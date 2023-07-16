<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coach extends Model
{
    use HasFactory;
    protected $appends = ['total_available_seat'];

    public function seatRows()
    {
        return $this->hasMany(SeatRow::class);
    }
    function getTotalAvailableSeatAttribute(): int
    {
        return $this->seatRows()->sum('total_available');
    }
}
