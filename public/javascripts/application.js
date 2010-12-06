// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//document.observe('dom:loaded', function() {
//alert('hello');
//});




		 /*
		Countdown Timer
		Based on the "Count down until any date script" - By JavaScript Kit (www.javascriptkit.com)
		Author: (c) 2009 Elbert Bautista
		URL: http://www.egTheBlog.com
		Licence : Open Source MIT Licence

	*/

/*
document.observe('dom:loaded', hey() {
	var current="Expired"
	var montharray=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
	countdown(2010, 12, 07, current, montharray);
}

);
	function countdown(yr,m,d,c,ma){
		theyear=yr;themonth=m;theday=d;current=c;montharray=ma;
		var today=new Date()
		var todayy=today.getYear()
		if (todayy < 1000){
		todayy+=1900}
		var todaym=today.getMonth()
		var todayd=today.getDate()
		var todayh=today.getHours()
		var todaymin=today.getMinutes()
		var todaysec=today.getSeconds()
		var todaystring=montharray[todaym]+" "+todayd+", "+todayy+" "+todayh+":"+todaymin+":"+todaysec
		futurestring=montharray[m-1]+" "+d+", "+yr
		dd=Date.parse(futurestring)-Date.parse(todaystring)
		dday=Math.floor(dd/(60*60*1000*24)*1)
		dhour=Math.floor((dd%(60*60*1000*24))/(60*60*1000)*1)
		dmin=Math.floor(((dd%(60*60*1000*24))%(60*60*1000))/(60*1000)*1)
		dsec=Math.floor((((dd%(60*60*1000*24))%(60*60*1000))%(60*1000))/1000*1)
		if(dday==0&&dhour==0&&dmin==0&&dsec==1){
			document.getElementById('counter').style.display='none';
			document.getElementById('expired').style.display='block';
			return
		}
		else{
			document.getElementById('countdown_day').innerHTML=dday;
			document.getElementById('countdown_hour').innerHTML=dhour;
			document.getElementById('countdown_min').innerHTML=dmin;
			document.getElementById('countdown_sec').innerHTML=dsec;
			setTimeout("countdown(theyear,themonth,theday, current, montharray",1000);
		}
	}



	//MODIFY THIS LINE: enter the count down date using the format year/month/day
		//e.g. countdown(2009, 03, 23);



/*
function countdown(exp_time) {

var expiration_time = exp_time
var time = 5000;
var today = new Date()
var timenow = today.getTime()

	if(time==0){
			return
		}
		else{
			document.getElementById('time').innerHTML=dday;
document.getElementById('countdown_day').innerHTML=dday;
			document.getElementById('countdown_hour').innerHTML=dhour;
			document.getElementById('countdown_min').innerHTML=dmin;
			document.getElementById('countdown_sec').innerHTML=dsec;
			setTimeout("countdown(theyear,themonth,theday)",1000)
			setTimeout("countdown(time)",1000);
		}
}

/*
document.observe('dom:loaded', function hey(5000)
{


  setInterval( "minus_one(5000)", 1000 );



}
);

function minus_one(n){

var i = n;

while = ( i > 0 ; time = time - 1000) {

document.getElementById("timer").innerHTML  -= 1 ;

}

}


function initialize_timer(time_left)
{

setTimeout('alert(\'Surprise!\')', 5000)

};

var e_timerRunning = false  
var e_timerID = null  

var e_delay = 3000  

function example_initialize_polling(e_seconds)  
{  

	// Set the length of the timer, in seconds  

	e_secs = e_seconds  
	example_StopTheClock()  
	example_StartTheTimer()  
}  

function example_StopTheClock()  
{  
	e_secs = 0  
	if(e_timerRunning)  

		clearTimeout(e_timerID)  
	e_timerRunning = false  
}  

function example_StartTheTimer()  

{  
	if (e_secs==0)  
	{  
		example_StopTheClock()  

		new Ajax.Request('/articles/update_example_status', {  
		  method:     'post'  

		});  
		//initialize_polling(e_seconds)  
	}  
	else  

	{  
		e_secs = e_secs - 1  
		e_timerRunning = true  

		e_timerID = self.setTimeout("StartTheTimer()", e_delay)  
	}  

}  