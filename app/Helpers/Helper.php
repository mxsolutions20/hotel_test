<?php
namespace App\Helpers;
use Illuminate\Support\Facades\Auth;
use Session;
use App\Models\auth\User;
use App\Models\auth\Roles;
use App\Models\auth\role_user;


class Helper
{
    public $user;
    public function __construct($user)
    {
        $this->user = $this->getUser();
    }

    public static function getUser(){
        $usr = Auth::user()->id;
        $usuario = User::with(['role'])->where('id', $usr)->first();
        if ($usuario == null) {
            return false;
        }else{
            $array_user = array('id'=>$usuario->idUsuario , 'email'=>$usuario->usuario , 'rol'=>$usuario->role);
            //dd($array_user);
            return $array_user;
        }
    }

    public static function hasRole($role){
        //busca si el usuario tiene un rol
        $rol = Roles::where('name',$role)->first();
        if($rol == null){
            return false;
        }else{
            $user = self::getUser();
            $role_user = role_user::where('user_id',$user['id'])->where('role_id' , $rol->id)->first();
            if($role_user == null){
                return false;
            }else{
                return true;
            }
        }

    }
}