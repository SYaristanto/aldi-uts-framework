<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Database\Factories\UserFactory;
use Illuminate\Database\Seeder;


class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            "name"=> "admin",
            "email"=> "admin@mail.com",
            "role"=> "admin",
            "password"=> Hash::make('admin')
        ]);

        // panggil UserFactory, generate sebanyak 10 data
        User::factory()->count(10)->create();
    }
}
