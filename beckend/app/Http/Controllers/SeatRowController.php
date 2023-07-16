<?php

namespace App\Http\Controllers;

use App\Models\Coach;
use App\Models\SeatRow;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class SeatRowController extends Controller
{
    protected $seat_num = [];


    function bookSeats(): object
    {
        Log::info(request()->number_of_seats);
        if (request()->has('number_of_seats') && request()->number_of_seats <= 7) {
            $number_of_seat = request()->number_of_seats;
            // $seat_um = [];
            $this->seat_num = [];
            $coach = Coach::find(1);

            if ($coach->total_available_seat >= $number_of_seat) {
                //Geting Row Which has all the required seat available
                $seat_row = SeatRow::where('coach_id', 1)->where('total_available', '>=',  $number_of_seat)->first();

                if (!(empty($seat_row))) {
                    $seat =  $this->updateSeats($seat_row, $number_of_seat, true);
                } else {
                    $seat_rows = SeatRow::where('coach_id', 1)->where('total_available', '>',  0)->orderBy('total_available', 'desc')->orderBy('row_number', 'desc')->get();

                    foreach ($seat_rows as $row) {

                        if ($number_of_seat != 0) {


                            $number_of_seat = $this->updateSeats($row, $number_of_seat);
                        } else {
                            break;
                        }
                    }
                }
                return response()->json(['output' => $coach, 'message' => 'Your seat booking is successfully completed', 'seat_num' => $this->seat_num], Response::HTTP_OK);
            } else {
                return response()->json(['output' => [], 'message' => 'Total Number of Seats available is less '], Response::HTTP_BAD_REQUEST);
            }

            // return response()->json(['output' => $coach, 'message' => 'Number of Seats Exceeds per user'], Response::HTTP_OK);
        } else {
            return response()->json(['output' => [], 'message' => 'Number of Seats Exceeds per user'], Response::HTTP_BAD_REQUEST);
        }
    }

    function updateSeats(SeatRow $row, int $number_of_seat, $single_row = false): int
    {
        if ($single_row) {

            $row->total_available = $row->total_available - $number_of_seat;
        } else {
            if ($row->total_available > $number_of_seat) {
                $row->total_available = $row->total_available - $number_of_seat;
            } else {
                $row->total_available = 0;
            }
        }

        if ($row->seat_1_available == 1 && $number_of_seat != 0) {
            $row->seat_1_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 1;
        }
        if ($row->seat_2_available == 1 && $number_of_seat != 0) {
            $row->seat_2_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 2;
        }
        if ($row->seat_3_available == 1 && $number_of_seat != 0) {
            $row->seat_3_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 3;
        }
        if ($row->seat_4_available == 1 && $number_of_seat != 0) {
            $row->seat_4_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 4;
        }
        if ($row->seat_5_available == 1 && $number_of_seat != 0) {
            $row->seat_5_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 5;
        }
        if ($row->seat_6_available == 1 && $number_of_seat != 0) {
            $row->seat_6_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 6;
        }
        if ($row->seat_7_available == 1 && $number_of_seat != 0) {
            $row->seat_7_available = 0;
            $number_of_seat = $number_of_seat - 1;
            $this->seat_num[] = ($row->row_number - 1) * 7 + 7;
        }
        $row->save();
        return $number_of_seat;
    }
}
