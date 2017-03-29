<%@ page language="java" contentType="text/html; charset=utf-8"
  					     pageEncoding="utf-8"%>
   <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
   <!--  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="authorr" content=""> -->
    <title>Add New Game</title>

    <!-- Bootstrap core CSS -->

    <script src="bootstrap-3.3.7-dist/jquery/jquery-3.1.1.js"></script>   
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/myStyle.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
 
 	   <%@ include file="/WEB-INF/pages/jspf_component/local_include.jspf" %>

  </head> 

  <body>   


  <nav class="navbar navbar-default">
	<div class="success-modal">
		<div class="alert alert-success fade in">
		    <a href="#" class="close" data-dismiss="alert">x</a>
		    <strong class="successType"></strong>
		</div>
	</div>	
  
  	<div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="redirectToIndexPage">${title}</a>
	    </div>

		<c:if test="${user != null }">   			
 			  <form action="Controller" method="get" class="navbar-form navbar-right authorize-user-form"> 
 			 	    <input type="hidden" name="command" value="log_out_command"/>
 			 	    	<button type="button" class="button btn-primary form-control" onclick="redirectToUserPersonalPage();">${user.email} <span class="badge">totalizator cash:${user.cash}</span></button>
 			  		<input class="button signupbutton form-control" type="submit" value="${signoutbutton}" /> 
 			  	<div class="form-group">
		 	       <div class="dropdown">
			           <button class="button dropbtn">${language}</button>
			           <div class="dropdown-content">		           		
			                <a href="#" onclick="setLanguage('redirectToAddNewGamePage','ru');">${russianLanguage}</a>
			                <a href="#" onclick="setLanguage('redirectToAddNewGamePage','en');">${englishLanguage}</a>
			          </div>
				 </div>  
	  		  </div>  
 			 </form>
 	    </c:if>
	</div>	
</nav>

    <!--  Content -->
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">

    empty space

    </div>
    <div class="col-sm-8 text-left"> 
      <h1>${newgameadding}</h1>
            
      <div>
      		<form method="get" class="addNewGameForm">
      		<div class="row">
      			<div class="col-xs-4">
      			<label for="game-kind-select">${gamekind}</label>
      				<select id="gameKindSelect" class="form-control" name="game_kind">
					  <option value="football">${football}</option>
					  <option value="basketball">${basketball}</option>
					  <option value="hockey">${hockey}</option>
					</select>
      			</div>
      		</div>
      		<div class="row">
      			<div class="col-xs-4">
      				<label for="game-first-team">${firstteam}</label>
      				<select id="game-first-team" name="team_1" class="form-control">
      					<c:forEach var="team" items="${teams}" >      						
					 		 <option>${team.name}</option>
					 	 </c:forEach>					 
					</select>
      			</div>
      			
      			<div class="col-xs-4">
      				<label for="game-second-team">${secondteam}</label>
      				<select id="game-second-team" name="team_2" class="form-control">
      					<c:forEach var="team" items="${teams}" >
					 		 <option>${team.name}</option>
					 	 </c:forEach>	
					</select>
      			</div>
      		</div>	 
      			
      	 	<div class="row">	
	      		<div class="col-xs-4">
	      			<label for="game-second-team">${time}</label>
	      			<input name="date" type="datetime-local" class="form-control">
	      		</div>
	       </div>	
    		
			<div class="row">
			  <div class="col-xs-2">
			  <label for="game-koefficient-k1">${home}</label>
			    <input id="game-koefficient-k1" name="k1" type="number" min="1.1" class="form-control" placeholder="k1">
			  </div>
			  <div class="col-xs-2">
			   <label for="game-koefficient-kx">${draw}</label>
			    <input id="game-koefficient-kx" name="kx" type="number" min="1.1"  class="form-control" placeholder="kx">
			  </div>
			  <div class="col-xs-2">
			   <label for="game-koefficient-k2">${away}</label>
			    <input id="game-koefficient-k2" name="k2" type="number" min="1.1"  class="form-control" placeholder="k2">
			  </div>
			</div>	
			<div>			
			   <input type="hidden" name="command" value="ADD_NEW_GAME_COMMAND"/>
          			  		<input class="btn signinbutton" type="submit" value="${addnewgame}" />
			</div>			
			</form>		
      </div>      
      <hr>       
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>Empty</p>
      </div>
      <div class="well">
    
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Epam 2017  </p>
</footer>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    
    <script>
    	$(".addNewGameForm").submit(function(event){
    		 
    		var command = event.currentTarget['command'].value;
    		var gameKind = event.currentTarget['game_kind'].value;
    		var firstTeam = event.currentTarget['team_1'].value;
    		var secondTeam = event.currentTarget['team_2'].value;
    		var gameDate = event.currentTarget['date'].value;
    		var k1 = event.currentTarget['k1'].value;
    		var kx = event.currentTarget['kx'].value;
    		var k2 = event.currentTarget['k2'].value;
    		
    		var timeStampGameDate = gameDate.concat(":00").replace("T"," ");
    		
    		if(firstTeam === secondTeam){
    			alert("first and second teams equals")
    		} else{
				$.ajax({
					type:"POST",
					data:{
							command:"ADD_NEW_GAME_AJAX_COMMAND",
							gameKind:gameKind,
							firstTeam:firstTeam,
							secondTeam:secondTeam,
							gameDate:timeStampGameDate,
							k1:k1,
							kx:kx,
							k2:k2
						 },
					url:"AJAXController",
		            success : function(data) {
		            
		            	var json = JSON.parse(data);
		            	
		            	var successMessage = json["success"];
		            	
		            	 $(".successType").text("Game is added");
		            	 $(".success-modal").css("display","block");
		            	setTimeout(function() {
		            		window.location.replace("redirectToIndexPage");
		            		}, 3000);
		            }
				});
    		}
    		event.preventDefault(); 
    	});
    	
    	$("#gameKindSelect").change(function(element){
    		var gameKind = $("#gameKindSelect").val();

    		
    		$.ajax({
				type:"POST",
				data:{
						command:"GET_TEAMS_BY_GAME_KIND_AJAX_COMMAND",
						gameKind:gameKind						
					 },
				url:"AJAXController",
	            success : function(data) {
	            	var json = JSON.parse(data);
	            	debugger;
	            	
	        		var firstTeamsSelect  = $("#game-first-team");
	            	var secondTeamsSelect = $("#game-second-team");
	            	
	            	var teams = json["teamsArray"];
	            	
	            	firstTeamsSelect.empty();
	            	secondTeamsSelect.empty();
	        		
	        		for(i = 0;i<teams.length;i++){
	        			firstTeamsSelect.append("<option>"+json["teamsArray"][i]+"</option>");
	        			secondTeamsSelect.append("<option>"+json["teamsArray"][i]+"</option>");
	        		}            	
	            }
			});
    	});
    	    		
    	
    </script>
     <script src="bootstrap-3.3.7-dist/js/myScripts.js"></script>   
</body>
</html>