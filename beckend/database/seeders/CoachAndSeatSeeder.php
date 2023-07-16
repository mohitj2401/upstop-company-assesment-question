<?php

namespace Database\Seeders;

use App\Models\Coach;
use App\Models\SeatRow;
use Illuminate\Database\Seeder;

class CoachAndSeatSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $coach = new Coach();
        $coach->name = 'Sleeper Coach';
        $coach->coach_class = 'SL';
        $coach->coach_number = 1;
        $coach->save();

        for ($i = 0; $i < 12; $i++) {
            $seat = new SeatRow();
            $seat->coach_id = $coach->id;
            $seat->row_number = $i + 1;
            $seat->total_available = 7;
            if ($i == 11) {
                $seat->seat_4_available = 0;
                $seat->seat_5_available = 0;
                $seat->seat_6_available = 0;
                $seat->seat_7_available = 0;
                $seat->total_available = 3;
            }
            $seat->save();
        }
    }
}
