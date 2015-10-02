package co.com.bnpparibas.cardif.valoracion.dto;

public class ObjetivosDTO {

	String objetivo;
	String formula;
	Long peso;
	Long cumplimiento;
	Long nota;
	Long meta;
	
	
	public Long getMeta() {
		return meta;
	}
	
	public void setMeta(Long meta) {
		this.meta = meta;
	}
	
	public ObjetivosDTO() {
		super();
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	public Long getPeso() {
		return peso;
	}
	public void setPeso(Long peso) {
		this.peso = peso;
	}
	public Long getCumplimiento() {
		return cumplimiento;
	}
	public void setCumplimiento(Long cumplimiento) {
		this.cumplimiento = cumplimiento;
	}
	public Long getNota() {
		return nota;
	}
	public void setNota(Long nota) {
		this.nota = nota;
	}
	
	
}
