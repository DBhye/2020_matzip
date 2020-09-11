<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div id="sectionContainerCenter">
	<div>
		<form id="frm" action="/restaurant/regProc" method="post">
			<div><input type="text" name="nm" placeholder="가게명"></div>
			<div>
				<input type="text" name="addr" placeholder="주소">
				<button type="button" onclick="getLatLng()">좌표가져오기</button>
			</div>
			<input type="hidden1" name="lat" value="0">
			<input type="hidden1" name="lng" value="0">
			<div>
				카테고리 : 
				<select name="cd_category">
					<c:forEach items="${categoryList}" var="item">
						<option value="${item.cd}">${item.val}</option>
					</c:forEach>
				</select>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ab3d71d45b40c5eaec83805c9a73569&libraries=services"></script>
	<script>
	
		const geocoder = new kakao.maps.services.Geocoder();
	
		function getLatLng() {
			const addrStr = frm.addr.value
			
			if(addrStr.length < 9) {
				alert('주소를 확인해 주세요')
				frm.addr.focus()
				return
			}
			
			geocoder.addressSearch(addrStr, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
			        console.log(result[0]);
			    }	
			});			
		}
	</script>
</div>

'















