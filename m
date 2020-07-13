Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0A21CFBA
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 08:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4v3Z6c1NzDq9C
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 16:33:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4v2p10sSzDqP4
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 16:32:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06D644S8119839; Mon, 13 Jul 2020 02:32:29 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3276afc6j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 02:32:28 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D6LP6F018660;
 Mon, 13 Jul 2020 06:32:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 327527svwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 06:32:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06D6V1cm13238724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 06:31:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259B342042;
 Mon, 13 Jul 2020 06:32:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 524A04203F;
 Mon, 13 Jul 2020 06:32:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.80.218])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 06:32:23 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
To: openbmc@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>,
 "Jason >> Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
 <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
 <6fc4c66e-4a0a-1c59-3f77-a6fcff29b97e@linux.intel.com>
 <ee2b81be-0aff-022f-e5a7-9f0f874c1f20@linux.vnet.ibm.com>
 <8e342c33-25c8-5586-cbd4-e8662fcac6b5@linux.intel.com>
 <5b2ab3f9-4e98-b9c3-128b-9eb161ea52f9@linux.vnet.ibm.com>
 <b62c0b2d-55fb-ffc7-5e29-2716f665f86d@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <09cf469e-ddc3-1206-efeb-54dd59a334d5@linux.vnet.ibm.com>
Date: Mon, 13 Jul 2020 12:02:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b62c0b2d-55fb-ffc7-5e29-2716f665f86d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_03:2020-07-10,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130046
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

Hi James,

As you asked for the examples in the 
thread(https://lists.ozlabs.org/pipermail/openbmc/2020-June/022125.html), 
I have created the mapping at the following location.

https://gist.github.com/ratagupt/0aa4da098a60d49af90a7e4a6ea6d5f2

1) Map1: Mapping between redfish resources to Dbus resources
2) Map2: Mapping between redfish resource types to the ineterested Dbus 
interfaces
3) Map3: Mapping between Dbus resources to redfish resources


I tried to cover the following scenario in the above mapping.

* Redfish resource is mapped to multiple Dbus Resources
* Redfish Property is mapped to single Dbus property
* Redfish Property(complex property) is mapped to multiple dbus property.
* Same type of Redfish Resources are mapped to different Dbus Resources
* Redfish node url having multiple regex : Yet to take a look on this.


Flow would be like as below

=> In bmcweb each Redfish node represents to a Redfish Resource.
=> Each node will be having it's own mapping between Redfish properties 
and the Dbus Resources.

=> Some code on bmcweb will walkthrough on each node during startup , 
get this mapping from each node and generate
    two mappings
    1) Reverse mapping (Dbus Resource to Redfish Resource)(MAP3) and
    2) mapping between Resource Types to the interested Dbus 
interfaces(MAP2)

=> To start with we will support few resource types and then scale it up 
as needed.

=> Map2 would be used when the Redfish client subscribe for the 
ResourceType to get the Dbus mappings.

=> Map3 would be used when the Dbus signal gets generated and need the 
Redfish mappings.

=> Once we have all thsese mapping gets generated and loaded into the 
memory, bmcweb would start listening
    for the interfaces listed in map2.

=> Once any Dbus signal gets generated map3 would be used to get the 
Redfish mapping.

Please let me know if you have any concerns with this approach.

Ratan

On 7/7/20 3:00 AM, Bills, Jason M wrote:
>
>
> On 7/3/2020 3:15 AM, Ratan Gupta wrote:
>>>>> I think I'm still a little confused at the scope.  My 
>>>>> understanding was that this initial design for EventService was 
>>>>> only for monitoring event messages and not resources in general. 
>>>>> It seems like it may not make sense to try to use the same tools 
>>>>> and approach for both message monitoring and resource monitoring? 
>>>>> Do we need to treat them separately for now to simplify the 
>>>>> discussion?
>>>> Jason, When you say event messages? What do you mean, Do you mean 
>>>> to say "/redfish/v1/Systems/system/Logservices/eventlog"? >
>>>> If yes then this should also go as Resource Event, When ever any 
>>>> log entry gets created under System Log 
>>>> (/redfish/v1/Systems/system/Logservices/eventlog/entries), BMC 
>>>> would notify to the Redfish client saying that "ResourceCreated" 
>>>> with the URL of the Resource.
>>> Yes, new entries under 
>>> "/redfish/v1/Systems/system/Logservices/eventlog", but I thought you 
>>> could register for specific MessageIDs, so it's not just a generic 
>>> "new resource" event like others would be.
>>
>> Can we register for MessageID? I thought client can register for 
>> whole registry not a specific Message ID.
>>
> I don't really know.  I thought that's what the current implementation 
> allowed, but I don't know for sure if it can or should.
>
>>>
>>>
>>>>
>>>> After receiving this event Redfish client will do a GET request on 
>>>> the URL(retrieved as part of event) to get the content of the log.
>>>>
>>>> This will become generic infra for all types of events.
>>> What I'm saying is I don't know if there is a good generic solution 
>>> to cover both the EventLog and all other resources. I believe the 
>>> current EventService implementation was designed only for EventLog 
>>> and may not work well for generic resource events.
>>
>> Can you get me the example payload for EventLog which is going to be 
>> sent with the current design? I am not sure how the eventlog and 
>> other resources are different.
>>
> This is based on the assumption that for a LogService, you can 
> register for a MessageId.  If this is not possible, then they might be 
> treated the same.
>
>> For eventLogs also we have the associated D-bus 
>> objects(/xyz/openbmc_project/logging,/xyz/openbmc_project/dump etc)
>>
> For Intel platforms, we don't use /xyz/openbmc_project/logging, so we 
> don't have D-Bus objects associated with each EventLog LogEntry.  We 
> use rsyslog to create a file that contains many LogEntries.
>
> However, as an unrelated side-thought: linking logging to 
> /xyz/openbmc_project/dump made me wonder if there is a possible 
> solution to the logging issue if we treat /xyz/openbmc_project/logging 
> like /xyz/openbmc_project/dump and place a pointer to the log in the 
> D-Bus object instead of the log itself?
>
>>>
>>>>
>>>> I would be coming up with few design approaches and downside with 
>>>> each approach to take it to conclusion.
>>> Thanks!  What I'm proposing is that we clarify or possibly separate 
>>> the discussions about EventLog vs. generic resources to avoid 
>>> confusion and come up with the right solutions for each.
>>>
>>>>
>>>> Ratan
>>>>
