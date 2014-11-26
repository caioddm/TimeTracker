$(function(){
	userHome.initialize();
});

var userHome = {
	initialized: false,
	initialize : function(){
		if(!userHome.initialized)
			window.setInterval(userHome.updateTimer, 1000);
			
		userHome.initialized = true;	
	},
	updateTimer: function(){
		var time = $("#current_time").text();
		var hour = parseInt(time.split(":")[0]);
		var minute = parseInt(time.split(":")[1]);
		var second = parseInt(time.split(":")[2]);
		second++;
		if(second > 59)
		{
			second = 0;
			minute++;
		}
		if(minute > 59)
		{
			minute = 0;
			second = 0;
			hour++;
		}
		if(hour > 23)
		{
			hour = 0;
			minute = 0;
			second = 0;
		}
		var newTime = (hour.toString().length < 2 ? "0" + hour.toString() : hour.toString()) + ":" + (minute.toString().length < 2 ? "0" + minute.toString() : minute.toString())
			+ ":" + (second.toString().length < 2 ? "0" + second.toString() : second.toString());
		
		$("#current_time").text(newTime);
	}
};
