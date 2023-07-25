<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public $timestamps = false;

    public function crew(): BelongsTo
    {
        return $this->belongsTo(Crew::class);
    }
}
