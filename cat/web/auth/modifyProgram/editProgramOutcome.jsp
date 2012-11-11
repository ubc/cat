<%@ page import="java.util.*,java.net.*,ca.usask.gmcte.util.*,ca.usask.gmcte.currimap.action.*,ca.usask.gmcte.currimap.model.*,org.hibernate.validator.Length"%>
<%
int linkId = HTMLTools.getInt(request.getParameter("link_id"));
OutcomeManager om = OutcomeManager.instance();
LinkProgramProgramOutcome existing = om.getLinkProgramProgramOutcomeById(linkId);


ProgramOutcome outcome =  existing.getProgramOutcome();
int fieldSize= (ProgramOutcome.class.getMethod("getName")).getAnnotation(Length.class).max();
String existingValue = outcome.getName();
%>
<form name="genericFieldForm" id="genericFieldForm" method="post" action="" >
	
<input type="hidden" name="link_id" id="link_id" value="<%=linkId%>"/>
	<div class="formElement">
		<div class="label">Program Outcome:</div>
		<div class="field">
			<textarea name="new_value" id="new_value" cols="40" rows="10"><%=existingValue%></textarea>
		</div>
		<div class="error" id="new_valueMessage" style="padding-left:10px;"></div>
		<div class="spacer"> </div>
	</div>
	<%
	int departmentId = HTMLTools.getInt(request.getParameter("department_id"));
	
	int programId = HTMLTools.getInt(request.getParameter("program_id"));
	Program program = ProgramManager.instance().getProgramById(programId);
		
	String parameterString = "";
	Department department = DepartmentManager.instance().getDepartmentById(departmentId);
	List<CharacteristicType> charTypes = department.getCharacteristicTypes();
	List<Characteristic> outcomeCharacteristics = new ArrayList<Characteristic>();
	outcomeCharacteristics = om.getCharacteristicsForProgramOutcome(program,outcome, department);
	for(int i=0; i< charTypes.size() ; i++)
	{
		CharacteristicType temp = charTypes.get(i);
		int selectedId = -1;
		for(Characteristic charac: outcomeCharacteristics)
		{
			if(charac.getCharacteristicType().getId() == temp.getId())
				selectedId = charac.getId();
		}
		
		%>
			<jsp:include page="/auth/modifyProgram/characteristicType.jsp">
				<jsp:param name="selectedId" value="<%=selectedId%>" />
				<jsp:param name="charTypeId" value="<%=temp.getId()%>"/>
				<jsp:param name="index" value="<%=i%>"/>
			</jsp:include>
		<% 
		parameterString += ",'characteristic_"+i+"','characteristic_type_"+i+"'";
	}
	%>
	<input type="hidden" name="department_id" id="department_id" value="<%=departmentId%>"/>
	<input type="hidden" name="program_id" id="program_id" value="<%=programId%>"/>
	
	<input type="hidden" name="char_count" id="char_count" value="<%=charTypes.size()%>"/>
	<br/>
	<div class="formElement">
		<div class="label"><input type="button" 
				   name="saveCourseOfferingOutcomeButton" 
				   id="saveCourseOfferingOutcomeButton" 
				   value="Save" 
				   onclick="saveProgram(new Array('new_value'),
				   				new Array('link_id','new_value'<%=parameterString%>,'department_id','program_id','program_outcome_group_id','char_count','outcome_id'),'ProgramOutcomeWithCharacteristics');" /></div>
		<div class="field"><div id="messageDiv" class="completeMessage"></div></div>
		<div class="spacer"> </div>
	</div>

</form>
		