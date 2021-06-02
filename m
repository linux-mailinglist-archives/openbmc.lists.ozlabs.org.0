Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDC399314
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 21:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwJKg1VBCz302B
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 05:01:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1/DzSx0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g1/DzSx0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwJKP5W5pz2xxn
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 05:01:28 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152IZ0r6173956; Wed, 2 Jun 2021 15:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6XJ+Q+Vz6ODXifsDWKhaOUJ2BlwA+QnOfFYv/TaGfpE=;
 b=g1/DzSx0ntSgNanoeSSXuQOcDAERxSgzanL1niH0IirST/G6JYd2SyozzUhDS2v/jGB8
 FF8biH1nCqVHjZ5rKwtpA8iekypVX8nM4CEvq/q/Bec52xJijutUHGGKBygYU2h6DoIy
 OXUMOCusONlzpDEM28z8rSlQFQFnwmF8biwYADLVGek7HcS73a+wUaR42X4C0ojWVi8l
 NMsIOjw2fJuETxlQ3XiLA64qpMLg6J9wTEo66/E8vd2Nfdc/s2muJP5+aObLWBkqgylZ
 SQ5MAJSA2YpFKFj6eGiOS9vTATSyNUau3m0/747fKmKwxfAcSpVcAQbinSmyfC6eih58 Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xe04b1sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:01:23 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152Ib0hf183403;
 Wed, 2 Jun 2021 15:01:23 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xe04b1ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:01:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152Iv9Md024638;
 Wed, 2 Jun 2021 19:01:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 38ud89t9xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 19:01:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152J1Ldf33620364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 19:01:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45EDDAC1B3;
 Wed,  2 Jun 2021 19:01:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34F75AC19C;
 Wed,  2 Jun 2021 19:01:19 +0000 (GMT)
Received: from [9.211.138.111] (unknown [9.211.138.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 19:01:19 +0000 (GMT)
Subject: Re: Seeking your opinion on ways to report both Altitude and Pressure
 sensors for the DPS310 as well as Temperature from dbus-sensors.
To: Guenter Roeck <groeck@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <edtanous@google.com>
References: <7a1dcde4-25df-ceee-a481-4a2f4afcf5bf@linux.vnet.ibm.com>
 <f1add89a-853d-2ddd-b07e-6345eb54e72b@linux.vnet.ibm.com>
 <CABXOdTcdkXzmi9qWWZapY19Z7-DsnXsz-yBWbaBqwhLrJpTDVw@mail.gmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <c32a844b-1114-b423-7e7d-63821628f919@linux.vnet.ibm.com>
Date: Wed, 2 Jun 2021 12:01:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CABXOdTcdkXzmi9qWWZapY19Z7-DsnXsz-yBWbaBqwhLrJpTDVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gfw20iSqaxRJuzr7COWaKA-DMLF8d-qI
X-Proofpoint-GUID: siUfiBbfjVlgcyFJBme8-qoH7RUJeSMJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_10:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020118
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
Cc: linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>, Guenter Roeck <groeck@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/2/2021 11:52, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Jun 2, 2021 at 11:18 AM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>
>> Forwarded to an expanded the To and Cc Lists.
>>
>> On 6/2/2021 09:21, Ed Tanous wrote:
>>> On Wed, Jun 2, 2021 at 9:14 AM Bruce Mitchell
>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>
>>>> On 6/2/2021 09:03, Ed Tanous wrote:
>>>>> On Wed, Jun 2, 2021 at 8:58 AM Bruce Mitchell
>>>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>>>
>>>>>> On 6/2/2021 08:39, Ed Tanous wrote:
>>>>>>> On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
>>>>>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>>>>>
>>>>>>>> Hello Ed,
>>>>>>>>
>>>>>>>> It has been suggest I seeking your opinion on ways to report both
>>>>>>>> Altitude and Pressure sensors for the DPS310 as well as Temperature from
>>>>>>>> dbus-sensors before going to far down the road.  Thus that is what I am
>>>>>>>> attempting to do in the email, others on the mailing list input is
>>>>>>>> desirable as well.
>>>>>>>
>>>>>>> Thanks for discussing this before getting too far along.  I haven't
>>>>>>> worked on any systems with physical pressure sensors, but I'm excited
>>>>>>> to see new things get added.
>>>>>>>
>>>>>>>>
>>>>>>>> As I see it, Altitude and Pressure are different in that
>>>>>>>>          1) Altitude is computed base off of essentially a policy
>>>>>>>
>>>>>>> I have no idea what this means.....   In what way is altitude a
>>>>>>> "policy"?  Can you elaborate a little?
>>>>>>>
>>>>>>
>>>>>> I view a mechanism is something like update a FLASH part with
>>>>>> an image provided.
>>>>>>
>>>>>> I view a policy is what decides if the the update of the FLASH part
>>>>>> with the specific image is allowed.
>>>>>>
>>>>>> I the case if Pressure and Temperature I view them as mechanism,
>>>>>> merely a simple reading and possibly some well defined computations
>>>>>> that are universal.
>>>>>>
>>>>>> With Altitude computed from Pressure there are several ways to
>>>>>> compute the Altitude and they are not universal.  So I see it as
>>>>>> a policy of which Pressure to Altitude model is chosen and why.
>>>>>
>>>>> Sounds like I interpreted your intention correctly. (I think).
>>>>
>>>> I believe you did.
>>>>
>>>>>
>>>>>>
>>>>>>>>          2) Pressures is a read measurement which is a mechanism
>>>>>>>>          3) Temperature is a read measurement which is also a mechanism
>>>>>>>
>>>>>>> I'm really struggling with the above to understand what you're getting
>>>>>>> after, so if I go down the wrong path, please forgive me.
>>>>>>>
>>>>>>> I think what you're saying is that altitude is calculated based on
>>>>>>> pressure + some transfer function to determine an altitude?  And that
>>>>>>> transfer function might be fungible depending on the platform?
>>>>>>>
>>>>>>> If I got the above right (big if) I would probably expect a new
>>>>>>> pressure sensor type to be added that reports a pressure sensor, then
>>>>>>> we'd put the transform code in something that looks a lot like CFM
>>>>>>> sensor (which oddly enough has a hardcoded 0 for altitude in its
>>>>>>> algorithm for systems without pressure sensors).  Considering how
>>>>>>> related a pressure sensor is to altitude, I could see putting them in
>>>>>>> the same application if you wanted;  It might simplify the code some.
>>>>>>>
>>>>>>>
>>>>>>> I think overall a better picture of what you're wanting to accomplish
>>>>>>> would be a good place to start, then we can iterate from there on what
>>>>>>> pieces we need that are new.
>>>>>>
>>>>>> I have Temperature, Pressure, possibly Humidity sensors all which are
>>>>>> variables to different models to compute Altitude from.  I do not have a
>>>>>> true Altitude sensor.
>>>>>
>>>>> This sounds exactly like the CFM sensor, and Exit air temp sensor;
>>>>> Most systems don't have exit air temp sensors, but they have input
>>>>> power and individual fan speeds, which can be put into models to
>>>>> determine CFM and ultimately exit air temperature.  I would expect
>>>>> Altitude to do something very similar in code (although with a
>>>>> completely different algorithm).
>>>>>
>>>>
>>>> So the DPS310 has 2 sensors in it a Pressure and a Temperature sensor.
>>>> Do I create a Pressure reading and a Temperature reading for the DPS310
>>>> and then add Altitude to it as well?
>>>>
>>>> Or do I create 3 separate things,  one for each Pressure, Temperature,
>>>> and Altitude?
>>>
>>> Assuming in this case "things" are intended to mean "entity manager
>>> exposes records" you would create one config record for the DPS310
>>> itself (which would in turn create 2 sensors).  This is one "record"
>>> because physically it's one part, and can't be separated, similar to a
>>> TMP421.  After that, I would create another config record for the
>>> "Here's the math to combine these into an altitude".  It might just be
>>> a type and a name, depending on how many inputs go into the transfer
>>> function to convert pressure+temperature into an altitude.
>>>
>>> If the math to combine into an altitude isn't system specific, I could
>>> be convinced that the math should go into a single record within the
>>> DPS310 exposes and have that live in the daemon itself, but I don't
>>> have enough detail on how these are usually deployed to know that.
>>>
>>
>> I prefer the the 2 record solution, it keeps the DPS310 self-contained.
>> And keeps the Altitude self-contained, to the models can evolve and
>> change; also if every a true altitude sensor were created it would help
>> keep better abstraction from the DPS310.
>>
>>>>
>>>> Also I believe I should be looking to the CFM sensor and Exit air
>>>> temperature sensor as reference examples.
>>>>
>>>>>>
>>>>>> I am being asked to provide Altitude.
>>>>>>
>>>>>> Personally I believe the desired feature is how much cooling a parcel of
>>>>>> air per unit of time.  Thus I would think air Temperature, Humidity, and
>>>>>> Density (probably compute-able from Pressure, but I have not checked on
>>>>>> the specifics) would be the important factors.
>>>>
>>
> 
> Again, I am obviously missing the entire discussion leading to this point, so
> my response may just be noise. If so, my apologies. Anyway, here is my $0.02:
> 
> Altitude can not be measured on its own with a sensor. It can, for example. be
> estimated from air pressure (maybe taking other information or sensors into
> account), or it can be provided (calculated) using GPS. Therefore, "altitude"
> measurements don't belong into the kernel but need to be calculated in user
> space from information which may or may not be provided by the kernel.
> How to do that is outside the scope of kernel development.
> 
> A kernel driver for DPS310 should report pressure and temperature data,
> not anything else that may be derived from it.
> 
> Thanks,
> Guenter
> 

You are correct Guenter, we are not talking kernel space here.
But the user land "driver" dbus-sensors with entity-manager as well this 
is all part of OpenBMC which is built on OpenEmbedded and Yocto.

I believe Ed and I are in agreement with "A kernel driver for DPS310 
should report pressure and temperature data, not anything else that may 
be derived from it."

Thank you for you validation of our conclusion; much appreciated.
(It is far easier when build something for the first time to get done 
correctly.)


-- 
Bruce


