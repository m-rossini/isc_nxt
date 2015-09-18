<?xml version="1.0" encoding="ISO-8859-1"?>
	<xsl:template name="DETALHE-CONTA-SRV">
        <!-- Servi�os Adicionais / Servi�os de Terceiros. S� mostra se houver algum -->	
        <xsl:if test="CALLS/IDCD/@V!='0,00'">
            <!-- Chamadas de r�dio internacionais utilizando o servi�o CDI Di�rio -->        
            <xsl:text>SERVI�OS ADICIONAIS</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>
            
            <xsl:call-template name="CHAMADAS-SRV">
                <xsl:with-param name="title">Conex�o Direta Internacional - Di�rio</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/IDCD/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/IDCD"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>
        </xsl:if> 
	</xsl:template>
	
    <!-- ********************************* -->    
	<!-- NEXTEL ONLINE (SERVI�OS DE DADOS) -->
    <!-- ********************************* -->
	<xsl:template name="DETALHE-CONTA-ONLINE">
            <!-- Servi�os Adicionais / Servi�os de Terceiros. S� mostra se houver algum -->
            <!--  <xsl:if test="CALLS/ONLINE/SVC/@ID='LOLGT' or CALLS/ONLINE/SVC/@ID='SMSSI'"> -->
            <xsl:if test="CALLS/ONLINE/SVC/@ID='LOLGT'">
                <xsl:text>NEXTEL ONLINE (SERVI�OS DE DADOS)</xsl:text>
            	<xsl:text>&#13;&#10;</xsl:text>
            	                
                <!-- Localizador Di�rio -->  
	            <xsl:if test="CALLS/ONLINE/SVC/@ID='LOLGT'">                              
	                <xsl:call-template name="CHAMADAS-ONLINE">
	                    <xsl:with-param name="title" select="CALLS/ONLINE/SVC[@ID='LOLGT']/@DS" />
	                    <xsl:with-param name="calls" select="CALLS/ONLINE/SVC[@ID='LOLGT']/descendant::CALL"/>
	                    <xsl:with-param name="subtotals" select="CALLS/ONLINE/SVC[@ID='LOLGT']"/>
	                </xsl:call-template>
				</xsl:if>		                

                <!-- Servi�os Interativos - SMS - ->  
	            <xsl:if test="CALLS/ONLINE/SVC/@ID='SMSSI'">                              
	                <xsl:call-template name="CHAMADAS-SRVINT">
	                    <xsl:with-param name="title" select="CALLS/ONLINE/SVC[@ID='SMSSI']/@DS" />
	                    <xsl:with-param name="calls" select="CALLS/ONLINE/SVC[@ID='SMSSI']/descendant::CALL"/>
	                    <xsl:with-param name="subtotals" select="CALLS/ONLINE/SVC[@ID='SMSSI']"/>
	                </xsl:call-template>
				</xsl:if>	
                -->	                
				
            	<xsl:text>&#13;&#10;</xsl:text>                
			</xsl:if>		
	</xsl:template>	
	

    <xsl:template name="DETALHE-CONTA">

        <!-- Chamadas de telefonia dentro da �rea de registro. S� mostra se houver alguma -->
        <!-- <xsl:if test="CALLS/HOME/@DNF!='0,00' or (@PP='Y' and CALLS/HOME/@CH!='0,00')"> -->
        <xsl:if test="(CALLS/HOME/@DNF!='0:00' and CALLS/HOME/@DNF!='0,00') or (@PP='Y' and (CALLS/HOME/@CH!='0:00' and CALLS/HOME/@CH!='0,00'))">        

            <!-- Chamadas de telefonia dentro da �rea de registro -->
            <xsl:text>CHAMADAS DE TELEFONIA DENTRO DA �REA DE REGISTRO</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>
            
            <!-- Chamadas locais -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas Locais</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/OUTGOING/LOCAL/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/OUTGOING/LOCAL"/>
                <xsl:with-param name="col_5_value">Local</xsl:with-param>
                <xsl:with-param name="use_call_origin_city">FALSE</xsl:with-param>
                <xsl:with-param name="apply_mobile_check">TRUE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>


            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas de longa dist�ncia -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas de Longa Dist�ncia</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/OUTGOING/LONG_DISTANCE/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/OUTGOING/LONG_DISTANCE"/>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas locais recebidas -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas Recebidas</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/INCOMING/RECEIVED/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/INCOMING/RECEIVED"/>
                <xsl:with-param name="col_3_title">Origem</xsl:with-param>
                <xsl:with-param name="col_4_title">N� Chamador</xsl:with-param>
                <xsl:with-param name="col_5_value">Local</xsl:with-param>
                <xsl:with-param name="use_call_origin_city">FALSE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>
            
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas locais recebidas a cobrar -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas a Cobrar Recebidas</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/INCOMING/COLLECT/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/INCOMING/COLLECT"/>
                <xsl:with-param name="col_3_title">Origem</xsl:with-param>
                <xsl:with-param name="col_4_title">N� Chamador</xsl:with-param>
                <xsl:with-param name="col_5_value">Local</xsl:with-param>
                <xsl:with-param name="use_call_origin_city">FALSE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>
            
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas internacionais -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas Internacionais</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/OUTGOING/INTERNATIONAL/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/OUTGOING/INTERNATIONAL"/>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>
            
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Servi�o 0300 -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Servi�o 0300</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/OUTGOING/Z300/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/OUTGOING/Z300"/>
                <xsl:with-param name="col_3_title">Origem</xsl:with-param>
                <xsl:with-param name="use_call_origin_city">FALSE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>
            
            <xsl:text>&#13;&#10;</xsl:text>

        </xsl:if>
        <!-- Chamadas de telefonia fora da �rea de registro (roaming). S� mostra se houver alguma -->
        <!-- <xsl:if test="CALLS/ROAMING/@DNF!='0,00' or (@PP='Y' and CALLS/ROAMING/@CH!='0,00')"> -->
        <xsl:if test="(CALLS/ROAMING/@DNF!='0:00' and CALLS/ROAMING/@DNF!='0,00') or (@PP='Y' and (CALLS/ROAMING/@CH!='0:00' and CALLS/ROAMING/@CH!='0,00'))">                
            <!-- Chamadas de telefonia dentro da �rea de registro -->
            <xsl:text>CHAMADAS DE TELEFONIA FORA DA �REA DE REGISTRO (ROAMING)</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>


            <!-- Chamadas Originadas -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas Originadas</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/ROAMING/OUTGOING/*[local-name()!='Z300']/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/ROAMING/OUTGOING/NO_Z300_SUMMARY"/>
                <xsl:with-param name="col_3_title">Origem/Destino</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Servi�o 0300 -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Servi�o 0300</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/ROAMING/OUTGOING/Z300/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/ROAMING/OUTGOING/Z300"/>
                <xsl:with-param name="col_3_title">Origem</xsl:with-param>
                <xsl:with-param name="use_call_origin_city">FALSE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas Recebidas -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas Recebidas</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/ROAMING/INCOMING/RECEIVED/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/ROAMING/INCOMING/RECEIVED"/>
                <xsl:with-param name="col_3_title">�rea de Recebimento</xsl:with-param>
                <xsl:with-param name="use_dialed_number">FALSE</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas recebidas a cobrar em roaming -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Chamadas a Cobrar Recebidas</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/ROAMING/INCOMING/COLLECT/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/ROAMING/INCOMING/COLLECT"/>
                <xsl:with-param name="col_3_title">�rea de Recebimento</xsl:with-param>
                <xsl:with-param name="col_4_title">N� Chamador</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>

        </xsl:if>

		<!--Desconto dentro da �rea de registro-->
        <xsl:if test="number(translate(CALLS/HOME/INCOMING/DISCOUNTS/@CHT,',','.')) &gt; 0">

            <!-- Descontos de telefonia dentro da �rea de registro -->
            <xsl:text>DESCONTOS DENTRO DA �REA DE REGISTRO</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas descontos local -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Descontos de Chamadas Locais</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/HOME/INCOMING/DISCOUNTS/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/HOME/INCOMING/DISCOUNTS"/>
                <xsl:with-param name="desconto">TRUE</xsl:with-param>
                <xsl:with-param name="col_3_title">�rea de Recebimento</xsl:with-param>
                <xsl:with-param name="col_4_title">N� Chamador</xsl:with-param>
                <xsl:with-param name="col_5_value">Desconto</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>

            <xsl:text>&#13;&#10;</xsl:text>
            
		</xsl:if>
		
		<!--Desconto fora da �rea de registro-->
        <xsl:if test="number(translate(CALLS/ROAMING/INCOMING/DISCOUNTS/@CHT,',','.')) &gt; 0">

            <!-- Descontos de telefonia fora da �rea de registro -->
            <xsl:text>DESCONTOS FORA DA �REA DE REGISTRO (ROAMING)</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Chamadas descontos em roaming -->
            <xsl:call-template name="CHAMADAS">
                <xsl:with-param name="title">Descontos de Chamadas em Roaming</xsl:with-param>
                <xsl:with-param name="calls" select="CALLS/ROAMING/INCOMING/DISCOUNTS/descendant::CALL"/>
                <xsl:with-param name="subtotals" select="CALLS/ROAMING/INCOMING/DISCOUNTS"/>
                <xsl:with-param name="desconto">TRUE</xsl:with-param>
                <xsl:with-param name="col_3_title">�rea de Recebimento</xsl:with-param>
                <xsl:with-param name="col_4_title">N� Chamador</xsl:with-param>
                <xsl:with-param name="col_5_value">Desconto</xsl:with-param>
                <xsl:with-param name="pre_paid" select="@PP"/>
            </xsl:call-template>
            <xsl:text>&#13;&#10;</xsl:text>
		</xsl:if>
    </xsl:template>


	<!-- =================================================================================================== -->

	
	<!-- ******************************************************************* -->
    <!-- * Mostra as chamadas de r�dio (servi�o CDI-Di�rio) detalhadamente * -->
    <!-- ******************************************************************* -->
    <xsl:template name="CHAMADAS-SRV">
        <!-- T�tulo da "tabela" -->
        <xsl:param name="title"/>
        <!-- Node-set de chamadas -->
        <xsl:param name="calls"/>    
        <!-- Elemento com os valores totalizados -->
        <xsl:param name="subtotals"/>        
		<!-- Indica se � CDI Di�rio -->
		<xsl:param name="is_idcd">Y</xsl:param>

        <!-- Se houverem chamadas ou for desconto -->
        <xsl:if test="($subtotals/@V!='0,00')">

            <!-- Primeira linha do cabe�alho -->
            <xsl:value-of select="$title"/>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Segunda linha do cabe�alho -->
            <xsl:text>Data</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Hora</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text></xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text></xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Min / Dur</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text></xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>VALOR R$</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Mostra cada chamada desse contrato -->
			<xsl:apply-templates select="$calls">
				<xsl:with-param name="is_idcd">
					<xsl:value-of select="$is_idcd"/>
				</xsl:with-param>                                                    
			</xsl:apply-templates>                    

            <!-- Subtotal -->
            <xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
            <xsl:text>Subtotal</xsl:text>
            <xsl:text>&#9;</xsl:text>

            <xsl:text>&#9;</xsl:text>

            <!-- Valor total de todas as chamadas -->
            <xsl:call-template name="VALOR-OU-ZERO">
                <xsl:with-param name="value">
                    <xsl:value-of select="$subtotals/@V"/>
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:if>

    </xsl:template>
    
    
    <!-- *********************************************************** -->
    <!-- * Mostra as chamadas de NEXTEL ONLINE (SERVI�OS DE DADOS) * -->
    <!-- *********************************************************** -->
    <xsl:template name="CHAMADAS-ONLINE">
        <!-- T�tulo da "tabela" -->
        <xsl:param name="title"/>
        <!-- Node-set de chamadas -->
        <xsl:param name="calls"/>    
        <!-- Elemento com os valores totalizados -->
        <xsl:param name="subtotals"/>        
		<!-- Indica se � CDI Di�rio -->
		<xsl:param name="is_idcd">N</xsl:param>

        <!-- Se houverem chamadas NEXTEL ONLINE-->
        <xsl:if test="($subtotals/@V!='0,00')">

            <!-- Primeira linha do cabe�alho -->
            <xsl:value-of select="$title"/>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Segunda linha do cabe�alho -->
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Data</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Hora</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>VALOR R$</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Mostra cada chamada desse contrato -->
 			<xsl:apply-templates select="$calls">
				<xsl:with-param name="is_idcd">
					<xsl:value-of select="$is_idcd"/>
				</xsl:with-param>      
				<xsl:with-param name="is_online">TRUE</xsl:with-param>
			</xsl:apply-templates>                    

            <!-- Subtotal -->
            <xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
            <xsl:text>Subtotal</xsl:text>
            <xsl:text>&#9;</xsl:text>

            <xsl:text>&#9;</xsl:text>

            <!-- Valor total de todas as chamadas -->
            <xsl:call-template name="VALOR-OU-ZERO">
                <xsl:with-param name="value">
                    <xsl:value-of select="$subtotals/@V"/>
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:if>

    </xsl:template>    
	
    <!-- ************************************************************** -->
    <!-- * Mostra as chamadas de NEXTEL ONLINE (SERVI�OS INTERATIVOS) * -->
    <!-- ************************************************************** -->
    <!-- Servi�os Interativos - SMS -->      
    <xsl:template name="CHAMADAS-SRVINT">
        <!-- T�tulo da "tabela" -->
        <xsl:param name="title"/>
        <!-- Node-set de chamadas -->
        <xsl:param name="calls"/>    
        <!-- Elemento com os valores totalizados -->
        <xsl:param name="subtotals"/>        

        <!-- Se houverem chamadas NEXTEL ONLINE-->
        <xsl:if test="($subtotals/@V!='0,00')">

            <!-- Primeira linha do cabe�alho -->
            <xsl:value-of select="$title"/>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Segunda linha do cabe�alho -->
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Data</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>Hora</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:text>VALOR R$</xsl:text>
            <xsl:text>&#13;&#10;</xsl:text>

            <!-- Mostra cada chamada desse contrato -->
 			<xsl:apply-templates select="$calls">
				<xsl:with-param name="is_servint">TRUE</xsl:with-param>
			</xsl:apply-templates>                    

            <!-- Subtotal -->
            <xsl:text>&#9;&#9;&#9;&#9;</xsl:text>
            <xsl:text>Subtotal</xsl:text>
            <xsl:text>&#9;</xsl:text>

            <xsl:text>&#9;</xsl:text>

            <!-- Valor total de todas as chamadas -->
            <xsl:call-template name="VALOR-OU-ZERO">
                <xsl:with-param name="value">
                    <xsl:value-of select="$subtotals/@V"/>
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:if>

    </xsl:template>    

    <!-- ************************************* -->
        <xsl:if test="(($subtotals/@DNF!='0:00' and $subtotals/@DNF!='0,00') or $desconto = 'TRUE') or ($pre_paid='Y' and ($subtotals/@CHA!='0:00' and $subtotals/@CHA!='0,00'))">

            <!-- Primeira linha do cabe�alho -->
                </xsl:with-param>
		<xsl:param name="is_idcd"/>
		<xsl:param name="is_online"/>
        <!-- Servi�os Interativos - SMS -->  		
		<xsl:param name="is_servint"/>		
		
        <!-- ******************************* --> 
        <!-- * Special Number Verification * --> 
        <!-- ******************************* --> 
        <xsl:variable name="callNumber" select="@N"/>
		<xsl:variable name="originalNumber" select="document('../SpecialCallNumber.xml')/document/number[contains($callNumber,@originalNumber)]/@originalNumber"/>        
	    <xsl:variable name="showNumberTemp" select="document('../SpecialCallNumber.xml')/document/number[contains($callNumber,@originalNumber)]/@showNumber"/>
	    <xsl:variable name="showNumber" select="concat(substring-before($callNumber,$originalNumber),$showNumberTemp)"/>		
		

        
          <xsl:choose>
        	<xsl:when test="$is_online='TRUE'">
        	
	            <!-- Data da chamada -->
				<xsl:text>&#9;</xsl:text>	            
				<xsl:text>&#9;</xsl:text>
				<xsl:text>&#9;</xsl:text>								
	            <xsl:value-of select="@DT"/>
	            <xsl:text>&#9;</xsl:text>
	            <!-- Horario da chamada -->
	            <xsl:value-of select="@TM"/>
	            <xsl:text>&#9;</xsl:text>
	            <xsl:text>&#9;</xsl:text>	            
	            <!-- Valor da chamada -->
	            <xsl:call-template name="VALOR-OU-ZERO">
	                <xsl:with-param name="value">
	                    <xsl:value-of select="@V"/>
	                </xsl:with-param>
	            </xsl:call-template>
	            <xsl:text>&#13;&#10;</xsl:text>        	
        	
        	</xsl:when>

            <!-- Servi�os Interativos - SMS -->          	
        	<xsl:when test="$is_servint='TRUE'">        	
	            <!-- Data da chamada -->
				<xsl:text>&#9;</xsl:text>	            
	            <xsl:value-of select="@DS"/>
				<xsl:text>&#9;</xsl:text>								
	            <xsl:value-of select="@DT"/>
	            <xsl:text>&#9;</xsl:text>
	            <!-- Horario da chamada -->
	            <xsl:value-of select="@TM"/>
	            <xsl:text>&#9;</xsl:text>
	            <xsl:text>&#9;</xsl:text>	            
	            <!-- Valor da chamada -->
	            <xsl:call-template name="VALOR-OU-ZERO">
	                <xsl:with-param name="value">
	                    <xsl:value-of select="@V"/>
	                </xsl:with-param>
	            </xsl:call-template>
	            <xsl:text>&#13;&#10;</xsl:text>        	        	
        	</xsl:when>
        	
        	<xsl:otherwise>
	                	<xsl:when test="string-length($showNumber) &gt; 0">
	                       	<xsl:value-of select="$showNumber"/>                	
	                	</xsl:when>
	                	<xsl:otherwise>
	                       <xsl:value-of select="@N"/>
	                	</xsl:otherwise>
	                </xsl:choose>					
	            </xsl:if>
	              	<xsl:when test="$is_idcd='Y'">
	                    <xsl:text>Ilimitado no dia</xsl:text>                        		
	              	</xsl:when>            
	           	<xsl:if test="$is_idcd!='Y'">            
		        </xsl:if>
	            
			</xsl:otherwise>    
          </xsl:choose>     