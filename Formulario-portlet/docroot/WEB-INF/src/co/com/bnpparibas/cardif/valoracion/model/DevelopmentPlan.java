/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author User
 */
@Entity
@Table(name = "DEVELOPMENT_PLAN", catalog = "")
@SequenceGenerator(name = "idPlan", sequenceName = "DEVELOPMENT_PLAN_SEQ", allocationSize = 1)

public class DevelopmentPlan implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idPlan")
    @Column(name = "PLAN_ID", nullable = false)
    private Long planId;
    @Column(name = "EXECUTION_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date executionDate;
    @Column(name = "INDICATOR", length = 255)
    private String indicator;
    @Column(name = "SPECIFIC_ACTION", length = 255)
    private String specificAction;
    @Column(name = "SUPPORT", length = 255)
    private String support;
    @OneToOne(mappedBy = "planId")
    private Survey survey;

    public DevelopmentPlan() {
    }

    public DevelopmentPlan(Long planId) {
        this.planId = planId;
    }

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public Date getExecutionDate() {
        return executionDate;
    }

    public void setExecutionDate(Date executionDate) {
        this.executionDate = executionDate;
    }

    public String getIndicator() {
        return indicator;
    }

    public void setIndicator(String indicator) {
        this.indicator = indicator;
    }

    public String getSpecificAction() {
        return specificAction;
    }

    public void setSpecificAction(String specificAction) {
        this.specificAction = specificAction;
    }

    public String getSupport() {
        return support;
    }

    public void setSupport(String support) {
        this.support = support;
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
        hash += (planId != null ? planId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DevelopmentPlan)) {
            return false;
        }
        DevelopmentPlan other = (DevelopmentPlan) object;
        if ((this.planId == null && other.planId != null) || (this.planId != null && !this.planId.equals(other.planId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.DevelopmentPlan[ planId=" + planId + " ]";
    }
    
}
