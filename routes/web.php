<?php

//test 1 ..
Route::get('reset', function () {
    return view('auth.empleados.resetEmpleado');
});

Route::get('/',                 ['as' => 'auth/admin',      'uses' => 'LoginController@index']);
Route::get('login',             ['as' => 'login',           'uses' => 'LoginController@index']);
Route::post('auth/admin',       ['as' => 'auth/admin',      'uses' => 'LoginController@postLogin']);


Route::group(['middleware' => 'auth'], function() {

    Route::group(['prefix' => 'admin'], function () {
        Route::get('logout', ['as' => 'logout', 'uses' => 'LoginController@getLogout']);

        /*
        |------------------------------------------------------------------------------------------------------------------
        | = = = > H O M E
        |------------------------------------------------------------------------------------------------------------------
        */
        Route::get('/',         ['as' => 'index', 'uses' => 'HomeController@index']);
        Route::get('users',     ['as' => 'users', 'uses' => 'UsersController@index']);

        /*
        |------------------------------------------------------------------------------------------------------------------
        | = = = > H O T E L S   M O D U L E
        |------------------------------------------------------------------------------------------------------------------
        */
        Route::get('hotels',          ['as' => 'hotels',     'uses' => 'HotelsController@index']);
        Route::post('requests/create',  'HotelsController@filter_requests');
        Route::post('request/update',   'HotelsController@get_butlers');
        Route::post('request/delete',   'HotelsController@get_chat');

    });
});


// Route to reload and change language
Route::get('lang/{lang}' , function ($lang) {
            session(['lang' => $lang]);
            return \Redirect::back();
        })
        ->where([
            'lang' => 'en|es'
        ]);
