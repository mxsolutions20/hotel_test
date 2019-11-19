<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Checkin;
use App\FcmHttp;
use App\Notifications;

class DailyCheckout extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:dailyCheckouts';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check for daily checkout notifications';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(){
        parent::__construct();
    }

    /**
     * Execute the console command.
     * Funcion que se ejecuta todos los dias a las 7 de la noche
     * @return mixed
     */
    public function handle(){
        //Notification for late checkout
        $tomorrow_is = Carbon::now('America/Cancun')->addDays(1)->format('Y-m-d');

        // Obtener lista de huespedes con checkin valido y con fecha de chekout mañana
        $checkOuts = Checkin::with(['guests'])->whereIn('status', [3,6])->where("fechaSalida", "=", $tomorrow_is)->get();

        $FCM = new FcmHttp();
        foreach ($checkOuts as $checkin){

            $notification   = new Notifications();
            $place_info     = [
                                'place_id' => null,
                                'place_tipo' =>null,
                                'hotel' => null,
                                'name' =>'Your checkout is tomorrow, do you want a late checkout?',
                                'notification_type' => 'checkout'
                            ];

            $notification->data_json        = (string)json_encode($place_info);
            $notification->uuid             = $checkin->guests->idDispositivo;
            $notification->reservation      = $checkin->reservation;
            $notification->origen           = 1;
            $notification->idCheckinVisitor = $checkin->guests->idCheckinVisitor;
            $notification->save();

            $not_read = Notifications::where('idCheckinVisitor', $checkin->guests->idCheckinVisitor)
                                    ->where('is_read', 0)
                                    ->where('is_deleted', 0)
                                    ->where('origen' , 1)
                                    ->get()
                                    ->count();

            $data = ['notification_type' => null, 'name' => 'checkout', 'place' => 'lobby', 'not_read'=>$not_read];
            $message = $checkin->nombre. ' Your checkout is tomorrow, do you want a late checkout? ';
            $FCM->send_message_to($message, 'Lobby', $checkin->fcm, json_encode( $data ), $not_read);
        }

        $today_is   = Carbon::now('America/Cancun')->format('Y-m-d');
        $checkOuts  = Checkin::where("fechaSalida", "=", $today_is)->get();

        foreach ($checkOuts as $checkin){
            $checkin->estatus = 4;
            $checkin->save();
        }
      
        $this->info('All users notified');
    }
}
