using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace adminpanel.Controllers
{
    public class UploadController : ApiController
    {
        public async Task<HttpResponseMessage> PostFormData()
        {
            if (!Request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            string root = HttpContext.Current.Server.MapPath("~/App_Data");
            var provider = new MultipartFormDataStreamProvider(root);

            try
            {
                await Request.Content.ReadAsMultipartAsync(provider);

                //CloudStorageAccount storageAccount;
                //CloudBlobClient blobClient;
                //CloudBlobContainer container;

                //storageAccount = CloudStorageAccount.Parse(ConfigurationManager.AppSettings.Get("StorageConnectionString"));

                //blobClient = storageAccount.CreateCloudBlobClient();

                //container = blobClient.GetContainerReference("ubiety");
                //container.CreateIfNotExists();

                //container.SetPermissions(new BlobContainerPermissions
                //{
                //    PublicAccess = BlobContainerPublicAccessType.Blob
                //});

                //CloudBlockBlob blockBlob = container.GetBlockBlobReference("1" + "/profilepic");
                //blockBlob.UploadFromStream(Request.Files[0].InputStream);

                //using (var fileStream = System.IO.File.OpenRead(@"path\myfile"))
                //{
                //    blockBlob.UploadFromStream(fileStream);
                //}

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (System.Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e);
            }
        }
    }
}
