	$(window).load(function(){

		// Generate three event handlers to disable/enable inputs when the "Has Ball" checkbox changes.
		
			$("#chkTeam1Reached").click(function(){
				//$("[for='rdoScoreHigh1']").css("color", this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow1']").css("color", this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh1").attr("checked", false); 
					$("#rdoScoreLow1").attr("checked", false); 
				}
				$("#chkTeam1Crossed").attr("checked", this.checked ? true : false);
			});
			$("#chkTeam1Crossed").click(function(){
				//$("[for='rdoScoreHigh1']").css("color", !this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow1']").css("color", !this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh1").attr("checked", false); 
					$("#rdoScoreLow1").attr("checked", false); 
				}else{
					$("#chkTeam1Reached").prop("checked", true);
				}
			});
			$("#rdoScoreLow1, #rdoScoreHigh1").click(function(){
				$("#chkTeam1Reached").prop("checked", this.checked ? true : false);
				$("#chkTeam1Crossed").prop("checked", this.checked ? true : false);
			});
		
			$("#chkTeam2Reached").click(function(){
				//$("[for='rdoScoreHigh2']").css("color", this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow2']").css("color", this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh2").attr("checked", false); 
					$("#rdoScoreLow2").attr("checked", false); 
				}
				$("#chkTeam2Crossed").attr("checked", this.checked ? true : false);
			});
			$("#chkTeam2Crossed").click(function(){
				//$("[for='rdoScoreHigh2']").css("color", !this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow2']").css("color", !this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh2").attr("checked", false); 
					$("#rdoScoreLow2").attr("checked", false); 
				}else{
					$("#chkTeam2Reached").prop("checked", true);
				}
			});
			$("#rdoScoreLow2, #rdoScoreHigh2").click(function(){
				$("#chkTeam2Reached").prop("checked", this.checked ? true : false);
				$("#chkTeam2Crossed").prop("checked", this.checked ? true : false);
			});
			
			$("#chkTeam3Reached").click(function(){
				//$("[for='rdoScoreHigh3']").css("color", this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow3']").css("color", this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh3").attr("checked", false); 
					$("#rdoScoreLow3").attr("checked", false); 
				}
				$("#chkTeam3Crossed").attr("checked", this.checked ? true : false);
			});
			$("#chkTeam3Crossed").click(function(){
				//$("[for='rdoScoreHigh3']").css("color", !this.checked ? "grey" : "white"); 
				//$("[for='rdoScoreLow3']").css("color", !this.checked ? "grey" : "white"); 
				if(!this.checked){
					$("#rdoScoreHigh3").attr("checked", false); 
					$("#rdoScoreLow3").attr("checked", false); 
				}else{
					$("#chkTeam3Reached").prop("checked", true);
				}
			});
			$("#rdoScoreLow3, #rdoScoreHigh3").click(function(){
				$("#chkTeam3Reached").prop("checked", this.checked ? true : false);
				$("#chkTeam3Crossed").prop("checked", this.checked ? true : false);
			});
			
	});
