<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\General\Hotel;

use Illuminate\Support\Facades\Lang;

class HotelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $hotels = Hotel::all();
        //dd($query);
        return view('hotels.index', ['hotels' => $hotels]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $hotel = new Hotel();
            $hotel->nombre = $request->name;
            $hotel->direccion = $request->street;
            $hotel->telefono = $request->phone;
            $hotel->save();
        } catch (\Exception $e) {
            echo $e->getMessage();
            die();
        }
        //dd($request);
        $data = [
            'success' => true, 'messages' => array(Lang::get('alerts.success_save')), 'data' => $hotel, 'htmTxtDelete' => Lang::get('forms.delete'), 'htmTxtEdit' => Lang::get('forms.edit'),  'htmTxtActive' => Lang::get('forms.active')
        ];
        //$response = response()->json( $data, 200);
        $response = response($data);
        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        try {
            $column = "idHotel";
            $hotel = Hotel::where($column, '=', $id)->first();
        } catch (\Exception $e) {
            echo $e->getMessage();
            die();
        }

        $data = ['success' => true, 'data' => $hotel];
        $response = response($data);
        return $response;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            //$hotel = Hotel::find($id);
            $column = "idHotel";
            $hotel = Hotel::where($column, '=', $id)->first();
            $hotel->delete();
        } catch (\Exception $e) {
            echo $e->getMessage();
            die();
        }
        //dd($request);
        $data = ['success' => true, 'messages' => array(Lang::get('alerts.success_delete'))];
        $response = response($data);
        return $response;
    }

    public function hotelUpdate(Request $request)
    {

        try {
            $column = "idHotel";
            $hotel = Hotel::where($column, '=', $request->idElement)->first();
            $hotel->nombre = $request->name;
            $hotel->direccion = $request->street;
            $hotel->telefono = $request->phone;
            $hotel->save();
        } catch (\Exception $e) {
            echo $e->getMessage();
            die();
        }
        $data = ['success' => true, 'messages' => array(Lang::get('alerts.success_update')), 'data' => $hotel, 'htmTxtDelete' => Lang::get('forms.delete'), 'htmTxtEdit' => Lang::get('forms.edit'),  'htmTxtActive' => Lang::get('forms.active')];
        $response = response($data);
        return $response;
    }
}
