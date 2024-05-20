<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Exception;

class GoogleAuthController extends Controller
{
    /**
     * Redirect the user to the Google OAuth provider.
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function redirect()
    {
        return Socialite::driver('google')->redirect();
    }

    /**
     * Handle callback from Google OAuth provider for registration.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackGoogle(Request $request)
    {
        // Ambil provider dari header request, jika tidak tersedia, atur menjadi 'google' secara default
        $provider = $request->header('Provider', 'google');
        // Ambil access_provider_token dari header request
        $accessProviderToken = $request->header('Authorization');
    
        // Validasi input
        $validator = Validator::make(
            [
                'provider' => $provider,
                'access_provider_token' => $accessProviderToken
            ],
            [
                'provider' => ['required', 'string'],
                'access_provider_token' => ['required', 'string']
            ]
        );
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        // Validasi provider
        $validated = $this->validateProvider($provider);
        if (!is_null($validated)) {
            return $validated;
        }
    
        try {
            // Ambil informasi pengguna dari token penyedia
            $providerUser = Socialite::driver($provider)->userFromToken($accessProviderToken);
    
            // Generate password default
            $defaultPassword = 'DefaultPassword123!'; // Anda dapat menggunakan metode yang lebih kompleks untuk menghasilkan password
    
            // Cari pengguna berdasarkan email, atau buat pengguna baru dengan password default
            $user = User::updateOrCreate(
                [
                    'email' => $providerUser->getEmail()
                ],
                [
                    'name' => $providerUser->getName(),
                    'password' => Hash::make($defaultPassword) // Simpan password yang di-hash
                ]
            );
    
            // Autentikasi pengguna dan hasilkan token JWT
            if (!$token = Auth::login($user)) {
                return response()->json([
                    'error' => 'Gagal menghasilkan token JWT.',
                    'code' => 500 // Internal Server Error
                ], 500);
            }
    
            // Kembalikan respon sukses dengan token
            $response = [
                'success' => true,
                'data' => [
                    'user' => $user,
                    'token' => $token,
                    'token_type' => 'bearer',
                    'expires_in' => auth()->factory()->getTTL() * 60,
                ]
            ];
    
            return response()->json($response, 200);
    
        } catch (Exception $e) {
            return response()->json([
                'error' => 'Terjadi kesalahan saat mengambil pengguna dari token provider.',
                'message' => $e->getMessage(),
                'code' => 500 // Internal Server Error
            ], 500);
        }
    }
    

    protected function validateProvider($provider)
    {
        if (!in_array($provider, ['google'])) {
            return response()->json(["message" => 'You can only login via google account'], 400);
        }
    }
}
