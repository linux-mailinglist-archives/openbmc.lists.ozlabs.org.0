Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FBD2A0FFC
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 22:07:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNFHn1CcBzDqwt
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 08:07:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kvD2H0NZ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNFGf6WqdzDqwB
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 08:06:17 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UL2wLB081046; Fri, 30 Oct 2020 17:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y7vl2YTTFkaxp17BXFv7No7bGETVTHHPvnyPtSQzWPU=;
 b=kvD2H0NZsLhC8K0TCDTXo+MypkO6iKZ+3VmVVtklo8hXL4MX9n2ZYY+YAU9SYZKxHgIw
 uIOMYe1B2r6g6KPcIeM8GxJaZCHAHfWTuAD+QKJ3CxezbCvIMS7CdyIj0HNrF+X8vCJ7
 Mwr7j2NkHj03Jq6TK2XtuMTpCj2Z64pAhLg5r9czPWF6TOho+pVsKHmdWVNeFcf6fMrj
 vKZs/k9fByPiCBsVHnbEbZcQizvfY9IYAPCrjsCAhgKvZSm/Y96OBCNLqQlAonGL3NRq
 sRE1OZslDcN17Nr4vEcVzrN6FV6Dw4+6hS9+SWNj5X+ZERPufb7IPH3RScgDsZtDnldV CQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34grkck0nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 17:06:13 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09UL1GPV028431;
 Fri, 30 Oct 2020 21:06:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 34e1gpn9b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 21:06:12 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09UL6BBA60293414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 21:06:11 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFC936E054;
 Fri, 30 Oct 2020 21:06:10 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3582E6E04E;
 Fri, 30 Oct 2020 21:06:10 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.156.122])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Oct 2020 21:06:09 +0000 (GMT)
Subject: Re: bmcweb logging
To: Ed Tanous <ed@tanous.net>, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
References: <1d95c6ac-7341-d7dd-5154-fa6457b4c97c@linux.vnet.ibm.com>
 <CACWQX83WMMWs2qFaYhtJm0r0XBTcdUdbgsiFL7h1GT0jhW1GEQ@mail.gmail.com>
 <36c2d0c1-b1a1-3ea9-01b4-34611dff4426@linux.vnet.ibm.com>
 <CACWQX81EusRC6faFN5uB6_qp+nHcsrXb9_8WLunMq+GuMK4vng@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e3f096eb-32fb-07a8-6b7b-8a489f38333d@linux.ibm.com>
Date: Fri, 30 Oct 2020 16:06:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CACWQX81EusRC6faFN5uB6_qp+nHcsrXb9_8WLunMq+GuMK4vng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_10:2020-10-30,
 2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300152
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
 a.kartashev@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/30/20 10:17 AM, Ed Tanous wrote:
> On Fri, Oct 30, 2020 at 5:24 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>> On 10/29/20 9:52 PM, Ed Tanous wrote:
>>> On Thu, Oct 29, 2020 at 8:47 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>>>> Hi Ed,
>>>>
>>>> I was having issues in getting the logs from bmcweb repo, If I don't
>>>> define the compiler flag(BMCWEB_ENABLE_LOGGING) then it doesn't get me
>>>> any logs in journal(not even error log) and if I define the compiler
>>>> flag then it gets too much debug info.
>>> What's your limit for "too much"?
>> around 30+ traces for each Redfish request.If we enable the bmcweb
>> logging, with that  journal is full of bmcweb traces.
> You've answered what bmcweb does today;  I asked you what the limit
> should be.  5 per request?  10?.  Personally, 30 prints for a single
> request is exactly what I would expect.  There are roughly 30 things
> that happen for every request, any of which can go wrong, and when
> stalls happen, it's good to know what the last thing was.  If you're
> trying to debug new handler code that can assume the core is handling
> things correctly and has no bugs, I could see that as being about 10
> more than you'd need, but as someone that has to debug core
> regressions quite a bit, having that information is quite helpful.
>
>>>> Seems it happens because we have hardcoded the logelevel  and there is
>>>> no way through which we can change except making the change manually in
>>>> the following place.
>>>>
>>>> https://github.com/openbmc/bmcweb/blob/master/http/logging.hpp#L93
>>>>
>>>> Suggestion is we can define another compile time flag for log level and
>>>> use that log level at the above line for type of logging , by default
>>>> logging should be enabled with error log level.
>>> Thusfar, we don't really have a definition of what kind of detail
>>> should be included at each log level, nor are we consistent about
>>> setting the log levels.  If it's important to you, and you want to put
>>> together some patches, we certainly could define the log verbosity,
>>> but we'd also have to come up with better definitions for what level
>>> each log needs to take, and be more consistent about it.
>> We have different log levels in bmcweb like error, critical, info,
>> debug, but what is missing is we don't have some compile time variable
>> to control it( currently it is either full or none.)
> Error critical and info are used roughly interchangeably in code, and
> we don't have a good definition of when to use each one.  It should be
> noted, it's a 1 line fix to set a lower verbosity;  Have you tried
> setting a lower one?  Did it give you the result you were looking for
> on old code?
>
>>> IMO, that level of log granularity was never that valuable to debug,
>>> my thought being that if I'm enabling logging I don't care about
>>> performance, so the more logs the better.  When reproducing a failure,
>>> there doesn't tend to be a lot of logging present, and it's easy
>>> enough to find what you want, but maybe you had a different
>>> experience?
>> Yes, I had a different experience in the recent bug where the failure
>> was intermittent and it was happening only after running the regression,
>> when I look into the log, not a single trace was there.Hence I thought
>> that atleast the logs which is being marked as error(BMCWEB_LOG_ERROR)
>> should have been written to the journal.
>>
>> Say In production if we find some issue and we ask for the journal then
>> journal will not be useful as it will not be having any traces to debug.
> Agreed, but that's not what the bmcweb logging framework is designed
> for, nor is it really in any webservers that I'm aware of.  What it
> sounds like you're looking for is an access log and an error log,
> similar to nginx, which is capable of running all the time and logging
> a minimal subset of a request.  bmcweb doesn't have that today.

+1 for the notion to separate the error logs and audit logs. <turns to a 
slightly different direction>

I believe OpenBMC should have an audit logging service per NIST SP 
800-193 "Platform Firmware Resiliency Guidelines" > "Event Logging".  
These are needed for platform and security administrators.  This log 
would record specific high-level events such as:
- Authentication attempts (requester, account, outcome, etc.).
- Attempted access (such as REST API operations that require privilege 
higher than ReadOnly and operations other than GET or HEAD).
- BMC rebooted.
- Host power state changes.
- Etc. (many more).

Many of these events are generated by BMCWeb, but others come from 
various daemons.  So IMHO this is an OpenBMC-wide opportunity.

Other folks need even more different logs.  For example, see 
https://github.com/ibm-openbmc/dev/issues/2008

- Joseph

References:
NIST.SP.800-193: 
https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-193.pdf

>
>>> Long term, my intent was to just get rid of the various verbosities,
>>> and make logging ON or OFF in the code, and downgrade to a single
>>> macro, but if you see a need, we could certainly go the other
>>> direction.
>>>
>>>> If there is a need user can play with new compiler flag for more verbose
>>>> logging.
>>> I don't personally see the need, but if it would help you, I don't
>>> think it adds much complexity to do it, and I'd be happy to review
>>> your patches.
>> Sure, I would be pushing the patch for the same.
> Cool.
>
>>>> Am I missing something in usage of logging infra?
>>>>
>>>> Ratan
>>>>
>>>>
>>> Just to be clear, you're using logging in a debug context, correct?
>>> If we're trying to use this to define an access log, that's a very
>>> different problem space, and the existing logging infrastructure would
>>> be poorly suited for it.
> It'd be helpful if you had answered this, although I'm starting to get
> a sense of what you're looking for.

