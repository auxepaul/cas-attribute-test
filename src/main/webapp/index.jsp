
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.jasig.cas.client.authentication.AttributePrincipal" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAS Attribute Test</title>
    </head>
    <body>
 
    <h1>CAS Attribute Test</h1>
    <p>User Id: <%= request.getRemoteUser() %></p>
<%
    if (request.getUserPrincipal() != null) {
      AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
      
      Map attributes = principal.getAttributes();
      
      if (attributes != null) {
        Iterator attributeNames = attributes.keySet().iterator();
         
        out.println("Received attributes: <b>" + (attributeNames.hasNext() ? "YES!" : "No") + "</b>");
        out.println("<hr><table border='3pt' width='100%'>");
        out.println("<th colspan='2'>Attributes</th>");
        out.println("<tr><td><b>Key</b></td><td><b>Value</b></td></tr>");

        for (; attributeNames.hasNext();) {
          out.println("<tr><td>");
          String attributeName = (String) attributeNames.next();
          out.println(attributeName);
          out.println("</td><td>");
          Object attributeValue = attributes.get(attributeName);
          out.println(attributeValue);
          out.println("</td></tr>");
        }
        out.println("</table>");
      } else {
        out.println("<pre>The attribute map is empty. Review your CAS filter configurations.</pre>");
      }
    } else {
        out.println("<pre>The user principal is empty from the request object. Review the wrapper filter configuration.</pre>");
    }
%>
    </body>
</html>
