<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
        uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BookMaker Page</title>

    <!-- Bootstrap core CSS -->
 
    <script src="bootstrap-3.3.7-dist/jquery/jquery-3.1.1.js"></script>   
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
    	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/myStyle.css">
    	  
  <fmt:setLocale value="${sessionScope.local}"/>
  <fmt:setBundle basename="localization.local" var="loc"/>
  
  <fmt:message bundle="${loc}" key="local.title" var="title"/>
  <fmt:message bundle="${loc}" key="local.signoutbutton" var="signoutbutton"/>
  <fmt:message bundle="${loc}" key="local.language.ru"  var="russianLanguage"/>
  <fmt:message bundle="${loc}" key="local.language.en"  var="englishLanguage"/>
  <fmt:message bundle="${loc}" key="local.language"  var="language"/>
  
  <fmt:message bundle="${loc}" key="local.game.football" var="soccer"/>
  <fmt:message bundle="${loc}" key="local.game.basketball" var="basketball"/>
  <fmt:message bundle="${loc}" key="local.game.hockey" var="hockey"/>
  <fmt:message bundle="${loc}" key="local.game.allgames" var="allgames"/>
  <fmt:message bundle="${loc}" key="local.table.game.addnewgame" var="addnewgame"/>
  
  <fmt:message bundle="${loc}" key="local.table.game.time" var="time"/>
  <fmt:message bundle="${loc}" key="local.table.game.event" var="event"/>
  <fmt:message bundle="${loc}" key="local.table.game.home" var="home"/>
  <fmt:message bundle="${loc}" key="local.table.game.draw" var="draw"/>
  <fmt:message bundle="${loc}" key="local.table.game.away" var="away"/>
  <fmt:message bundle="${loc}" key="local.table.game.firstteam" var="firstteam"/>
  <fmt:message bundle="${loc}" key="local.table.game.secondteam" var="secondteam"/>
  <fmt:message bundle="${loc}" key="local.table.game.gameid" var="gameid"/>
  </head>
  <body>    
  
   <nav class="navbar navbar-default">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="redirectToIndexPage">${title}</a>
    </div>
     
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

      <ul class="nav navbar-nav navbar-right">      
     
     	<c:if test="${user != null }">   			
   			  <form action="Controller" method="get" class="navbar-form navbar-left"> 
   			   <input type="hidden" name="command" value="log_out_command"/>
   			  		<input class="navbar-form navbar-right" type="submit" value="${signoutbutton}" /> 
   			          <a href="redirectToPersonalPage"><span class="label label-primary navbar-form navbar-left">${user.email}</span></a>    	   
   			  </form>
   	    </c:if>
  
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${language} <span class="caret"></span></a>
          <ul class="dropdown-menu">
      		 <li>
             	<form action="Controller">             	 	
             	 	<input type="hidden" name="go_to_page" value="redirectToBookmakerPage"/>   
             	 	<input type="hidden" name="command" value="LOCALIZATION_COMMAND"/>          		
             		<input type="hidden" name="local" value="en"/>
             		<input type="submit" class="btn btn-default btn-xs form-control" value="${englishLanguage}"/>
             	</form>
             </li>
              <li>
             	<form action="Controller">             	 	
             	 	<input type="hidden" name="go_to_page" value="redirectToBookmakerPage"/>   
             	 	<input type="hidden" name="command" value="LOCALIZATION_COMMAND"/>          		
             		<input type="hidden" name="local" value="ru"/>
             		<input type="submit" class="btn btn-default btn-xs form-control" value="${russianLanguage}"/>
             	</form>
             </li>
          </ul>
        </li>        
      </ul>
    </div>
  </div>
</nav>

    <!-- Content -->
  <div class="container-fluid text-center">  
   <div class="row content">
      <div class="col-sm-2 sidenav">     
 			<%@ include file="/WEB-INF/pages/jspf_component/bookmaker_game_selector.jspf" %>
    </div>
  
      <div class="col-sm-8 text-left">
      <c:if test="${ game_kind == 'FOOTBALL' }">
      	<h2>${ soccer }</h2>
      </c:if>
      
      <c:if test="${ game_kind == 'BASKETBALL' }">
		<h2>${ basketball }</h2>
	</c:if>
	
	 <c:if test="${ game_kind == 'HOCKEY' }">
		<h2>${ hockey }</h2>
	</c:if>
	
      <c:if test="${ game_kind == null }">
		<h2>${allgames}</h2>
	</c:if>        
        
     <div class="container">
	<table class="table table-striped table-hover table-bordered">
	<thead>
		<tr>
			<td class="success">${gameid}</td>
			<td>${firstteam}</td>
			<td>${secondteam}</td>
			<td>${time}</td>
			<td>${home}</td>
			<td>${draw}</td>
			<td>${away}</td>
		</tr>
	</thead>
		<c:forEach var="game" items="${games}" >	 		
				<tr>
				  <td class="success">
				  			<c:out value="${game.id}"></c:out>
				  </td>
				  
				  <td >
				  			<c:out value="${game.firstTeam}"></c:out>
				  </td>
				  
				  <td>
				  			<c:out value="${game.secondTeam}"></c:out><br>
				  </td>
				  
				  <td>
				  			<c:out value="${game.date}"></c:out>
				  </td>
				    <td>
				  			<c:out value="${game.k1}"></c:out>
				  </td>
				    <td>
				  			<c:out value="${game.kx}"></c:out>
				  </td>
				    <td>
				  			<c:out value="${game.k2}"></c:out>
				  </td>
				</tr>			
		</c:forEach>
		</table> 
	</div>	

        <p><a href="redirectToAddNewGamePage" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-plus"/>${addnewgame}</a></p>
      </div>     
    </div>
   </div>
    <footer class="container-fluid text-center">
	  <p>Epam 2017</p>
	</footer>
  </body>
</html>