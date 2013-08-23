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


<%@ page import="java.util.*,java.net.*,ca.usask.gmcte.util.*,ca.usask.gmcte.currimap.action.*,ca.usask.gmcte.currimap.model.*"%>



	
<%
String courseOfferingId = request.getParameter("course_offering_id");
int linkId = HTMLTools.getInt(request.getParameter("link_id"));
LinkCourseOfferingAssessment o = new LinkCourseOfferingAssessment();
CourseManager cm = CourseManager.instance();
if(linkId > -1)
{
	o = cm.getLinkAssessmentById(linkId);
}
List<AssessmentFeedbackOptionType> questions = cm.getAssessmentFeedbackQuestions();
List<AssessmentFeedbackOption> selectedOptions = cm.getAssessmentOptionsSelectedForLinkOffering(linkId);

TreeMap<String ,AssessmentFeedbackOption> optionIdMapping = new TreeMap<String ,AssessmentFeedbackOption>();
for(AssessmentFeedbackOption selectedOption: selectedOptions )
{
	optionIdMapping.put(""+selectedOption.getId(),selectedOption);
}
%>

<a href="javascript:hideDiv('additionalAssessmentInfo_<%=linkId%>')" class="smaller">hide</a>

<table>
	<tr>
		<th>Question</th>
		<th>Answer</th>
	</tr>

<%
for(AssessmentFeedbackOptionType question: questions)
{
%>
	<tr>
		<td><%=question.getQuestion()%></td>
		<td>
				<%
				String questionType = question.getQuestionType();
				List<AssessmentFeedbackOption> options = cm.getAssessmentOptionsForQuestion(question.getId());
				for(AssessmentFeedbackOption option:options)
				{
					if(optionIdMapping.containsKey(""+option.getId()))
					{
						%>
						<%=optionIdMapping.get(""+option.getId()).getName() %>
						<br>
						<%
					}
				}
							
				%>
		</td>
	</tr>
<%
}
%>
</table>
