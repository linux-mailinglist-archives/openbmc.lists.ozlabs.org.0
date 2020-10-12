Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D586E28C244
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 22:25:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C99CP12TxzDqcx
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 07:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DRA/DeoU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C99BY0VKpzDqP1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 07:24:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CK2sAc118986; Mon, 12 Oct 2020 16:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=N3MlA30rsejJJh7+JNDYowJ4NwngbY9N1NJwudhdvws=;
 b=DRA/DeoU4x7J1FxMo07S7lEmFScjiqbRkoSFRoFVuJXq/RIvA2882FPr0CCwidINkRvq
 Ua5IKBg3RaEdhAvUn+GxM0/89+gxOorxhpuPJ1yO24gxwxLm/V84P7IfsrOrao2wf++O
 r6ZwuQwdwgxjBcV4VpR0Zbs5cja5bA1PbujgtMqIDqR/SZb7CN/iGfRHlYwk4ibjrUiu
 F6ibNnLRgAvNOXM/4pUr/Jnss15fTgIlomkDJlZ/1kaXQ5oFVaNepkN1gozoGjmbtB4j
 9lDgasyJaB24grVah4wDtGpeMVXxl/vTLwrIGmTwkV4nmrDvNdnXwfiOt2GrYP/lY/h/ DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344wt68h72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 16:24:18 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09CK3JVM119602;
 Mon, 12 Oct 2020 16:24:17 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344wt68h6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 16:24:17 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CKMSPp023286;
 Mon, 12 Oct 2020 20:24:17 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3434k8xuvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 20:24:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CKOFPw53739926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 20:24:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC423BE056;
 Mon, 12 Oct 2020 20:24:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C3CBBE053;
 Mon, 12 Oct 2020 20:24:14 +0000 (GMT)
Received: from [9.206.182.230] (unknown [9.206.182.230])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 20:24:13 +0000 (GMT)
Subject: Re: Redfish: Supporting deprecated properties
To: Ed Tanous <ed@tanous.net>
References: <1a66bd6f-4095-2357-c860-80435c63bbe5@linux.vnet.ibm.com>
 <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <a345e4ba-7053-09ac-a497-056f830f1278@linux.vnet.ibm.com>
Date: Mon, 12 Oct 2020 14:24:10 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACWQX80ZxZuvzLzCoEvENYPSHd0yFiR8O=eu0oovptw4zYgzxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_17:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120150
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, kurt.r.taylor@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/5/2020 3:35 PM, Ed Tanous wrote:
> On Mon, Oct 5, 2020 at 1:34 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>>
>> Felt this needed some broader discussion. Although Redfish tries to
>> avoid, it does deprecate properties. In the future, Redfish plans to
>> deprecate whole schemas. One of these deprecated properties was the
>> IndicatorLED property, replaced by the LocationIndicatorActive property.
>> More information on this can be found at (Slide 11):
>> http://www.dmtf.org/sites/default/files/Redfish_Release_2020.3_Overview.pdf
>>
>> On https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36886, it was
>> proposed supporting both the deprecated and new property for some time.
>> This would introduce a new Redfish Validator warning about implementing
>> a deprecated property. We have other warnings today so maybe not a big deal.
>> How long do we need to support both properties?
>> Based on releases? 6 months? That feels too long.
> 

> Based on releases feels too long?  Can you elaborate on why that's
> "too long".

It is additional work. I feel it could slow picking up new Redfish 
schemas and implementing new properties.
Also, are we planning on continuing our release process? Roughly every 6 
months following a Yocto Release?
I could get behind something like support both the deprecated and new 
property for one release. See below.

> Supporting it for N+2 releases with a deprecation warning
> return seems reasonable to me, 

PATCH deprecation warning only? Not sure how you would return a 
deprecation warning on a GET within the spec.
If the client checks the schema or runs the validator they will also 
know it is deprecated.
It seems reasonable to me to return a PATCH deprecation warning.

> considering the number of
> implementations that we'd break if we did the cutover quickly, and
> considering the alternative hasn't existed very long (a matter of
> weeks it looks like).  Maybe I'm over/under thinking something here.
> 
>> Are our releases used
>> broadly enough and release process mature enough?
>> If it is not a replacement and just deprecating a property, can we just
>> drop the deprecated property immediately when switching to a new schema
>> version that deprecates?
> 
> I don't think so.  That would break clients, many of whom aren't
> connected enough to the mailing list, but would be broken all the
> same.
> 
>> Do we need to do the same when a schema is deprecated?
> 
> Depends on the schema, and I'd say we come up with this posture once
> it happens, and depending on impact.  For example, if they deprecate
> SessionService (something that every tool in the world uses) that's a
> very different posture than if they deprecate the Fan schema, which
> very few implementations actually implement in the client side
> correctly to the spec.
> 
>> This matters
>> because Redfish is targeting 2020.4 for new Power and Thermal Subsystem
>> Schemas. Redfish plans to deprecate the old Power and Thermal Schemas
>> and release new schemas.
> 
> In this specific case, I suspect a compile time flag would be my
> recommendation, because it's not just a pure deprecation, it's
> changing the meaning and intent of a lot of collections.  We already
> did this with the "single chassis" flag a long time back, and it
> worked quite well.  Those that wanted new behavior got it, those that
> wanted old behavior, got it.  It was a nightmare to maintain, but I
> suspect this changeover will be a little easier maintenance wise.

"single chassis" flag was a lot of work maintaining. I studied the new 
Power / Thermal schemas a bit more, they can coexist.
The existing Power and Thermal will be at .../Thermal .../Power while 
the new schemas will be at .../ThermalSubsystem  and .../PowerSubsystem.
I think this is better than a flag but can discuss later after.

>> I think it is reasonable we support both IndicatorLED and
>> LocationIndicatorActive for some time, I'll throw out 2 months.
> 
> Not nearly enough time IMO.  It takes longer than that for the spec to
> go from PR merged to a versioned API release.  

Not always, Redfish does 4 releases a year now and most of their merging 
is the last few weeks of their cycle.
Redfish also has a 30 day IP review which is prescribed by DMTF which is 
why it does take a month after they approve a release for it to be public.

> Some gerrit reviews
> alone take longer than that.  Also, supporting both for some time is
> trivial code-wise.  Are you just worried about the warning, or are you
> expecting a significant revamp of the LED stuff in the near future?
> 

Supporting both LED properties, sure, probably isn't a huge amount of 
work (I would not call it trivial though) but supporting both the new 
thermal/power and the old thermal/power schemas I think would be, either 
via compile flag or just both in /chassis. I am worried about the 
developmental and support costs of any "support deprecated properties" 
rule so would be more in favor of something more limited like support 
both new and deprecated for 1 release.

>> Our
>> Redfish implementation is young and I am not sure it is worth the
>> developmental and support costs, at least at this time, to maintain
>> deprecated properties and schemas for long.
> 
> In this case, I'm looking at what would be maybe 3 lines of code?

Disagree it is 3 lines of code. IndicatorLED is used in multiple places, 
you suggested a PATCH deprecation warning, and have to make both 
properties work.


> If
> redfish starts deprecating properties every other release, then I
> agree, that's not maintainable, but in this case, this seems
> unimportant.  One thing I would like to understand: it looks like the
> new property doesn't support Blink?  How is that handled in the new
> schema?

Redfish moved away from IndicatorLED (3 states) to 
LocationIndicatorActive (boolean).
More detail in the 2020.3 overview and several issues in the Redfish 
repo. The highlights are:

IndicatorLED improperly exposed hardware implementation details
- Redfish attempts to model usage semantics rather than physical 
characteristics
This caused interoperability issues discovered during Redfish Plugfests
- Some vendors use “On” as the active state, others use “Blinking”
- Some vendors use “Off” as the inactive state, other use “On”

> 
> It should be noted, OCPServerHardwareManagement v0.2.3 requires
> IndicatorLED;  Are we ok with breaking our OCP compliance more?

Where is it stated we need to support the OCP profiles?
The OCP profiles are the most well known but there are other profiles 
out there. Not all systems in OpenBMC are OCP. I don't think we have 
100% compliance today with the OCP profiles either?

> At this point in time, I'd rather not, so I'd like to see OCP also ratify
> the deprecation, and release a new version of their profile before
> anything other deprecation happens.
> 
> In this specific case, what if we did this:
> Now;  Upstream backward compatible LocationIndicatorActive property to
> bmcweb.  Upstream changes to OCP schema to also deprecate
> IndicatorLed.  Time starts counting once both patches have been
> accepted into their respective mainline branches.

The first seems reasonable. The second does not for the reasons stated 
above. I think before dropping a property that is required by an OCP 
profile we can have more discussion but I don't think getting upstream 
changes to the OCP profile accepted should be a requirement to starting 
the count down. If supporting OCP Baseline Profile / OCP Server Profile 
is a requirement, we should document that and probably test in CI.

You mentioned OCPServerHardwareManagement v0.2.3 which was released 
April 18, 2018. It is not clear to me if OCP plans to release new 
versions or when. Does anyone have insight into this?
Looking at 
https://www.opencompute.org/wiki/Hardware_Management/SpecsAndDesigns


> N+1 release;  Implement returning a deprecation warning to the user
> attempting to use the IndicatorLED PATCH API.
> N+2 release; Remove the IndicatorLED property from GET requests, but
> continue to accept the property for PATCH requests (we've done this in
> other cases).
> N+3 release; Disallow PATCH to that property entirely, and continue
> with new implementation.  Ideally hold the deprecation warning, but
> use judgement about technical debt.
> 

This feels too cumbersome.

I could get behind something like support for 1 release, ~6 months as a 
compromise:
Release N-1 - Only the (yet to be) deprecated property (e.g. 
IndicatorLED) is supported
Release N - Both the deprecated and new property (e.g. 
LocationIndicatorActive) are supported
Release N+1 - Support for the deprecated property is dropped


>> Clients can use the schema version to determine which properties are
>> available. If needed companies in a fork could maintain backward
>> compatibility for longer.
> 
> In practice, many clients don't check the schema at all.  I really
> wish Redfish had a way for a client to say "I support X version of the
> schema, give me the things compatible with that", but I'm not aware of
> anything like that.
> 

Thanks,
Gunnar
