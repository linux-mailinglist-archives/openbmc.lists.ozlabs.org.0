Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002239900F
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 18:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwF4V3FBqz303J
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 02:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+6ERJCB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F+6ERJCB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwF4B17Lhz2yXf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 02:34:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152GWiXH159032; Wed, 2 Jun 2021 12:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lgWkJl01bsysbe3YQBRLxYjlmc/gnIxSpOe63PnlV9s=;
 b=F+6ERJCBybAbKCiDe0ILA6/9KOWjvtgsptbyuDUseTxBC3ZqXGdvIIoTWeq+uoqsV7BO
 5LPUSdB8geatKXBDhnycimvIrWWKuKqCE/A//t7QleEjwxRzkxuBIPEk2ja0BnvoUSCo
 TDE4uxOBrlH8eDHKff474/VUsr2IgM2fUPxtU0ugWTUZnVqC2Ru028jgvgc0VuKvVIGy
 cOLC7EFqEy4YKyAC2ZjqMtHQaaPuEs09mvsXEaJ+JFihLmuhj6FqTrOMw8cGAfB2ZLu5
 5lKXW5g4ID3TzLJc97T+MCyVxqaYDVyJNkfP4wGDalOd3ws2KDLBEIr5Y6imPTD2s5r6 Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xc8y2s0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 12:34:45 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152GYhFN167336;
 Wed, 2 Jun 2021 12:34:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xc8y2s04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 12:34:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152GXAdu028597;
 Wed, 2 Jun 2021 16:34:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 38ud8a170e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 16:34:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152GYi4310945324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 16:34:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 145B3AC05B;
 Wed,  2 Jun 2021 16:34:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FD13AC05F;
 Wed,  2 Jun 2021 16:34:43 +0000 (GMT)
Received: from [9.211.138.111] (unknown [9.211.138.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 16:34:43 +0000 (GMT)
Subject: Re: Seeking your opinion on ways to report both Altitude and Pressure
 sensors for the DPS310 as well as Temperature from dbus-sensors.
To: Ed Tanous <edtanous@google.com>
References: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
 <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
 <1bdf8842-2b53-0d51-40b6-6bf64f2bf315@linux.vnet.ibm.com>
 <CAH2-KxAjjefRFfirz0Gn9DTn-dCfqw_7ed2obk43wxevym3xPA@mail.gmail.com>
 <4746ede6-dea9-32c5-10e3-2fd6773e2033@linux.vnet.ibm.com>
 <CAH2-KxDD8=ipYoDtBz_gQh8nWMsu_u+JDs33ma=-gk7ZVXVuWA@mail.gmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <7a1dcde4-25df-ceee-a481-4a2f4afcf5bf@linux.vnet.ibm.com>
Date: Wed, 2 Jun 2021 09:34:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAH2-KxDD8=ipYoDtBz_gQh8nWMsu_u+JDs33ma=-gk7ZVXVuWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vAxTLNvC7mpumLlYOAzi8zWfb3W5uxFM
X-Proofpoint-GUID: CAOKk2zs5DopXWx-ZCq1Cfq_4EOv3UaD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_08:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020104
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/2/2021 09:21, Ed Tanous wrote:
> On Wed, Jun 2, 2021 at 9:14 AM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>
>> On 6/2/2021 09:03, Ed Tanous wrote:
>>> On Wed, Jun 2, 2021 at 8:58 AM Bruce Mitchell
>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>
>>>> On 6/2/2021 08:39, Ed Tanous wrote:
>>>>> On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
>>>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>>>
>>>>>> Hello Ed,
>>>>>>
>>>>>> It has been suggest I seeking your opinion on ways to report both
>>>>>> Altitude and Pressure sensors for the DPS310 as well as Temperature from
>>>>>> dbus-sensors before going to far down the road.  Thus that is what I am
>>>>>> attempting to do in the email, others on the mailing list input is
>>>>>> desirable as well.
>>>>>
>>>>> Thanks for discussing this before getting too far along.  I haven't
>>>>> worked on any systems with physical pressure sensors, but I'm excited
>>>>> to see new things get added.
>>>>>
>>>>>>
>>>>>> As I see it, Altitude and Pressure are different in that
>>>>>>         1) Altitude is computed base off of essentially a policy
>>>>>
>>>>> I have no idea what this means.....   In what way is altitude a
>>>>> "policy"?  Can you elaborate a little?
>>>>>
>>>>
>>>> I view a mechanism is something like update a FLASH part with
>>>> an image provided.
>>>>
>>>> I view a policy is what decides if the the update of the FLASH part
>>>> with the specific image is allowed.
>>>>
>>>> I the case if Pressure and Temperature I view them as mechanism,
>>>> merely a simple reading and possibly some well defined computations
>>>> that are universal.
>>>>
>>>> With Altitude computed from Pressure there are several ways to
>>>> compute the Altitude and they are not universal.  So I see it as
>>>> a policy of which Pressure to Altitude model is chosen and why.
>>>
>>> Sounds like I interpreted your intention correctly. (I think).
>>
>> I believe you did.
>>
>>>
>>>>
>>>>>>         2) Pressures is a read measurement which is a mechanism
>>>>>>         3) Temperature is a read measurement which is also a mechanism
>>>>>
>>>>> I'm really struggling with the above to understand what you're getting
>>>>> after, so if I go down the wrong path, please forgive me.
>>>>>
>>>>> I think what you're saying is that altitude is calculated based on
>>>>> pressure + some transfer function to determine an altitude?  And that
>>>>> transfer function might be fungible depending on the platform?
>>>>>
>>>>> If I got the above right (big if) I would probably expect a new
>>>>> pressure sensor type to be added that reports a pressure sensor, then
>>>>> we'd put the transform code in something that looks a lot like CFM
>>>>> sensor (which oddly enough has a hardcoded 0 for altitude in its
>>>>> algorithm for systems without pressure sensors).  Considering how
>>>>> related a pressure sensor is to altitude, I could see putting them in
>>>>> the same application if you wanted;  It might simplify the code some.
>>>>>
>>>>>
>>>>> I think overall a better picture of what you're wanting to accomplish
>>>>> would be a good place to start, then we can iterate from there on what
>>>>> pieces we need that are new.
>>>>
>>>> I have Temperature, Pressure, possibly Humidity sensors all which are
>>>> variables to different models to compute Altitude from.  I do not have a
>>>> true Altitude sensor.
>>>
>>> This sounds exactly like the CFM sensor, and Exit air temp sensor;
>>> Most systems don't have exit air temp sensors, but they have input
>>> power and individual fan speeds, which can be put into models to
>>> determine CFM and ultimately exit air temperature.  I would expect
>>> Altitude to do something very similar in code (although with a
>>> completely different algorithm).
>>>
>>
>> So the DPS310 has 2 sensors in it a Pressure and a Temperature sensor.
>> Do I create a Pressure reading and a Temperature reading for the DPS310
>> and then add Altitude to it as well?
>>
>> Or do I create 3 separate things,  one for each Pressure, Temperature,
>> and Altitude?
> 
> Assuming in this case "things" are intended to mean "entity manager
> exposes records" you would create one config record for the DPS310
> itself (which would in turn create 2 sensors).  This is one "record"
> because physically it's one part, and can't be separated, similar to a
> TMP421.  After that, I would create another config record for the
> "Here's the math to combine these into an altitude".  It might just be
> a type and a name, depending on how many inputs go into the transfer
> function to convert pressure+temperature into an altitude.
> 
> If the math to combine into an altitude isn't system specific, I could
> be convinced that the math should go into a single record within the
> DPS310 exposes and have that live in the daemon itself, but I don't
> have enough detail on how these are usually deployed to know that.
> 

I prefer the the 2 record solution, it keeps the DPS310 self-contained.
And keeps the Altitude self-contained, to the models can evolve and 
change; also if every a true altitude sensor were created it would help 
keep better abstraction from the DPS310.

>>
>> Also I believe I should be looking to the CFM sensor and Exit air
>> temperature sensor as reference examples.
>>
>>>>
>>>> I am being asked to provide Altitude.
>>>>
>>>> Personally I believe the desired feature is how much cooling a parcel of
>>>> air per unit of time.  Thus I would think air Temperature, Humidity, and
>>>> Density (probably compute-able from Pressure, but I have not checked on
>>>> the specifics) would be the important factors.
>>

Thank you Ed!
