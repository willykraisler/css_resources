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
@Table(name = "TRAINING", catalog = "")
@SequenceGenerator(name = "idTraining", sequenceName = "TRAINING_SEQ", allocationSize = 1)

public class Training implements Serializable {
	
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idTraining")
    @Column(name = "TRAINING_ID", nullable = false, precision = 19, scale = 0)
    private BigDecimal trainingId;
    @Column(name = "DETAIL", length = 255)
    private String detail;
    @Column(name = "NEXT_REVIEW_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date nextReviewDate;
    @OneToOne(mappedBy = "trainingId")
    private Survey survey;

    public Training() {
    }

    public Training(BigDecimal trainingId) {
        this.trainingId = trainingId;
    }

    public BigDecimal getTrainingId() {
        return trainingId;
    }

    public void setTrainingId(BigDecimal trainingId) {
        this.trainingId = trainingId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getNextReviewDate() {
        return nextReviewDate;
    }

    public void setNextReviewDate(Date nextReviewDate) {
        this.nextReviewDate = nextReviewDate;
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
        hash += (trainingId != null ? trainingId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Training)) {
            return false;
        }
        Training other = (Training) object;
        if ((this.trainingId == null && other.trainingId != null) || (this.trainingId != null && !this.trainingId.equals(other.trainingId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.Training[ trainingId=" + trainingId + " ]";
    }
    
}
