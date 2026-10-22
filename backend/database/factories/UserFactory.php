<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;

/** @extends Factory<User> */
class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition(): array
    {
        return ['name' => 'Example Owner', 'email' => 'owner@example.test', 'password' => Hash::make('Fictional-Password-123'), 'enabled' => true];
    }
}
