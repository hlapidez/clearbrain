<%@include file="/WEB-INF/views/front/header.jsp"%>
<br /><br /><br />
<div class="main-box span-24 last">
	<div class="prepend-4 span-20 last">
		<h2>
			<img src="<spring:url value="/images/front/tick-green.png" htmlEscape="true" />" alt="" />
			<spring:message code="signupcompleted.title" />
		</h2>
		<h3 class="alt"><spring:message code="signupcompleted.subtitle" /></h3>
		<br />
		<h4>
			<spring:message code="signupcompleted.canAccessDashboard" />
			<a href="<spring:url value="/dashboard" htmlEscape="true" />"> <spring:message code="signupcompleted.link" /></a>.
		</h4>
	</div>
</div>
<%@include file="/WEB-INF/views/front/footer.jsp"%>
