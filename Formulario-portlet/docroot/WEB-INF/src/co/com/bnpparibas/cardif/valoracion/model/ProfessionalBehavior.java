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
@Table(name = "PROFESSIONAL_BEHAVIOR", catalog = "")
@SequenceGenerator(name = "idProfessional", sequenceName = "PROFESSIONAL_BEHAVIOR_SEQ", allocationSize = 1)

public class ProfessionalBehavior implements Serializable {
    private static final long serialVersionUID = 1L;
   
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idProfessional")
    @Column(name = "PROFESSIONAL_ID", nullable = false, precision = 19, scale = 0)
    private BigDecimal professionalId;
    @Column(name = "AMBITION_1")
    private BigInteger ambition1;
    @Column(name = "AMBITION_2")
    private BigInteger ambition2;
    @Column(name = "COMMMITMENT_1")
    private BigInteger commmitment1;
    @Column(name = "COMMMITMENT_2")
    private BigInteger commmitment2;
    @Column(name = "COMMMITMENT_3")
    private BigInteger commmitment3;
    @Column(name = "CREATIVITY_1")
    private BigInteger creativity1;
    @Column(name = "CREATIVITY_2")
    private BigInteger creativity2;
    @Column(name = "REACTION_1")
    private BigInteger reaction1;
    @Column(name = "REACTION_2")
    private BigInteger reaction2;
    @OneToOne(mappedBy = "professionalId")
    private Survey survey;

    public ProfessionalBehavior() {
    }

    public ProfessionalBehavior(BigDecimal professionalId) {
        this.professionalId = professionalId;
    }

    public BigDecimal getProfessionalId() {
        return professionalId;
    }

    public void setProfessionalId(BigDecimal professionalId) {
        this.professionalId = professionalId;
    }

    public BigInteger getAmbition1() {
        return ambition1;
    }

    public void setAmbition1(BigInteger ambition1) {
        this.ambition1 = ambition1;
    }

    public BigInteger getAmbition2() {
        return ambition2;
    }

    public void setAmbition2(BigInteger ambition2) {
        this.ambition2 = ambition2;
    }

    public BigInteger getCommmitment1() {
        return commmitment1;
    }

    public void setCommmitment1(BigInteger commmitment1) {
        this.commmitment1 = commmitment1;
    }

    public BigInteger getCommmitment2() {
        return commmitment2;
    }

    public void setCommmitment2(BigInteger commmitment2) {
        this.commmitment2 = commmitment2;
    }

    public BigInteger getCommmitment3() {
        return commmitment3;
    }

    public void setCommmitment3(BigInteger commmitment3) {
        this.commmitment3 = commmitment3;
    }

    public BigInteger getCreativity1() {
        return creativity1;
    }

    public void setCreativity1(BigInteger creativity1) {
        this.creativity1 = creativity1;
    }

    public BigInteger getCreativity2() {
        return creativity2;
    }

    public void setCreativity2(BigInteger creativity2) {
        this.creativity2 = creativity2;
    }

    public BigInteger getReaction1() {
        return reaction1;
    }

    public void setReaction1(BigInteger reaction1) {
        this.reaction1 = reaction1;
    }

    public BigInteger getReaction2() {
        return reaction2;
    }

    public void setReaction2(BigInteger reaction2) {
        this.reaction2 = reaction2;
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
        hash += (professionalId != null ? professionalId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProfessionalBehavior)) {
            return false;
        }
        ProfessionalBehavior other = (ProfessionalBehavior) object;
        if ((this.professionalId == null && other.professionalId != null) || (this.professionalId != null && !this.professionalId.equals(other.professionalId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.ProfessionalBehavior[ professionalId=" + professionalId + " ]";
    }
    
}
