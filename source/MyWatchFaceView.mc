using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Activity as Activity;
using Toybox.ActivityMonitor as ActivityMonitor;

class MyWatchFaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
        
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
		setTime();
        setAltitude();
        setSteps();
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    function setTime() {
    	// Get and show the current time
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString);
    }
    
    function setAltitude() {
    	var altitude = Activity.getActivityInfo().altitude;
        var view = View.findDrawableById("AltitudeLabel");
        view.setText(altitude.format("%d"));
    }
    
    function setSteps() {
    	var steps = ActivityMonitor.getInfo().steps;
        var view = View.findDrawableById("StepsLabel");
        view.setText(steps.format("%d"));
    }
    

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
