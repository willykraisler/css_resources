<%@include file="/html/init.jsp"%>

<portlet:resourceURL var="getInfoURL"></portlet:resourceURL>
<portlet:actionURL var="getGuardar" name="saveForm"></portlet:actionURL>
<div id="principal">
	<form name="datosGeneralesForm" id="datosGeneralesForm" action="<%=getInfoURL%>"
		method="POST" onSubmit="return programar();">
		
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
					<input name="numId" type="text" id="numId" onKeyPress="return soloNumeros(event)" onchange="validarNumer(id) , validCedulaAnho()" required/>
			</td>
			<td colspan="2">
			<label for="charge">CARGO ACTUAL</label>
					<input name="charge" id="charge" type="text"  required />
			</td>
			</tr>
			<tr>
			<td colspan="2">
			<label>JEFE INMEDIATO</label>
					<input name="boss" type="text"  required />
			</td>	
			<td colspan="2">
			<label>CARGO</label>
					<input name="bossCharge" type="text"  required/>
			</td>	
			<td colspan="2">
			<label>AREA</label>
					<input name="area"  id="area" type="text"  required/>
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
					<select name="anho"	id="anho" style="width:230px !important;" required onchange="validCedulaAnho()">
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
						<td>Esta por debajo de lo requerido 50%</td>
					</tr>
				</tbody>
			</table>
			<table class="table-objetivos"  id="tableObj">
				<thead>
					<tr >
						<td style="width: 30%;">OBJETIVOS ESTRATEGICOS</td>
						<td style="width: 20%;">FORMULA CALCULO</td>
						<td style="width: 15%;"><div id="porcAct">PESO-0%</div></td>
						<td style="width: 15%;">CUMPLIMIENTO</td>
						<td style="width: 10%;">NOTA</td>
						<td style="width: 10%;">META</td>
					</tr>
				</thead>
				<tbody>
					<tr>

						<td style="width: 30%;"><textarea name="objetivo1" rows="3"	required="required"></textarea></td>
						<td style="width: 20%;"><textarea name="formula1" rows="3"	required="required"></textarea></td>
						<td style="width: 15%;"><input type="text" name="peso1" id="peso1" required="required" onchange="porcentaje(id)"/></td>
						<td style="width: 15%;"><input type="text" name="cumplimiento1" id="cumplimiento1"  onKeyPress="return soloNumeros(event)" onchange="validarNumer(id), nota(id), cumplimiento(id)" value="" /></td>
						<td style="width: 10%;"><input type="text" name="notaSelect1" id="notaSelect1"  value="" readonly="readonly">
						</td>
						<td style="width: 10%;">100%</td>
					</tr>
				</tbody>
			</table>
			<input type="button" value="Agregar Objetivo"
				onclick="addRows('tableObj')" />
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
						<td>Comprension del negocio</td>
						<td><select name="compSelect" id="compSelect" onChange="comportamiento()" required>
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>Toma de decisiones</td>
						<td><select name="tomaSelect" id="tomaSelect" required  onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>Empático</td>
						<td><select name="creaSelect" id="creaSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>Ético</td>
						<td><select name="trabSelect" id="trabSelect" required  onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>Ingenioso</td>
						<td><select name="metSelect" id="metSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>Manejo de problemas</td>
						<td><select name="manSelect" id="manSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>Foco en resultado final</td>
						<td><select name="focoSelect" id="focoSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>Emprendedor</td>
						<td><select name="astSelect" id="astSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
					</tr>
					<tr>
						<td>Experto</td>
						<td><select name="insSelect" id="insSelect" required onChange="comportamiento()">
								<option value="" ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select></td>
						<td>Manejo relaciones</td>
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
		
		<table class="table_person">
		<tbody>
		<tr>
		<td width="30%">	
		<label>El funcionario tiene personas a cargo</label>
		</td>
		<td width="60%">
		<select name="SelectPerson" id="SelectPerson"	required style="width: 20% !important;" onchange="validPerson(id)">
												<option value="" ></option>
												<option value="Si">Si</option>
												<option value="No">No</option>												
											</select> </td>
		</tr>
		</tbody>
		</table>
	
		
		<div id="comp-gerencial">
		<div id="comp-person">
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
			</div>
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
		<input name="rowTotal" style="d " id="rowTotal" type="hidden"  value="1"></input>
		<input type="hidden" name="validBtn" id="validBtn" value="0">
		<input type="button" disabled="disabled" name="bttnGuardar" id="bttnGuardar" onclick="validButton(id)" value="Guardar"></input>
			
		<input type="button" name="bttnDescargar" id="bttnDescargar" onclick="validButton(id)" value="Descargar"></input>	
	</form>
</div>

<script type="text/javascript">
var descarga=0;
function validButton(id){
		
	var urlAction='<%=getGuardar%>';
	
	if(descarga>=1){
		$('#bttnGuardar').prop('disabled', false);
	}
		if(id=='bttnGuardar'&&descarga>=2){
	$('#datosGeneralesForm').attr('action', '<%=getGuardar%>');
	$("#"+id).attr("type","submit");
		
}else
		if(id=='bttnDescargar'){
		$("#"+id).attr("type","submit");
		
		}
}


function programar(){
	descarga=descarga+1;
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


function validCedulaAnho(){
	var cedula=document.getElementById("numId").value;
	var anho=document.getElementById("anho").value;
	if(cedula!=''&&anho!='')
	   AUI().use('aui-io-request', function(A){
		   
	        A.io.request('<%=getInfoURL.toString()%>', {
	        	  method: 'post',
	        	  dataType: 'json',
	              data: {
	            	 id: cedula,
	            	 year: anho,
	            	 process: 'valid'
	              },
	              on: {
	                  success: function() {
			if(this.get('responseData').validCedula>=1){
				document.getElementById("datosGeneralesForm").reset();
				alert("Usuario ya registrado..");
			}
	
	                  }
	             }
	        });	 
	    });
}

	
function recarger(){
	document.getElementById("datosGeneralesForm").reset();
	
		 var table = document.getElementById("tableObj");
	    var rowCount = table.rows.length;
	    console.log(rowCount);
	    for(var i=rowCount;i>rowCount ;i--){
	    	console.log(i);
	    	document.getElementById("tableObj").deleteRow(i);
	    }
	    document.getElementById("rowTotal").value=1;
}


// function promedio(id){		
// 	promedio+=document.getElementById("<portlet:namespace/>datosGeneralesForm").value;
// }

function comportamiento(){
	var personAcar=document.getElementById("SelectPerson").value;
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

//if(compSelect!='')
//		promedio+=parseInt(compSelect);


if(tomaSelect!='')
	promedio+=parseInt(tomaSelect);
// if(creaSelect!='')
// 	promedio+=parseInt(creaSelect);
if(compSelect!='')
	promedio+=parseInt(compSelect);
// if(trabSelect!='')
// 	promedio+=parseInt(trabSelect);
// if(metSelect!='')
// 	promedio+=parseInt(metSelect);
if(manSelect!='')
	promedio+=parseInt(manSelect);
if(focoSelect!='')
	promedio+=parseInt(focoSelect);
// if(astSelect!='')
// 	promedio+=parseInt(astSelect);
// if(insSelect!='')
// 	promedio+=parseInt(insSelect);
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
	
if(tomSelect!=''&&personAcar!='No')
	promedio+=parseInt(tomSelect);
if(idenSelect!=''&&personAcar!='No')
	promedio+=parseInt(idenSelect);
if(deciSelect!=''&&personAcar!='No')
	promedio+=parseInt(deciSelect);
	
if(tratSelect!=''&&personAcar!='No')
	promedio+=parseInt(tratSelect);
if(evalSelect!=''&&personAcar!='No')
	promedio+=parseInt(evalSelect);
if(detSelect!=''&&personAcar!='No')
	promedio+=parseInt(detSelect);
	
if(estimSelect!=''&&personAcar!='No')
	promedio+=parseInt(estimSelect);
if(maxSelect!=''&&personAcar!='No')
	promedio+=parseInt(maxSelect);
if(optSelect!=''&&personAcar!='No')
	promedio+=parseInt(optSelect);
if(rapidSelect!=''&&personAcar!='No')
	promedio+=parseInt(rapidSelect);
if(estrucSelect!=''&&personAcar!='No')
	promedio+=parseInt(estrucSelect);
if(aliSelect!=''&&personAcar!='No')
	promedio+=parseInt(aliSelect);

if(personAcar=='Si'||personAcar==''){
resultPromedio=promedio/26;
}
else{
	resultPromedio=promedio/14;
}
var resutNota=0;

if(document.getElementById("notaText").value!='')
	resutNota=parseInt(document.getElementById("notaText").value)*70;
var notaFinal=(resultPromedio*30);
if(resultPromedio.toString().length>7)
document.getElementById("calFinalInput").value=resultPromedio.toFixed(9);
else
	document.getElementById("calFinalInput").value=resultPromedio;

var valor=(resutNota+notaFinal)/100;
if(valor.toString().length>4)
document.getElementById("notaFinalInput").value=valor.toFixed(6);
else
	document.getElementById("notaFinalInput").value=valor;
	}	
	

function cumplimiento(id){
	
	var res = id.split("notaSelect")
	var table = document.getElementById('tableObj');
	var rowCount = table.rows.length;
	
	var valorCump=0;
	var promedio=0;
	var validVacio=0;
	
// 	if(parseInt(document.getElementById(id).value)==1){
// 		document.getElementById("cumplimiento"+res[1]).value=110
// 		valorCump=110;
// 	}
// 		if(parseInt(document.getElementById(id).value)==2){
// 			document.getElementById("cumplimiento"+res[1]).value=100
// 			valorCump=100;
// 		}
// 			if(parseInt(document.getElementById(id).value)==3){
// 				document.getElementById("cumplimiento"+res[1]).value=70
// 				valorCump=70;
// 			}
// 				if(parseInt(document.getElementById(id).value)==4){
// 					document.getElementById("cumplimiento"+res[1]).value=50
// 					valorCump=70;
// 					}
	
	for(var i=1; i<rowCount;i++){
			
				if(document.getElementById("peso"+i).value!=''&& document.getElementById("cumplimiento"+i).value!=''){
					promedio+=((parseInt(document.getElementById("cumplimiento"+i).value)*parseInt(document.getElementById("peso"+i).value))/100);
// 				promedio=((valorCump*parseInt(document.getElementById("peso"+i).value))/100);
					validVacio=1;
				}				
	}
	if(validVacio==1){
	document.getElementById("cumpText").value=promedio;
	if(promedio>=0&&promedio<=50){
		document.getElementById("notaText").value=4;
	}else
		if(promedio>50&&promedio<=70){
			document.getElementById("notaText").value=3;
		}else
			if(promedio>70&&promedio<=100){
				document.getElementById("notaText").value=2;
			}else
				if(promedio>100){
					document.getElementById("notaText").value=1;
				}	
	}else{
		document.getElementById("cumpText").value="";
		document.getElementById("notaText").value="";
	}
	comportamiento();
}

function formReset()
{
document.getElementById("datosGeneralesForm").reset();
}

function nota(id){
	var pos=id.split("cumplimiento");
	var cump=document.getElementById(id).value;
	document.getElementById("notaSelect"+pos[1]).value="";
	if(cump!=''){	
		
		if(parseInt(cump)>=0&&parseInt(cump)<=50){
			document.getElementById("notaSelect"+pos[1]).value=4;
		}else
			if(parseInt(cump)>=51&&parseInt(cump)<=70){	
				document.getElementById("notaSelect"+pos[1]).value=3;	
		}else
			if(parseInt(cump)>=71&&parseInt(cump)<=100){	
				document.getElementById("notaSelect"+pos[1]).value=2;
			}else
				if(parseInt(cump)>=101){	
					document.getElementById("notaSelect"+pos[1]).value=1;
		}
	}
}

function porcentaje(id){	
		var table = document.getElementById("tableObj");
		var rowCount = table.rows.length;
	 	var sumaPorc=0;
	 	var valid=1;
	 	var pos=id.split("peso");
	    for(var i=1;i<rowCount ;i++){
	    	if(document.getElementById("peso"+i).value!=''){
	    		var peso=parseInt(document.getElementById("peso"+i).value);

	    		if(pos[1]!=i){
// 	    		if((100-(peso+sumaPorc))>=0){
	    			

// 	    			if((peso+sumaPorc)!=100&&i==rowCount-1){
// 	    				document.getElementById(id).value="";
// 	    				peso=0;
// 	    			}
	    			console.log("ingreso..."+peso);
	    	  		sumaPorc+=peso;
	    			
// 	    			}else{
// 	    				sumaPorc+=peso;
// 	    				document.getElementById(id).value="";
	    			}
	   			 
	    		
	    		
	      				 
	   		 }else{
	   			valid=0; 
	   		 }
	    }
	    	
// 			if(i==rowCount-1){    			
    			var pesofinal=0;
    				    		
    			if(document.getElementById(id).value!=''){
    				    	pesofinal= parseInt(document.getElementById(id).value);			
   				if((100-(pesofinal+sumaPorc))>=0){

	    			if((peso+sumaPorc)!=100&&valid!=0){
	    				alert("No ha ingresado el 100%");
	    				document.getElementById(id).value="";
	    				pesofinal=0;
	    			}

	    			console.log("ingreso..."+pesofinal);
	    	  		sumaPorc+=pesofinal;
	    	  		$("#"+id).css({"border-color": "#C1E0FF", 
   		             "border-weight":"1px", 
   		             "border-style":"solid"});
	    			
	    			}else{

//		    				sumaPorc+=peso;
					alert("Superó el 100%");
	    				document.getElementById(id).value="";
	    				$("#"+id).css({"border-color": "#FF0408", 
	    		             "border-weight":"1px", 
	    		             "border-style":"solid"});
	    				$("#"+id).focus();
	    			}     	
	       	
	    }

	document.getElementById('porcAct').innerHTML ="PESO-"+ (sumaPorc)+"%";	
	cumplimiento(id);
}


function addRows(tableID){
	var table = document.getElementById(tableID);
	var rowCount = table.rows.length;	
	var newRow='';
		newRow="<tr><td style='width: 30%;'><textarea row='3' required='required' name='objetivo"+rowCount+"' id='objetivo"+rowCount+"'></textarea></td>";
		newRow+="<td style='width: 20%;'><textarea row='3' required='required'  name='formula"+rowCount+"' id='formula"+rowCount+"'></textarea></td>";
		newRow+="<td style='width: 15%;'><input type='text' name='peso"+rowCount+"' id='peso"+rowCount+"' required='required' onchange='porcentaje(id)'></td>";
		newRow+="<td style='width: 15%;'><input type='text' name='cumplimiento"+rowCount+"' id='cumplimiento"+rowCount+"'  onKeyPress='return soloNumeros(event)' onchange='validarNumer(id), nota(id), cumplimiento(id)' required='required'></td>";
		newRow+="<td style='width: 10%;'><input type='text' name='notaSelect"+rowCount+"' id='notaSelect"+rowCount+"' required='required' readonly='readonly'></td>";
		newRow+="<td style='width: 10%;'><label>100%</label></td></tr>";
		$("#"+tableID).append(newRow);
		document.getElementById("rowTotal").value=rowCount;
		
}


function soloNumeros(e){
		var tecla = (document.all) ? e.keyCode : e.which;	
		if (tecla==8 || tecla==127 || tecla==9|| tecla==0) return true; //Tecla de retroceso (para poder borrar)
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

function validPerson(id){
var valor=document.getElementById(id).value;

if(valor!=''&&valor=='Si'){
	$('#comp-person').children().find('input,select').each(function(){
		   $(this).prop('disabled', false);
		});
}else
	if(valor!=''&&valor=='No'){
			$('#comp-person').children().find('input,select').each(function(){
				   $(this).prop('disabled', true);
				   $(this).val('');
				});
}
comportamiento();
}

 </script>