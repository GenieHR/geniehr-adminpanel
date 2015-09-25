using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Linq;


namespace UbietyDataServices.Models
{
    public class AttendanceLineDetail 
    {
        public DateTime? inMarkTime { get; set; }
        public Double? inLatitude { get; set; }
        public Double? inLongitude { get; set; }
        public int? inMarkCount { get;  set; }
        public DateTime? outMarkTime { get; set; }
        public Double? outLatitude { get; set; }
        public Double? outLongitude { get; set; }
        public int? outMarkCount { get; set; }

        public int? empId { get; set; }
        
        public String inCoordinates
        {
            get { return string.Format("{0},{1}", inLatitude, inLongitude); }
            set { int abc = 0; }
        }
        public String strInMarkTime
        {
            get { return string.Format("{0:00}:{1:00}", inMarkTime.Value.Hour, inMarkTime.Value.Minute); }
            set { int abc = 1; }
        }
        public String inImageURL
        {
            get { return string.Format("{4}/{0}/{1:00}/{2:00}/{3}", inMarkTime.Value.Year, inMarkTime.Value.Month, inMarkTime.Value.Day, inMarkCount, empId); }
            set { int abc = 2; }
        }

        public String strMarkDate
        {
            get { return string.Format(" {0:00}/{1:00}/{2}", inMarkTime.Value.Day, inMarkTime.Value.Month, inMarkTime.Value.Year); }
            set { int abc = 3; }
        }

        public String outCoordinates
        {
            get { return string.Format("{0},{1}", outLatitude, outLongitude); }
            set { int abc = 0; }
        }

        public String strOutMarkTime
        {
            get
            {
                if (outMarkTime.HasValue)
                {
                    return string.Format("{0:00}:{1:00}", outMarkTime.Value.Hour, outMarkTime.Value.Minute);
                }
                else
                {
                    return "";
                }
            }
            set { int abc = 1; }
        }
        public String outImageURL
        {
            get {
                if (outMarkTime.HasValue)
                {
                    return string.Format("{4}/{0}/{1:00}/{2:00}/{3}", outMarkTime.Value.Year, outMarkTime.Value.Month, outMarkTime.Value.Day, outMarkCount, empId);
                }
                else
                { return ""; }
            }
            set { int abc = 2; }
        }


        public String inLocName
        {
            get
            {
                String result = "";
                XmlDocument doc = new XmlDocument();
                doc = getXMLDoc(inCoordinates);
                var elmts = doc.GetElementsByTagName("formatted_address");
                if (elmts.Count > 0)
                {
                    result = elmts[0].InnerText; 
                }
                return result;
            }
            set { int abc = 1; }
        }

        public String outLocName
        {
            get
            {
                if (outCoordinates.Equals(","))
                {
                    return "";
                }
                String result = "Unable to Find Location";
                XmlDocument doc = new XmlDocument();
                doc = getXMLDoc(outCoordinates);
                var elmts = doc.GetElementsByTagName("formatted_address");
                if (elmts.Count > 0)
                {
                    result = elmts[0].InnerText; 
                }
                return result;
            }
            set { int abc = 1; }
        }

        private XmlDocument getXMLDoc(string coordinates)
        {
            string baseURL = "https://maps.googleapis.com/maps/api/geocode/xml?latlng=" + coordinates + "&&result_type=political&key=AIzaSyBSe3La3ozGtbqxZZ4Q2VS4yq9ok_sbuq8";

            HttpWebRequest req = WebRequest.Create(baseURL) as HttpWebRequest;

            XmlDocument xmlDoc = new XmlDocument();
            using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
            {
                xmlDoc.Load(resp.GetResponseStream());
            }
            return xmlDoc;
        }
    }
}
