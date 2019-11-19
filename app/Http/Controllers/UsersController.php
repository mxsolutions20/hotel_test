<?php

namespace App\Http\Controllers;

//plugins
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Validator;
use File;
use DB;

//models
use App\Models\auth\User;
use App\Models\auth\Role;


class UsersController extends Controller {

    function __construct(){
        $this->idioma_defecto = 'en';
    }

    /**
     * Display a listing of the resource.
     */
    public function index(){
        $user = Auth::user()->id;
        $usuarios = User::with([
                        'role',
                        'role.role_rel'])
                    ->whereIn('estatus', [0,1])
                    ->orderBy('created_at', 'DESC')
                    ->get();

        return view('users.index' , ['status_'=>1 , 'usuarios'=>$usuarios]);
    }


    public function transaction(){
        $commit  = true;
        $message = "Woops! Something went wrong, please try again!";

        DB::beginTransaction();
        try{
            // All queries stay here
        } catch (\Exception $e) {
            $commit  = false;
            $message = $e->getMessage();
            
        }

        if ($commit) {
            DB::commit();
        } else {
            DB::rollback();
        }
    }
}
