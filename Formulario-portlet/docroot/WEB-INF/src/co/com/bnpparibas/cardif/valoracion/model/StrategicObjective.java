/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author User
 */
@Entity
@Table(name = "STRATEGIC_OBJECTIVE", catalog = "")
@SequenceGenerator(name = "idCalculation", sequenceName = "STRATEGIC_OBJECTIVE_SEQ", allocationSize = 1)

public class StrategicObjective implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idCalculation")
    @Column(name = "ID", nullable = false)
    private Long id;
    @Column(name = "CALCULATIONFORMULA", length = 255)
    private String calculationformula;
    @Column(name = "FULFILLMENT", length = 255)
    private String fulfillment;
    @Column(name = "GOAL")
    private Long goal;
    @Column(name = "OBJETIVE", length = 255)
    private String objetive;
    @Column(name = "SCORE")
    private Long score;
    @Column(name = "WEIGHING")
    private Long weighing;
    @JoinColumn(name = "PERFORMANCE_PERFORMANCE_ID", referencedColumnName = "PERFORMANCE_ID")
    @ManyToOne
    private Performance performancePerformanceId;

    public StrategicObjective() {
    }

    public StrategicObjective(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCalculationformula() {
        return calculationformula;
    }

    public void setCalculationformula(String calculationformula) {
        this.calculationformula = calculationformula;
    }

    public String getFulfillment() {
        return fulfillment;
    }

    public void setFulfillment(String fulfillment) {
        this.fulfillment = fulfillment;
    }

    public Long getGoal() {
        return goal;
    }

    public void setGoal(Long goal) {
        this.goal = goal;
    }

    public String getObjetive() {
        return objetive;
    }

    public void setObjetive(String objetive) {
        this.objetive = objetive;
    }

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }

    public Long getWeighing() {
        return weighing;
    }

    public void setWeighing(Long weighing) {
        this.weighing = weighing;
    }

    public Performance getPerformancePerformanceId() {
        return performancePerformanceId;
    }

    public void setPerformancePerformanceId(Performance performancePerformanceId) {
        this.performancePerformanceId = performancePerformanceId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StrategicObjective)) {
            return false;
        }
        StrategicObjective other = (StrategicObjective) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.StrategicObjective[ id=" + id + " ]";
    }
    
}
