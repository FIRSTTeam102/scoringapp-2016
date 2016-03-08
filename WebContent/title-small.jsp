<img class="title-small" src="Images/frc-stronghold-logo.png" />
				<div id="Tournament" class="header">
					<c:forEach var="t" items="${tournament.rows}">
						<c:out value="${t.title}" />
					</c:forEach>
				</div>