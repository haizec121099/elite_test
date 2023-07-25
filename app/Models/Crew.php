<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Model;

class Crew extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public $timestamps = false;

    public function documents(): HasMany
    {
        return $this->hasMany(Document::class);
    }
}
