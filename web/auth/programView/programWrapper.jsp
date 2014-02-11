<%-- 
    Copyright 2012, 2013 University of Saskatchewan

    This file is part of the Curriculum Alignment Tool (CAT).

    CAT is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    CAT is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with CAT.  If not, see <http://www.gnu.org/licenses/>.
--%>


<%@ page import="java.util.*,ca.usask.gmcte.currimap.action.*,ca.usask.gmcte.util.*,ca.usask.gmcte.currimap.model.*"%>
<jsp:include page="/header.jsp"/>
		<div id="content-and-context" style="overflow:auto;">
			<div class="wrapper" style="overflow:auto;"> 
				<ul class="breadcrumb">
					<li>
						<a href="/cat">Curriculum Alignment Tool</a>
						<span class="divider">/</span>
					</li>
					<li class="active">
						Program Information
					</li>
				</ul>  
				<div id="content" style="overflow:auto;"> 
					<div id="program" class="module" style="overflow:auto;">
						<jsp:include page="program.jsp"/>
					</div>
					<div id="modifyDiv" class="fake-input" style="display:none;"></div>
				</div>
			</div>
		</div>


<jsp:include page="/footer.jsp"/>		
