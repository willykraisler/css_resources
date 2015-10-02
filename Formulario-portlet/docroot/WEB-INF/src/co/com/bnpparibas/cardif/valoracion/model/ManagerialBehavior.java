/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author User
 */
@Entity
@Table(name = "MANAGERIAL_BEHAVIOR", catalog = "")
@SequenceGenerator(name = "idManagerial", sequenceName = "MANAGERIAL_BEHAVIOR_SEQ", allocationSize = 1)
public class ManagerialBehavior implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idManagerial")
    @Column(name = "MANAGERIAL_ID", nullable = false, precision = 19, scale = 0)
    private BigDecimal managerialId;
    @Column(name = "AUTONOMY_1")
    private BigInteger autonomy1;
    @Column(name = "AUTONOMY_2")
    private BigInteger autonomy2;
    @Column(name = "AUTONOMY_3")
    private BigInteger autonomy3;
    @Column(name = "CONFIDENCE_1")
    private BigInteger confidence1;
    @Column(name = "CONFIDENCE_2")
    private BigInteger confidence2;
    @Column(name = "CONFIDENCE_3")
    private BigInteger confidence3;
    @Column(name = "COOPERATION_1")
    private BigInteger cooperation1;
    @Column(name = "COOPERATION_2")
    private BigInteger cooperation2;
    @Column(name = "COOPERATION_3")
    private BigInteger cooperation3;
    @Column(name = "OPPORTUNITIES", length = 255)
    private String opportunities;
    @Column(name = "RESPONSABILITY_1")
    private BigInteger responsability1;
    @Column(name = "RESPONSABILITY_2")
    private BigInteger responsability2;
    @Column(name = "RESPONSABILITY_3")
    private BigInteger responsability3;
    @Column(name = "SCORE", precision = 126)
    private Double score;
    @Column(name = "STRENGTHS", length = 255)
    private String strengths;
    @OneToOne(mappedBy = "managerialId")
    private Survey survey;

    public ManagerialBehavior() {
    }

    public ManagerialBehavior(BigDecimal managerialId) {
        this.managerialId = managerialId;
    }

    public BigDecimal getManagerialId() {
        return managerialId;
    }

    public void setManagerialId(BigDecimal managerialId) {
        this.managerialId = managerialId;
    }

    public BigInteger getAutonomy1() {
        return autonomy1;
    }

    public void setAutonomy1(BigInteger autonomy1) {
        this.autonomy1 = autonomy1;
    }

    public BigInteger getAutonomy2() {
        return autonomy2;
    }

    public void setAutonomy2(BigInteger autonomy2) {
        this.autonomy2 = autonomy2;
    }

    public BigInteger getAutonomy3() {
        return autonomy3;
    }

    public void setAutonomy3(BigInteger autonomy3) {
        this.autonomy3 = autonomy3;
    }

    public BigInteger getConfidence1() {
        return confidence1;
    }

    public void setConfidence1(BigInteger confidence1) {
        this.confidence1 = confidence1;
    }

    public BigInteger getConfidence2() {
        return confidence2;
    }

    public void setConfidence2(BigInteger confidence2) {
        this.confidence2 = confidence2;
    }

    public BigInteger getConfidence3() {
        return confidence3;
    }

    public void setConfidence3(BigInteger confidence3) {
        this.confidence3 = confidence3;
    }

    public BigInteger getCooperation1() {
        return cooperation1;
    }

    public void setCooperation1(BigInteger cooperation1) {
        this.cooperation1 = cooperation1;
    }

    public BigInteger getCooperation2() {
        return cooperation2;
    }

    public void setCooperation2(BigInteger cooperation2) {
        this.cooperation2 = cooperation2;
    }

    public BigInteger getCooperation3() {
        return cooperation3;
    }

    public void setCooperation3(BigInteger cooperation3) {
        this.cooperation3 = cooperation3;
    }

    public String getOpportunities() {
        return opportunities;
    }

    public void setOpportunities(String opportunities) {
        this.opportunities = opportunities;
    }

    public BigInteger getResponsability1() {
        return responsability1;
    }

    public void setResponsability1(BigInteger responsability1) {
        this.responsability1 = responsability1;
    }

    public BigInteger getResponsability2() {
        return responsability2;
    }

    public void setResponsability2(BigInteger responsability2) {
        this.responsability2 = responsability2;
    }

    public BigInteger getResponsability3() {
        return responsability3;
    }

    public void setResponsability3(BigInteger responsability3) {
        this.responsability3 = responsability3;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getStrengths() {
        return strengths;
    }

    public void setStrengths(String strengths) {
        this.strengths = strengths;
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
        hash += (managerialId != null ? managerialId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ManagerialBehavior)) {
            return false;
        }
        ManagerialBehavior other = (ManagerialBehavior) object;
        if ((this.managerialId == null && other.managerialId != null) || (this.managerialId != null && !this.managerialId.equals(other.managerialId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.ManagerialBehavior[ managerialId=" + managerialId + " ]";
    }
    
}
