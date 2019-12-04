Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D935112CA4
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 14:31:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SfrV0SBHzDq7h
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 00:31:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sfmg169FzDqWy
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 00:28:02 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4DRiOG017067; Wed, 4 Dec 2019 08:27:58 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnqn5kdu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 08:27:57 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB4DKNJI025234;
 Wed, 4 Dec 2019 13:28:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 2wkg26dg6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 13:28:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4DRtJc46268860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 13:27:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33B11AE05F;
 Wed,  4 Dec 2019 13:27:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C028AAE05C;
 Wed,  4 Dec 2019 13:27:54 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.41.74.115])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 13:27:54 +0000 (GMT)
Subject: Re: [EXTERNAL] Telemetry Reports dynamic update
To: Neeraj Ladkani <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 vishwa <vishwa@linux.vnet.ibm.com>
References: <da4d443c-e7e1-6980-af49-15d05360feff@linux.vnet.ibm.com>
 <DM6PR21MB1388E6CEF6424B616C7C7B1DC85D0@DM6PR21MB1388.namprd21.prod.outlook.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <df5cf925-4999-18ab-8b6f-dfe7a9c38fff@linux.vnet.ibm.com>
Date: Wed, 4 Dec 2019 07:27:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <DM6PR21MB1388E6CEF6424B616C7C7B1DC85D0@DM6PR21MB1388.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912040110
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



On 12/4/19 12:43 AM, Neeraj Ladkani wrote:
> We don’t have telemetryservice in BMC currently so are you currently doing it using webui? Or you have written a app using redfish APIs?  I asked similar question in last week work group meeting. I think it will be useful to have ability to add new report definitions.
I have an app that uses the current websocket implementation on openBMC 
and have been reviewing the needs for transitioning the app to redfish 
when the time comes. One limitation of those is not being able to update 
the active subscription without tearing it down and starting it again, 
resulting in a few seconds of missed readings.

Being able to update the content of the subscription on the fly would be 
a huge value add I think.
> 
> -----Original Message-----
> From: Justin Thaler <thalerj@linux.vnet.ibm.com>
> Sent: Tuesday, December 3, 2019 3:57 PM
> To: openbmc@lists.ozlabs.org; Matuszczak, Piotr <piotr.matuszczak@intel.com>; vishwa <vishwa@linux.vnet.ibm.com>; Neeraj Ladkani <neladk@microsoft.com>
> Subject: [EXTERNAL] Telemetry Reports dynamic update
> 
> Hi All,
> 	I've been sort of silently reviewing the designs to telemetry reports design along with subscriptions. As I was reviewing it, I've had a couple of different design points come up and an interesting use case I've wanted to ask about. So here's my scenario:
> 
> I've set up a telemetry report to the system dynamically by querying the sensors and request the values are updated every second. The system was in a state where it was powered off, so not many sensors were available.
> After the system is powered on, more sensors are added as different devices are powered up. At this point I'd want to add the additional sensors to my report. I query the system again for all the available sensors and see thermal and power readings for the CPUs. I want updates on these every second just like my initial report.
> 
> This leads me to the following question:
> Can I push a new report definition to the TelemetryService and have the event service start providing that new definition without tearing down the subscription first, which would leave a gap in the data?
> 
> Thanks,
> Justin Thaler
> 
