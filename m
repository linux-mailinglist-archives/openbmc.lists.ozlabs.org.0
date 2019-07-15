Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E7698E0
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 18:11:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nT6L6TZ3zDqTQ
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 02:11:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nT5b0fTrzDqRM
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 02:10:26 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FG31Ph008103
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 12:10:23 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2trtx96nms-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 12:10:22 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Mon, 15 Jul 2019 17:10:22 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Jul 2019 17:10:19 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FGAI5X5309004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 16:10:18 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3778B112063;
 Mon, 15 Jul 2019 16:10:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D74DF112062;
 Mon, 15 Jul 2019 16:10:17 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jul 2019 16:10:17 +0000 (GMT)
Subject: Re: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Matthew Barth <msbarth@linux.ibm.com>, Kun Yi <kunyi@google.com>,
 Patrick Venture <venture@google.com>,
 Brandon Kim <brandonkim@google.com>, spinler@us.ibm.com,
 mine260309@gmail.com
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
 <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Mon, 15 Jul 2019 11:10:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071516-0060-0000-0000-0000035E9DE7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011433; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01232588; UDB=6.00649402; IPR=6.01013889; 
 MB=3.00027727; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-15 16:10:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071516-0061-0000-0000-00004A263B44
Message-Id: <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150187
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 7/15/2019 9:45 AM, Matthew Barth wrote:
> This is a great proposal, just a few concerns/notes.
>
> On 7/12/19 5:27 PM, Kun Yi wrote:
>> Hi there,
>>
>> Current phosphor-hwmon code is filled with preprocessor macros to 
>> branch error condition for sysfs reads, and it seems to me that 
>> adding a per-sensor configuration would solve two issues at least:
>> 1. code can be greatly simplified
>> 2. we can code more flexible sensor reading behavior
>>
>> Why 2) is needed: with many types of sensors that BMC controls, 
>> having an one-size-fits-all policy will always have cases that it 
>> can't handle. Each flaky sensor is flaky in its own way.
>>
>> Rough proposal on how this will work:
>>
>> add properties to each sensor group's configuration file:
>>
>> "error behavior": can be one of
>> - always keep
>> - remove from D-Bus on error
> There is a REMOVERCS device config file option that can be configured 
> to remove an individual sensor or any sensor of the device when a 
> given set of return codes occur when attempting to read the sensor.
>>
>> "error condition":  can be combination of
>> - certain sysfs return codes
> REMOVERCS combines this error condition to the behavior of removing 
> the sensor from Dbus. I'd be interested in how these types of 
> bahavior-to-conditions will be mapped within the device's config file.
>
>> - timeout
> In the case of phosphor-hwmon, isnt a timeout condition similar to 
> error retries since a timeout condition is presented as a ETIMEDOUT 
> return code on the sensor.
>> - invalid value
> This is another area I'd be interested to hear more on, how would one 
> go about defining when a value would be invalid? Or is this a simple, 
> negative values are invalid for a sensor that should always return a 
> positive value?
>>
>> "error retries": number of retries before declaring the sensor has an 
>> error
> This would be great to have configurable per sensors, however a 
> possible issue here would be allowing too many retries causing hwmon 
> to take too long. So this should be capped or controlled in someway 
> with the delay between reads as well. Right now a sensor is allowed to 
> be retried 10x's with a 100ms delay between each attempt.
>>
>> Happy to hear any feedback.
>>

I like this idea.  Hopefully the defaults can be kept the same as they 
are today so users of
today's default settings wouldn't have to change their config files to 
keep things the same.

Another thing we've been thinking about adding is the ability for 
sensors to only be
read when the power is on,   though there's still some invention 
required as to how
to represent this state on D-Bus.

>> Regards,
>> Kun
>

