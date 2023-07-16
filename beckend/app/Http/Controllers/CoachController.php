<?php

namespace App\Http\Controllers;

use App\Models\Coach;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use PhpParser\Node\Expr\Cast\Array_;

class CoachController extends Controller
{
    function index(): array
    {
        try {
            return [
                'output' => Coach::with('seatRows')->get(),
                'message' => 'Successfully Fetched',
                "success" => true
            ];
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage(), 'success' => false], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
