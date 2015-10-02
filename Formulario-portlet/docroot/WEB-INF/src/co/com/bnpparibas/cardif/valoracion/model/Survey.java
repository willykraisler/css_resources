/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author User
 */
@Entity
@Table(name = "SURVEY", catalog = "",  uniqueConstraints = {
    @UniqueConstraint(columnNames = {"PROFESSIONAL_ID"}),
    @UniqueConstraint(columnNames = {"NUMBER_ID"}),
    @UniqueConstraint(columnNames = {"COMPETITIONS_ID"}),
    @UniqueConstraint(columnNames = {"TRAINING_ID"}),
    @UniqueConstraint(columnNames = {"PERFORMANCE_ID"}),
    @UniqueConstraint(columnNames = {"MANAGERIAL_ID"}),
    @UniqueConstraint(columnNames = {"PLAN_ID"})})
@SequenceGenerator(name = "idSurvey", sequenceName = "SURVEY_SEQ", allocationSize = 1)

public class Survey implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idSurvey")
    @Column(name = "SURVEY_ID", nullable = false, precision = 19, scale = 0)
    private BigDecimal surveyId;
    @JoinColumn(name = "TRAINING_ID", referencedColumnName = "TRAINING_ID")
    @OneToOne
    private Training trainingId;
    @JoinColumn(name = "PROFESSIONAL_ID", referencedColumnName = "PROFESSIONAL_ID")
    @OneToOne
    private ProfessionalBehavior professionalId;
    @JoinColumn(name = "PERFORMANCE_ID", referencedColumnName = "PERFORMANCE_ID")
    @OneToOne
    private Performance performanceId;
    @JoinColumn(name = "MANAGERIAL_ID", referencedColumnName = "MANAGERIAL_ID")
    @OneToOne
    private ManagerialBehavior managerialId;
    @JoinColumn(name = "NUMBER_ID", referencedColumnName = "NUMBER_ID")
    @OneToOne
    private GeneralData numberId;
    @JoinColumn(name = "PLAN_ID", referencedColumnName = "PLAN_ID")
    @OneToOne
    private DevelopmentPlan planId;
    @JoinColumn(name = "COMPETITIONS_ID", referencedColumnName = "COMPETITIONS_ID")
    @OneToOne
    private Competitions competitionsId;

    public Survey() {
    }

    public Survey(BigDecimal surveyId) {
        this.surveyId = surveyId;
    }

    public BigDecimal getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(BigDecimal surveyId) {
        this.surveyId = surveyId;
    }

    public Training getTrainingId() {
        return trainingId;
    }

    public void setTrainingId(Training trainingId) {
        this.trainingId = trainingId;
    }

    public ProfessionalBehavior getProfessionalId() {
        return professionalId;
    }

    public void setProfessionalId(ProfessionalBehavior professionalId) {
        this.professionalId = professionalId;
    }

    public Performance getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Performance performanceId) {
        this.performanceId = performanceId;
    }

    public ManagerialBehavior getManagerialId() {
        return managerialId;
    }

    public void setManagerialId(ManagerialBehavior managerialId) {
        this.managerialId = managerialId;
    }

    public GeneralData getNumberId() {
        return numberId;
    }

    public void setNumberId(GeneralData numberId) {
        this.numberId = numberId;
    }

    public DevelopmentPlan getPlanId() {
        return planId;
    }

    public void setPlanId(DevelopmentPlan planId) {
        this.planId = planId;
    }

    public Competitions getCompetitionsId() {
        return competitionsId;
    }

    public void setCompetitionsId(Competitions competitionsId) {
        this.competitionsId = competitionsId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (surveyId != null ? surveyId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Survey)) {
            return false;
        }
        Survey other = (Survey) object;
        if ((this.surveyId == null && other.surveyId != null) || (this.surveyId != null && !this.surveyId.equals(other.surveyId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.Survey[ surveyId=" + surveyId + " ]";
    }
    
}
