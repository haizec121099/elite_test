<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('crews', function (Blueprint $table) {
            $table->id("id");
            $table->string("first_name", 100);
            $table->string("last_name", 100);
            $table->string("middle_name", 100)
                ->nullable();
            $table->string("email", 150)
                ->unique();
            $table->string("house_no", 50)
                ->nullable();
            $table->string("education", 255);
            $table->string("street", 50);
            $table->string("barangay", 50);
            $table->string("city_municipality", 50);
            $table->string("province", 50);
            $table->string("zip_code", 4);
            $table->string("mobile_no", 13)
                ->unique();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('crews');
    }
};
