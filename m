Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEAAE2421
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 22:14:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z1mn2SCQzDqR6
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 07:14:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z1m64CY7zDqQY
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 07:13:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9NK25GW058208; Wed, 23 Oct 2019 16:13:32 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vtuxtbkkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 16:13:31 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9NK4kpO022699;
 Wed, 23 Oct 2019 20:13:30 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2vqt47ng2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 20:13:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9NKDTKX12255620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 20:13:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523D7BE056;
 Wed, 23 Oct 2019 20:13:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF338BE051;
 Wed, 23 Oct 2019 20:13:28 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Oct 2019 20:13:28 +0000 (GMT)
Subject: Re: Fw: RE: Telemetry Streaming from OpenBMC
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
References: <OF14108F29.F96A2615-ON00258495.0040F63B-86258495.00411F29@notes.na.collabserv.com>
 <7f04cbd5-00ad-5b7e-9f90-5b15500d58ea@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F8FE5@IRSMSX101.ger.corp.intel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9022@IRSMSX101.ger.corp.intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <03d64d92-df4e-630a-2349-536e23f5aad8@linux.vnet.ibm.com>
Date: Wed, 23 Oct 2019 15:13:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9022@IRSMSX101.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910230185
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
Cc: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "viswha@linux.vnet.ibm.com" <viswha@linux.vnet.ibm.com>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
 "rosedahl@us.ibm.com" <rosedahl@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/23/19 4:14 AM, Matuszczak, Piotr wrote:
> One more thing that I missed earlier. If you set up metric report and SSE subscription as it is described below, you will receive server-sent events with metric report updates at defined interval (in your example it will be every 1 second).
> 
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+piotr.matuszczak=intel.com@lists.ozlabs.org] On Behalf Of Matuszczak, Piotr
> Sent: Wednesday, October 23, 2019 11:00 AM
> To: Justin Thaler <thalerj@linux.vnet.ibm.com>
> Cc: Paul.Vancil@dell.com; openbmc@lists.ozlabs.org; viswha@linux.vnet.ibm.com; neladk@microsoft.com; gmills@linux.vnet.ibm.com; vijaykhemka@fb.com; rosedahl@us.ibm.com
> Subject: RE: Fw: RE: Telemetry Streaming from OpenBMC
> 
>> 1. Create a metric report. This report should defined against the appropriate sensors, with a sample rate set to 1/s, and a duration of 1s?
> 
> Exactly. You just set the MetricReportDefinitionType to Periodic in the Metric Report Definition and proper RecurrenceInterval.
> 
>> 2. Push the telemetry report to the BMC using RedFish.
> 
> Metric Report will be generated by the Monitoring Service automatically, after its definition through the Redfish. If you want to push it out as a Redfish event you should set the ReportActions property in the Metric Report Definition to "RedfishEvent".
> 
>> 3. Create a new SSE subscription.
> 
> Yes, if you have metric report defined as above, you should be able to receive Redfish Events with metric reports as soon as this feature is implemented, because as far as I know, neither the Event Service and Telemetry Service is not implemented yet. Both designs are in review.
> 

Thanks Piotr, this is very useful!
Justin Thaler
> -----Original Message-----
> From: Justin Thaler [mailto:thalerj@linux.vnet.ibm.com]
> Sent: Tuesday, October 22, 2019 8:47 PM
> To: Matuszczak, Piotr <piotr.matuszczak@intel.com>
> Cc: kunyi@google.com; openbmc@lists.ozlabs.org; Paul.Vancil@dell.com; neladk@microsoft.com; gmills@linux.vnet.ibm.com; viswha@linux.vnet.ibm.com; rosedahl@us.ibm.com; vijaykhemka@fb.com
> Subject: Re: Fw: RE: Telemetry Streaming from OpenBMC
> 
> 
>> From:   "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
>> To:     'Justin Thaler' <thalerj@us.ibm.com>, "kunyi@google.com"
>> <kunyi@google.com>, "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
>> "OpenBMC Maillist" <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com"
>> <Paul.Vancil@dell.com>, "neladk@microsoft.com" <neladk@microsoft.com>,
>> "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>, vishwa
>> <vishwa@linux.vnet.ibm.com>
>> Cc:     Todd Rosedahl <rosedahl@us.ibm.com>
>> Date:   10/01/2019 11:10 AM
>> Subject:        [EXTERNAL] RE: Telemetry Streaming from OpenBMC
>>
>>
>>
>> Hi,
>>
>> Sorry for the late response. For now streaming shall be supported by
>> the Redfish telemetry service. Every metric report can be configured
>> to be pushed out as the redfish event. Currently this is work in progress.
> 
> Thanks for the response! I guess I'm still a bit confused about the telemetry service in general. If I wanted to get an update on all metric sensors at a rate of 1/s I think I should do the following at a high level.
> 
> 1. Create a metric report. This report should defined against the appropriate sensors, with a sample rate set to 1/s, and a duration of 1s?
> 
> 2. Push the telemetry report to the BMC using RedFish.
> 
> 3. Create a new SSE subscription.
> 
> This is at least my very rudimentary understanding on the subject. I was hoping someone could add some clarity here, more specifically, how do I get continual updates after setting up the subscription? I do apologize as this isn't very clear to me, even after reading over the telemetry reports, telemetry service documentation from the DMTF, and the direction of this workgroup. I would greatly appreciate any help I can get as well!
> 
> Thanks,
> Justin Thaler
> 
>> BR
>> Piotr Matuszczak
>>
>>
>> -----Original Message-----
>> From: openbmc
>> [mailto:openbmc-bounces+piotr.matuszczak=intel.com@lists.ozlabs.org]
>> On Behalf Of Justin Thaler
>> Sent: Thursday, September 19, 2019 8:19 PM
>> To: kunyi@google.com; vijaykhemka@fb.com; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>; Paul.Vancil@dell.com;
>> neladk@microsoft.com; gmills@linux.vnet.ibm.com; vishwa
>> <vishwa@linux.vnet.ibm.com>
>> Cc: Todd Rosedahl <rosedahl@us.ibm.com>
>> Subject: Telemetry Streaming from OpenBMC
>>
>> Hi All,
>>
>> I’m not sure if this should be a separate note or not. I've also not
>> been able to join this workgroup, however all of my concerns appear to
>> have been discussed. . I’ve started reviewing some of the telemetry
>> conversation for openbmc, and have taken some time review the wiki and
>> have also reviewed the document proposal. Based on my experience,
>> there’s two core use cases:
>> telemetry streams, and telemetry reports. The Reports are a collect
>> and analyze later method, typically used for system profiling, job
>> profiling, and analytics of data center usage over time.
>> For the streams, these are being used to allow the data center to
>> react to changes across the managed systems, like increasing water
>> flow, cooling capacity, or power throttling systems to prevent over
>> subscriptions on the data center’s power grid.
>>
>> I’d like to ask about the streams since the report portion of things
>> seems exceptionally well covered. With previous versions of openBMC I
>> was able to leverage websockets to get updates on sensor values on
>> change. This turned out to be pretty network efficient and is able to
>> drive 1/s updates on all the sensors in a system. It doesn’t have an
>> impact on other monitoring services either. That being said, I’ve been
>> reading through the redfish telemetry and eventing services and was
>> looking for some help and or guidance. For reference I was looking at
>> this document
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1
>> .6.0.p
>>
>> df
>> .
>>
>> If I do subscribe using SSE and telemetry reports, it seems to be
>> setup to get a full set of readings over time and only send when the
>> report is complete. Can I use these reports to get updates every
>> second? If I subscribe to an endpoint, I also seem to get the entire
>> endpoint and I’m not sure if this would meet a goal of getting the
>> large cluster (300
>> systems) worth of updates at a data rate of less than 20 Mb/s. I would
>> appreciate any advice on leveraging redfish standards to stream sensor
>> readings for an OpenBMC system. If I'm not able to use redfish, I'd be
>> happy to elaborate more on the websocket method I used with the
>> phosphor webserver and discuss options for the current/future BMC
>> versions leveraging bmcweb.
>>
>>
>> Thanks,
>> Justin Thaler
>> Senior RAS Engineer
>>
>>
>>
>>
