/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author User
 */
@Entity
@Table(name = "GENERAL_DATA", catalog = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"PERFORMANCE_ID"})})
@SequenceGenerator(name = "idGenerator", sequenceName = "GENERAL_DATA_SEQ", allocationSize = 1)
public class GeneralData implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idGenerator")
    @Column(name = "NUMBER_ID", nullable = false, precision = 19, scale = 2)
    private BigDecimal numberId;
    
    @Column(name = "DOCUMENT_NUMBER", nullable = true, length = 20)
    private String documentNumber;
    
    @Column(name = "ACTUAL_CHARGE", length = 255)
    private String actualCharge;
    @Column(name = "BOSS", length = 255)
    private String boss;
    @Column(name = "BOSS_CHARGE", length = 255)
    private String bossCharge;
    @Column(name = "DATE_")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Column(name = "EVALUATION_TYPE", length = 255)
    private String evaluationType;
    @Column(name = "NAMES", length = 255)
    private String names;
    @Column(name = "PERIOD", length = 255)
    private String period;
    @Column(name = "YEAR", length = 5)
    private String year;
    @Column(name = "AREA", length = 55)
    private String area;
    
    @JoinColumn(name = "PERFORMANCE_ID", referencedColumnName = "PERFORMANCE_ID")
    @OneToOne
    private Performance performanceId;
    @OneToOne(mappedBy = "numberId")
    private Survey survey;

    public GeneralData() {
    }

    public GeneralData(BigDecimal numberId) {
        this.numberId = numberId;
    }

    public BigDecimal getNumberId() {
        return numberId;
    }

    public void setNumberId(BigDecimal numberId) {
        this.numberId = numberId;
    }

    public String getActualCharge() {
        return actualCharge;
    }

    public void setActualCharge(String actualCharge) {
        this.actualCharge = actualCharge;
    }

    public String getBoss() {
        return boss;
    }

    public void setBoss(String boss) {
        this.boss = boss;
    }

    public String getBossCharge() {
        return bossCharge;
    }

    public void setBossCharge(String bossCharge) {
        this.bossCharge = bossCharge;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getEvaluationType() {
        return evaluationType;
    }

    public void setEvaluationType(String evaluationType) {
        this.evaluationType = evaluationType;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
	public String getYear() {
		return year;
	}
    
	public void setYear(String year) {
		this.year = year;
	}
	
    public Performance getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Performance performanceId) {
        this.performanceId = performanceId;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
    
    public String getDocumentNumber() {
		return documentNumber;
	}
    public void setDocumentNumber(String documentNumber) {
		this.documentNumber = documentNumber;
	}
    
	public String getArea() {
		return area;
	}
	
	public void setArea(String area) {
		this.area = area;
	}
	
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numberId != null ? numberId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GeneralData)) {
            return false;
        }
        GeneralData other = (GeneralData) object;
        if ((this.numberId == null && other.numberId != null) || (this.numberId != null && !this.numberId.equals(other.numberId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.GeneralData[ numberId=" + numberId + " ]";
    }
    
}
