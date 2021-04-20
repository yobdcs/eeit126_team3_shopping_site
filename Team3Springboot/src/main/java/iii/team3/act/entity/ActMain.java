package iii.team3.act.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "act_main")
public class ActMain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_act")
	private int id_act;

	@Column(name = "name_act")
	private String name_act;

	@Column(name = "id_editor")
	private int id_editor;

	@Column(name = "date_begin", columnDefinition = "datetime")
	private String date_begin;

	@Column(name = "date_due", columnDefinition = "datetime")
	private String date_due;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_acp")
	private ActCrossProduct actCrossProduct;

	public ActMain() {

	}

	public ActMain(String name_act, int id_editor, String date_begin, String date_due) {
		this.name_act = name_act;
		this.id_editor = id_editor;
		this.date_begin = date_begin;
		this.date_due = date_due;
	}

	public int getId_act() {
		return id_act;
	}

	public void setId_act(int id_act) {
		this.id_act = id_act;
	}

	public String getName_act() {
		return name_act;
	}

	public void setName_act(String name_act) {
		this.name_act = name_act;
	}

	public int getId_editor() {
		return id_editor;
	}

	public void setId_editor(int id_editor) {
		this.id_editor = id_editor;
	}

	public String getDate_begin() {
		return date_begin;
	}

	public void setDate_begin(String date_begin) {
		this.date_begin = date_begin;
	}

	public String getDate_due() {
		return date_due;
	}

	public void setDate_due(String date_due) {
		this.date_due = date_due;
	}

	public ActCrossProduct getActCrossProduct() {
		return actCrossProduct;
	}

	public void setActCrossProduct(ActCrossProduct actCrossProduct) {
		this.actCrossProduct = actCrossProduct;
	}

	@Override
	public String toString() {
		return "ActMain [id_act=" + id_act + ", name_act=" + name_act + ", id_editor=" + id_editor + ", date_begin="
				+ date_begin + ", date_due=" + date_due + "]";
	}

}
