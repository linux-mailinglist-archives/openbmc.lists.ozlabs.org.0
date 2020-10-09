Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A22DC28900F
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 19:34:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7FYz637zzDqbX
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 04:34:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QbhRr6kH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7FXl5wgfzDqK3
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 04:33:26 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 099HXAHd007931; Fri, 9 Oct 2020 13:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=f6yGD7lQtvY2gmZPLKtCIe+VnMOKfLzDJ+Bu5hbDAN0=;
 b=QbhRr6kHcTGkUNm4tgef0sfD7qybjifgM6DwytX8N/eE4Tt5PHNxC/8y+z/fs1TWAXn9
 uth2xk+WWQZXuvwnZnRr3rZRGR2EOCjSkASftyHm7ymqpViW7i8WJtKACTPWjmdBqRqf
 ilKXYuMCNk3M6SChMxgx8amXNwUUc+HuGD1OXJ4Thsr48B9aZwX7B7F+72dEucIDozkX
 GD+lIMlJQ+TJYRzU4OP37PODAvczMyQs4GnvutN3JHoVdADXdZLk03EGjbPo7Kn/VWcb
 8lBppqc6Qj8Lh7gQNfLMvsCdFlo70UeKVnoAgSvC6RxAIx931K6l5uPDo9FtI6dIcr9E Rg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342u8mhyj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 13:33:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 099HVY58011373;
 Fri, 9 Oct 2020 17:33:19 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3429hq0qw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 17:33:19 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 099HXJuu44040518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Oct 2020 17:33:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD9AA112062;
 Fri,  9 Oct 2020 17:33:18 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0D2112061;
 Fri,  9 Oct 2020 17:33:18 +0000 (GMT)
Received: from [9.85.129.237] (unknown [9.85.129.237])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  9 Oct 2020 17:33:18 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: OpenBMC Learning Series - security
To: Openbmc <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>
References: <DDAFCC55-7CF7-469F-B3AA-F61459CCCCF3@fb.com>
Message-ID: <4d47eaf7-286e-b31e-acbc-d26f850b48f1@linux.ibm.com>
Date: Fri, 9 Oct 2020 12:33:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <DDAFCC55-7CF7-469F-B3AA-F61459CCCCF3@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_09:2020-10-09,
 2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090128
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

On 7/24/20 7:13 PM, Sai Dasari wrote:
>
> Team,
>
> Thanks to all volunteer speakers stepping up to share their expertise 
> with community. For speaker convenience, the sessions will be held on 
> two *TimeZones* (USA/PDT and INDIA/IST) on *Thursdays@10AM* starting 
> from 8/20 onwards.
>
> I encourage you to take a look at the shared doc @ 
> https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0FivEZJe_EyWs/edit?usp=sharing 
> for more information regarding this series. If you would like to see 
> more topics (either as speakers or new community members), please feel 
> free to add them for extending the topics in future sessions.
>
...snip...


Sai and the OpenBMC community,

Here is my big-picture idea to organize OpenBMC's security effort. I 
hope this material will guide the project's overall security effort, 
including the learning series.

I want to take this process one step at a time to help build consensus 
for my approach.

My big idea is to apply the world's best publicly available security 
schemes to the OpenBMC project.  Schemes like Microsoft Security 
Engineering, IBM Secure Engineering, and the Common Criteria evaluation 
have been developed over decades of experience and give us the most 
complete guidance for the OpenBMC project and its users.  We should use 
them.

Does this seem like the right approach?  See discussion in footnote 1.

These schemes have a lot in common.  For example, they all advocate for 
threat modeling, security testing, and development process steps like 
design and code reviews.  I am trying to get at that common portion and 
I would like to hear your ideas.

The elements of each scheme are listed in footnote 2 below.  Which of 
these seem most important?  It is so easy (and fun) to focus on security 
functions like authentication and transport layer security algorithms.  
But we might be served better by documenting BMC's architecture to 
understand where its weaknesses are, or making better security tests.  I 
would like to hear your ideas, and I can help sort them into the 
big-picture.


For the learning series presentation, I suggest picking up a dozen or so 
categories from below, including authentication and user management, 
testing and coding, documentation and threat models, incident response, 
etc.  Does that sound right?

- Joseph

## Footnote 1 - How we can use the world's best security schemes

I foresee several difficulties in trying to apply the schemes:
1. The project has not agreed to any particular security scheme and is 
unlikely to choose one, because...
2. Performing any security evaluation is expensive in terms of 
person-hours investment by subject matter experts and we have limited 
resources, and...
3. The big-picture security schemes apply to an entire IT project (like 
a server) while OpenBMC is only source code for one part of any such 
project, so we cannot apply the full methodology.

Why a big-picture scheme?  Security schemes that have a smaller scope 
will not take the project security to the highest levels.  The OpenBMC 
project itself should perform security work needed by various 
big-picture security schemes (such as listed above).  This includes not 
only features like transport security and authentication, but also 
documentation, evidence of design and code reviews, testing, and bug 
fixes, as required by big-picture secure engineering mandates.  Yes, the 
project does all that already, but that work does not have a security 
context.  I would like to help define that context.

Would it be helpful to show how more targeted guidelines from OWASP, 
OCP, and CSIS fit into the big-picture schemes?
[OWASP]: https://www.owasp.org/
[OCP]: https://www.opencompute.org/wiki/Security
[CSIS]: 
https://github.com/opencomputeproject/Security/blob/master/SecureFirmwareDevelopmentBestPractices.md

NOTE: This is a refresh of the effort started in the [security working 
group][] under the headings of "security assurance workflow" and 
"applicable standards".
[security working group]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group

## Footnote 2 - Elements of high-level security schemes

Here are three high-level security schemes.  Is this the right set of 
schemes?
I've started to break these down.

==> Microsoft Security Engineering
https://www.microsoft.com/en-us/securityengineering
Security Development Lifecycle (SDL)
Operational Security Assurance (OSA)
Open Source Security
(Will someone help articulate which elements apply to OpenBMC?)

==> Common Criteria
https://www.commoncriteriaportal.org/cc/
Functional requirements:
- Security Audit (audit logs)
- Communication
- Cryptographic Support
- User data protection
- Authentication
- Security Management
- Privacy
- Protection of the BMC
- Resource Utilization
- BMC access, Trusted paths
Assurance requirements:
- Document BMC architecture and configuration
- Development (architecture, functions spec, implementation)
- Internal representation (source code)
- Guidance documentation
- Life-cycle support
- Tests
- Vulnerability Assessment.
Note: I've annotated and substituted some terminology to make this more 
readable (for example, TOE means BMC).  Also, I've skipped over some 
topics and grossly oversimplified others.  My goal is to make this list 
understandable to the BMC community and the organize OpenBMC work so it 
can be understood by security folks who do not have a BMC background.

==> IBM Secure Engineering
ibm.com/redbooks: Security in Development, The IBM Secure Engineering 
Framework
Development process: protect source code, planing, testing
Product lifecycle management: vulnerabilities, fixes
Secure Engineering Framework:
- Education and awareness
- Project Planning
- Risk assessment and threat modeling
- Security requirements
- Secure coding
- Test and vulnerability assessment
- Documentation
- Incident response
- Supply chain

Includes https://www.ibm.com/trust/security-spbd
- Assessment
- Threat Model
- Code Scan
- Security Tests
- Penetration Test
- Vulnerability Management

