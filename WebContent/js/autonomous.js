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
		
			$("#chkTeam1HasBall").click(function() {				
				$("#chkScoreHot1").attr("checked", false); 
				$("#rdoScoreNone1").prop("checked", true);
				$("#rdoScoreHigh1").attr("disabled", !this.checked); 
				$("[for='rdoScoreHigh1']").css("color", !this.checked ? "grey" : "white"); 
				$("#rdoScoreLow1").attr("disabled", !this.checked); 
				$("[for='rdoScoreLow1']").css("color", !this.checked ? "grey" : "white"); 
				// $("#rdoScoreNone1").attr("disabled", !this.checked); 
				$("[for='rdoScoreNone1']").css("color", !this.checked ? "grey" : "white"); 
				$("#chkScoreHot1").attr("disabled", !this.checked); 
				$("[for='chkScoreHot1']").css("color", !this.checked ? "grey" : "white"); 
			});
			$("#chkTeam2HasBall").click(function() {				
				$("#chkScoreHot2").attr("checked", false); 
				$("#rdoScoreNone2").prop("checked", true);
				$("#rdoScoreHigh2").attr("disabled", !this.checked); 
				$("[for='rdoScoreHigh2']").css("color", !this.checked ? "grey" : "white"); 
				$("#rdoScoreLow2").attr("disabled", !this.checked); 
				$("[for='rdoScoreLow2']").css("color", !this.checked ? "grey" : "white"); 
				// $("#rdoScoreNone2").attr("disabled", !this.checked); 
				$("[for='rdoScoreNone2']").css("color", !this.checked ? "grey" : "white"); 
				$("#chkScoreHot2").attr("disabled", !this.checked); 
				$("[for='chkScoreHot2']").css("color", !this.checked ? "grey" : "white"); 
			});
			$("#chkTeam3HasBall").click(function() {				
				$("#chkScoreHot3").attr("checked", false); 
				$("#rdoScoreNone3").prop("checked", true);
				$("#rdoScoreHigh3").attr("disabled", !this.checked); 
				$("[for='rdoScoreHigh3']").css("color", !this.checked ? "grey" : "white"); 
				$("#rdoScoreLow3").attr("disabled", !this.checked); 
				$("[for='rdoScoreLow3']").css("color", !this.checked ? "grey" : "white"); 
				// $("#rdoScoreNone3").attr("disabled", !this.checked); 
				$("[for='rdoScoreNone3']").css("color", !this.checked ? "grey" : "white"); 
				$("#chkScoreHot3").attr("disabled", !this.checked); 
				$("[for='chkScoreHot3']").css("color", !this.checked ? "grey" : "white");
			});
				});
