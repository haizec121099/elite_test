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
        Schema::create('documents', function (Blueprint $table) {
            $table->id("id");
            $table->string("code");
            $table->string("name");
            $table->string("document_number");
            $table->date("date_issued");
            $table->date("date_expiry");
            $table->string("remarks")
                ->nullable();
            $table->foreignId("crew_id")
                ->constrained(table: "crews", indexName: "documents_crew_id")
                ->onUpdate("cascade")
                ->onDelete("cascade");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('documents');
    }
};
