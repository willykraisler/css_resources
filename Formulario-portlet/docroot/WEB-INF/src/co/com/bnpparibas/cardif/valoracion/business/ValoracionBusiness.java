package co.com.bnpparibas.cardif.valoracion.business;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import co.com.bnpparibas.cardif.valoracion.dto.ObjetivosDTO;
import co.com.bnpparibas.cardif.valoracion.dto.ValoracionDTO;
import co.com.bnpparibas.cardif.valoracion.model.Competitions;
import co.com.bnpparibas.cardif.valoracion.model.DevelopmentPlan;
import co.com.bnpparibas.cardif.valoracion.model.GeneralData;
import co.com.bnpparibas.cardif.valoracion.model.ManagerialBehavior;
import co.com.bnpparibas.cardif.valoracion.model.Performance;
import co.com.bnpparibas.cardif.valoracion.model.ProfessionalBehavior;
import co.com.bnpparibas.cardif.valoracion.model.Survey;
import co.com.bnpparibas.cardif.valoracion.model.Training;
import co.com.bnpparibas.cardif.valoracion.model.StrategicObjective;;

public class ValoracionBusiness implements  Serializable{
	
	private static final long serialVersionUID = 1L;
	private static Log _log =  LogFactoryUtil.getLog(ValoracionBusiness.class);	
	private EntityManagerFactory emf=null;

	public EntityManagerFactory getEntityManagerFactory() {
		if (emf == null) {
	        emf = Persistence.createEntityManagerFactory("Formulario-portlet");
	    }
	    return emf;
	}

	public EntityManager getEntityManager() {
	   	EntityManager entityManager = null;
	    if (null != getEntityManagerFactory()){
	    	
	           entityManager = emf.createEntityManager();
	    }
	    return entityManager;
	}
		
	 public Object getGeneralDataCount(String id, String year) {
	        EntityManager em = getEntityManager();
	        try {

	        	String sql="select count(d.numberId) from "+GeneralData.class.getSimpleName()+" d where d.documentNumber= :id AND d.year= :years";
	            Query q = em.createQuery(sql).setParameter("id",id).setParameter("years", year);	            
	            return q.getSingleResult();
	        }catch(Exception ex){
	            System.out.println("Error.. "+ex.getMessage());
	            return -1;
	        } finally {
	            em.close();
	        }
	    }
	
	 public GeneralData createGeneralData(GeneralData generalData) {
	        EntityManager em = null;
	        GeneralData generalDatas=null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Performance performanceId = generalData.getPerformanceId();
//	            System.out.println("gg.."+performanceId);
	            if (performanceId != null) {
	                performanceId = em.getReference(performanceId.getClass(), performanceId.getPerformanceId());
	                generalData.setPerformanceId(performanceId);
	            }
	            Survey survey = generalData.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                generalData.setSurvey(survey);
	            }
	            em.persist(generalData);
	            generalDatas=  em.merge(generalData);
	            if (performanceId != null) {
	                GeneralData oldGeneralDataOfPerformanceId = performanceId.getGeneralData();
	                if (oldGeneralDataOfPerformanceId != null) {
	                    oldGeneralDataOfPerformanceId.setPerformanceId(null);
	                    oldGeneralDataOfPerformanceId = em.merge(oldGeneralDataOfPerformanceId);
	                }
	                performanceId.setGeneralData(generalData);
	                performanceId = em.merge(performanceId);
	            }
	            if (survey != null) {
	                GeneralData oldNumberIdOfSurvey = survey.getNumberId();
	                if (oldNumberIdOfSurvey != null) {
	                    oldNumberIdOfSurvey.setSurvey(null);
	                    oldNumberIdOfSurvey = em.merge(oldNumberIdOfSurvey);
	                }
	                survey.setNumberId(generalData);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	        	_log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return generalDatas;
	    }
	
	
	 public Competitions createCompetitions(Competitions competitions)  {
	        EntityManager em = null;
	        Competitions competition=null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Survey survey = competitions.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                competitions.setSurvey(survey);
	            }
//	            em.persist(competitions);
	            competition=em.merge(competitions);
	            if (survey != null) {
	                Competitions oldCompetitionsIdOfSurvey = survey.getCompetitionsId();
	                if (oldCompetitionsIdOfSurvey != null) {
	                    oldCompetitionsIdOfSurvey.setSurvey(null);
	                    oldCompetitionsIdOfSurvey = em.merge(oldCompetitionsIdOfSurvey);
	                }
	                survey.setCompetitionsId(competitions);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	            _log.error(ex);
	            
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return competition;
	    }
	
	 public DevelopmentPlan createDevelopmentPlan(DevelopmentPlan developmentPlan) {
	        EntityManager em = null;
	        DevelopmentPlan developmentPlans=null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Survey survey = developmentPlan.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                developmentPlan.setSurvey(survey);
	            }
//	            em.persist(developmentPlan);
	            developmentPlans=em.merge(developmentPlan);
	            if (survey != null) {
	                DevelopmentPlan oldPlanIdOfSurvey = survey.getPlanId();
	                if (oldPlanIdOfSurvey != null) {
	                    oldPlanIdOfSurvey.setSurvey(null);
	                    oldPlanIdOfSurvey = em.merge(oldPlanIdOfSurvey);
	                }
	                survey.setPlanId(developmentPlan);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	        	 _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return developmentPlans;
	    }
	 
	 
	 public ManagerialBehavior createManagerialBehavior(ManagerialBehavior managerialBehavior){
	        EntityManager em = null;
	        ManagerialBehavior managerialBehaviors=null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Survey survey = managerialBehavior.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                managerialBehavior.setSurvey(survey);
	            }
//	            em.persist(managerialBehavior);
	            managerialBehaviors=em.merge(managerialBehavior);
	            if (survey != null) {
	                ManagerialBehavior oldManagerialIdOfSurvey = survey.getManagerialId();
	                if (oldManagerialIdOfSurvey != null) {
	                    oldManagerialIdOfSurvey.setSurvey(null);
	                    oldManagerialIdOfSurvey = em.merge(oldManagerialIdOfSurvey);
	                }
	                survey.setManagerialId(managerialBehavior);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	        	 _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return managerialBehaviors;
	    }
	 
	  public Performance createPerformance(Performance performance) {
	        if (performance.getStrategicObjectiveList() == null) {
	            performance.setStrategicObjectiveList(new ArrayList<StrategicObjective>());
	        }
	        EntityManager em = null;
	        Performance perf= null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            GeneralData generalData = performance.getGeneralData();
//	            System.out.println("valorttt.."+generalData);
	            if (generalData != null) {
	                generalData = em.getReference(generalData.getClass(), generalData.getNumberId());
	                performance.setGeneralData(generalData);
	            }
	            Survey survey = performance.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                performance.setSurvey(survey);
	            }
	            List<StrategicObjective> attachedStrategicObjectiveList = new ArrayList<StrategicObjective>();
	            for (StrategicObjective strategicObjectiveListStrategicObjectiveToAttach : performance.getStrategicObjectiveList()) {
	                strategicObjectiveListStrategicObjectiveToAttach = em.getReference(strategicObjectiveListStrategicObjectiveToAttach.getClass(), strategicObjectiveListStrategicObjectiveToAttach.getId());
	                attachedStrategicObjectiveList.add(strategicObjectiveListStrategicObjectiveToAttach);
	            }
	            performance.setStrategicObjectiveList(attachedStrategicObjectiveList);
//	            em.persist(performance);
	            perf= em.merge(performance);
	            if (generalData != null) {
	                Performance oldPerformanceIdOfGeneralData = generalData.getPerformanceId();
	                if (oldPerformanceIdOfGeneralData != null) {
	                    oldPerformanceIdOfGeneralData.setGeneralData(null);
	                    oldPerformanceIdOfGeneralData = em.merge(oldPerformanceIdOfGeneralData);
	                }
	                generalData.setPerformanceId(performance);
	                generalData = em.merge(generalData);
	            }
	            if (survey != null) {
	                Performance oldPerformanceIdOfSurvey = survey.getPerformanceId();
	                if (oldPerformanceIdOfSurvey != null) {
	                    oldPerformanceIdOfSurvey.setSurvey(null);
	                    oldPerformanceIdOfSurvey = em.merge(oldPerformanceIdOfSurvey);
	                }
	                survey.setPerformanceId(performance);
	                survey = em.merge(survey);
	            }
	            for (StrategicObjective strategicObjectiveListStrategicObjective : performance.getStrategicObjectiveList()) {
	                Performance oldPerformancePerformanceIdOfStrategicObjectiveListStrategicObjective = strategicObjectiveListStrategicObjective.getPerformancePerformanceId();
	                strategicObjectiveListStrategicObjective.setPerformancePerformanceId(performance);
	                strategicObjectiveListStrategicObjective = em.merge(strategicObjectiveListStrategicObjective);
	                if (oldPerformancePerformanceIdOfStrategicObjectiveListStrategicObjective != null) {
	                    oldPerformancePerformanceIdOfStrategicObjectiveListStrategicObjective.getStrategicObjectiveList().remove(strategicObjectiveListStrategicObjective);
	                    oldPerformancePerformanceIdOfStrategicObjectiveListStrategicObjective = em.merge(oldPerformancePerformanceIdOfStrategicObjectiveListStrategicObjective);
	                }
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	          _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return perf;
	    }

	  public ProfessionalBehavior createProfessionalBehavior(ProfessionalBehavior professionalBehavior) {
	        EntityManager em = null;
	        ProfessionalBehavior professionalBeh=null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Survey survey = professionalBehavior.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                professionalBehavior.setSurvey(survey);
	            }
//	            em.persist(professionalBehavior);
	            professionalBeh= em.merge(professionalBehavior);
	            if (survey != null) {
	                ProfessionalBehavior oldProfessionalIdOfSurvey = survey.getProfessionalId();
	                if (oldProfessionalIdOfSurvey != null) {
	                    oldProfessionalIdOfSurvey.setSurvey(null);
	                    oldProfessionalIdOfSurvey = em.merge(oldProfessionalIdOfSurvey);
	                }
	                survey.setProfessionalId(professionalBehavior);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	           _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return professionalBeh;
	    }
	  
	  public void createStrategicObjective(StrategicObjective strategicObjective)  {
	        EntityManager em = null;
	        
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Performance performancePerformanceId = strategicObjective.getPerformancePerformanceId();
	            if (performancePerformanceId != null) {
	                performancePerformanceId = em.getReference(performancePerformanceId.getClass(), performancePerformanceId.getPerformanceId());
	                strategicObjective.setPerformancePerformanceId(performancePerformanceId);
	            }
	            em.persist(strategicObjective);
	            if (performancePerformanceId != null) {
	                performancePerformanceId.getStrategicObjectiveList().add(strategicObjective);
	                performancePerformanceId = em.merge(performancePerformanceId);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	            _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }	       
	    }	  
	  
	  public void createSurvey(Survey survey) {
	        EntityManager em = null;
	       
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Training trainingId = survey.getTrainingId();
	            if (trainingId != null) {
	                trainingId = em.getReference(trainingId.getClass(), trainingId.getTrainingId());
	                survey.setTrainingId(trainingId);
	            }
	            ProfessionalBehavior professionalId = survey.getProfessionalId();
	            if (professionalId != null) {
	                professionalId = em.getReference(professionalId.getClass(), professionalId.getProfessionalId());
	                survey.setProfessionalId(professionalId);
	            }
	            Performance performanceId = survey.getPerformanceId();
	            if (performanceId != null) {
	                performanceId = em.getReference(performanceId.getClass(), performanceId.getPerformanceId());
	                survey.setPerformanceId(performanceId);
	            }
	            ManagerialBehavior managerialId = survey.getManagerialId();
	            if (managerialId != null) {
	                managerialId = em.getReference(managerialId.getClass(), managerialId.getManagerialId());
	                survey.setManagerialId(managerialId);
	            }
	            GeneralData numberId = survey.getNumberId();
	            if (numberId != null) {
	                numberId = em.getReference(numberId.getClass(), numberId.getNumberId());
	                survey.setNumberId(numberId);
	            }
	            DevelopmentPlan planId = survey.getPlanId();
	            if (planId != null) {
	                planId = em.getReference(planId.getClass(), planId.getPlanId());
	                survey.setPlanId(planId);
	            }
	            Competitions competitionsId = survey.getCompetitionsId();
	            if (competitionsId != null) {
	                competitionsId = em.getReference(competitionsId.getClass(), competitionsId.getCompetitionsId());
	                survey.setCompetitionsId(competitionsId);
	            }
	            em.persist(survey);
	            
	            if (trainingId != null) {
	                Survey oldSurveyOfTrainingId = trainingId.getSurvey();
	                if (oldSurveyOfTrainingId != null) {
	                    oldSurveyOfTrainingId.setTrainingId(null);
	                    oldSurveyOfTrainingId = em.merge(oldSurveyOfTrainingId);
	                }
	                trainingId.setSurvey(survey);
	                trainingId = em.merge(trainingId);
	            }
	            if (professionalId != null) {
	                Survey oldSurveyOfProfessionalId = professionalId.getSurvey();
	                if (oldSurveyOfProfessionalId != null) {
	                    oldSurveyOfProfessionalId.setProfessionalId(null);
	                    oldSurveyOfProfessionalId = em.merge(oldSurveyOfProfessionalId);
	                }
	                professionalId.setSurvey(survey);
	                professionalId = em.merge(professionalId);
	            }
	            if (performanceId != null) {
	                Survey oldSurveyOfPerformanceId = performanceId.getSurvey();
	                if (oldSurveyOfPerformanceId != null) {
	                    oldSurveyOfPerformanceId.setPerformanceId(null);
	                    oldSurveyOfPerformanceId = em.merge(oldSurveyOfPerformanceId);
	                }
	                performanceId.setSurvey(survey);
	                performanceId = em.merge(performanceId);
	            }
	            if (managerialId != null) {
	                Survey oldSurveyOfManagerialId = managerialId.getSurvey();
	                if (oldSurveyOfManagerialId != null) {
	                    oldSurveyOfManagerialId.setManagerialId(null);
	                    oldSurveyOfManagerialId = em.merge(oldSurveyOfManagerialId);
	                }
	                managerialId.setSurvey(survey);
	                managerialId = em.merge(managerialId);
	            }
	            if (numberId != null) {
	                Survey oldSurveyOfNumberId = numberId.getSurvey();
	                if (oldSurveyOfNumberId != null) {
	                    oldSurveyOfNumberId.setNumberId(null);
	                    oldSurveyOfNumberId = em.merge(oldSurveyOfNumberId);
	                }
	                numberId.setSurvey(survey);
	                numberId = em.merge(numberId);
	            }
	            if (planId != null) {
	                Survey oldSurveyOfPlanId = planId.getSurvey();
	                if (oldSurveyOfPlanId != null) {
	                    oldSurveyOfPlanId.setPlanId(null);
	                    oldSurveyOfPlanId = em.merge(oldSurveyOfPlanId);
	                }
	                planId.setSurvey(survey);
	                planId = em.merge(planId);
	            }
	            if (competitionsId != null) {
	                Survey oldSurveyOfCompetitionsId = competitionsId.getSurvey();
	                if (oldSurveyOfCompetitionsId != null) {
	                    oldSurveyOfCompetitionsId.setCompetitionsId(null);
	                    oldSurveyOfCompetitionsId = em.merge(oldSurveyOfCompetitionsId);
	                }
	                competitionsId.setSurvey(survey);
	                competitionsId = em.merge(competitionsId);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	            _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }	      
	    }
	  
	  public Training createTraining(Training training)  {
	        EntityManager em = null;
	        Training trainings= null;
	        try {
	            em = getEntityManager();
	            em.getTransaction().begin();
	            Survey survey = training.getSurvey();
	            if (survey != null) {
	                survey = em.getReference(survey.getClass(), survey.getSurveyId());
	                training.setSurvey(survey);
	            }
//	            em.persist(training);
	            trainings=em.merge(training);
	            if (survey != null) {
	                Training oldTrainingIdOfSurvey = survey.getTrainingId();
	                if (oldTrainingIdOfSurvey != null) {
	                    oldTrainingIdOfSurvey.setSurvey(null);
	                    oldTrainingIdOfSurvey = em.merge(oldTrainingIdOfSurvey);
	                }
	                survey.setTrainingId(training);
	                survey = em.merge(survey);
	            }
	            em.getTransaction().commit();
	        } catch (Exception ex) {
	           _log.error(ex);
	        } finally {
	            if (em != null) {
	                em.close();
	            }
	        }
	        return trainings;
	    }

	  
	  
	public void PersistForm(ValoracionDTO dto,List<ObjetivosDTO> objetivosDTOs) {
		
		Survey survey=new Survey();
		Competitions competitions=new Competitions();
		GeneralData generalData=new GeneralData();
		ManagerialBehavior managerialBehavior=new ManagerialBehavior();
		Performance performance=new Performance();
		DevelopmentPlan plan =new DevelopmentPlan();
		ProfessionalBehavior professionalBehavior=new ProfessionalBehavior();
		Training training=new Training();
		
//		OK
//		competitions.setEvaluateFactor("compromiso");
//		competitions.setScore(dto.getCompSelect());
		competitions.setEvaluateFactor1(new BigInteger(dto.getCompSelect().toString()));
		competitions.setEvaluateFactor2(new BigInteger(dto.getTomaSelect().toString()));
		competitions.setEvaluateFactor3(new BigInteger(dto.getCreaSelect().toString()));
		competitions.setEvaluateFactor4(new BigInteger(dto.getTrabSelect().toString()));
		competitions.setEvaluateFactor5(new BigInteger(dto.getMetSelect().toString()));
		competitions.setEvaluateFactor6(new BigInteger(dto.getFocoSelect().toString()));
		competitions.setEvaluateFactor7(new BigInteger(dto.getInsSelect().toString()));
		competitions.setEvaluateFactor8(new BigInteger(dto.getManSelect().toString()));
		competitions.setEvaluateFactor9(new BigInteger(dto.getAstSelect().toString()));
		competitions.setEvaluateFactor10(new BigInteger(dto.getManrelSelect().toString()));
		
		competitions=createCompetitions(competitions);		
		
//		OK
		performance.setCedula(dto.getNumId());
		performance.setFinalscore(dto.getNoteFinal().doubleValue());
		performance=createPerformance(performance);
				
//		OK
		generalData.setActualCharge(dto.getCharge());
		generalData.setBoss(dto.getBoss());
		generalData.setBossCharge(dto.getBossCharge());
		generalData.setDate(dto.getStartDate());
		generalData.setEvaluationType(dto.getEvaluationType());
		generalData.setNames(dto.getNames());
		generalData.setDocumentNumber(dto.getNumId()+"");
		generalData.setPeriod(dto.getPeriod());
		generalData.setPerformanceId(performance);
		generalData.setYear(dto.getAnho());
		generalData.setArea(dto.getArea());
		generalData=createGeneralData(generalData);		
		
//		OK
		managerialBehavior.setAutonomy1(new BigInteger(dto.getRapidSelect().toString()));
		managerialBehavior.setAutonomy2(new BigInteger(dto.getEstrucSelect().toString()));
		managerialBehavior.setAutonomy3(new BigInteger( dto.getAliSelect().toString()));
		managerialBehavior.setConfidence1(new BigInteger(dto.getTratSelect().toString()));
		managerialBehavior.setConfidence2(new BigInteger(dto.getEvalSelect().toString()));
		managerialBehavior.setConfidence3(new BigInteger(dto.getDetSelect().toString()));
		managerialBehavior.setCooperation1(new BigInteger(dto.getEstimSelect().toString()));
		managerialBehavior.setCooperation2(new BigInteger(dto.getMaxSelect().toString()));
		managerialBehavior.setCooperation3( new BigInteger(dto.getOptSelect().toString()));
		managerialBehavior.setOpportunities( dto.getOpportunities());
		managerialBehavior.setResponsability1(new BigInteger(dto.getTomSelect().toString()));
		managerialBehavior.setResponsability2(new BigInteger(dto.getIdenSelect().toString()));
		managerialBehavior.setResponsability3(new BigInteger(dto.getDeciSelect().toString()));
		managerialBehavior.setScore(dto.getCalcFinal());
		managerialBehavior.setStrengths(dto.getStrengths());
		managerialBehavior=createManagerialBehavior(managerialBehavior);
		
//		OK
		for(ObjetivosDTO objDTO:objetivosDTOs){
			
			StrategicObjective strategicObjective=new StrategicObjective();
			strategicObjective.setCalculationformula(objDTO.getFormula());
			strategicObjective.setFulfillment(objDTO.getCumplimiento().toString());
			strategicObjective.setGoal(objDTO.getMeta());
			strategicObjective.setObjetive(objDTO.getObjetivo());
			strategicObjective.setPerformancePerformanceId(performance);
			strategicObjective.setScore(objDTO.getNota());
			strategicObjective.setWeighing(objDTO.getPeso());
			createStrategicObjective(strategicObjective);
		}
		
		//OK
		plan.setExecutionDate(dto.getExecutionDate());
		plan.setIndicator(dto.getIndicator());
		plan.setSpecificAction(dto.getSpecialAction());
		plan.setSupport(dto.getSupport());
		plan=createDevelopmentPlan(plan);
	
		//OK
		professionalBehavior.setAmbition1(new BigInteger(dto.getEsfSelect().toString()));
		professionalBehavior.setAmbition2(new BigInteger(dto.getPartiSelect().toString()));
		professionalBehavior.setCommmitment1(new BigInteger(dto.getCompcliSelect().toString()));
		professionalBehavior.setCommmitment2(new BigInteger(dto.getDesaSelect().toString()));
		professionalBehavior.setCommmitment3(new BigInteger( dto.getDemSelect().toString()));
		professionalBehavior.setCreativity1(new BigInteger(dto.getPropSelect().toString()));
		professionalBehavior.setCreativity2(new BigInteger(dto.getAsuSelect().toString()));
		professionalBehavior.setReaction1(new BigInteger(dto.getAdaptSelect().toString()));
		professionalBehavior.setReaction2(new BigInteger( dto.getEntreSelect().toString()));
		professionalBehavior=createProfessionalBehavior(professionalBehavior);

		//OK
		training.setDetail(dto.getCapacitation());
		training.setNextReviewDate(dto.getRevisionDate());
		training=createTraining(training);
		
		//OK
		survey.setCompetitionsId(competitions);
		survey.setNumberId(generalData);
		survey.setManagerialId(managerialBehavior);
		survey.setPerformanceId(performance);
		survey.setPlanId(plan);
		survey.setProfessionalId(professionalBehavior);
		survey.setTrainingId(training);
		createSurvey(survey);
	}	
}