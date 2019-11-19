<?php

namespace App\Http\Controllers;

//librerias
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Laracasts\Flash\Flash;
use JWTFactory;
use Validator;
use Session;
use JWTAuth;

//mdelos
use App\Models\auth\Role;
use App\Models\auth\User;

use App\Models\General\Checkin;
use App\Models\General\CheckinVisitor;
use App\Models\General\Rooms;
use App\Models\General\FcmHttp;
use App\Models\General\CheckinButlers;
use App\Models\General\Precheckin;


class LoginController extends Controller {
    protected $valid_roles = [];


    public function index(){
        return view('auth.empleados.index');
    }

    // TODO: Refactor this function
    public function postLogin(Request $request){
        $validator = Validator::make($request->all(), [
            'usuario' => 'required',
            'clave' => 'required|min:6',
        ]);

        if ($validator->fails()) {
            return redirect('/')
                ->withErrors($validator)
                ->withInput();
        } else {
            $UserVal = User::where('user', $request->input('usuario'))->where('estatus',1)->first();
            if ($UserVal == null) {
                Flash::error('Usuario Inexistente, Por favor verifica tus datos');
                return redirect('/')
                    ->withErrors($validator)
                    ->withInput();
            } else {
                if($UserVal->verificado == 0){
                    Flash::error('Por favor, verifica tu correo electrónico.');
                    return redirect('/')
                        ->withErrors($validator)
                        ->withInput();
                } else {
                    $userPage = $request->input('usuario');
                    $passpage = $request->input('clave');
                    $userDB = $UserVal->id;
                    $passDB = decrypt($UserVal->password);
                    if ($passpage == $passDB) {
                        Auth::login($UserVal);
                        // Get users that have access to backend
                        $roles = Role::whereNotIn('name', ['', 'Invitado VIP'])->pluck('name')->values()->all();
                        $valid_user = Auth::user()->hasRole($roles);
                        // If user has access, redirect to dashboard
                        if ($valid_user) {
                            return redirect('admin');
                        }
                        Flash::error('Acceso Denegado!');
                        return redirect('/')
                            ->withErrors($validator)
                            ->withInput();
                    } else {
                        Flash::error('Usuario o Contraseña Incorrecta');
                        return redirect('/')
                            ->withErrors($validator)
                            ->withInput();
                    }
                }

            }
        }
    }

    public function getLogout(){
        auth()->logout();
        return redirect('/');
    }
}
