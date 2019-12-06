Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32911567F
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 18:28:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V01P53swzDqgn
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 04:28:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V00c08mTzDqg1
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 04:27:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6HR98d183861; Fri, 6 Dec 2019 12:27:55 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq905u6f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 12:27:53 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB6HP21E021792;
 Fri, 6 Dec 2019 17:27:52 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 2wkg281jdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 17:27:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6HRqUa50463088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 17:27:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB1CBB205F;
 Fri,  6 Dec 2019 17:27:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3997B2064;
 Fri,  6 Dec 2019 17:27:51 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.85.155.42])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 17:27:51 +0000 (GMT)
Subject: Re: [EXTERNAL] Telemetry Reports dynamic update
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Neeraj Ladkani <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 vishwa <vishwa@linux.vnet.ibm.com>
References: <da4d443c-e7e1-6980-af49-15d05360feff@linux.vnet.ibm.com>
 <DM6PR21MB1388E6CEF6424B616C7C7B1DC85D0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <df5cf925-4999-18ab-8b6f-dfe7a9c38fff@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A310AA67@IRSMSX101.ger.corp.intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <665d8a28-6f02-b88a-2a11-377285ab881b@linux.vnet.ibm.com>
Date: Fri, 6 Dec 2019 11:27:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A310AA67@IRSMSX101.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_05:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912060145
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

Hi Piotr,
	Agreed, this type of thing, OOB Telemetry, in the industry is 
relatively new and we've seen a lot of interest in it, with some pretty 
wide varying use cases. I brought up this particular case as we had the 
same behavior on the legacy rest API where the sensors were dynamically 
added and removed, so any listening software had to actively track that 
list. It really boiled down to knowing when the sensors list would be 
updated, and keying a rescan at that point in time. The trouble I ran 
into is it required a resubscribe to change the sensor list and would 
lead into data gaps during the boot cycle. Workaround of course can be 
made for this but do result in some extra BMC loads.

I think if we had a way to get the event service of redfish to see a 
telemetry report was changed, and begin pushing the new results of that 
report, it would go a long way to solving this issue.This option is 
however limited by the external application having to monitor for those 
state changes, then querying for all the sensors, and pushing a new 
report. This could result in a delay causing some initial readings to be 
missed.

The other alternative you hinted at for the sensors would be to have an 
"all" option on the TelemetryReport, that then causes the 
TelemetryService to track the new sensors getting added to the redfish 
API. The report appears to be updated dynamically, with the new sensor 
adds, with no work needed by an external application. This may be the 
more favorable and hardware agnostic approach, but is definitely more 
work from a BMC perspective.

Thanks,
Justin Thaler

On 12/6/19 10:04 AM, Matuszczak, Piotr wrote:
> Hi Justin,
> 
> You've raised an interesting topic. In current implementation, when OpenBMC boots when platform is in power off state, not all sensors are available, thus they won't appear in Redfish tree and you won't be able to configure metric report if you want to use these sensors. If BMC boots during the platform boot, all available sensors will be discovered and exposed in the Redfish tree. After this, when platform is powered off, the sensors, that are not available in this platform state shall be still available in the Redfish tree, but they won't provide valid readings. Unfortunately, such behavior is not standardized, thus if we want to be able to define metric reports when platform is powered off, we will have to make the required sensors behavior part of the design.
> 
> Regards
> Piotr
> 
> 
> -----Original Message-----
> From: Justin Thaler <thalerj@linux.vnet.ibm.com>
> Sent: Wednesday, December 4, 2019 2:28 PM
> To: Neeraj Ladkani <neladk@microsoft.com>; openbmc@lists.ozlabs.org; Matuszczak, Piotr <piotr.matuszczak@intel.com>; vishwa <vishwa@linux.vnet.ibm.com>
> Subject: Re: [EXTERNAL] Telemetry Reports dynamic update
> 
> 
> 
> On 12/4/19 12:43 AM, Neeraj Ladkani wrote:
>> We don’t have telemetryservice in BMC currently so are you currently doing it using webui? Or you have written a app using redfish APIs?  I asked similar question in last week work group meeting. I think it will be useful to have ability to add new report definitions.
> I have an app that uses the current websocket implementation on openBMC and have been reviewing the needs for transitioning the app to redfish when the time comes. One limitation of those is not being able to update the active subscription without tearing it down and starting it again, resulting in a few seconds of missed readings.
> 
> Being able to update the content of the subscription on the fly would be a huge value add I think.
>>
>> -----Original Message-----
>> From: Justin Thaler <thalerj@linux.vnet.ibm.com>
>> Sent: Tuesday, December 3, 2019 3:57 PM
>> To: openbmc@lists.ozlabs.org; Matuszczak, Piotr
>> <piotr.matuszczak@intel.com>; vishwa <vishwa@linux.vnet.ibm.com>;
>> Neeraj Ladkani <neladk@microsoft.com>
>> Subject: [EXTERNAL] Telemetry Reports dynamic update
>>
>> Hi All,
>> 	I've been sort of silently reviewing the designs to telemetry reports design along with subscriptions. As I was reviewing it, I've had a couple of different design points come up and an interesting use case I've wanted to ask about. So here's my scenario:
>>
>> I've set up a telemetry report to the system dynamically by querying the sensors and request the values are updated every second. The system was in a state where it was powered off, so not many sensors were available.
>> After the system is powered on, more sensors are added as different devices are powered up. At this point I'd want to add the additional sensors to my report. I query the system again for all the available sensors and see thermal and power readings for the CPUs. I want updates on these every second just like my initial report.
>>
>> This leads me to the following question:
>> Can I push a new report definition to the TelemetryService and have the event service start providing that new definition without tearing down the subscription first, which would leave a gap in the data?
>>
>> Thanks,
>> Justin Thaler
>>
