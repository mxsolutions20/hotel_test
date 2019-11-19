<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\ActivitiesSchedule;
use Carbon\Carbon;
use App\FcmHttp;
use App\Notifications;

class ScheduleNotifications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:scheduleActivities';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send Notifications to users';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        // Get Current time
        $today_is = Carbon::now('America/Cancun')->format('l');
        $currHour = Carbon::now('America/Cancun')->format('g:i a');
        $currYear = Carbon::now('America/Cancun')->format('Y-m-d');

        // Get activities scheduled by user that will start in 10min or less
        $activities = ActivitiesSchedule::where('activitie_day', strtolower($today_is) )->where('is_schedule', 0)->where('is_active', 1)->get();

        // Create a new FCM object
        $FCM = new FcmHttp();

        foreach ($activities as $activity){
            $to = Carbon::createFromFormat('Y-m-d g:i a', $currYear.$currHour);
            $from = Carbon::createFromFormat('Y-m-d g:i a', $currYear.$activity->activitie_hour);

            // If activity starts in 10min or less, send notification to the user
            if( $diff_in_minutes = $to->diffInMinutes($from) <= 10){
                $place_info = [
                                'place_id'          => null, 
                                'place_tipo'        => null, 
                                'hotel'             => null, 
                                'name'              => '¡Your activity '.$activity->activitie.' will start at ' .$activity->activitie_hour .'!', 
                                'notification_type' => 'activity', 
                                'day'               => $activity->activitie_day, 
                                'hour'              => $activity->activitie_hour 
                            ];

                // Save notification info into DB
                $notification = new Notifications();
                $notification->data_json        = (string)json_encode($place_info);
                $notification->idCheckinVisitor = $activity->idCheckinVisitor;
                $notification->uuid             = '';
                $notification->reservation      = $activity->reservation;
                $notification->origen           = 1;
                $notification->save();

                // Count notifications pending to read
                $not_read = Notifications::where('idCheckinVisitor', '=', $activity->idCheckinVisitor)
                                         ->where('is_read', 0)
                                         ->where('is_deleted', 0)
                                         ->where('origen' , 1)
                                         ->count();

                // Prepare(parse) data to send
                $data = json_encode( array('notification_type' => 'activity', 'name' =>  $activity->activitie, 'place' => $activity->place, 'not_read'=>$not_read) );

                // Send Notification
                // [@params] send_message_to($title, $body, $fcm, $data = null, $badge = 0)
                $title = 'Your activity '. $activity->activitie .' will start at '.$activity->activitie_hour . '!';
                $FCM->send_message_to($title, $activity->place, $activity->fcm,  $data, $not_read);

                // Update acheduled activity status
                $activity->is_schedule = 1;
                $activity->is_active   = 0;
                $activity->save();
            }

        }

        $this->info('All users notified');

    }
}
