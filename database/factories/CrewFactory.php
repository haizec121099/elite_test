<?php

namespace Database\Factories;

use App\Models\Crew;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Crew>
 */
class CrewFactory extends Factory
{

    protected $model = Crew::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            "first_name" => fake()->firstName,
            "last_name" => fake()->lastName,
            "middle_name" => fake()->lastName,
            "email" => fake()->unique()->safeEmail,
            "house_no" => fake()->text(15),
            "street" => fake()->word,
            "barangay" => fake()->word,
            "city_municipality" => fake()->word,
            "province" => fake()->word,
            "zip_code" => fake()->numerify("####"),
            "education" => fake()->text(100),
            "mobile_no" => fake()->unique()->numerify("+63##########")
        ];
    }
}
