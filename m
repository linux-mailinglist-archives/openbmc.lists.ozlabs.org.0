Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0676BE66
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 16:37:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pfxN2wPzzDqWS
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 00:37:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pfwp1rxBzDqP1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 00:36:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HEaqQJ098937
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 10:36:54 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tt4yta4t4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 10:36:53 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Wed, 17 Jul 2019 15:36:44 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 15:36:41 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HEadDt66650424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 14:36:39 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9871A6A051;
 Wed, 17 Jul 2019 14:36:39 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 410626A04D;
 Wed, 17 Jul 2019 14:36:39 +0000 (GMT)
Received: from [9.10.99.12] (unknown [9.10.99.12])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jul 2019 14:36:39 +0000 (GMT)
Subject: Re: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Patrick Venture <venture@google.com>, Matt Spinler <mspinler@linux.ibm.com>
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
 <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
 <fdc0a94c-8295-fc78-b076-d186122dddd1@linux.ibm.com>
 <CAO=notw6jitPk-OuA2OGxqBEm38nVY5sa1C0KKx0TfYi=0qpnQ@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Wed, 17 Jul 2019 09:36:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAO=notw6jitPk-OuA2OGxqBEm38nVY5sa1C0KKx0TfYi=0qpnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071714-0016-0000-0000-000009D13952
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011446; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01233485; UDB=6.00649951; IPR=6.01014809; 
 MB=3.00027760; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-17 14:36:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071714-0017-0000-0000-0000440F168C
Message-Id: <a8159cb7-9b54-8682-98aa-c1133d042c2b@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170171
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
Cc: Matt Spinler <spinler@us.ibm.com>, Brandon Kim <brandonkim@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 7/16/19 4:19 PM, Patrick Venture wrote:
> On Mon, Jul 15, 2019 at 9:10 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>>
>>
>>
>> On 7/15/2019 9:45 AM, Matthew Barth wrote:
>>> This is a great proposal, just a few concerns/notes.
>>>
>>> On 7/12/19 5:27 PM, Kun Yi wrote:
>>>> Hi there,
>>>>
>>>> Current phosphor-hwmon code is filled with preprocessor macros to
>>>> branch error condition for sysfs reads, and it seems to me that
>>>> adding a per-sensor configuration would solve two issues at least:
>>>> 1. code can be greatly simplified
>>>> 2. we can code more flexible sensor reading behavior
>>>>
>>>> Why 2) is needed: with many types of sensors that BMC controls,
>>>> having an one-size-fits-all policy will always have cases that it
>>>> can't handle. Each flaky sensor is flaky in its own way.
>>>>
>>>> Rough proposal on how this will work:
>>>>
>>>> add properties to each sensor group's configuration file:
>>>>
>>>> "error behavior": can be one of
>>>> - always keep
>>>> - remove from D-Bus on error
>>> There is a REMOVERCS device config file option that can be configured
>>> to remove an individual sensor or any sensor of the device when a
>>> given set of return codes occur when attempting to read the sensor.
>>>>
>>>> "error condition":  can be combination of
>>>> - certain sysfs return codes
>>> REMOVERCS combines this error condition to the behavior of removing
>>> the sensor from Dbus. I'd be interested in how these types of
>>> bahavior-to-conditions will be mapped within the device's config file.
>>>
>>>> - timeout
>>> In the case of phosphor-hwmon, isnt a timeout condition similar to
>>> error retries since a timeout condition is presented as a ETIMEDOUT
>>> return code on the sensor.
>>>> - invalid value
>>> This is another area I'd be interested to hear more on, how would one
>>> go about defining when a value would be invalid? Or is this a simple,
>>> negative values are invalid for a sensor that should always return a
>>> positive value?
>>>>
>>>> "error retries": number of retries before declaring the sensor has an
>>>> error
>>> This would be great to have configurable per sensors, however a
>>> possible issue here would be allowing too many retries causing hwmon
>>> to take too long. So this should be capped or controlled in someway
>>> with the delay between reads as well. Right now a sensor is allowed to
>>> be retried 10x's with a 100ms delay between each attempt.
>>>>
>>>> Happy to hear any feedback.
> 
> I think the idea in general is interesting -- it may be ugly to try
> and set the values per sensor, versus a group of sensors in a config
> -- see INTERVAL, which is set for all sensors in a file.  I realize
> that some things are sensor specific... so maybe a mixture?  I'd just
> hate to see us need to specify the error handling for every sensor if
> only one is different, and the others aren't default.  Although, maybe
> that can be done nicely -- have some default you can set in a config
> once and then override per sensor...
> 

FWIW, REMOVERCS is partially implemented to how you describe. A 
REMOVERCS entry can be added to a devices config either per sensor or 
for all sensors provided by the device. The return codes defined per 
sensor are added to the list for the sensor when its created and any 
other/additional return codes are added to the same sensor if defined as 
a general config option on the device.

ex.) REMOVERCS_fan1 = 7,11 and REMOVERCS = 13 within the same device 
config would remove fan1 when return codes 7,11or13 occur when 
attempting to read it.

>>>>
>>
>> I like this idea.  Hopefully the defaults can be kept the same as they
>> are today so users of
>> today's default settings wouldn't have to change their config files to
>> keep things the same.
>>
>> Another thing we've been thinking about adding is the ability for
>> sensors to only be
>> read when the power is on,   though there's still some invention
>> required as to how
>> to represent this state on D-Bus.
>>
>>>> Regards,
>>>> Kun
>>>
>>
> 

