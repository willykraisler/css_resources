/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package co.com.bnpparibas.cardif.valoracion.model;

import java.io.Serializable;
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
@Table(name = "COMPETITIONS", catalog = "")
@SequenceGenerator(name = "idCompetitions", sequenceName = "COMPETITIONS_SEQ", allocationSize = 1)

public class Competitions implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idCompetitions")
    @Column(name = "COMPETITIONS_ID", nullable = false)
    private Long competitionsId;
    @Column(name = "EVALUATE_FACTOR1")
    private BigInteger evaluateFactor1;
    @Column(name = "EVALUATE_FACTOR2")
    private BigInteger evaluateFactor2;
    @Column(name = "EVALUATE_FACTOR3")
    private BigInteger evaluateFactor3;
    @Column(name = "EVALUATE_FACTOR4")
    private BigInteger evaluateFactor4;
    @Column(name = "EVALUATE_FACTOR5")
    private BigInteger evaluateFactor5;
    @Column(name = "EVALUATE_FACTOR6")
    private BigInteger evaluateFactor6;
    @Column(name = "EVALUATE_FACTOR7")
    private BigInteger evaluateFactor7;
    @Column(name = "EVALUATE_FACTOR8")
    private BigInteger evaluateFactor8;
    @Column(name = "EVALUATE_FACTOR9")
    private BigInteger evaluateFactor9;
    @Column(name = "EVALUATE_FACTOR10")
    private BigInteger evaluateFactor10;
//    @Column(name = "SCORE")
//    private Long score;
    @OneToOne(mappedBy = "competitionsId")
    private Survey survey;

    public Competitions() {
    }

    public Competitions(Long competitionsId) {
        this.competitionsId = competitionsId;
    }

    public Long getCompetitionsId() {
        return competitionsId;
    }

    public void setCompetitionsId(Long competitionsId) {
        this.competitionsId = competitionsId;
    }
    

//    public String getEvaluateFactor() {
//        return evaluateFactor;
//    }
//
//    public void setEvaluateFactor(String evaluateFactor) {
//        this.evaluateFactor = evaluateFactor;
//    }
//
//    public Long getScore() {
//        return score;
//    }
//
//    public void setScore(Long score) {
//        this.score = score;
//    }

 

	public Survey getSurvey() {
        return survey;
    }

    public BigInteger getEvaluateFactor1() {
		return evaluateFactor1;
	}

	public void setEvaluateFactor1(BigInteger evaluateFactor1) {
		this.evaluateFactor1 = evaluateFactor1;
	}

	public BigInteger getEvaluateFactor2() {
		return evaluateFactor2;
	}

	public void setEvaluateFactor2(BigInteger evaluateFactor2) {
		this.evaluateFactor2 = evaluateFactor2;
	}

	public BigInteger getEvaluateFactor3() {
		return evaluateFactor3;
	}

	public void setEvaluateFactor3(BigInteger evaluateFactor3) {
		this.evaluateFactor3 = evaluateFactor3;
	}

	public BigInteger getEvaluateFactor4() {
		return evaluateFactor4;
	}

	public void setEvaluateFactor4(BigInteger evaluateFactor4) {
		this.evaluateFactor4 = evaluateFactor4;
	}

	public BigInteger getEvaluateFactor5() {
		return evaluateFactor5;
	}

	public void setEvaluateFactor5(BigInteger evaluateFactor5) {
		this.evaluateFactor5 = evaluateFactor5;
	}

	public BigInteger getEvaluateFactor6() {
		return evaluateFactor6;
	}

	public void setEvaluateFactor6(BigInteger evaluateFactor6) {
		this.evaluateFactor6 = evaluateFactor6;
	}

	public BigInteger getEvaluateFactor7() {
		return evaluateFactor7;
	}

	public void setEvaluateFactor7(BigInteger evaluateFactor7) {
		this.evaluateFactor7 = evaluateFactor7;
	}

	public BigInteger getEvaluateFactor8() {
		return evaluateFactor8;
	}

	public void setEvaluateFactor8(BigInteger evaluateFactor8) {
		this.evaluateFactor8 = evaluateFactor8;
	}

	public BigInteger getEvaluateFactor9() {
		return evaluateFactor9;
	}

	public void setEvaluateFactor9(BigInteger evaluateFactor9) {
		this.evaluateFactor9 = evaluateFactor9;
	}

	public BigInteger getEvaluateFactor10() {
		return evaluateFactor10;
	}

	public void setEvaluateFactor10(BigInteger evaluateFactor10) {
		this.evaluateFactor10 = evaluateFactor10;
	}

	public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (competitionsId != null ? competitionsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Competitions)) {
            return false;
        }
        Competitions other = (Competitions) object;
        if ((this.competitionsId == null && other.competitionsId != null) || (this.competitionsId != null && !this.competitionsId.equals(other.competitionsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.com.entity.Competitions[ competitionsId=" + competitionsId + " ]";
    }
    
}
