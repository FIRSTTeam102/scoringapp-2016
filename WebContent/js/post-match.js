$(window).load(function(){
	$("#Capture").html("<img src='Images/icons/capt-" + alliance + "-n.png' width='150' height='150'/>");
	$("#Breach").html("<img src='Images/icons/br-" + alliance + "-n.png' width='150' height='150'/>");
	
	$("#Breach").click(function(){
		$("#Breach").html("<img src='Images/icons/br-" + alliance + "-" + (breach ? "n" : "y") + ".png' width='150' height='150'/>");
		breach = breach ? false : true;
		$("#BreachInput").attr("value", breach ? "Y" : "N");
	});
	$("#Capture").click(function(){
		$("#Capture").html("<img src='Images/icons/capt-" + alliance + "-" + (capture ? "n" : "y") + ".png' width='150' height='150'/>");
		//console.log("<img src='Images/icons/capt-" + alliance + "-" + (capture ? "n" : "y") + ".png' width='150' height='150'/>")
		capture = capture ? false : true;
		$("#CaptureInput").attr("value", capture ? "Y" : "N");
	});
	
	
	
	$("#chkTeam1Challenge").click(function(){
		
		if(!this.checked){
			$("#chkTeam1Scale").prop("checked", false);
		}
	});
	$("#chkTeam1Scale").click(function(){
		
		if(this.checked){
		$("#chkTeam1Challenge").prop("checked", true);
		}
	});
	
	$("#chkTeam2Challenge").click(function(){
		
		if(!this.checked){
			$("#chkTeam2Scale").prop("checked", false);
		}
	});
	$("#chkTeam2Scale").click(function(){
		
		if(this.checked){
		$("#chkTeam2Challenge").prop("checked", true);
		}
	});
	
	$("#chkTeam3Challenge").click(function(){
		
		if(!this.checked){
			$("#chkTeam3Scale").prop("checked", false);
		}
	});
	$("#chkTeam3Scale").click(function(){
		
		if(this.checked){
		$("#chkTeam3Challenge").prop("checked", true);
		}
	});
});