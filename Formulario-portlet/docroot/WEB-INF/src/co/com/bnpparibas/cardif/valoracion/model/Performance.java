/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "PERFORMANCE", catalog = "")
@SequenceGenerator(name = "idPerformance", sequenceName = "PERFORMANCE_SEQ", allocationSize = 1)

public class Performance implements Serializable {
    private static final long serialVersionUID = 1L;
   
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idPerformance")
    @Column(name = "PERFORMANCE_ID", nullable = false)
    private Long performanceId;
    @Column(name = "CEDULA")
    private Long cedula;
    @Column(name = "FINALSCORE", precision = 126)
    private Double finalscore;
    @OneToMany(mappedBy = "performancePerformanceId")
    private List<StrategicObjective> strategicObjectiveList;
    @OneToOne(mappedBy = "performanceId")
    private GeneralData generalData;
    @OneToOne(mappedBy = "performanceId")
    private Survey survey;

    public Performance() {
    }

    public Performance(Long performanceId) {
        this.performanceId = performanceId;
    }

    public Long getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Long performanceId) {
        this.performanceId = performanceId;
    }

    public Long getCedula() {
        return cedula;
    }

    public void setCedula(Long cedula) {
        this.cedula = cedula;
    }

    public Double getFinalscore() {
        return finalscore;
    }

    public void setFinalscore(Double finalscore) {
        this.finalscore = finalscore;
    }

    @XmlTransient
    public List<StrategicObjective> getStrategicObjectiveList() {
        return strategicObjectiveList;
    }

    public void setStrategicObjectiveList(List<StrategicObjective> strategicObjectiveList) {
        this.strategicObjectiveList = strategicObjectiveList;
    }

    public GeneralData getGeneralData() {
        return generalData;
    }

    public void setGeneralData(GeneralData generalData) {
        this.generalData = generalData;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (performanceId != null ? performanceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Performance)) {
            return false;
        }
        Performance other = (Performance) object;
        if ((this.performanceId == null && other.performanceId != null) || (this.performanceId != null && !this.performanceId.equals(other.performanceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.Performance[ performanceId=" + performanceId + " ]";
    }
    
}
