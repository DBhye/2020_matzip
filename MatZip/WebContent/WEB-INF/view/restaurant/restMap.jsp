<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sectionContainerCenter">
	<div id="mapContainer" style="width:100%; height:100%;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ab3d71d45b40c5eaec83805c9a73569"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>
			
		const options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.958437, 128.486084), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(mapContainer, options);
		
		function getRestaurantList() {
			axios.get('/restaurant/ajaxGetList').then(function(res) {
				console.log(res.data)
				
				res.data.forEach(function(item) {					
					var mPos = new kakao.maps.LatLng(item.lat, item.lng)
					
					var marker = new kakao.maps.Marker({
					    position: mPos 
					});
					
					marker.setMap(map)
				})
			})		
		}
		getRestaurantList()
		
		
		// check for Geolocation support
		if (navigator.geolocation) {
		  console.log('Geolocation is supported!');
		  
		  var startPos;		  
		  navigator.geolocation.getCurrentPosition(function(pos) {		
			  	startPos = pos			  
			    console.log('lat : ' + startPos.coords.latitude)
			    console.log('lng : ' + startPos.coords.longitude)
			    
			    if(map) {
				    var moveLatLon = new kakao.maps.LatLng(startPos.coords.latitude, startPos.coords.longitude)
				    map.panTo(moveLatLon)			    	
			    }
		  });
		  
		} else {
		  console.log('Geolocation is not supported for this Browser/OS.');
		}
	</script>
</div>