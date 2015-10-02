package co.com.bnpparibas.cardif.valoracion.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import co.com.bnpparibas.cardif.valoracion.business.ValoracionBusiness;
import co.com.bnpparibas.cardif.valoracion.dto.ObjetivosDTO;
import co.com.bnpparibas.cardif.valoracion.dto.ValoracionDTO;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.HttpHeaders;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class FormularioPortletClass
 */
public class ValoracionPortletClass extends MVCPortlet {

	protected String viewJSP;
	private static Log _log = LogFactoryUtil.getLog(ValoracionPortletClass.class);
	

@SuppressWarnings("unchecked")
public void saveForm(ActionRequest actionRequest,
		ActionResponse actionResponse) throws IOException, PortletException {
		
	PortletSession session= actionRequest.getPortletSession();
	ValoracionDTO dto= (ValoracionDTO)session.getAttribute("dto");
	List<ObjetivosDTO> objetivosDTOs=(List<ObjetivosDTO> )session.getAttribute("objetivosDTOs");
	System.out.println("valor name.."+dto.getNames());	
	ValoracionBusiness business = new ValoracionBusiness();		
	business.PersistForm(dto,objetivosDTOs);
	session.removeAttribute("dto");
	session.removeAttribute("objetivosDTOs");
}

    public void init() {
        viewJSP = getInitParameter("view-template");
    }
    
	
	public void getInfoForm(ResourceRequest request,
			ResourceResponse response) {
				
		String cumpText=request.getParameter("cumpText");
		String notaText=request.getParameter("notaText");
		String calFinalInput=request.getParameter("calFinalInput");
		String names = request.getParameter("names");
		Long id =Long.valueOf(Long.valueOf(request.getParameter("numId")));
		String charge = request.getParameter("charge");
		String boss = request.getParameter("boss");
		String bossCharge = request.getParameter("bossCharge");
		String evaluationType = request.getParameter("evaluationType");
		String period = request.getParameter("period");
		String datePickerStart = request.getParameter("startDate");
		String notaDesep=request.getParameter("notaFinalInput");
		String fechaEjecucion=request.getParameter("fechaEjecucion");
		String fechaRevision=request.getParameter("fechaRevision");		
		String area=request.getParameter("area");
		
		String objetive = "objetivo";
		String formula="formula";
		String weight="peso";
		String fulfillment="cumplimiento";
		String note="notaSelect";
		Long rowCount=Long.valueOf(request.getParameter("rowTotal"));
		List<ObjetivosDTO> objetivosDTOs=new ArrayList<ObjetivosDTO>();
	System.out.println("rowCount "+rowCount);
		for(int i=1;i<rowCount+1;i++){
			ObjetivosDTO objetivoDTO=new ObjetivosDTO();
			objetivoDTO.setObjetivo(request.getParameter(objetive+i));
			objetivoDTO.setFormula(request.getParameter(formula+i));
			objetivoDTO.setPeso(Long.valueOf(request.getParameter(weight+i)));
			objetivoDTO.setCumplimiento(Long.valueOf(request.getParameter(fulfillment+i)));
			objetivoDTO.setNota(Long.valueOf(request.getParameter(note+i)));
			objetivoDTO.setMeta(Long.valueOf(100));
			objetivosDTOs.add(objetivoDTO);
		}		
		
		 Long compSelect=Long.valueOf(request.getParameter("compSelect"));
		 
		 Long tomaSelect=Long.valueOf(request.getParameter("tomaSelect"));
		 Long creaSelect=Long.valueOf(request.getParameter("creaSelect"));
		 Long trabSelect=Long.valueOf(request.getParameter("trabSelect"));
		 Long metSelect=Long.valueOf(request.getParameter("metSelect"));
		 Long manSelect=Long.valueOf(request.getParameter("manSelect"));
		 Long focoSelect=Long.valueOf(request.getParameter("focoSelect"));
		 Long astSelect=Long.valueOf(request.getParameter("astSelect"));
		 Long insSelect=Long.valueOf(request.getParameter("insSelect"));
		 Long manrelSelect=Long.valueOf(request.getParameter("manrelSelect"));
		 
		 Long compcliSelect=Long.valueOf(request.getParameter("compcliSelect"));
		 Long desaSelect=Long.valueOf(request.getParameter("desaSelect"));
		 Long demSelect=Long.valueOf(request.getParameter("demSelect"));
		 Long propSelect=Long.valueOf(request.getParameter("propSelect"));
		 Long asuSelect=Long.valueOf(request.getParameter("asuSelect"));
		 Long esfSelect=Long.valueOf(request.getParameter("esfSelect"));
		 Long partiSelect=Long.valueOf(request.getParameter("partiSelect"));
		 Long adaptSelect=Long.valueOf(request.getParameter("adaptSelect"));
		 Long entreSelect=Long.valueOf(request.getParameter("entreSelect"));
		 
		 Long tomSelect=Long.valueOf(request.getParameter("tomSelect")==null?0+"":request.getParameter("tomSelect"));		 
		 Long idenSelect=Long.valueOf(request.getParameter("idenSelect")==null?0+"":request.getParameter("idenSelect"));		 
		 Long deciSelect=Long.valueOf(request.getParameter("deciSelect")==null?0+"":request.getParameter("deciSelect"));		 
		 Long tratSelect=Long.valueOf(request.getParameter("tratSelect")==null?0+"":request.getParameter("tratSelect"));		 
		 Long evalSelect=Long.valueOf(request.getParameter("evalSelect")==null?0+"":request.getParameter("evalSelect"));		 
		 Long detSelect=Long.valueOf(request.getParameter("detSelect")==null?0+"":request.getParameter("detSelect"));		 
		 Long estimSelect=Long.valueOf(request.getParameter("estimSelect")==null?0+"":request.getParameter("estimSelect"));		 
		 Long maxSelect=Long.valueOf(request.getParameter("maxSelect")==null?0+"":request.getParameter("maxSelect"));		 
		 Long optSelect=Long.valueOf(request.getParameter("optSelect")==null?0+"":request.getParameter("optSelect"));		 
		 Long rapidSelect=Long.valueOf(request.getParameter("rapidSelect")==null?0+"":request.getParameter("rapidSelect"));		
		 Long estrucSelect=Long.valueOf(request.getParameter("estrucSelect")==null?0+"":request.getParameter("estrucSelect"));		
		 Long aliSelect=Long.valueOf(request.getParameter("aliSelect")==null?0+"":request.getParameter("aliSelect"));
		
		String strengths = request.getParameter("fortalezas");
		String opportunities = request.getParameter("oportunidades");
		String indicator = request.getParameter("indicador");
		String specialAction = request.getParameter("accionEsp");
		String support = request.getParameter("soporte");
		
		Date executionDate = null;
		Date revisionDate = null;
		String capacitation = request.getParameter("capacitacion");
		String comments = request.getParameter("comentarios");
		String anho=request.getParameter("anho");		
		String SelectPerson=request.getParameter("SelectPerson");

		ValoracionDTO dto = new ValoracionDTO();
		dto.setBoss(boss);
		dto.setBossCharge(bossCharge);
		dto.setCharge(charge);
		dto.setStartDate(new Date(datePickerStart));
		dto.setEvaluationType(evaluationType);
		dto.setNumId(id);
		dto.setNames(names);
		dto.setPeriod(period);
		
		dto.setArea(area);
		
		 dto.setCompSelect(compSelect);
		 dto.setTomaSelect(tomaSelect);
		 dto.setCreaSelect(creaSelect);
		 dto.setTrabSelect(trabSelect);
		 dto.setMetSelect(metSelect);
		 dto.setManSelect(manSelect);
		 dto.setFocoSelect(focoSelect);
		 dto.setAstSelect(astSelect);
		 dto.setInsSelect(insSelect);
		 dto.setManrelSelect(manrelSelect);
		 
		 dto.setCompcliSelect(compcliSelect);
		 dto.setDesaSelect(desaSelect);
		 dto.setPropSelect(propSelect);
		 dto.setAsuSelect(asuSelect);
		 dto.setEsfSelect(esfSelect);
		 dto.setPartiSelect(partiSelect);
		 dto.setAdaptSelect(adaptSelect);
		 dto.setEntreSelect(entreSelect);
		 dto.setTomSelect(tomSelect);
		 dto.setIdenSelect(idenSelect);
		 dto.setDeciSelect(deciSelect);
		 dto.setTratSelect(tratSelect);
		 dto.setEvalSelect(evalSelect);
		 dto.setDetSelect(detSelect);
		 dto.setEstimSelect(estimSelect);
		 dto.setMaxSelect(maxSelect);
		 dto.setOptSelect(optSelect);
		 dto.setRapidSelect(rapidSelect);
		 dto.setEstrucSelect(estrucSelect);
		 dto.setAliSelect(aliSelect);
		dto.setStrengths(strengths);
		dto.setOpportunities(opportunities);
		dto.setIndicator(indicator);
		dto.setSpecialAction(specialAction);
		dto.setSupport(support);
		
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
		
		try {
			executionDate=formateador.parse(fechaEjecucion);
			revisionDate=formateador.parse(fechaRevision);
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		dto.setExecutionDate(executionDate);
		dto.setRevisionDate(revisionDate);
		dto.setCapacitation(capacitation);
		dto.setComments(comments);
//		dto.setExecutionDate(executionDate);
//		dto.setFechaEjecucion(fechaEjecucion);
//		dto.setFechaRevision(fechaRevision);
		dto.setDemSelect(demSelect);
		dto.setAnho(anho);
		dto.setNoteFinal(Double.valueOf(notaDesep));
		dto.setPersoncharge(SelectPerson);
		dto.setCalcFinal(Double.valueOf(calFinalInput));
		PortletSession session= request.getPortletSession();
		session.setAttribute("dto", dto);
		session.setAttribute("objetivosDTOs", objetivosDTOs);
		generarPdf(objetivosDTOs, response,dto,cumpText,notaText);		
//		ValoracionBusiness business = new ValoracionBusiness();		
//		business.PersistForm(dto,objetivosDTOs);
	}
	
	
	public void doView(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {

        include(viewJSP, renderRequest, renderResponse);
	}
	

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            _log.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }
	
	
	@SuppressWarnings("unchecked")
	public void generarPdf(List<ObjetivosDTO> listObj,ResourceResponse response ,
			ValoracionDTO dto,String cumpText, String notaText ){

			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
			try {

	           Map parametro= new HashMap();
	           parametro.put("nombre", dto.getNames());
	           parametro.put("cedula", ""+dto.getNumId());
	           parametro.put("cargoActual", dto.getCharge());
	           parametro.put("jefeInmediato", dto.getBoss());
	           parametro.put("cargo", dto.getBossCharge());
	           parametro.put("tipoEvaluacion", dto.getEvaluationType());     
	           parametro.put("fecha", ""+formateador.format(dto.getStartDate()));
	           parametro.put("periodo", dto.getPeriod());
	           parametro.put("anho", dto.getAnho());
	           parametro.put("area", dto.getArea());
	           
	           parametro.put("cumplimiento",""+ cumpText);
	           parametro.put("resCumplimiento",  notaText);	           
	           parametro.put("valoracionInc_I", ""+dto.getCompSelect());
	           
	           parametro.put("valoracionInc_II", ""+ dto.getCreaSelect());	 
	           
	           parametro.put("valoracionInc_III", ""+dto.getMetSelect());	           
	           parametro.put("valoracionInc_IV", ""+dto.getFocoSelect());
	           
	           parametro.put("valoracionInc_V", ""+dto.getInsSelect());	           
	           parametro.put("valoracionFinal_I", ""+dto.getTrabSelect());
	           
	           parametro.put("valoracionFinal_II", ""+dto.getTomaSelect());
	           parametro.put("valoracionFinal_III", ""+dto.getManSelect());
	           
	           parametro.put("valoracionFinal_IV", ""+dto.getAstSelect());
	           parametro.put("valoracionFinal_V", ""+dto.getManrelSelect());   
	           
	           parametro.put("compCliente", ""+dto.getCompcliSelect());
	           parametro.put("desCompProf", ""+dto.getDesaSelect());
	           parametro.put("demEspEq", ""+dto.getDemSelect());	           
	           parametro.put("ambEsfMej", ""+dto.getEsfSelect());
	           parametro.put("ambParCumpObj", ""+dto.getPartiSelect());           
	           parametro.put("creatPropCamb", ""+dto.getPropSelect());
	           parametro.put("creatCompIdeas", ""+dto.getAsuSelect());		           
	           parametro.put("propPartCamb", ""+dto.getAdaptSelect());
	           parametro.put("inicCompIdeasCon", ""+dto.getEntreSelect());    
	           parametro.put("respTomAsum", ""+dto.getTomSelect());	           
	           parametro.put("respIdentClar", ""+dto.getIdenSelect());
	           parametro.put("respDecCont", ""+dto.getDeciSelect());	           
	           parametro.put("confTratPerson", ""+dto.getTratSelect());	           
	           parametro.put("confIdentTareas", ""+dto.getEvalSelect());
	           parametro.put("confDetPot", ""+dto.getDetSelect());	       
	           parametro.put("CoopEstTrab", ""+dto.getEstimSelect());	           
	           parametro.put("CoopUtilMax", ""+dto.getMaxSelect());
	           parametro.put("CoopOpt", ""+dto.getOptSelect());	  	           
	           parametro.put("autAdaptRap", ""+dto.getRapidSelect());	           
	           parametro.put("autAdaptEst", ""+dto.getEstrucSelect());
	           parametro.put("autAlinExp", ""+dto.getAliSelect());          
	           parametro.put("califComp", ""+dto.getCalcFinal());
	           parametro.put("notaFinal", ""+dto.getNoteFinal());
	           
	           parametro.put("personaCargo", dto.getPersoncharge());
	           
	           parametro.put("fortalezas", ""+dto.getStrengths());
	           parametro.put("oportunidad", ""+dto.getOpportunities());	           
	           parametro.put("capacidadEnt", ""+dto.getCapacitation());
	           parametro.put("comentarioCol", ""+dto.getComments());           
	           parametro.put("indMejorar", ""+dto.getIndicator());
	           parametro.put("accionEsp", ""+dto.getSpecialAction());	           
	           parametro.put("personaSop", ""+dto.getSupport());
	           
	           parametro.put("fechaEjec", ""+formateador.format(dto.getExecutionDate()));
	           parametro.put("fechaRevision", ""+formateador.format(dto.getRevisionDate()));
	           parametro.put("imagene", this.getClass().getClassLoader().getResource("img.png").getPath());
	           parametro.put("coutList",listObj.size());		           
	           JasperReport report= JasperCompileManager.compileReport(this.getClass().getClassLoader().getResource("reporte.jrxml").getPath());

	            JasperPrint jPrint= JasperFillManager.fillReport(report, parametro, new JRBeanCollectionDataSource(listObj));
	            byte[] bytes = JasperExportManager.exportReportToPdf(jPrint);

	              response.setContentLength(bytes.length);
	              response.setContentType("application/pdf");
	               response.setProperty(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + "valoracion.pdf" + "\"");
	               response.addProperty(HttpHeaders.CACHE_CONTROL, "max-age=3600, must-revalidate");
	          OutputStream OutputStream = response.getPortletOutputStream();
	          OutputStream.write(bytes);
	            OutputStream.flush();
	            OutputStream.close();
	        } catch (JRException | IOException ex) {
	            ex.printStackTrace();
	        } 
		 }
	
	@Override
	public void serveResource(ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {
		if(resourceRequest.getParameter("process")!=null&&resourceRequest.getParameter("process")!="valid"&&resourceRequest.getParameter("validBtn")==null){
			PrintWriter writer = resourceResponse.getWriter();	
			JSONObject jresponse= JSONFactoryUtil.createJSONObject();			
			ValoracionBusiness business = new ValoracionBusiness();	
			String year=resourceRequest.getParameter("year");
			String id=resourceRequest.getParameter("id");
			Long valor= (Long)business.getGeneralDataCount(id, year);
			jresponse.put("validCedula", valor);
			writer.print(jresponse);
			writer.flush();
			writer.close();			
		}else{
		getInfoForm(resourceRequest, resourceResponse);
		}
		
		super.serveResource(resourceRequest, resourceResponse);
	}
}
