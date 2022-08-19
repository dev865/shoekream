<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<jsp:include page="../commons/header.jsp" />

<style>
p {
	font-size: 13px;
	font-family: -apple-system, BlinkMacSystemFont, Roboto,
		AppleSDGothicNeo-Regular, NanumBarunGothic, NanumGothic, 나눔고딕,
		Segoe UI, Helveica, Arial, Malgun Gothic, Dotum, sans-serif;
	color: #3d3d3d;
	margin: 0;
}

.productitempic {
	height: 180px;
	position: relative;
	background-position: center center;
}

#imggg {
	border-radius: 0.5em;
	background-color: #ebf0f5;
	height: auto;
	width: auto;
}

.product[data-v-75e33658] {
	padding: 0;
	overflow: hidden;
	position: relative;
	padding-top: 100%;
	border-radius: 8px;
}

.productitemtext {
	padding-top: 11px;
	position: relative;
}

#title {
	display: inline-block;
	vertical-align: top;
	line-height: 16px;
	font-size: 14px;
	letter-spacing: -.21px;
	font-weight: 700;
	color: #333;
}

#name[data-v-6a8ef390] {
	line-height: 16px;
	font-size: 13px;
}

#translated_name[data-v-6a8ef390] {
	line-height: 14px;
	font-size: 12px;
	letter-spacing: -.06px;
	color: rgba(34, 34, 34, .5);
}
</style>

<jsp:include page="../member/mypagesidebar.jsp" />

<div data-v-5f779880="" data-v-3d7f7af7="" class="content_area">
	<div data-v-5f779880="" class="my_home">
		<div data-v-6752ceb2="" data-v-5f779880="" class="my_home_title">
			<h3 data-v-6752ceb2="" class="title">관리자 모드</h3>
		</div>
		<div data-v-5f779880="" class="recent_purchase">
			<div data-v-bbed98be="" data-v-5f779880=""
				class="purchase_list_tab sell">
				<div data-v-bbed98be="" class="tab_item total">
					<a data-v-bbed98be="" href="#" class="tab_link"
						style="pointer-events: none;"><dl data-v-bbed98be=""
							class="tab_box">
							<dt data-v-bbed98be="" class="title">전체</dt>
							<dd data-v-bbed98be="" class="count">${selDTO.totalCount}</dd>
						</dl></a>
				</div>
				<div data-v-bbed98be="" class="tab_item tab_on">
					<a data-v-bbed98be="" href="#" class="tab_link"
						style="pointer-events: none;"><dl data-v-bbed98be=""
							class="tab_box">
							<dt data-v-bbed98be="" class="title">활성</dt>
							<dd data-v-bbed98be="" class="count">${selDTO.bidCount}</dd>
						</dl></a>
				</div>
				<div data-v-bbed98be="" class="tab_item">
					<a data-v-bbed98be="" href="#" class="tab_link"
						style="pointer-events: none;"><dl data-v-bbed98be=""
							class="tab_box">
							<dt data-v-bbed98be="" class="title">비활성</dt>
							<dd data-v-bbed98be="" class="count">${selDTO.endCount}</dd>
						</dl></a>
				</div>
			</div>
			<div data-v-5f779880="">
				<div data-v-21d527e4="" data-v-5f779880=""
					class="purchase_list all ask">

					<c:choose>
						<c:when test="${selDTO.totalCount eq 0}">
							<div data-v-e2f6767a="" data-v-21d527e4="" class="empty_area">
								<p data-v-e2f6767a="" class="desc">거래 내역이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${selDTO.history}" var="history"
								varStatus="status" begin="0" end="2">
								<div data-v-62dace61="" data-v-21d527e4=""
									class="purchase_item buy" data-itemno="${history.itemNo}">
									<div data-v-62dace61="" class="history_product">
										<div data-v-62dace61="" class="product_box">
											<div data-v-75e33658="" data-v-62dace61="" class="product"
												style="background-color: rgb(235, 240, 245);">

												<picture data-v-548c90f9="" data-v-75e33658=""
													class="picture product_img"> <img
													data-v-548c90f9="" alt="#" src="${history.thImg }"
													class="image"> </picture>

												<!---->
												<!---->
												<!---->
											</div>
										</div>
										<div data-v-62dace61="" class="product_detail">
											<!---->
											<p data-v-62dace61="" class="name">${history.eName}</p>
											<p data-v-62dace61="" class="size">
												<span data-v-62dace61="" class="size_text">${history.shoeSize}</span>
											</p>
										</div>
									</div>
									<div data-v-62dace61="" class="history_status">
										<c:choose>
											<c:when test="${history.isSold eq 1}">
												<div data-v-62dace61="" class="status_box field_status">
													<span data-v-62dace61="" class="status_txt text-default">거래완료</span>
													<!---->
												</div>
											</c:when>
											<c:otherwise>
												<div data-v-62dace61="" class="status_box field_status">
													<span data-v-62dace61="" class="status_txt text-default">거래중</span>
													<!---->
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!---->
					<!---->
					<!---->
					<!---->
				</div>
				<!---->
			</div>
		</div>
		<!---->
	</div>
</div>
</div>
<span id="grade" style="display: none;">${ses.grade}</span>

<script>
	let pagehdlr = '<c:out value="${productDTO.pagehdlr.totalCount}"/>';
	console.log('pageHandler : ' + pagehdlr);
	let productList = '<c:out value="${productDTO.productList}"/>';
	console.log('productList : ' + productList);
</script>
<script src="../../resources/js/product/adminlist.js"></script>
<script src="../../resources/js/member/historylist.js"></script>
<jsp:include page="../commons/footer.jsp" />