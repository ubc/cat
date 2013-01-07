package ca.usask.gmcte.currimap.model;

// Generated Dec 3, 2011 11:40:19 AM by Hibernate Tools 3.2.4.GA

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.NotNull;

/**
 * LinkCourseOfferingOutcome generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "link_program_program_outcome")
public class LinkProgramProgramOutcome implements java.io.Serializable
{

	private int id;
	private Program program;
	private ProgramOutcome programOutcome;
	
	public LinkProgramProgramOutcome()
	{
	}

	public LinkProgramProgramOutcome(int id, Program p,
			CourseClassification courseClassification, ProgramOutcome programOutcome)
	{
		this.id = id;
		this.program = p;
		this.programOutcome = programOutcome;
	}

	@Id @GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public int getId()
	{
		return this.id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "program_id", nullable = false)
	@NotNull
	public Program getProgram()
	{
		return this.program;
	}

	public void setProgram(Program p)
	{
		this.program = p;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "program_outcome_id", nullable = false)
	@NotNull
	public ProgramOutcome getProgramOutcome()
	{
		return this.programOutcome;
	}

	public void setProgramOutcome(ProgramOutcome outcome)
	{
		this.programOutcome = outcome;
	}
}
