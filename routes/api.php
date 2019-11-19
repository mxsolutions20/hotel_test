<?php
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// Pending to config
Route::group(['potokapp' => 'apipalafitos.potokapp.com', 'middleware' => 'jwt.verify'], function () {

});


Route::group(['potokapp' => 'apipalafitos.potokapp.com'], function () {

    Route::post('get_hotels',               'HotelsController@Api_getHotels');
    Route::post('get_rooms',                'HotelsController@Api_getRooms');
    Route::post('get_rooms_check',          'HotelsController@Api_getRoomsCheckin');
    Route::post('get_mayordomos_check',     'HotelsController@Api_getMayordomosCheckin');

});
