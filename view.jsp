<%@page
	import="co.com.bnpparibas.cardif.valoracion.controller.ValoracionPortletClass"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  
<portlet:defineObjects />

	
	<portlet:resourceURL var="getInfoURL"></portlet:resourceURL>
	
<div id="principal">
	<form name="datosGeneralesForm" id="datosGeneralesForm" action="<%=getInfoURL%>"
		method="POST" onSubmit="return programar(20);">
		
		<div id="datos-generales">
			<span class="logo-paribas"></span>
			<span class="seccion">I. DATOS GENERALES</span>
			<table class="dataTable">
			<tbody>
			<tr>
			<td colspan="2">
			<label for="names">NOMBRE</label>
					<input name="names" id="names" type="text"  required/>	</td>
			<td colspan="2">
			<label for="numId" >CEDULA</label>
					<input name="numId" type="text" id="numId" onKeyPress="return soloNumeros(event)" onchange="validarNumer(id)" required/>
			</td>
			<td colspan="2">
			<label for="charge">CARGO ACTUAL</label>
					<input name="charge" id="charge" type="text"  required />
			</td>
			</tr>
			<tr>
			<td colspan="3">
			<label>JEFE INMEDIATO</label>
					<input name="boss" type="text"  required />
			</td>	
			<td colspan="3">
			<label>CARGO</label>
					<input name="bossCharge" type="text"  required/>
			</td>			
			</tr>
			<tr>
			<td colspan="3">
			<label>TIPO DE EVALUACIÓN</label>
					<select name="evaluationType" style="width:230px !important;" id="evaluationType" required>
						<option value="" ></option>
						<option value="Evaluación Periodo de Prueba">Evaluación Periodo de Prueba</option>
						<option value="Evaluación Periódica">Evaluación Periódica</option>
						<option value="Por cambio de cargo">Por cambio de cargo</option>
					</select>
			</td>
			<td colspan="3">
			<label>FECHA</label>					
						<input name="startDate" id="startDate"type="text" onchange="validate_fecha(id)" autocomplete="off" required />
			</td>
			</tr>
			<tr>
			<td colspan="3">
			<label>PERIODO</label>
					<select name="period" style="width:230px !important;" required>
						<option value="" ></option>
						<option value="1er Semestre">1er Semestre</option>
						<option value="2do Semestre">2do Semestre</option>
					</select>
			</td>
			<td colspan="3">
			<label>AÑO</label>
					<select name="anho"
						style="width:230px !important;" required >
						<option value="" ></option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
					</select>
			</td>
			</tr>
			
			</tbody>			
			</table>

		</div>
		<div id="desempeno-funciones">
			<span class="seccion">II. DESEMPEÑO DE SUS FUNCIONES</span>
			<table class="table-criterios" >
				<thead>
					<tr>
						<td colspan="4" class="subtitulo">Criterios de Calificacion</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="criterio-num">1</span></td>
						<td>Supera significativamente las expectativas 110%</td>
						<td><span class="criterio-num">3</span></td>
						<td>Generalmente cumple con las expectativas 70%</td>
					</tr>
					<tr>
						<td><span class="criterio-num">2</span></td>
						<td>Cumple las expectativas 100%</td>
						<td><span class="criterio-num">4</span></td>
						<td>Esta por debajo de lo requerido 70%</td>
					</tr>
				</tbody>
			</table>
			<table class="table-objetivos"  id="tableObj">
				<thead>
					<tr >
						<td style="width: 35%;">OBJETIVOS ESTRATEGICOS</td>
						<td style="width: 20%;">FORMULA CALCULO</td>
						<td style="width: 10%;">PESO(%)</td>
						<td style="width: 15%;">CUMPLIMIENTO</td>
						<td style="width: 10%;">NOTA</td>
						<td style="width: 10%;">META</td>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td style="width: 35%;"><textarea name="objetivo1" rows="3"
								style="resize: none; max-width: 400px;" required="required"></textarea></td>
						<td style="width: 20%;"><textarea name="formula1" rows="3"
								style="resize: none;" required="required"></textarea></td>
						<td style="width: 10%;"><input type="text" name="peso1" id="peso1"
							style="max-width: 50px" required="required"  /></td>
						<td style="width: 15%;"><input type="text"
							name="cumplimiento1" id="cumplimiento1"
							style="max-width: 25px; text-align: center;" value="10" readonly="readonly"/></td>
						<td style="width: 10%;"><select name="notaSelect1" id="notaSelect1" required
								 onChange="cumplimiento(id)">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td style="width: 10%;">100%</td>
					</tr>
				</tbody>
			</table>
			<input type="button" value="Agregar Objetivo"
				onclick="addRow('tableObj')" />
			<table class="table_calif">
				<tbody>
					<tr>
						<td>CALIFICACION FINAL DESEMPEÑO</td>
						<td>
							<table border="1">
								<tbody>
									<tr>
										<td>CUMPLIMIENTO</td>
									</tr>
									<tr>
										<td><input type="text"
											name="cumpText" id="cumpText" readonly="readonly" /></td>
										<td>X</td>
										<td>70%</td>
										<td>=</td>
										<td><input type="text"
											name="notaText" id="notaText" readonly="readonly"></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<div id="competencias">
			<span class="seccion">III. COMPETENCIAS REQUERIDAS POR EL
				CARGO</span>
			<table class="table-competencias" >
				<thead>
					<tr>

						<td>FACTOR A EVALUAR</td>
						<td>VALORACION</td>
						<td>FACTOR A EVALUAR</td>
						<td>VALORACION</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>COMPRENSION DEL NEGOCIO</td>
						<td><select name="compSelect" id="compSelect" onChange="comportamiento()" required>
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>TOMA DE DECISIONES</td>
						<td><select name="tomaSelect" id="tomaSelect" required  onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>CREATIVIDAD</td>
						<td><select name="creaSelect" id="creaSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>TRABAJAR A TRAVES DE OTROS</td>
						<td><select name="trabSelect" id="trabSelect" required  onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>METODOLOGIA DE TRABAJO</td>
						<td><select name="metSelect" id="metSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>MANEJO DE PROBLEMAS</td>
						<td><select name="manSelect" id="manSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>FOCO EN RESULTADO FINAL</td>
						<td><select name="focoSelect" id="focoSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>ASTUCIA ORGANIZACIONAL</td>
						<td><select name="astSelect" id="astSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>INSPIRAR A OTROS</td>
						<td><select name="insSelect" id="insSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>MANEJO RELACIONES DIVERSAS</td>
						<td><select name="manrelSelect" id="manrelSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="comp-profesional">
			<span class="seccion">IV. COMPORTAMIENTO PROFESIONAL</span> <span>Esta
				secciòn hace referencia al conjunto de comportamientos "tipo" que de
				acuerdo a los valores del grupo BNP Paribas son identificados como
				las bases para un desempeño homogeneo al interior del Grupo. Evalùe
				dichos comportamientos de acuerdo a la escala señalada en la seccion
				"Competencias requeridas para el cargo"</span>
			<table class="tableCompromiso">
				<tbody>
					<tr>
						<td style="padding-top: 40px;">
							<table class="table-comp-profesional">
								<thead>
									<tr>
										<td colspan="2">Compromiso</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Comprometido con clientes (internos / externos)</td>
										<td><select name="compcliSelect" id="compcliSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Desarrolla competencias profesionales</td>
										<td><select name="desaSelect" id="desaSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Demuestra espiritu de equipo</td>
										<td><select name="demSelect" id="demSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
							<table class="table-comp-profesional">
								<thead>
									<tr>
										<td colspan="2">Creatividad</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Hace propuestas y participa en los cambios</td>
										<td><select name="propSelect" id="propSelect" required  onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Asume iniciativas, comparte sus ideas y sus
											conocimientos expertos</td>
										<td><select name="asuSelect" id="asuSelect"  required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
					<tr>
						<td>
							<table class="table-comp-profesional">
								<thead>
									<tr>
										<td colspan="2">Ambición</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Se esfuerza espontaneamente por mejorar su desempeño</td>
										<td><select name="esfSelect" id="esfSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Participa activamente en el cumplimiento de objetivos
											comunes</td>
										<td><select name="partiSelect" id="partiSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td >
							<table class="table-comp-profesional">
								<thead>
									<tr>
										<td colspan="2">Capacidad de reacción</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Se adapta al enfrentar situaciones nuevas o
											imprevistas</td>
										<td><select name="adaptSelect"  id="adaptSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Entrega el servicio solicitado a tiempo</td>
										<td><select name="entreSelect" id="entreSelect"	required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
				</tbody>
			</table>
		</div>
		<div id="comp-gerencial">
			<span class="seccion">V. COMPORTAMIENTO GERENCIAL (Ùnicamente
				para responsables del àrea)</span> <span>Paribas establece 4
				principios de gestion que guian e inspiran las actitudes de los
				lideres de BNP Paribas, cualquiera que sea la naturaleza de sus
				funciones, entidad o pais de operacion. Evalue dichos
				comportamientos de acuerdo a la escala señalada en la seccion
				"Competencias requeridas para el cargo"</span>
			<table class="table-comport">
				<tbody>
					<tr>
						<td>
							<table class="table-comp-gerencial">
								<thead>
									<tr>
										<td colspan="2">Responsabilidad</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Toma y asume la responsabilidad por las decisiones
											dentro de su linea de autoridad</td>
										<td><select name="tomSelect" id="tomSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Identifica claramente las tareas de los miembros de
											su equipo y los une en la consecucion de un proyecto en comun</td>
										<td><select name="idenSelect" id="idenSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Decide del contenido y organizacion de la delegacion
											de autoridad que entrega y verifica que se apliquen
											correctamente</td>
										<td><select name="deciSelect" id="deciSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
							<table class="table-comp-gerencial">
								<thead>
									<tr>
										<td colspan="2">Confianza</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Trata a cada persona con la consideración que se
											merece</td>
										<td><select name="tratSelect" id="tratSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Evalúa los desempeños de los miembros de su equipo en
											forma transparente</td>
										<td><select name="evalSelect" id="evalSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Detecta y despierta el potencial de las personas de
											talento</td>
										<td><select name="detSelect" id="detSelect" required  onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table class="table-comp-gerencial">
								<thead>
									<tr>
										<td colspan="2">Cooperacion transversal</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Estimula el trabajo de proyectos y el compartir
											información</td>
										<td><select name="estimSelect" id="estimSelect"	required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Utiliza al máximo el potencial competitivo del Grupo
											desarrollando el intercambio de ventas y/o de las mejores
											prácticas</td>
										<td><select name="maxSelect" id="maxSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Optimiza los medios colocados a su disposición,
											compartiéndolos si corresponde</td>
										<td><select name="optSelect" id="optSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
							<table class="table-comp-gerencial">
								<thead>
									<tr>
										<td colspan="2">Autonomia</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Adapta rápidamente a su organización y su curso de
											acción personal para los cambios que ve delante suyo</td>
										<td><select name="rapidSelect" id="rapidSelect"	required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Adapta su estructura jerárquica para asegurar la
											eficiencia en el flujo de información y en el proceso de toma
											de decisiones</td>
										<td><select name="estrucSelect" id="estrucSelect" required onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
									<tr>
										<td>Alienta la expresión de opiniones, la responsabilidad
											individual y la libertad de acción</td>
										<td><select name="aliSelect" id="aliSelect" required  onChange="comportamiento()">
												<option value="" ></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="calificacion">
				<span>CALIFICACION FINAL COMPETENCIAS <input
					name="calFinalInput" id="calFinalInput" readonly="readonly"
					style="background-color: transparent; border-color: black;"></span>
			</div>
			<div id="nota-final">
				<span class="inline"> <span class="seccion-a">NOTA
						FINAL EVALUACION DE DESEMPEÑO </span> <input
					name="notaFinalInput" id="notaFinalInput" readonly="readonly"
					style="background-color: transparent !important; border-color: black; display: inline-block; width: 25%; margin-top: 5px;"></input>
				</span> <span>Referentes a Desempeño y Competencias</span>
				<table class="table-referentes">
					<thead>
						<tr>
							<td>FORTALEZAS:</td>
							<td>OPORTUNIDADES DE MEJORA:</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea name="fortalezas" rows="3" cols="12"
									style="resize: none; width: 350px;" required></textarea></td>
							<td><textarea name="oportunidades"
									rows="3" cols="12" style="resize: none; width: 350px;"
									required></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="plan-desarrollo">
			<span class="seccion">VI. PLAN INDIVIDUAL DE DESARROLLO
				(Acciones de Apoyo para potencializar la labor del colaborador)</span>
			<table border="1" class="tablePlan">
				<thead style="background-color: rgb(214, 208, 219);">
					<tr>
						<td style="width: 20%;">INDICADOR A MEJORAR /
							COMPETENCIA A DESARROLLAR</td>
						<td style="width: 20%;">ACCION ESPECIFICA</td>
						<td style="width: 20%;">PERSONA SOPORTE</td>
						<td style="width: 20%;">FECHA EJECUCION</td>
						<td style="width: 20%;">FECHA REVISION</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea name="indicador"
								style="width: 180px; resize: none;" required="required"></textarea></td>
						<td><textarea name="accionEsp"
								style="width: 180px; resize: none;" required="required"></textarea></td>
						<td><textarea name="soporte"
								style="width: 180px; resize: none;" required="required"></textarea></td>
						<td>
						<input name="fechaEjecucion" id="fechaEjecucion"
								style="width: 180px; resize: none; height: 45px;" onchange="validate_fecha(id)" autocomplete="off" required="required"/>
								
								</td>
						<td><input name="fechaRevision" id="fechaRevision"
								style="width: 180px; resize: none; height: 45px;" onchange="validate_fecha(id)" autocomplete="off" required="required"/>
								</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="capacitacion">
			<span class="seccion" style="height: 40px;">VII. CAPACITACION
				Y ENTRENAMIENTO Capacitacion de acuerdo al plan de capacitacion (Ver
				Anexo), entrenamiento o reentrenamiento en el cargo </span>
			<textarea name="capacitacion" rows="3"	required="required"></textarea>
		</div>
		
		<div id="comentarios">
			<span class="seccion">VIII. COMENTARIOS DEL COLABORADOR</span>
			<textarea name="comentarios"required="required"></textarea>
			
					<span style="text-decoration: overline; padding-left: 120px;">FIRMA DEL COLABORADOR</span>
			
					<span style="text-decoration: overline; float: right;
    				 margin-left: 141px;    padding-right: 120px">FIRMA	JEFE INMEDIATO</span>
				
		</div>
		<input name="rowTotal" id="rowTotal" type="hidden" value="1"></input>
		<input type="submit" name="dd" value="Guardar y DescargarPDF"
			></input>
				
	</form>
</div>



<script type="text/javascript">


function programar(v){
	setTimeout('recarger()',parseInt(v) )
	return true;
}



$(function() {
    $( "#startDate" ).datepicker({
    	 minDate: new Date(2014, 0, 1),
         maxDate: new Date(2016, 11, 31),
         dateFormat: 'dd/mm/yy',
         constrainInput: true,   	
    	
    });
  });
  
  
$(function() {
    $( "#fechaEjecucion" ).datepicker({
    	 minDate: new Date(2014, 0, 1),
         maxDate: new Date(2016, 11, 31),
         dateFormat: 'dd/mm/yy',
         constrainInput: true,   	
    	
    });
  });
  
$(function() {
    $( "#fechaRevision" ).datepicker({
    	 minDate: new Date(2014, 0, 1),
         maxDate: new Date(2016, 11, 31),
         dateFormat: 'dd/mm/yy',
         constrainInput: true,   	
    	
    });
  });

function generarPDF(){
// 	alert("on submit..");
	
// 		textoCp=new Array();

		   AUI().use('aui-io-request', function(A){
 
        A.io.request('<%=getInfoURL.toString()%>', {
        	  method: 'post',
        	  dataType: 'json',
              form: {
                  id: 'datosGeneralesForm'
              },
              on: {
                  success: function() {
//                 	  alert("FULL-");
                	  //window.open(this.get('responseData'));
                	  printPDFData(this.get('responseData'));
                  }
             }
        });
 
    });
	
 return false;
};

	
function printPDFData(jsonDataString){    
	   window.open('<portlet:resourceURL id="printQuestionnairePdfData"></portlet:resourceURL>&jsonDataString='+jsonDataString);    
	} 
	
function recarger(){
// 	alert("CLEAR...");
	document.getElementById("datosGeneralesForm").reset();
	
		 var table = document.getElementById("tableObj");
	    var rowCount = table.rows.length;
	    console.log(rowCount);
	    for(var i=rowCount;i>rowCount ;i--){
	    	console.log(i);
	    	document.getElementById("tableObj").deleteRow(i);
	    }
	    document.getElementById("rowTotal").value=1;
// 	location.reload(true);
// 	window.onload = function() {
// 		alert("Limpiar..");
// 		document.getElementById("datosGeneralesForm").reset();
// 	};
// 	return true;
}


function promedio(id){		
	promedio+=document.getElementById("<portlet:namespace/>datosGeneralesForm").value;
}

function comportamiento(){
	var promedio=0;
	var resultPromedio=0;
	var compSelect=document.getElementById("compSelect").value;
	var tomaSelect= document.getElementById("tomaSelect").value;
	var creaSelect=document.getElementById("creaSelect").value;
	var trabSelect= document.getElementById("trabSelect").value;
	var metSelect=document.getElementById("metSelect").value;
	var manSelect =document.getElementById("manSelect").value;
	var focoSelect=document.getElementById("focoSelect").value;
	var astSelect=document.getElementById("astSelect").value;
	var insSelect=document.getElementById("insSelect").value;
	var manrelSelect=document.getElementById("manrelSelect").value;
	
	var compcliSelect=document.getElementById("compcliSelect").value;
	var desaSelect=document.getElementById("desaSelect").value;
	var demSelect=document.getElementById("demSelect").value;
	var propSelect=document.getElementById("propSelect").value;
	var asuSelect=document.getElementById("asuSelect").value;
	var esfSelect=document.getElementById("esfSelect").value;
	var partiSelect=document.getElementById("partiSelect").value;
	var adaptSelect=document.getElementById("adaptSelect").value;
	var entreSelect=document.getElementById("entreSelect").value;
	var tomSelect=document.getElementById("tomSelect").value;
	
	var idenSelect=document.getElementById("idenSelect").value;
	var deciSelect=document.getElementById("deciSelect").value;
	var tratSelect=document.getElementById("tratSelect").value;
	var evalSelect=document.getElementById("evalSelect").value;
	var detSelect=document.getElementById("detSelect").value;
	var estimSelect=document.getElementById("estimSelect").value;
	var maxSelect=document.getElementById("maxSelect").value;
	var optSelect=document.getElementById("optSelect").value;
	var rapidSelect=document.getElementById("rapidSelect").value;
	var estrucSelect=document.getElementById("estrucSelect").value;
	var aliSelect=document.getElementById("aliSelect").value;
//alert("valor..."+compSelect);
if(compSelect!='')
		promedio+=parseInt(compSelect);

//alert("valor..."+tomaSelect);
if(tomaSelect!='')
	promedio+=parseInt(tomaSelect);
if(creaSelect!='')
	promedio+=parseInt(creaSelect);
if(compSelect!='')
	promedio+=parseInt(compSelect);
if(trabSelect!='')
	promedio+=parseInt(trabSelect);
if(metSelect!='')
	promedio+=parseInt(metSelect);
if(manSelect!='')
	promedio+=parseInt(manSelect);
if(focoSelect!='')
	promedio+=parseInt(focoSelect);
if(astSelect!='')
	promedio+=parseInt(astSelect);
if(insSelect!='')
	promedio+=parseInt(insSelect);
if(manrelSelect!='')
	promedio+=parseInt(manrelSelect);
if(compcliSelect!='')
	promedio+=parseInt(compcliSelect);
if(desaSelect!='')
	promedio+=parseInt(desaSelect);
if(demSelect!='')
	promedio+=parseInt(demSelect);
if(propSelect!='')
	promedio+=parseInt(propSelect);	

if(asuSelect!='')
	promedio+=parseInt(asuSelect);
if(esfSelect!='')
	promedio+=parseInt(esfSelect);
if(partiSelect!='')
	promedio+=parseInt(partiSelect);
if(adaptSelect!='')
	promedio+=parseInt(adaptSelect);
if(entreSelect!='')
	promedio+=parseInt(entreSelect);
if(tomSelect!='')
	promedio+=parseInt(tomSelect);

if(idenSelect!='')
	promedio+=parseInt(idenSelect);
if(deciSelect!='')
	promedio+=parseInt(deciSelect);
if(tratSelect!='')
	promedio+=parseInt(tratSelect);
if(evalSelect!='')
	promedio+=parseInt(evalSelect);
if(detSelect!='')
	promedio+=parseInt(detSelect);
if(estimSelect!='')
	promedio+=parseInt(estimSelect);
if(maxSelect!='')
	promedio+=parseInt(maxSelect);
if(optSelect!='')
	promedio+=parseInt(optSelect);
if(rapidSelect!='')
	promedio+=parseInt(rapidSelect);
if(estrucSelect!='')
	promedio+=parseInt(estrucSelect);
if(aliSelect!='')
	promedio+=parseInt(aliSelect);

//alert("despues del if.."+promedio);
resultPromedio=promedio/31;
//alert("despues "+resultPromedio);
var resutNota=document.getElementById("notaText").value;
//alert("if");
var notaFinal=(resultPromedio*0.30);
//alert("....");
document.getElementById("calFinalInput").value=resultPromedio.toFixed(4);
//alert("....");
var valor=parseFloat(resutNota)+notaFinal;
//alert(valor+"....");
document.getElementById("notaFinalInput").value=valor.toFixed(4);
//alert("....");
}	




function cumplimiento(id){
	
	var res = id.split("notaSelect")
	var table = document.getElementById('tableObj');
	var rowCount = table.rows.length;
	
	var valorCump=0;
	var promedio=0;
	
	
	if(parseInt(document.getElementById(id).value)==1){
		document.getElementById("cumplimiento"+res[1]).value=110
		valorCump=110;
	}
		if(parseInt(document.getElementById(id).value)==2){
			document.getElementById("cumplimiento"+res[1]).value=100
			valorCump=100;
		}
			if(parseInt(document.getElementById(id).value)==3){
				document.getElementById("cumplimiento"+res[1]).value=70
				valorCump=70;
			}
				if(parseInt(document.getElementById(id).value)==4){
					document.getElementById("cumplimiento"+res[1]).value=70
					valorCump=70;
					}
	
	for(var i=1; i<rowCount;i++){
			
				if(document.getElementById("peso"+i).value!=''){
					
				promedio+=((valorCump*parseInt(document.getElementById("peso"+i).value))/100);
				}

				
	}
	document.getElementById("cumpText").value=promedio;
	document.getElementById("notaText").value=(promedio*0.7).toFixed(3);
}

function formReset()
{
document.getElementById("datosGeneralesForm").reset();
}

function addRow(tableID) {

    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);
	var cell1 = row.insertCell(0);
    var element1 = document.createElement("textarea");
    element1.type = "text";
    element1.name = "objetivo"+(rowCount);
    element1.setAttribute("required","true");
    element1.style.width='57%';
    element1.style.height='80px';
    cell1.appendChild(element1);


    var cell2 = row.insertCell(1);
    var element2 = document.createElement("textarea");
    element2.type = "text";
    element2.name = 'formula'+(rowCount);
    element2.setAttribute("required","true");
    element2.style.width='95%';
    element2.style.height='80px';
    cell2.appendChild(element2);



    var cell3 = row.insertCell(2);
    var element3 = document.createElement("input");
    element3.type = "text";
    element3.name = 'peso'+(rowCount);
    element3.id="peso"+(rowCount);
    element3.setAttribute("required","true");
    element3.style.width='50%';
    cell3.appendChild(element3);
    
    var cell4 = row.insertCell(3);
    var element4 = document.createElement("input");
    element4.type="text;"
    element4.id="cumplimiento"+(rowCount);
   	element4.name =  'cumplimiento'+(rowCount);
   	element4.style.width='20%';
   	element4.setAttribute("readonly", "true"); 
    cell4.appendChild(element4);
    
    var cell5 = row.insertCell(4);
    var element5 = document.createElement("select");
   	element5.name =  'notaSelect'+(rowCount);
   	element5.id = 'notaSelect'+(rowCount);
   	element5.setAttribute("required","true");
   	element5.setAttribute("onchange", "cumplimiento(id)"); 
   	element5.style.width='10%';
   	var opt1 = document.createElement("option");
    opt1.value="";
    opt1.innerHTML="";
    element5.appendChild(opt1);
   	for(var i=1;i<5;i++){
   		var opt1 = document.createElement("option");
        opt1.value=i;
        opt1.innerHTML=i;
        element5.appendChild(opt1);
   	}
    cell5.appendChild(element5);
    var cell6 = row.insertCell(5);
    var element6 = document.createElement("label");
   	element6.innerHTML="100%"
   	element6.style.width='100%';
   	cell6.appendChild(element6);
    
    document.getElementById("rowTotal").value=rowCount;
}



function soloNumeros(e){
		var tecla = (document.all) ? e.keyCode : e.which;
	
		if (tecla==8 || tecla==127 || tecla==9|| tecla==0) return true; //Tecla de retroceso (para poder borrar)
// 		var patron = /\d/;
		var patron = /[0-9]/;
		var te = String.fromCharCode(tecla);
		return patron.test(te);

		}
		
function validarNumer(id){
			var valor =document.getElementById(id).value;
			if(isNaN((valor))){			
				document.getElementById(id).value="";
			}			
		}
		
function validate_fecha(id)
{
	var fecha=document.getElementById(id).value;
	
    var patron=new RegExp("^([0-9]{1,2})([/])([0-9]{1,2})([/])(19|20)+([0-9]{2})$");
 
    if(!fecha.search(patron)==0)
    {
    	document.getElementById(id).value="";
    }

}

 </script>