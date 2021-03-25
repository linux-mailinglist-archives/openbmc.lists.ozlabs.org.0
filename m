Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775B3493ED
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 15:25:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5nT70sNlz30L1
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 01:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZJ4eNHqn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZJ4eNHqn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5nSt6J4lz309g
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 01:25:33 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PEFujE152071; Thu, 25 Mar 2021 10:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8DSHVa/xAA/W7BWTxodmJZ4/mY4fpfY4Cdr8MlbB+2Y=;
 b=ZJ4eNHqnzy6Z+SIRGqAXc8bdt/Gfog+uwoqQnSRW/4W7nvhVzbcrP3wf3AkTKg3izM8r
 VKib3CXkMeAUJWDIxMv8SqcLVtCCRmYCTy0MHikBrOfaIeOWoC1NteHGvcdkpzZ1tuJS
 gmt9HShHPmLsxDH93/CES0AozWh/m7xSIRS0MVgG8MFxe2D8G5yFm9eadhQiz2A+xGse
 xeP2La4WCZ1upkbgZaDIW/uf0kGlX/Q3pm1raCJn5tAaiVm+2LQcTaUEwRSxYnSsXOa3
 js4IfIrNMrL+UjpoRZ/aI5H3WCZ3EJsycsrNJCWWFr8STKqKds1G7LSZaGXSeaLgcIhn Lw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37grn16u70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:25:29 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PEITUZ018487;
 Thu, 25 Mar 2021 14:25:29 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 37d9ccx7hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 14:25:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PEPSY930802338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 14:25:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE84828060;
 Thu, 25 Mar 2021 14:25:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 313892805A;
 Thu, 25 Mar 2021 14:25:28 +0000 (GMT)
Received: from [9.160.75.159] (unknown [9.160.75.159])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 14:25:28 +0000 (GMT)
Subject: Re: Question of phosphor-sel-logger
To: =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
 <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
 <TY2PR04MB37121D9EE4CD05A70D5F6C5B88629@TY2PR04MB3712.apcprd04.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <f92a8942-ea95-6ca2-402b-d2fec89d2357@linux.ibm.com>
Date: Thu, 25 Mar 2021 09:25:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <TY2PR04MB37121D9EE4CD05A70D5F6C5B88629@TY2PR04MB3712.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250106
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
Cc: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/25/2021 3:22 AM, Duke Du (杜祥嘉) wrote:
>> -----Original Message-----
>> From: Matt Spinler <mspinler@linux.ibm.com>
>> Sent: Wednesday, March 24, 2021 9:20 PM
>> To: Duke Du (杜祥嘉) <Duke.Du@quantatw.com>; openbmc@lists.ozlabs.org
>> Cc: vernon.mauery@linux.intel.com; jason.m.bills@linux.intel.com; Fran Hsu
>> (徐誌謙) <Fran.Hsu@quantatw.com>; George Hung (洪忠敬)
>> <George.Hung@quantatw.com>
>> Subject: Re: Question of phosphor-sel-logger
>>
>>
>>
>> On 3/24/2021 6:28 AM, Duke Du (杜祥嘉) wrote:
>>> Hi all,
>>>
>>>        I used package phosphor-hwmon and phospor-sel-logger to
>> monitor sensor and create log when sensor reading
>>>      cross the threshold. I found after the commit
>> 25b26e162bd109b51aa09b16f26f9aa3d9d940fa of phosphor-sel-logger
>>>      would catch the signal "ThresholdAsserted" to create sensor threhold
>> log in the journal, but the phosphor-hwmon
>>>      would not send the signal "ThresholdAsserted" when sensor reading
>> is abnormal so that phosphor-sel-logger
>>>      would not create the sensor threhold log, am I right ?
>>>
>>>      If I'm right, can you give me some suggestion to fix this side effect, or
>> what setting I have lost in the
>>>      phosphor-hwmon or phosphor-sel-logger ?
>> Hi,
>> That signal isn't defined in phosphor-dbus-interfaces, so phosphor-hwmon
>> cannot use it.  When I tried to add it, it was rejected as-is with a
>> recommendation to break it up into separate signals for each alarm property
>> on each interface.  At that point I gave up and had the code I was working
>> on at the time just look at propertiesChanged signals instead.
>>
>> If you would like to take that up it would entail:
>> * Update
>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgerrit.
>> openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%2B
>> %2F39899&amp;data=04%7C01%7CDuke.Du%40quantatw.com%7Cc5bf4d3d1
>> 6f046cc6efa08d8eec78fd7%7C179b032707fc4973ac738de7313561b2%7C1%7
>> C0%7C637521888783853893%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
>> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp
>> ;sdata=XoY4nKa3Go%2F9jt2coyzOcnXNrcMaw6XUtqnmK57k0ds%3D&amp;res
>> erved=0
>> as requested
>> * Update phosphor-hwmon to emit the new signals
>> * Update phosphor-sel-logger to also listen for these new signals in addition
>> to the  current one, or change the dbus-sensors code to only emit the new
>> signals.
>>
>>
> Hi Matt,
>
>     Thanks for your reply, I want to add a event monitor to listen "signal PropertyChanged" for
>     "phosphor-phosphor-hwmon" only, like watchdog event monitor
>     (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/37774),
>     I think this is a simple way to fix this side effect, what do you think about my thought ?
>     
>     Please feel free to give me some suggestion, thanks very much !

I don't really know the best way to go here other than what I already 
suggested.  sel-logger used to look at PropertiesChanged, but was 
changed to use ThresholdAsserted I think so that it could capture the 
sensor value within the signal.  But applications that need 
phosphor-dbus-interfaces bindings for their operations, like 
phosphor-hwmon, can't use ThresholdAsserted because it failed the PDI 
review.

Jason or Vernon, what do you suggest?


>
> Thanks
> Duke
>
>>>      phosphor-sel-logger commit
>> 25b26e162bd109b51aa09b16f26f9aa3d9d940fa link :
>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>>>
>> ub.com%2Fopenbmc%2Fphosphor-sel-logger%2Fcommit%2F25b26e162bd10
>> 9b51aa0
>> 9b16f26f9aa3d9d940fa&amp;data=04%7C01%7CDuke.Du%40quantatw.com%
>> 7Cc5bf4
>> d3d16f046cc6efa08d8eec78fd7%7C179b032707fc4973ac738de7313561b2%7C
>> 1%7C0
>> %7C637521888783853893%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
>> wMDAiLCJQ
>> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=rHxKqIk
>> Vg7
>>> yQXmqvjXal7I6eVBzw3ifl26gsZF8o4xo%3D&amp;reserved=0
>>>
>>>      Thanks very much !
>>>      Duke

