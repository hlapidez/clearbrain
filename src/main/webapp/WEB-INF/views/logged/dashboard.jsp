<%@include file="/WEB-INF/views/logged/header.jsp"%>

<%-- Left --%>
<div class="span-7">
	<%-- Date --%>
	<div class="top-frames date-container">
		<%-- TODO: Capitalize first letter --%>
		<spring:message code="header.dateFormat" var="dateFormat" />
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:formatDate value="${today}" pattern="${dateFormat}" />
	</div><br /><br />

	<%-- Categories --%>
	<div class="title"><spring:message code="dashboard.cat.title" /></div><br />
	<div id="categories-container">
		<ul id="categories" class="pointer">
			<c:forEach items="${categoriesList}" var="cur">
				<li id="cat-<c:out value="${cur.id}" />" class="category">
					<span id="catname-<c:out value="${cur.id}" />"><c:out value="${cur.name}" /></span>
					<span id="catcount-<c:out value="${cur.id}" />" class="category-count">(TODO)</span>
					<span id="catmenu-<c:out value="${cur.id}" />" class="category-menus">
						<a id="catrnm-<c:out value="${cur.id}" />" href="javascript:alert('TODO');"><img src="<spring:url value="/images/logged/cat-edit.gif" />" /></a>
						<a id="catrmv-<c:out value="${cur.id}" />"><img src="<spring:url value="/images/logged/cat-remove.png" />" /></a>
					</span>
				</li>
			</c:forEach>
		</ul>
		<div id="cat-unclassified" class="category category-selected">
			<span id="catname-0"><spring:message code="dashboard.cat.unclassified" /></span>
			<span id="catcount-0" class="category-count">(TODO)</span>
		</div>
	</div>
	<%-- Categories edition link --%>
	<div id="categories-edit-link">
		<a id="categories-edit">
			<spring:message code="dashboard.cat.edit" /> <img src="<spring:url value="/images/logged/edit.gif" />" />
		</a>
	</div>
	<%-- Categories edition container --%>
	<div id="categories-edit-container" class="hide">
		<b><spring:message code="dashboard.cat.insert" /></b><br />
		<input id="catadd-name" type="text" class="category" /><br />
		<i><spring:message code="dashboard.cat.insert.help" /></i><br />
		<a id="categories-endedit">
			<spring:message code="dashboard.cat.finEdit" /> <img src="<spring:url value="/images/logged/grey-tick.png" />" />
		</a>
	</div>
	<br />
</div>

<%-- Right --%>
<div class="span-17 last">
	<div id="insert-note-container" class="top-frames">
		<input id="quick-add-task" class="clearField clearFieldBlurred" type="text" value="<spring:message code="dashboard.note.quickInsert" />" />
	</div><br /><br />

	<%-- Notes --%>
	<div class="title">Notes:</div><br />
	<div id="notes-container">
		<c:forEach items="${notesList}" var="cur">
			<div id="note-<c:out value="${cur.id}" />" class="note">
				<input type="checkbox"> <c:out value="${cur.name}" />
				<span id="noteedit-<c:out value="${cur.id}" />" class="notes-edit"><a href="javascript:alert('TODO');"><img src="<spring:url value="/images/logged/edit.gif" />" /></a></span>
				<div id="notecat-<c:out value="${cur.id}" />" class="note-category">TODO</div>
			</div>
		</c:forEach>
	</div>
</div>

<%-- Preload some images --%>
<img class="hide" src="<spring:url value="/images/logged/cat-bg-to-note.png" />" />

<%@include file="/WEB-INF/views/logged/footer.jsp"%>
