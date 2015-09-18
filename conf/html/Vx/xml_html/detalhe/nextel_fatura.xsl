<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
              version="4.01" 
              doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
              encoding="ISO-8859-1" 
              omit-xml-declaration="no" 
              indent="no" 
              media-type="text/html"/>
                      <!-- <xsl:if test="CALLS/HOME/@DNF!='0:00' or CALLS/ROAMING/@DNF!='0:00' or CALLS/HOME/@V!='0,00' or CALLS/ROAMING/@V!='0,00' or @PP='Y' or CALLS/IDCD/@V!='0,00'"> -->
                       <xsl:if test="(CALLS/HOME/@DNF!='0:00' and CALLS/HOME/@DNF!='0,00') or (CALLS/ROAMING/@DNF!='0:00' and CALLS/ROAMING/@DNF!='0,00') or CALLS/HOME/@V!='0,00' or CALLS/ROAMING/@V!='0,00' or @PP='Y' or CALLS/IDCD/@V!='0,00'">                      
                                    
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <xsl:call-template name="DETALHE-CONTA-SRV"/>
                                            <tr>
                                                <td width="3%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="7%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="7%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="15%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="14%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="15%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="14%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="11%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                            </tr>
                                        </table>
                                        
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <xsl:call-template name="DETALHE-CONTA-ONLINE"/>
                                            <tr>
                                                <td width="3%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="7%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="7%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="15%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="14%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="15%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="14%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="2%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                                <td width="11%" class="text5" height="20">
                                                    &#160;
                                                </td>
                                            </tr>
                                        </table>
                                        
                                            
                                            <xsl:call-template name="DETALHE-CONTA"/>

    <xsl:include href="nextel_detalhe_fatura.xsl"/>