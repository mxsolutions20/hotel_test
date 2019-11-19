<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class HomeController extends Controller
{

    public function index(){
        return view('home.homeEmpleado');
    }
}
