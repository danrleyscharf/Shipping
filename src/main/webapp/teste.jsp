<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/layout" prefix="layout"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<layout:template>
	<jsp:attribute name="cssEspecificos">
	 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
	</jsp:attribute>
	<jsp:attribute name="scriptsEspecificos">
		<script type="text/javascript">
			$("#frm").submit(function() {
				$.ajax({
					type : $("#frm").attr('method'),
					url : $("#frm").attr('action'),
					data : $('#frm').serialize(),
					success : function(data) {
						swal({   
							title: "Salvo!",   
							text: "Registro salvo com sucesso.",   
							type: "success",   
							showCancelButton: false,   
							confirmButtonColor: "#DD6B5",   
							confirmButtonText: "Ok",   
							closeOnConfirm: false }, 
							function(){
								window.location = '<c:url value="/historicosViagens/"/>';
						});
					},//Fim success
					error : function() {
						swal("Falha!","Falha ao salvar registro.",
								"error");
					}
				});//Fim ajax
				return false;
			}); //Fim submit
		</script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">		
		$( function() {
		    $( "#dataHistorico" ).datepicker("option", "dateFormat", "dd/mm/yy");
		  } );
		</script>
		<script>
			var latitude = document.getElementById("latitude");
			var longitude = document.getElementById("longitude");
			function getLocation() {
				if (navigator.geolocation){
					navigator.geolocation.getCurrentPosition(showPosition);
				}else {
					x.innerHTML="O seu navegador não suporta Geolocalização.";
				}
			}
			function showPosition(position) {
			  latitude.value = position.coords.latitude;
			  longitude.value = position.coords.longitude;  
			  initMap(latitude.value, longitude.value);
			}
		</script>
		<script>
	      function initMap(latitude, longitude) {
	    	  var myLatLng = {lat: -26.1973, lng: -52.6891};
	
	        // Create a map object and specify the DOM element
	        // for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          zoom: 10
	        });
	
	        // Create a marker and set its position.
	        var marker = new google.maps.Marker({
	          map: map,
	          position: myLatLng,
	          title: 'Posição!'
	        });
	      }
	
	    </script>
	    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqBd4mX6U4lRLEuNPBCWe08pkU6NzTEn4&callback=initMap"
        async defer></script>
	</jsp:attribute>

	<jsp:body>

	
				
		            <div class="col-md-3 col-md-offset-3">	
		            	<h1>Cadastro de Históricos</h1>
						<form id="frm" action="<c:url value="/historicosViagens/"/>"
								method="POST" class="well span6">
							
							<div class="form-group">
								<label for="id">Código:</label>
								<input type="text" id="id" name="id" value="${historicosViagens.id}"
								readonly class="form-control" />
							</div>		
							
							<div class="form-group">
								<label for="descricao">Descrição:</label>
								<input type="text" id="descricao" name="descricao"
								class="form-control" value="${historicosViagens.descricao}" />
							</div>
							
							<div class="form-group">
								<label for="dataHistorico">Data:</label>
								<input type="text" id="dataHistorico" name="dataHistorico"
								class="form-control" value="<fmt:formatDate pattern = "dd/MM/yyyy" 
         							value = "${historicosViagens.dataHistorico}" />"  />
							</div>
							
							<div class="form-group">
								<label for="latitude">Latitude:</label>
								<input type="text" id="latitude" name="latitude"
								readonly class="form-control" value="${historicosViagens.latitude}" />
							</div>
							
							<div class="form-group">
								<label for="longitude">Longitude:</label>
								<input type="text" id="longitude" name="longitude"
								readonly class="form-control" value="${historicosViagens.longitude}" />
							</div>
							
							<div class="form-group">
							<label for="viagens">Viagem:</label>
								<select id="viagens" name="viagens" class="form-control">
									<option value="">(Selecione)</option>
									<c:forEach var="viagem" items="${viagens}">
										<option value="${viagem.id}"
												${viagem.id==historicosViagens.viagem.id ? 'selected' : ''}>
										${viagem.id}</option>
									</c:forEach>
								</select>	
							</div>
							
							<button type="reset" class="btn btn-default">Limpar</button>
							<button type="submit" class="btn btn-primary">Salvar</button>
							
						</form>
						
						<br>
						<button onclick="getLocation()" class="btn btn-default">Obter Localização</button>
					</div>
					<div class="" style="clear:both"></div>				
					<div id="map">Teste</div>

	</jsp:body>
</layout:template>