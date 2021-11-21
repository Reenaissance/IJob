package com.ssm.ijob.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;


/**
 * @author Renassiance
 * @date 2021/11/15 13:29
 */

@WebServlet("/uploadServlet")
public class uploadServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FileItemFactory factory = new DiskFileItemFactory();

        // 创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 开始解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        // 对所有请求信息进行判断
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            // 信息为普通的格式
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString();
                request.setAttribute(fieldName, value);
            }
            // 信息为文件格式
            else {
                String fileName = item.getName();
                System.out.println(fileName);
                int index = fileName.lastIndexOf("\\");
                if (index != -1) {
                    fileName = fileName.substring(index + 1);
                }

                //校验文件的扩展名
                if (!fileName.toLowerCase().endsWith(".png")) {        //将大写转换成小写进行比较
                    error("上传的图片扩展名必须是PNG", request, response);
                    return;
                }
//                 ServletRequest servletRequest;
                String courseName = (String)request.getSession().getAttribute("courseName");
//                System.out.println(courseName);
                String newName = courseName+".png";
//                System.out.println(newName);
                request.setAttribute("realFileName",newName);
                //D:\IdeaProjects\IJob\out\artifacts\IJob_Web_exploded\images
                String basePath = request.getSession().getServletContext().getRealPath("/") + "/images";
                File file = new File(basePath, newName);
                try {
                    item.write(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("msg", "文件上传成功!");
            getServletContext().getRequestDispatcher("/admin/allCourse").forward(request, response);
        }
    }
    private void error(String msg, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("/admin/addCourse").forward(request, response);
    }

}
