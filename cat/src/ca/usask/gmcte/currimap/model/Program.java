package ca.usask.gmcte.currimap.model;

// Generated Dec 3, 2011 11:40:19 AM by Hibernate Tools 3.2.4.GA

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.Length;
import org.hibernate.validator.NotNull;

/**
 * Program generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "program")
public class Program implements java.io.Serializable, Comparable<Program>
{

	private int id;
	private Organization organization;
	private String name;
	private String description;
	private List<LinkCourseProgram> linkCoursePrograms = new ArrayList<LinkCourseProgram>(0);
	private List<LinkProgramProgramOutcome> linkProgramOutcomes = new ArrayList<LinkProgramProgramOutcome>(0);

	public Program()
	{
	}

	public Program(int id, String name)
	{
		this.id = id;
		this.name = name;
	}

	public Program(int id, Organization organization, String name,
			String description, List<LinkCourseProgram> linkCoursePrograms)
	{
		this.id = id;
		this.organization = organization;
		this.name = name;
		this.description = description;
		this.linkCoursePrograms = linkCoursePrograms;
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
	@JoinColumn(name = "organization_id")
	public Organization getOrganization()
	{
		return this.organization;
	}

	public void setOrganization(Organization organization)
	{
		this.organization = organization;
	}

	@Column(name = "name", nullable = false, length = 100)
	@NotNull
	@Length(max = 100)
	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "description", length = 1024)
	@Length(max = 1024)
	public String getDescription()
	{
		return this.description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "program")
	//@OrderBy("display_index")
	public List<LinkCourseProgram> getLinkCoursePrograms()
	{
		return this.linkCoursePrograms;
	}

	public void setLinkCoursePrograms(List<LinkCourseProgram> linkCoursePrograms)
	{
		this.linkCoursePrograms = linkCoursePrograms;
	}

	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "program")
	public List<LinkProgramProgramOutcome> getLinkProgramOutcomes()
	{
		return linkProgramOutcomes;
	}

	public void setLinkProgramOutcomes(List<LinkProgramProgramOutcome> linkProgramOutcomes)
	{
		this.linkProgramOutcomes = linkProgramOutcomes;
	}

	@Transient
	@Override
	public int compareTo(Program other) {
		return id - other.getId();
	}

}
