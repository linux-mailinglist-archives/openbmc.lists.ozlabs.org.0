Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B209F67372
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 18:38:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lds909L1zDr1D
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 02:38:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ldrR36t7zDqxc
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 02:37:39 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CGbQSm085690
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 12:37:37 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tpucd6u3n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 12:37:36 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Fri, 12 Jul 2019 17:37:35 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Jul 2019 17:37:32 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6CGbV2b39846342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 16:37:31 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2C0DB205F;
 Fri, 12 Jul 2019 16:37:31 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 726D0B2066;
 Fri, 12 Jul 2019 16:37:31 +0000 (GMT)
Received: from [9.10.99.12] (unknown [9.10.99.12])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jul 2019 16:37:31 +0000 (GMT)
Subject: Re: Platform telemetry and health monitoring
To: Neeraj Ladkani <neladk@microsoft.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <742cb5ad955a42518e15c0c68ed06f94@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191A26EB5622A8095101263C8E30@BYAPR21MB1191.namprd21.prod.outlook.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Fri, 12 Jul 2019 11:37:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <BYAPR21MB1191A26EB5622A8095101263C8E30@BYAPR21MB1191.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071216-0060-0000-0000-0000035DCB8C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011415; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231174; UDB=6.00648546; IPR=6.01012458; 
 MB=3.00027693; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-12 16:37:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071216-0061-0000-0000-00004A1D3D8B
Message-Id: <94ec9dd5-c0fa-580c-d121-0cb280feddee@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907120171
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

There are a proposed design and associated dbus interfaces for power 
metrics in gerrit that I'd like to receive any feedback that anyone may 
have. Interfaces were created for providing average and maximum power 
consumed metrics over a configurable duration of time. These were 
intended to be flexible in providing these metrics to the end user thru 
any protocol able to access the dbus properties calculated by a BMC side 
application.

Design: https://gerrit.openbmc-project.xyz/23493

Dbus Intefaces: https://gerrit.openbmc-project.xyz/23405

Matt

On 6/25/19 2:43 AM, Neeraj Ladkani wrote:
> This is good stuff Paul. Thank you for detailed explanation in today's call. if you can share the Mock up, it would be great.
> 
> I'll share notes soon.
> 
> Neeraj
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> On Behalf Of Paul.Vancil@dell.com
> Sent: Monday, June 24, 2019 12:34 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: Platform telemetry and health monitoring
> 
> Re Redfish support for Telemetry,
> Deepak noted that Redfish had a Telemetry schema that is a work-in-progress (wip).
> Actually, Redfish Telemetry was release as part of the 2018.2 release in August 2018, and is being implemented by some BMCs now.
> See:  https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dmtf.org%2Fcontent%2Fnew-redfish-release-adds-openapi-30-support-telemetry&amp;data=02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f921c441%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;sdata=2U11E0iOrhnRGxl8FgmBrjyaPzHKbWajeT509U5tmXw%3D&amp;reserved=0
> And  https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dmtf.org%2Fsites%2Fdefault%2Ffiles%2FRedfish_2018_Release_2_Overview.pdf&amp;data=02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f921c441%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;sdata=%2B4JjaeCJ870NOUS%2F7%2FhKSu6TFeexSayU45N08YYj0dM%3D&amp;reserved=0    (slides 2, 7 )
> The White Paper Deepak referred to was released as a wip earlier in the year.   It was not updated but is accurate as a general overview.
> There is a public-telemetry-mockup that is nice for understanding the model, but not yet published.   We could push them to do that soon.
> In Redfish, there are:
>     --MetricDefinitions -- that define a metric property (eg minimumConsumedWatts being the min of power consumption over an interval)
>     --MetricReportDefinitions -- define a metric report consisting of a set of MetricProperties, what triggers the generation of the report (eg scheduled, on trigger...), and how to send the report (log to metricReports Collection, send RedfishEvent, etc)
>     --MetricReports -- the report --which can is logged or sent as an event
>     --MetricTriggers -- defines triggers can can trigger a metric report creation eg a sensor crossing a threshold etc
> 
> Metric data can be collected by the BMC, and then read by a client with Redfish GET requests, or can be sent autonomously as RedfishEvents.
> 
> The data is JSON encoded and formatted along the lines of Redfish responses, but the reports generally only contains the relevant telemetry data (with minimal describing metadata) since the descriptive metadata is all defined by the MetricReportDefinitions and MetricDefinitions that are associated with the report.
>   
> The Redfish Telemetry model is very general in nature I think--and thus supports about any type of metric or telemetry data one might want.
> So this is worth a strong consideration as the basis for OpenBMC telemetry.
> 
> Note that the model does support allowing users to define metric reports (based on supported Redfish properties), however it does not require allowing users to define custom reports (which could be complicated to implement).
> I think most early implementations will support some set of pre-defined MetricReportDefinitions.
> However the DMTF has not officially published any 'standard' Report Definitions.
> 
> Thanks,  Paul Vancil   --Dell ESI
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Thu, 20 Jun 2019 14:54:35 +0530
> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
> To: Neeraj Ladkani <neladk@microsoft.com>, OpenBMC Maillist
> 	<openbmc@lists.ozlabs.org>
> Subject: Re: Platform telemetry and health monitoring
> Message-ID: <582a29cf-e3bf-f7d3-2e78-c743c3a6a2d2@linux.vnet.ibm.com>
> Content-Type: text/plain; charset=utf-8; format=flowed
> 
> On 19/06/19 11:11 AM, Neeraj Ladkani wrote:
>> In last meeting, we discussed that telemetry data can be collected
>> using ?tools? and exported using binary ?blobs?,
>>
>> Should we define a standard data format so that information can be parsed through standard mechanism and help taking specific actions.
>>
>> Host CPU
>> Memory
>> Network Adapter
>> GPUs/IPUs
>> BMCs
>>
> 
> Redfish has a work-in-progress [1] Telemetry schema, and I believe via this schema, one can pull out telemetry information, as well as have the BMC push out Telemetry information via server-sent events. Are you looking at this as an option?
> 
> [1]
> https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dmtf.org%2Fdocuments%2Fredfish-spmf%2Fredfish-telemetry-white-paper-010a&amp;data=02%7C01%7Cneladk%40microsoft.com%7Ca3197c4ea71c426c110f08d6f921c441%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C1%7C636970320773102040&amp;sdata=YhukH6juS%2FbWyFd7PngBHmbHwsY98%2FEVe2zYuYb2d%2Fs%3D&amp;reserved=0
> 
> Regards,
> Deepak
> 
>> Thanks
>> Neeraj
> 
> 

