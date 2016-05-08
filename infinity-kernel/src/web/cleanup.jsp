<%@ page
	import="com.iisigroup.infinity.kernel.nodeagent.deployer.MonitoredDiskFileItemFactory"%>
<%@ page import="com.iisigroup.infinity.kernel.nodeagent.deployer.UploadListener"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iisigroup.infinity.kernel.nodeagent.NodeAgent"%>
<%@ page import="com.iisigroup.infinity.kernel.nodeagent.deployer.Deployer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%--
/* Licence:
*   Use this however/wherever you like, just don't blame me if it breaks anything.
*
* Credit:
*   If you're nice, you'll leave this bit:
*
*   Class by Pierre-Alexandre Losson -- http://www.telio.be/blog
*   email : plosson@users.sourceforge.net
*/
--%>
<%
	try {
		String moduleXmlFileName = request.getParameter("moduleXml");
		NodeAgent nodeAgent = (NodeAgent) getServletContext().getAttribute("nodeAgent");
		String moduleDir = nodeAgent.getModuleDirectory();
		Deployer deployer = Deployer.getInstance(moduleDir);
		deployer.undeploy(moduleXmlFileName);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>Done</title>
</head>
<body>
Done
</body>
</html>