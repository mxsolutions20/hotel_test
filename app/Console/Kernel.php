<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
        Commands\ScheduleNotifications::class,
        Commands\DailyCheckout::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // https://programacion.net/articulo/gestionando_cronjobs_con_laravel_1091
        // Activities schedule: Ejecucion diaria de 8AM a 8:15PM
        $schedule->command('command:scheduleActivities')
            //->daily()
            ->everyMinute()
            ->timezone('America/Cancun')
            ->between('8:00', '20:15');

        // Checkout: Ejecucion diaria a las 7PM
        $schedule->command('command:dailyCheckouts')->dailyAt('19:00')->timezone('America/Cancun');

    }

    /**
     * Register the Closure based commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        require base_path('routes/console.php');
    }
}
