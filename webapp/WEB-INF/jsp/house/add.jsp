<%--
  Created by IntelliJ IDEA.
  User: PC-S510
  Date: 14-5-20
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/jsp/common/_includes.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/_head.jsp">
	<jsp:param name="title" value="转发" />
	<jsp:param name="vendorCss"
		value="bootstrap/dist/css/bootstrap,jquery-ui/jquery-ui" />
	<jsp:param name="css" value="main,share" />
</jsp:include>

<div class="share-main">
	<div class="detail-container center-block">
		<div class="clearfix pd_t20 mg_b20 width-fixed container">
		<h4 class="font-bold mg_l15 mg_b20">编辑并转发</h4>
		<form class="boxWrapBlue form-horizontal">
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>广告标题：</div>
				<div class="content">
					<div class="item">
						<input type="text" id="title" value="" placeholder="请输入广告词" class="inline form-control w300"/>
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>房源编号：</div>
				<div class="content">
					<div class="item">
						<input type="text" id="houseCode" value="" placeholder="请输入房源编号" class="inline form-control w300"/>
					</div>
				</div>
				<div class="title">房源信息：</div>
				<div class="content">
					<div class="row">
						<div class="col-md-3">租金<strong class="mg_l15">${houseMessage.price }${houseMessage.unit }</strong></div>
						<div class="col-md-3">户型<strong class="mg_l15">${houseMessage.room }室${houseMessage.hall }厅${houseMessage.toilet }卫</strong></div>
						<div class="col-md-3">面积<strong class="mg_l15"><fmt:formatNumber value="${houseMessage.acreage }" type="number" pattern="0.00" />平米</strong></div>
						<div class="col-md-3">小区<strong class="mg_l15">${houseMessage.propertyName }</strong></div>
					</div>
					<div class="row">
						<div class="col-md-3">楼层<strong class="mg_l15">${houseMessage.floorPosition } / 总${houseMessage.totalFloor }层</strong></div>
						<div class="col-md-3">朝向<strong class="mg_l15">${houseMessage.direction}</strong></div>
						<div class="col-md-3">装修<strong class="mg_l15">${houseMessage.decoration }</strong></div>
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>出租价格：</div>
				<div class="content">
					<div class="item">
						<input type="text" id="price" value="${houseMessage.price }" placeholder="请输入每月出租价格" class="inline form-control w150"/><span class="mg_l20">元/月</span>
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>联系人：</div>
				<div class="content">
					<div class="item">
						<input type="text" id="name" value="${houseMessage.userName }" placeholder="请输入联系人姓名" class="inline form-control w150">
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>电话：</div>
				<div class="content">
					<div class="item">
						<input type="text" id="phone" value="${houseMessage.mobilePhone }" placeholder="请输入联系人电话" class="inline form-control w150">
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="field">
				<div class="title"><span class="red">*&nbsp;</span>选择照片：</div>
				<div class="content">
					<div class="mg_b10">（单击选中要展示的照片，任意拖拽更改照片排列顺序）</div>
					<div id="sortable" class="clearfix">
						<script type="text/javascript">
						var pictureListNow = {};
						</script>
						<c:forEach var="house" items="${houseMessage.housePictureList }" varStatus="ele">
						<script type="text/javascript">
						pictureListNow['${house.pictureUrl }'] = true;
						</script>
						<div class="col-md-3">
							<a href="#" class="thumbnail active">
								<img src="<app:PhotoFullPath url="${house.pictureUrl }" size="ORIGINAL"/>" realsrc="${house.pictureUrl }">
								<div class="caption" data-remark="${house.remark }">${house.remark }</div>
								<span class="glyphicon glyphicon-ok"></span>
							</a>
						</div>
						</c:forEach>
					</div>
					<p>您共选中 <strong><span id="photoCount">${fn:length(houseMessage.housePictureList) }</span></strong> 张房源照片</p>
				</div>
			</div>
		</form>
		<button id="gene" class="mg_t20 pull-right btn btn-primary">生成立即看</button>
		</div>
	</div>
</div>
<script type="text/javascript">
var houseId = '${houseMessage.id}';
var propertyId = '${houseMessage.houseCode}';
</script>
<jsp:include page="/WEB-INF/jsp/common/_foot.jsp">
	<jsp:param name="js" value="share" />
</jsp:include>