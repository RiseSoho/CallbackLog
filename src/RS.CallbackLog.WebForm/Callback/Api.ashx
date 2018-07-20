<%@ WebHandler Language="C#" Class="Api" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Microsoft.Owin;
using Newtonsoft.Json;
using NLog;
using Rbp.Json;

public class Api : IHttpHandler
{





    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        var log = LogManager.GetCurrentClassLogger();
        //logger.Info("Hello World");
        var sb = new StringBuilder();
        try
        {
            var rq = context.Request;
            var re = context.Response;

            //var qs = context.Request.QueryString?.ToJsonByJc();
            //var qf = context.Request.Form?.ToJsonByJc();
            //var qh = context.Request.Headers?.ToJsonByJc(new JsonSerializerSettings()
            //{
            //    PreserveReferencesHandling = PreserveReferencesHandling.Objects,
            //    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            //});
            //var rh = context.Response.Headers.ToJsonByJc();

            sb.AppendLine();
            sb.AppendLine("--------------------------------------------------------------------------------------------");
            sb.AppendLine("General");
            sb.AppendFormat($"   Request URL: {rq.Url}{Environment.NewLine}");
            sb.AppendFormat($"   Request Method: {rq.HttpMethod}{Environment.NewLine}");
            sb.AppendFormat($"   Status Code: {re.StatusCode}{Environment.NewLine}");
            sb.AppendFormat($"   Remote Address: {rq.UserHostAddress}{Environment.NewLine}");
            sb.AppendFormat($"   Referrer Policy?: {rq.UrlReferrer?.Scheme}{Environment.NewLine}");
            sb.AppendLine("--------------------------------------------------------------------------------------------");
            sb.AppendLine("Request Headers");
            foreach (string key in rq.Headers.Keys)
            {
                sb.AppendFormat($"   {key}: {rq.Headers[key]}{Environment.NewLine}");
            }
            sb.AppendLine("--------------------------------------------------------------------------------------------");
            sb.AppendLine("Response Headers");
            foreach (string key in re.Headers.Keys)
            {
                sb.AppendFormat($"   {key}: {rq.Headers[key]}{Environment.NewLine}");
            }
            var qs = rq.QueryString;
            if (qs.Count > 0)
            {
                sb.AppendLine("--------------------------------------------------------------------------------------------");
                sb.AppendLine("Request String Paramters");
                sb.AppendFormat($"  {string.Join("&", qs.AllKeys.Select(key => $"{key}={qs[key]}").ToArray())}");
                sb.AppendLine();
            }

            var qf = rq.Form;
            if (qf.Count > 0)
            {
                sb.AppendLine("--------------------------------------------------------------------------------------------");
                sb.AppendLine("Request Form Paramters");
                sb.AppendFormat($"  {string.Join("&", qf.AllKeys.Select(key => $"{key}={qf[key]}").ToArray())}");
                sb.AppendLine();
            }


            sb.AppendLine("--------------------------------------------------------------------------------------------");
            sb.AppendLine();
            sb.AppendLine();
            log.Info(sb.ToString);
        }
        catch (Exception e)
        {
            log.Error(e, sb.ToString);
            //Console.WriteLine(e);
            //throw;
        }


        context.Response.Write("OK");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}