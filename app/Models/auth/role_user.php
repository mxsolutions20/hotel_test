<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Model;

class role_user extends Model
{
    protected $table = 'role_user';

    protected $primaryKey='user_id';

    protected $fillable = ['user_id', 'role_id'];

    public function role_rel(){
        return $this->belongsTo('App\Models\auth\Role','role_id' );
    }

    public function user_rel(){
        return $this->belongsTo('App\Models\auth\User','user_id');
    }

}
