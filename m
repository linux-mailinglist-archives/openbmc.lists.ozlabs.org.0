Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05D3B7FE9
	for <lists+openbmc@lfdr.de>; Wed, 30 Jun 2021 11:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFGD921qwz3bWq
	for <lists+openbmc@lfdr.de>; Wed, 30 Jun 2021 19:25:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=krzysztof.grobelny@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFGCw4r6qz2xYp
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jun 2021 19:25:31 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="229954218"
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="229954218"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 02:24:27 -0700
X-IronPort-AV: E=Sophos;i="5.83,311,1616482800"; d="scan'208";a="457146555"
Received: from kgrobeln-mobl.ger.corp.intel.com (HELO [10.213.11.200])
 ([10.213.11.200])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 02:24:26 -0700
Subject: Re: create telemetry metric report definition
To: openbmc@lists.ozlabs.org
References: <PS2PR02MB354169FE1A228DAB09D78A8B90039@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: "Grobelny, Krzysztof" <krzysztof.grobelny@linux.intel.com>
Message-ID: <c86a2844-c5a8-bff7-81ef-d6a09fe31e3a@linux.intel.com>
Date: Wed, 30 Jun 2021 11:24:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <PS2PR02MB354169FE1A228DAB09D78A8B90039@PS2PR02MB3541.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

About your dbus call it should look like this:
busctl call xyz.openbmc_project.Telemetry 
/xyz/openbmc_project/Telemetry/Reports 
xyz.openbmc_project.Telemetry.ReportManager AddReport 'ssbbta(osss)' 
'TelemetryService/ReportName' 'Periodic' true true 1000 1 
'/xyz/openbmc_project/sensors/current/HSC_IOUT' 'SINGLE' 'MetricName' 
'/redfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading'

You are missing method signature 'ssbbta(osss)'
You are missing number of elements in array a(osss)

About your post request it works for me:
curl --user root:root --insecure --location --request POST 
https://localhost:4443/redfish/v1/TelemetryService/MetricReportDefinitions 
-d 
'{"Id":"MyMetric","Metrics":[{"MetricId":"HSC_IOUT_reading","MetricProperties":["/redfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading"]}],"MetricReportDefinitionType":"Periodic","ReportActions":["RedfishEvent","LogToMetricReportsCollection"],"Schedule":{"RecurrenceInterval":"PT1S"}}'

Are you sure your curl params are ok? Can you perform post with for 
example invalid parameters to verify your request. You could change 
RecurrenceInterval to something not recongnized or Id to contain invalid 
characters like '@' and see if you get correct reponse from bmcweb.


BR, Krzysztof

On 2021-06-28 23:14, Mohammed.Habeeb ISV wrote:
> Hi
>
> How to create a telemetry metric report definition? I tried to set via dbus command as below, but got an error.
>   busctl call xyz.openbmc_project.Telemetry /xyz/openbmc_project/Telemetry/Reports xyz.openbmc_project.Telemetry.ReportManager AddReport MyMetric Periodic 1 1 1000 "/xyz/openbmc_project/sensors/current/HSC_IOUT" "SINGLE" 1 "/redfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading"
> Unknown signature type M.
>
> Tried to use redfish also, but got an internal service error. Please let me know if I miss anything here in both commands.
> habeeb@nsit-160:~/openbmc_nibu06$ curl -k -H "X-Auth-Token: $token" -X POST https://${bmc}/redfish/v1/TelemetryService/MetricReportDefinitions -d '{
>   "Id":"MyMetric",
>   "Metrics":[
> 	{
> 	 "MetricId": "HSC_IOUT_reading",
> 	 "MetricProperties":
>   ["/redfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading"]
>   	}
>   	],
>   "MetricReportDefinitionType": "Periodic",
>   "ReportActions": ["RedfishEvent", "LogToMetricReportsCollection"],
>   "Schedule": {
>   	"RecurrenceInterval": "PT1S"
>   	}
>   }'
>
> {
>    "error": {
>      "@Message.ExtendedInfo": [
>        {
>          "@odata.type": "#Message.v1_1_1.Message",
>          "Message": "The request failed due to an internal service error.  The service is still operational.",
>          "MessageArgs": [],
>          "MessageId": "Base.1.8.1.InternalError",
>          "MessageSeverity": "Critical",
>          "Resolution": "Resubmit the request.  If the problem persists, consider resetting the service."
>        }
>      ],
>      "code": "Base.1.8.1.InternalError",
>      "message": "The request failed due to an internal service error.  The service is still operational."
>    }
> }
> ---
> I see xyz.openbmc_project.Telemetry.ReportManager Interface is present.
> sysadmin@transformers:~# busctl tree --no-pager xyz.openbmc_project.Telemetry
> `-/xyz
>    `-/xyz/openbmc_project
>      `-/xyz/openbmc_project/Telemetry
>        `-/xyz/openbmc_project/Telemetry/Reports
>
> Regards
> Habeeb
