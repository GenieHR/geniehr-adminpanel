using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace adminpanel
{

    public class hn_SimpeFileUploader : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
            string str_image = "";
            string empId = HttpContext.Current.Session["EmpId"].ToString();
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            string doctype = context.Request.Params["doctype"];
            string docname = context.Request.Params["docname"];

            if (string.Compare(doctype, "profile", true) == 0)
            { 
                HttpPostedFile file = context.Request.Files[0];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    CloudBlobContainer container = blobClient.GetContainerReference("profile");
                    container.CreateIfNotExists();

                    container.SetPermissions(new BlobContainerPermissions
                    {
                        PublicAccess = BlobContainerPublicAccessType.Blob
                    });

                    CloudBlockBlob blockBlob = container.GetBlockBlobReference(empId);

                    blockBlob.UploadFromStream(context.Request.Files[0].InputStream);
                    }
                }

                else
                {
                    foreach (string s in context.Request.Files)
                    {
                        HttpPostedFile file = context.Request.Files[s];
                        string fileName = file.FileName;
                        string fileExtension = file.FileName.Split('.')[file.FileName.Split('.').Length - 1];

                        //string fileExtension = file.ContentType;
                        
                        if (!string.IsNullOrEmpty(fileName))
                        {
                            CloudBlobContainer container = blobClient.GetContainerReference("identity");
                            container.CreateIfNotExists();

                            container.SetPermissions(new BlobContainerPermissions
                            {
                                PublicAccess = BlobContainerPublicAccessType.Blob
                            });

                            CloudBlockBlob blockBlob = container.GetBlockBlobReference(empId.ToString() + "/" + doctype + "/" + docname + "." + fileExtension);

                            blockBlob.UploadFromStream(context.Request.Files[s].InputStream);
                        }
                    }
                }
                context.Response.Write(str_image);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}