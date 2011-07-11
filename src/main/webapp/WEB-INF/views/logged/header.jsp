<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="<spring:url value="/css/blueprint/screen.css" />" media="screen, projection" />
	<link rel="stylesheet" href="<spring:url value="/css/blueprint/print.css" />" type="text/css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="<spring:url value="/css/blueprint/ie.css" />" type="text/css" media="screen, projection" />
	<![endif]-->
	<link rel="stylesheet" href="<spring:url value="/css/logged.css" />" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="<spring:url value="/js/jquery-1.6.2.min.js" />"></script>
	<script type="text/javascript" src="<spring:url value="/js/jquery-ui-1.8.14.custom.min.js" />"></script>
	<script type="text/javascript" src="<spring:url value="/js/jquery-clearfield.min.js" />"></script>
	<script type="text/javascript">
		$('#m-notes-container, #m-profile-container').live('hover', function(){$(this).find('.dropdown').toggle();});
		<c:if test="${i18nJS != null && not empty i18nJS}">
			var i18n = new Array();
			<c:forEach var="entry" items="${i18nJS}">i18n["${entry.key}"]="${entry.value}";</c:forEach>
		</c:if>
	</script>
	<script type="text/javascript" src="<spring:url value="/js/logged.js" />" ></script>
	<title>~S2NDBRN logged~</title>
</head>

<body>
	<div id="menu">
		<div class="container">
			<div class="span-24 last">
				<%-- Left --%>
				<div id="logo"><a href="<spring:url value="/dashboard" />">ClearBrain</a></div>
				<a id="m-today" class="m-datebox" href="javascript:alert('TODO');">
					<spring:message code="header.menu.today" /><span>1</span><%-- TODO --%>
				</a>
				<a id="m-tomorrow" class="m-datebox" href="javascript:alert('TODO');">
					<spring:message code="header.menu.tomorrow" /><span>4</span><%-- TODO --%>
				</a>
				<a id="m-week" class="m-datebox" href="javascript:alert('TODO');">
					<spring:message code="header.menu.week" /><span>22</span><%-- TODO --%>
				</a>

				<%-- Right --%>
				<div id="m-profile-container" class="m-dropdown">
					<a id="m-profile">
						<spring:message code="header.menu.profile" /><img src="<spring:url value="/images/logged/dropdown.png" />" />
					</a>
					<div class="dropdown">
						<ul>
							<li class="dropdown-li-top"><a id="m-settings" href="javascript:alert('TODO');">
								<spring:message code="header.menu.settings" /></a>
							</li>
							<li>
								<a id="m-stats" href="javascript:alert('TODO');"><spring:message code="header.menu.stats" /></a>
							</li>
							<li>
								<a id="m-help" href="javascript:alert('TODO');"><spring:message code="header.menu.help" /></a>
							</li>
							<li>
								<a id="m-logout" href="<spring:url value="/j_spring_security_logout" />">
								<spring:message code="header.menu.logout" /></a>
							</li>
						</ul>
					</div>
				</div>
				<div id="m-notes-container" class="m-dropdown">
					<a id="m-notes">
						<spring:message code="header.menu.notes" /><img src="<spring:url value="/images/logged/dropdown.png" />" />
					</a>
					<div class="dropdown">
						<ul>
							<li class="dropdown-li-top">
								<a id="m-add" href="javascript:alert('TODO');"><spring:message code="header.menu.add" /></a>
							</li>
							<li>
								<a id="m-memo" href="javascript:alert('TODO');"><spring:message code="header.menu.memo" /></a>
							</li>
							<li>
								<a id="m-search" href="javascript:alert('TODO');"><spring:message code="header.menu.search" /></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="content" class="container">
		<div id="blank">&nbsp;</div>