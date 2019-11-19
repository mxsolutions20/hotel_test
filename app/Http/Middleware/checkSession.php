<?php

namespace App\Http\Middleware;

use App\rutaacceso;
use Closure;
use Illuminate\Support\Facades\Auth;
use Session;
use App\Helpers\Helper;

class checkSession
{
     /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $ruta = \Request::route()->getName();
        if ($request->session()->has('usuariomanager')) {

            if ($request->ajax() || $request->wantsJson()){
                //dd('ajax: '.$ruta);
            }else{
                //dd(': '.$ruta);
                $method = $request->method();

                if($method == 'PUT' || $method == 'POST' || $method == 'DELETE'){
                    //dd($method);
                }else{

                    $continue = Helper::routeaccess($ruta);
                    if($continue){
                        $usuario = Auth::user();
                        if ($usuario == null) {
                            return redirect('/');
                        }else{

                        }
                    }else{
                        return redirect('/');
                    }
                }

            }

        }else{
            return redirect('/');
        }
        return $next($request);
    }
    /*
    //$this->continueWithPage($ruta , Session::get('usuario') , Session::get('tipo'));
    function continueWithPage($ruta , $usuario , $tipo){
        $ruta = rutaacceso::where('tipoUsuario',$tipo)->where('ruta',$ruta)->first();
        if($ruta == false){
            return false;
        }else{
            return true;
        }
    }*/
}
