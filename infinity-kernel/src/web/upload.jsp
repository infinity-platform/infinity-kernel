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
	UploadListener listener = new UploadListener(request, 30);
	// Create a factory for disk-based file items
	FileItemFactory factory = new MonitoredDiskFileItemFactory(listener);
	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	try {
		NodeAgent nodeAgent = (NodeAgent) getServletContext().getAttribute("nodeAgent");
		String moduleDir = nodeAgent.getModuleDirectory();
		try {
			// process uploads ..
			List files = upload.parseRequest(request);
			for (Iterator i = files.iterator(); i.hasNext();) {
				FileItem fi = (FileItem) i.next();
				String fieldName = fi.getFieldName();
				File mnmFile = null;
				try {
					mnmFile = File.createTempFile(fieldName, ".mnm.tmp");
					fi.write(mnmFile);
					Deployer deployer = Deployer.getInstance(moduleDir);
					String mnmFileName = mnmFile.getAbsolutePath();
					deployer.deploy(mnmFileName);
				} finally {
					if (mnmFile != null)
						mnmFile.delete();
					fi.delete();
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
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