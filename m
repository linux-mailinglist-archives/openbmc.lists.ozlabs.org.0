Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A5290B1A
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 20:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCYyk3N6lzDqpK
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 05:07:26 +1100 (AEDT)
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
 header.s=pp1 header.b=qIWINDkK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCYxr1ppczDqlh
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 05:06:39 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GI2xGk174439; Fri, 16 Oct 2020 14:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RVnZZcWlmdaBN+KdbzX6NekqV2hsqhCX3Fos7Al1MBo=;
 b=qIWINDkKHuHYErn/JCanpM+YP6z9ySshKmP4EDk1vVjSWudoLhzR0SXCcFWC0oJfH5GH
 cb2amSvs0Bgn0l50EhcE/RahczEF99Olm//Yp7vbIvbWIapUt1EwoR0gF69g1CvLH/RP
 sT7ITzXiC3ivFcdmn1309o+20xfHDVVy5GKLwJsxdUSIXe4dFY9aqoTPoYwB39s5nkPc
 1qj6J6M+xGToUbnzSoEALsOfsZFQ8p89pNI7Xadug+xYHjGKVrlWGn3EXe4ne69JbOPC
 BsDaXGDzj/Krnd+EoJy+VqZ3AlM0YmySYAV1lYfyV9lKchgXPt83Y2Y+W3s1CTZK0xTm Xg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 347gceg8xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 14:06:35 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09GHvwfu018304;
 Fri, 16 Oct 2020 18:06:34 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3434kahcrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 18:06:34 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09GI6Xmu54002128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Oct 2020 18:06:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA2EC124055;
 Fri, 16 Oct 2020 18:06:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51B65124052;
 Fri, 16 Oct 2020 18:06:33 +0000 (GMT)
Received: from [9.80.201.12] (unknown [9.80.201.12])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Oct 2020 18:06:33 +0000 (GMT)
Subject: Re: OpenBMC Learning Series - list of security topics
To: Lee Fisher <lee@preossec.com>, openbmc <openbmc@lists.ozlabs.org>
References: <DDAFCC55-7CF7-469F-B3AA-F61459CCCCF3@fb.com>
 <4d47eaf7-286e-b31e-acbc-d26f850b48f1@linux.ibm.com>
 <d44f321b-d0b9-11c9-010b-0335439db226@linux.ibm.com>
 <9bfccd5e-79ae-f1fb-6771-0514e3d1b2fd@preossec.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <f0738e3d-b3d2-9f0e-a8e7-6852053b532e@linux.ibm.com>
Date: Fri, 16 Oct 2020 13:06:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9bfccd5e-79ae-f1fb-6771-0514e3d1b2fd@preossec.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_09:2020-10-16,
 2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010160133
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

On 10/15/20 5:39 PM, Lee Fisher wrote:
> Looks pretty good.
>
> One thing I'm concerned with: dev -vs- sysadmin focus.
>
> You need to cover dev focus for OpenBMC dev. But you also need to cover
> run-time use, by sysadmins/users, including security automation.
>
> Don't have a single set of OpenBMC security guidance for both audiences,
> they are very different.

Lee,  +cc:openbmc email list

Point taken.  I agree.  I'll have separate topics for the system 
integrator and the BMC admin.  Along with the existing set of topics for 
the development community (coding standards, static scans, etc.).

I started a BMC configuration guide here: 
https://github.com/openbmc/openbmc/wiki/Configuration-guide
and have just now separated the build -vs- admin sections.  I'll use it 
to guide the presentation.

Thank you!

- Joseph

> For example, see how the NIST Secure Boot docs are for implementors
> *AND* users, but most users will navigate through all the
> implementor-centric docs for run-time guidance. Similar problem with
> DMTF Redfish docs, blurring implementors and users.
>
> Sysadmins/users will need a checklist of guidance and some
> security/update automation tools. At least one tool for security checks,
> and one tool for firmware updates. Vendors will work hard to screw up
> the tools, when trying to make their platform vendor-centric, so be
> careful of that.
>
> Thanks.
>
> On 10/15/20 11:55 AM, Joseph Reynolds wrote:
>> On 10/9/20 12:33 PM, Joseph Reynolds wrote:
>>> On 7/24/20 7:13 PM, Sai Dasari wrote:
>>>> Team,
>>>>
>>>> Thanks to all volunteer speakers stepping up to share their
>>>> expertise with community. For speaker convenience, the sessions will
>>>> be held on two *TimeZones* (USA/PDT and INDIA/IST) on
>>>> *Thursdays@10AM* starting from 8/20 onwards.
>>>>
>>>> I encourage you to take a look at the shared doc @
>>>> https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0FivEZJe_EyWs/edit?usp=sharing
>>>> for more information regarding this series. If you would like to see
>>>> more topics (either as speakers or new community members), please
>>>> feel free to add them for extending the topics in future sessions.
>>>>
>>> ...snip...
>>>
>>>
>>> Sai and the OpenBMC community,
>>>
>>> Here is my big-picture idea to organize OpenBMC's security effort. I
>>> hope this material will guide the project's overall security effort,
>>> including the learning series.
>> ...snip...
>>> For the learning series presentation, I suggest picking up a dozen or
>>> so categories from below, including authentication and user
>>> management, testing and coding, documentation and threat models,
>>> incident response, etc.  Does that sound right?
>> Sai, thanks for helping to push this forward.
>>
>>
>> OpenBMC community,
>>
>> We agreed [1] to a list "security topics" drawn from Microsoft
>> Security Engineering, Common Criteria, and IBM Secure Engineering. The
>> idea is that a project that uses OpenBMC and follows a similar
>> security approach should be able to find what they need in the OpenBMC
>> security topics, but the topics themselves are not tightly coupled to
>> any specific approach.  Then each of the OpenBMC security topics will
>> give whatever the project offers.
>>
>> [1]: General agreement at the 2020-10-14 OpenBMC security working
>> group meeting.  Notes here:
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
>>
>>
>> To clarify, I intend for these topics to be the organizing principle
>> for the security working group and the learning series.  I am not
>> announcing any intention to meet any guidelines, follow any specific
>> practices, or perform any security assessments.  One step at a time.
>>
>> Here is my initial proposal for topics.  This most certainly reflects
>> my bias.  Feel free to suggest corrections, changes, and additions.
>> - Education and awareness
>> - Threat model
>> - Code scans
>> - Security tests (includes dynamic scans and penetration testing)
>> - Vulnerability management and incident response
>> - Development process (include planning, designs, reviews, secure coding)
>> - Documentation (includes specs, architecture, designs, code, and
>> configuration) - see breakout below
>> - Incident response
>> - Guidance documentation (for downstream projects and for BMC admins)
>> - Supply chain (includes source code from Yocto and projects built
>> into the image)
>>
>> BMC security function documentation:
>> - Audit logs
>> - Communication paths
>> - Cryptographic support
>> - User data protection
>> - Authentication
>> - Security Management
>> - Privacy
>> - Protection of the BMC
>> - Resource Utilization
>> - BMC access, Trusted paths
>>
>> Excluded topics:
>> - Threat assessment - varies between use cases
>> - Supply chain (physical) - not applicable
>>
>> For the learning series presentation I propose one slide to motivate
>> why security focus is important, and another explain how OpenBMC
>> security topics relate to high-level security schemes and to more
>> focused guidance from OWASP, OCP, and CSIS.  Then slides for each
>> security topic.  My feeling is that even professional developers need
>> help to understand how everything relates back to security. :-)
>>
>> Let me know if you expect the learning series presentation to have any
>> specific content.
>>
>> - Joseph
>>
>>> - Joseph
>>>
>>> ## Footnote 1 - How we can use the world's best security schemes
>>>
>>> I foresee several difficulties in trying to apply the schemes:
>>> 1. The project has not agreed to any particular security scheme and
>>> is unlikely to choose one, because...
>>> 2. Performing any security evaluation is expensive in terms of
>>> person-hours investment by subject matter experts and we have limited
>>> resources, and...
>>> 3. The big-picture security schemes apply to an entire IT project
>>> (like a server) while OpenBMC is only source code for one part of any
>>> such project, so we cannot apply the full methodology.
>>>
>>> Why a big-picture scheme?  Security schemes that have a smaller scope
>>> will not take the project security to the highest levels. The OpenBMC
>>> project itself should perform security work needed by various
>>> big-picture security schemes (such as listed above).  This includes
>>> not only features like transport security and authentication, but
>>> also documentation, evidence of design and code reviews, testing, and
>>> bug fixes, as required by big-picture secure engineering mandates.
>>> Yes, the project does all that already, but that work does not have a
>>> security context.  I would like to help define that context.
>>>
>>> Would it be helpful to show how more targeted guidelines from OWASP,
>>> OCP, and CSIS fit into the big-picture schemes?
>>> [OWASP]: https://www.owasp.org/
>>> [OCP]: https://www.opencompute.org/wiki/Security
>>> [CSIS]:
>>> https://github.com/opencomputeproject/Security/blob/master/SecureFirmwareDevelopmentBestPractices.md
>>>
>>> NOTE: This is a refresh of the effort started in the [security
>>> working group][] under the headings of "security assurance workflow"
>>> and "applicable standards".
>>> [security working group]:
>>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>>>
>>> ## Footnote 2 - Elements of high-level security schemes
>>>
>>> Here are three high-level security schemes.  Is this the right set of
>>> schemes?
>>> I've started to break these down.
>>>
>>> ==> Microsoft Security Engineering
>>> https://www.microsoft.com/en-us/securityengineering
>>> Security Development Lifecycle (SDL)
>>> Operational Security Assurance (OSA)
>>> Open Source Security
>>> (Will someone help articulate which elements apply to OpenBMC?)
>>>
>>> ==> Common Criteria
>>> https://www.commoncriteriaportal.org/cc/
>>> Functional requirements:
>>> - Security Audit (audit logs)
>>> - Communication
>>> - Cryptographic Support
>>> - User data protection
>>> - Authentication
>>> - Security Management
>>> - Privacy
>>> - Protection of the BMC
>>> - Resource Utilization
>>> - BMC access, Trusted paths
>>> Assurance requirements:
>>> - Document BMC architecture and configuration
>>> - Development (architecture, functions spec, implementation)
>>> - Internal representation (source code)
>>> - Guidance documentation
>>> - Life-cycle support
>>> - Tests
>>> - Vulnerability Assessment.
>>> Note: I've annotated and substituted some terminology to make this
>>> more readable (for example, TOE means BMC).  Also, I've skipped over
>>> some topics and grossly oversimplified others.  My goal is to make
>>> this list understandable to the BMC community and the organize
>>> OpenBMC work so it can be understood by security folks who do not
>>> have a BMC background.
>>>
>>> ==> IBM Secure Engineering
>>> ibm.com/redbooks: Security in Development, The IBM Secure Engineering
>>> Framework
>>> Development process: protect source code, planing, testing
>>> Product lifecycle management: vulnerabilities, fixes
>>> Secure Engineering Framework:
>>> - Education and awareness
>>> - Project Planning
>>> - Risk assessment and threat modeling
>>> - Security requirements
>>> - Secure coding
>>> - Test and vulnerability assessment
>>> - Documentation
>>> - Incident response
>>> - Supply chain
>>>
>>> Includes https://www.ibm.com/trust/security-spbd
>>> - Assessment
>>> - Threat Model
>>> - Code Scan
>>> - Security Tests
>>> - Penetration Test
>>> - Vulnerability Management
>>>

