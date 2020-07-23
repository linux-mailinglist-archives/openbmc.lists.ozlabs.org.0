Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078E22B325
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 18:08:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCHLR0THTzDrQv
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 02:08:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCHJS0YdRzDrQd
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 02:04:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NG3aYB009866; Thu, 23 Jul 2020 12:04:35 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fabxfd74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 12:04:35 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NFuHjs025801;
 Thu, 23 Jul 2020 16:04:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 32brqa0y7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 16:04:34 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NG4UXF65405338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 16:04:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 272C16A04F;
 Thu, 23 Jul 2020 16:04:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9858C6A047;
 Thu, 23 Jul 2020 16:04:32 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.74])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 16:04:32 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday July 22 - results
To: Ed Tanous <ed@tanous.net>
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
 <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <ad27b3c7-cb6e-3062-36a9-8f001bd6468e@linux.ibm.com>
Date: Thu, 23 Jul 2020 11:04:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_08:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230119
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/23/20 10:13 AM, Ed Tanous wrote:
> First off, if you are finding certificates are expiring in a
> production environment, you need to rethink your certificate
> replacement strategy.  The BMC cannot be the primary entity in charge
> of certificate replacement and revocation, and the fact that this is
> happening points to a greater organizational problem than the bmc can
> cover.
>
> One thing to note;  At one point, I had talked through how to
> prototype ACME protocol replacement of certificates automatically, so,
> given an ACME server on the network, the BMC could essentially
> automatically provision itself and keep its certs up to date.  If
> someone wanted to run with that, it might reduce some of the pain here
> (and be extremely cool).
>
> On Thu, Jul 23, 2020 at 7:24 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>
>> 4 Question: If BMCWeb finds an unusable HTTPS site identity certificate,
>> it DELETES it and self-generates one.  This has caused problems for
>> certificates that are not valid until a future date. In general, what
>> certificate management support should we have for BMCWeb?  What is needed?
> This is not how bmcweb was intended to work, and I had explicitly
> tested that it doesn't have this behavior (prior to it being moved
> over to certificate manager).  The only time it previously would
> replace a certificate was if the cert file didn't exist, or was
> completely unreadable.  I suspect the right thing here is to bisect
> the commit that broke this behavior (I'll bet it's easy to find) and
> get a bug filed with the author so they can either fix it or revert
> the patch.
>
> This one smells awfully suspicious: 082f28fd2588fd9fcd9452ad38234ce875319163.
>
>> ANSWER:
>> There were two discussion threads: The BMC’s notion of time of day
>> (TOD), and how BMCWeb should handle certificates.
>>
>> Does the BMC have a battery backed TOD clock?  Depends on BMC model.
>> Can it validate if it has access to its NTP server (when configured)?
>> Does the BMC know if its time was set correctly?
>>
>> How does the BMC know if the BMC has the correct time?  Have a BMC flag
>> that says, “Look like the BMC TOD clock is not working.”  Does the BMC
>> know if we got a good time from an  NTP server?  Can we read the GPS
>> signal?  What is the industry solution?
>> Should the BMC store its idea of what date it is?  So it can report if
>> the time changes significantly.  Or will this lead to a bigger problem?
>> Is it better/simpler to check for TOD = beginning-of-era-1/1/1970?  →
>> start an email thread
> The above is all asking the wrong question: "Can we determine if the
> certificate is valid?"  This is irrelevant, the question is: "Should
> we ever be replacing a user provided certificate with one generated on
> the BMC."  The answer previously has been no.  In almost all cases the
> user provided certificate, even an expired one, will still be better
> than one the BMC self signs.  Between having an invalid certificate
> chain, and an invalid date, I'll take the invalid date every time.
>
> It should be noted, most browsers (in my testing) seem to ignore the
> HTTP date header entirely, so the BMC doesn't even need the correct
> time to set up a proper encryption channel.

We weren't sure what question to ask.  Thanks for the discussion.

I sent a followup email with some better-phrased questions, but our 
email crossed.

>
>> BMCWeb configuration?  Configure option: delete cert and generate
>> self-signed -vs- use defective certificate.  What is the purpose of
>> deleting the unusable cert?
> This question needs answered.  I suspect this was unintentional, and
> someone simply used some bad openssl code to attempt to verify the
> cert against the (possibly non existent) chain without realizing this
> requirement.
>
>>   Should “out of date” not be part of the
>> “unusable” definition? ⇒ Ideas: 1. If bmcweb finds a usable cert but is
>> out of date, that cert can still be used.  2. Leave the defective
>> certificate (do not delete it) and log an error.
> A lot of BMCs don't have a dedicated RTC, and rely on other systems
> (like the PCH or NTP) to get the correct time.  bmcweb needs to come
> up long before the PCH or NTP (both of which are also optional) so as
> a general rule, using these for valid time is a non-starter.  I could
> see logging an error _if_ you know time is valid, but I'm not sure how
> a bmc could know that.
>
>> The group consensus was that BMCWeb should treat its HTTPS site identity
>> certificate like this:
>> 1 certificate is perfectly good - Use the certificate
>> 2 certificate is good but expired or not yet valid - Use the certificate
>> and log a warning
> Add "and we know time has been set appropriately".  Also, be careful
> with not yet valid.  I don't know how openssl chains handle clock skew
> between certificate generator and client.  If the BMC has a time
> that's 1 minute fast, is the certificate "not yet valid"?
>
>> 3 certificate is missing or bad format or algorithm too old - Use
>> another certificate or self-generate a certificate (and log that action)
> We shouldn't be replacing certificates unless it's completely missing
> (ie, we're on a first boot or a factory reset) and wouldn't be
> switching certificates on the fly.  If the algorithm is too old, the
> user is free to replace it with their own, which is the right
> procedure anyway.  We also have no idea if the user has added this
> public certificate to their local root store, so replacing it out of
> the blue might look like an attack.  Also, we have no idea if the
> users' client systems support the new crypto format.  We could be
> unintentionally DOSing them if, say, we turn on a new keytype or size
> and their clients don't support that key.
>
>> There are no cases where BMCWeb should delete any certificate.
> I think I know what you mean, but to be clear, we should delete the
> old certificates when they're replaced.  We should delete root trust
> store certificates when requested, ect.  I don't think we can say "no
> cases" here.

Correct.  I meant BMCWeb should not delete an unusable certifivate when 
it generates a new one.  Thanks for clarifying that.


