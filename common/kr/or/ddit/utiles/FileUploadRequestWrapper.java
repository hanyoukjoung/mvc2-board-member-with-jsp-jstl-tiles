package kr.or.ddit.utiles;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadRequestWrapper extends HttpServletRequestWrapper{
   private boolean multipartFlag = false;
   private Map<String, String[]> parameterMap;
   private Map<String, FileItem[]> fileitemMap;
   
   
   public FileUploadRequestWrapper(HttpServletRequest request) {
      this(request,-1,-1);
      
   }

   public FileUploadRequestWrapper(HttpServletRequest request, int thresold, int sizeMax){
      super(request);
      
      parsing(request, thresold,sizeMax);
   }

   private void parsing(HttpServletRequest request, int thresold, int sizeMax) {
      this.multipartFlag = ServletFileUpload.isMultipartContent(request);
      
      if(this.multipartFlag){
         this.parameterMap = new HashMap<String, String[]>();
         this.fileitemMap = new HashMap<String, FileItem[]>();
         
         DiskFileItemFactory factory = new DiskFileItemFactory();
         factory.setSizeThreshold(thresold);
         
         ServletFileUpload fileUploafServlet = new ServletFileUpload(factory);
         fileUploafServlet.setSizeMax(sizeMax);
         
         try {
            List<FileItem> items = fileUploafServlet.parseRequest(request);
            
            for(FileItem item : items){
               if(item.getSize() > 0){
                  String fieldName = item.getFieldName();
                  if(item.isFormField()){
                     String value = item.getString("UTF-8");
                     String[] values = this.parameterMap.get(fieldName);
                     if(values == null){
                        values = new String[]{value};
                     }else{
                        String[] temp = new String[values.length+1];
                        System.arraycopy(values, 0, temp, 0, values.length);
                        
                        temp[temp.length-1]= value;
                        
                        values = temp;
                     }
                     this.parameterMap.put(fieldName, values);
                     
                  }else{
                     FileItem[] values= this.fileitemMap.get(fieldName);
                     if(values == null){
                        values = new FileItem[]{item};
                        
                     }else{
                        FileItem[] temp = new FileItem[values.length+1];
                        System.arraycopy(values, 0, temp, 0, values.length);
                        
                        temp[temp.length-1]=item;
                        values=temp;
                     }
                     this.fileitemMap.put(fieldName,values);
                  }
               }
            }
         } catch (FileUploadException e) {
            e.printStackTrace();
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }
      }
   }

   @Override
   public String getParameter(String name) {
      if(this.multipartFlag){
         String[] values = this.parameterMap.get(name);
         if(values == null){
            return null;
         } else{
            return values[0];
         }
      }else{
         return super.getParameter(name);
      }
   }

   @Override
   public Map<String, String[]> getParameterMap() {
      if(this.multipartFlag){
         return this.parameterMap;
      }else{
         return super.getParameterMap();
      }
   }

   @Override
   public Enumeration<String> getParameterNames() {
      if(this.multipartFlag){
         return new Enumeration<String>() {
            Iterator<String> keys = parameterMap.keySet().iterator();

            @Override
            public boolean hasMoreElements() {
               return keys.hasNext();
            }

            @Override
            public String nextElement() {
               return keys.next();
            }
         };
      }else{
         return super.getParameterNames();
      }
   }

   @Override
   public String[] getParameterValues(String name) {
      if(this.multipartFlag){
         return this.parameterMap.get(name);
      }else{
         return super.getParameterValues(name);
      }
   }
   
   public FileItem getFileItem(String name){
      if(this.multipartFlag){
         FileItem[] items = this.fileitemMap.get(name);
         if(items == null){
            return null;
         }else{
            return items[0];
         }
      }else{
         return null;
      }
   }
   
   public FileItem[] getFileItemValues(String name){
      if(this.multipartFlag){
         return this.fileitemMap.get(name);
      }else{
         return null;
      }
   }
   public Map<String, FileItem[]> getFileItemMap(){
      if(this.multipartFlag){
         return this.fileitemMap;
      }else{
         return null;
      }
   }
   
}