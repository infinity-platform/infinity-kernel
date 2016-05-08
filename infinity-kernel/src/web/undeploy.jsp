<%@ page
	import="com.iisigroup.infinity.kernel.nodeagent.deployer.MonitoredDiskFileItemFactory"%>
<%@ page import="com.iisigroup.infinity.kernel.nodeagent.deployer.UploadListener"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FilenameFilter"%>
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
<html>
<head>
<title>Undeploy</title>
</head>
<body>
<p>
	<h1>NodeAgent Web Deployment Utility</h1>
</p>
<p>
	Modules to undeploy:<br>
<%
	try {
		NodeAgent nodeAgent = (NodeAgent) getServletContext().getAttribute("nodeAgent");
		String moduleDir = nodeAgent.getModuleDirectory();
		Deployer deployer = Deployer.getInstance(moduleDir);
		File[] modules = deployer.listModules();
		if(modules!=null) {
			for(int i=0; i<modules.length; i++) {
				File contextPath = deployer.findContextPathInXml(modules[i]);
%>
				<a href="cleanup.jsp?moduleXml=<%=modules[i].getName() %>"><%= modules[i].getName()+"("+contextPath.getAbsolutePath()+")" %></a><br>
<%
			}
		} else {
			out.println("No MNM modules found.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</p>
</body>
</html>