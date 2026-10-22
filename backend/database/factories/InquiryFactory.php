<?php

namespace Database\Factories;

use App\Models\Inquiry;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<Inquiry> */
class InquiryFactory extends Factory
{
    protected $model = Inquiry::class;

    public function definition(): array
    {
        return ['name' => 'Fictional Visitor', 'email' => 'visitor@example.test', 'subject' => 'Example inquiry', 'message' => 'Fictional local test message.', 'status' => 'new', 'submitted_at' => now()];
    }
}
