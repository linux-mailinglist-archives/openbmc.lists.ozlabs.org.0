Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D8232F3B
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 11:11:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHPmR2YkTzDqtK
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 19:11:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHPlP50G5zDqkV
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 19:10:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06U91wPT102166
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 05:10:37 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kretcxm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 05:10:36 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06U9AYOX007258
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:10:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0upqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:10:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06U997xv66585066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:09:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A52142045
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:10:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5CC84203F
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:10:31 +0000 (GMT)
Received: from [9.79.214.119] (unknown [9.79.214.119])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:10:31 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
To: openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
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
 <09cf469e-ddc3-1206-efeb-54dd59a334d5@linux.vnet.ibm.com>
 <9f44403a-3852-4b41-2a68-89dc84d30a23@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <d67f2e58-3eee-b02b-f9ca-2f6bf7de4ea7@linux.vnet.ibm.com>
Date: Thu, 30 Jul 2020 14:40:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <9f44403a-3852-4b41-2a68-89dc84d30a23@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_05:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300063
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

On 7/15/20 2:38 AM, James Feist wrote:
> On 7/12/2020 11:32 PM, Ratan Gupta wrote:
>> Hi James,
>>
>> As you asked for the examples in the 
>> thread(https://lists.ozlabs.org/pipermail/openbmc/2020-June/022125.html), 
>> I have created the mapping at the following location.
>>
>> https://gist.github.com/ratagupt/0aa4da098a60d49af90a7e4a6ea6d5f2
>
> Thanks for the examples.
>
>>
>> 1) Map1: Mapping between redfish resources to Dbus resources
>
> How does this work when the mapping isn't 1:1 vs D-Bus? Most of the 
> time the enums to not match the d-bus enum, or take multiple d-bus 
> interface to distinguish what the value should be. Also how does this 
> work for discovered things, like multiple chassis?

I have not mentioned in the below use cases, but just look at the url 
https://gist.github.com/ratagupt/0aa4da098a60d49af90a7e4a6ea6d5f2#file-gistfile1-txt-L77
<https://gist.github.com/ratagupt/0aa4da098a60d49af90a7e4a6ea6d5f2#file-gistfile1-txt-L77>

There we are covering the resources which are getting added dynamically.
>
>
>> 2) Map2: Mapping between redfish resource types to the ineterested 
>> Dbus interfaces
>> 3) Map3: Mapping between Dbus resources to redfish resources
>>
>>
>> I tried to cover the following scenario in the above mapping.
>>
>> * Redfish resource is mapped to multiple Dbus Resources
>> * Redfish Property is mapped to single Dbus property
>> * Redfish Property(complex property) is mapped to multiple dbus 
>> property.
>> * Same type of Redfish Resources are mapped to different Dbus Resources
>> * Redfish node url having multiple regex : Yet to take a look on this.
>> >
>> Flow would be like as below
>>
>> => In bmcweb each Redfish node represents to a Redfish Resource.
>> => Each node will be having it's own mapping between Redfish 
>> properties and the Dbus Resources.
>>
>> => Some code on bmcweb will walkthrough on each node during startup , 
>> get this mapping from each node and generate
>>     two mappings
>>     1) Reverse mapping (Dbus Resource to Redfish Resource)(MAP3) and
>>     2) mapping between Resource Types to the interested Dbus 
>> interfaces(MAP2)
>>
>> => To start with we will support few resource types and then scale it 
>> up as needed.
>
> I think we need an idea of what the final solution will look like for 
> more complicated properties, or we'll be creating something that isn't 
> future proof.
I thought I covered the complicated one in the examples(gist link above) 
but just let me know the other redfish resource which I can take it in 
the examples.
>
>>
>> => Map2 would be used when the Redfish client subscribe for the 
>> ResourceType to get the Dbus mappings.
>>
>> => Map3 would be used when the Dbus signal gets generated and need 
>> the Redfish mappings.
>
> Why can't these be the same mapping?

To start monitoring for Dbus : We need Dbus Resource Path,

Once we get any Dbus signal, we need to send redfish event which needs 
redfish resource path hence we need reverse map

Did I get you correctly?

> I think having 3 different maps makes this very confusing. I also 
> think this is attempting to generalize the problem too early. If you 
> look at the Redfish code to determine some of the more complicated 
> properties, sometimes it takes quite a bit of logic. That logic also 
> would possibly be nice to reuse. Maybe we can take your idea of a 
> match with a callback to some of the already existing property 
> parsing? Obviously it would need some cleaning up, but I could see 
> something with a map of schemas/properties to function pointers for 
> property parsing.
>
>>
>> => Once we have all thsese mapping gets generated and loaded into the 
>> memory, bmcweb would start listening
>>     for the interfaces listed in map2.
>
> Why aren't these compiled in? I don't see why they need to be loaded, 
> could just be in code. Also, they shouldn't be added as matches until 
> there is a subscriber, or we'll add many unneeded matches.

They would be compiled in, they would be in memory(big std::map).

Agree monitoring should start only when there is a subscriber.

>
>>
>> => Once any Dbus signal gets generated map3 would be used to get the 
>> Redfish mapping.
>>
>> Please let me know if you have any concerns with this approach.
>>
>> Ratan
