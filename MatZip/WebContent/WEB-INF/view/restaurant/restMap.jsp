<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sectionContainerCenter">
	<div id="mapContainer" style="width:100%; height:100%;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ab3d71d45b40c5eaec83805c9a73569"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script>		
		const options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.8641294, 128.5942331), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(mapContainer, options);
		
		console.log(map.getCenter())
		
		function getRestaurantList() {
			axios.get('/restaurant/ajaxGetList').then(function(res) {
				console.log(res.data)
				
				res.data.forEach(function(item) {
					console.log('item : ' + item)
					
					var na = {
							'na': {
								'Ga': item.lng,
								'Ha': item.lat	
							}
					}
					
					console.log('na : ' + na.na)
					var marker = new kakao.maps.Marker({
					    position: na 
					});
					
					marker.setMap(map)
				})
			})		
		}
		getRestaurantList()
		
		/*
			na: {
				Ga: 128.5942107684672
				Ha: 35.86410635758569
			}
		
		*/
	</script>
</div>