Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D16597796
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 22:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7K1Y69Y2z3c6v
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 06:12:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q9LGzdjh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q9LGzdjh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7K133zv1z3bZc
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 06:11:51 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HJkwBI002071
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iVXThGd5JLZKTIp2SbkgkBXxIO4o88AxYSrsWpHw2UI=;
 b=Q9LGzdjhshoNh4Az0Wl7IdJd0L+SX1mIo3PP2P5SmrnNq3q/r+QWT1FyiH5Ww7IRj7r0
 5o7ZtopR8o7yrXjy5259hQ4tTLtezjh/S+8q2IIWXajCiWpfSWVaO5NxMYWyWyoLj0NJ
 KPdQhlglsHCCGhmhCLveZDytWEjt1c/HTVxN0sMazqJJi40K/6jZP7ImdqRuWTfapPt3
 vsTJ3Dv1lXd5apN1INeBv59GzIwucZvG8TjjXO22eWJdhdv45tZrQve0R708bC7jb94d
 SZIAphwe2dp08nUGxJ/2649kAsOeEd2LuQAN5bxEG+LTt837GRsG/UMB9nb6jT1py1o4 7A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j16smrpxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HK5txC025900
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma02wdc.us.ibm.com with ESMTP id 3hx3ka2p35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HKBl899306858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E36124054
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58A29124052
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 +0000 (GMT)
Received: from [9.160.40.68] (unknown [9.160.40.68])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 20:11:47 +0000 (GMT)
Message-ID: <c002db20-f047-b4aa-1137-a9cc96048706@linux.ibm.com>
Date: Wed, 17 Aug 2022 15:11:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday August 17
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
In-Reply-To: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yzyA1iIALy41cwB73AtNEmFBgwsLbRXK
X-Proofpoint-ORIG-GUID: yzyA1iIALy41cwB73AtNEmFBgwsLbRXK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_13,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170075
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

On 8/16/22 10:07 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 17 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

I added topic 0: Move the meeting access from ebex to discord voice.
I combined topic 4 (how to submit proof-of-concept exploits) into topic 2.

Attendees: Joseph Reynolds, Yutaka Sugawara, Ruud Haring, James Mihm, 
Dhananjay, Krishnan Sugavanam, Sandhya Koteshwara, Dick from Phoenix, 
Chris Engel, Paul Crumley, Mark McCawley, Angelo Ruocco, Daniil, Robert 
Senger.


0 Move the next meeting access to Discord?  Discord > OpenBMC > Voice 
channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>

Yes, agreed.

The next meeting planned for 2022-08-31 will be on discord.


1 Measured Boot.

DISCUSSION:

Single design or separate designs?  Let’s have separate designs:


1a. Enable measured boot: Kernel Device driver is available. Collect 
measurements into TPM.  See 
https://review.trustedfirmware.org/q/measured-boot 
<https://review.trustedfirmware.org/q/measured-boot>


1b. Enable attestation: use the Keylime-Agent REST server on default BMC 
port 8890.

Design Question: Keylime vs Redfish vs other (VMWare is not OSS, Intel’s 
design is proprietary).

Design Question: what gets measured by the TPM?  Follow the TCG 
standard. 
https://trustedcomputinggroup.org/resource/tcg-server-management-domain-firmware-profile-specification/ 
<https://trustedcomputinggroup.org/resource/tcg-server-management-domain-firmware-profile-specification/>

Design question: when and how to init the TPM?  This is partly in scope 
to community project, but some parts will depend on hardware outside the 
scope of OpenBMC.

Root-of-trust Issue: Does BMC hardware (for example, the next ASPEED 
AST2x00 BMC hw) init the TPM and measure the Uboot image?  ⇒  Or does 
Uboot init the TPM?  Can ew use a FIP image?

Pre-req design: the measured boot design requires the signatures 
provided by secure boot.


2 CVE Response.

DISCUSSION:

Add guidance to 
https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md 
<https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md>for 
submitting proof-of-concept exploits. How to ensure the exploit is not 
harmful to the recipient , and is not tagged by the email sanitizers?   
Encrypt? Or quoted with: > text  Or add to the security advisory?

We are still working on:

  *

    Github repo maintainers need to create security tabs so they can
    handle security advisories.

  *

    Proposal to restructure repos

  *

    Which CNA to use?  The Openbmc CNA vs the github CNA?


3 FIPS compliance.

DISCUSSION:

Note that OpenBMC is not the kind of thing which can be FIPS compliant.  
The way it works is this: a system “built on OpenBMC” seeks FIPS 
compliance.  As part of the compliance process, they need to ask 
questions about the portions of the system which OpenBMC provides, 
therefore the OpenBMC project needs to answer those questions.

FIPS reference: https://en.wikipedia.org/wiki/FIPS_140 
<https://en.wikipedia.org/wiki/FIPS_140>

The way I (Joseph) see the next steps are:


3a. What FIPS requirements apply to the BMC?  Note that some FIPS 
requirements will not apply to the BMC and will apply only to the 
overall system.  (OpenBMC does not need to address those requirements.)  
The work is to go through the FIPS standards, and list which 
requirements apply to the BMC, and if needed, how they apply.  For 
example, the BMC is part of the management component of the system, and 
the FIPS requirements apply to the management subsystem.


3b. Given the requirements from the previous work item, what can the 
OpenBMC community say about them?  For example, if OpenBMC documentation 
shows how a default build of OpenBMC would pick up some code or 
configuration to satisfy the requirement, that would go a long way to 
help the FIPS evaluator.  More specifically for example, the BMC does 
provide role-based authentication to help satisfy the FIPS requirements.


3c. Create a new openbmc document to capture the answers above.  This 
document use case is as a starting point for the information someone 
needs when they are working to FIPS-certify their system and try to roll 
down the FIPS requirements to their BMC.  A secondary use of this 
document is to identify any gaps in BMC security function.


BONUS TOPIC:

4 SELinux design.  Request for re-review. 
https://gerrit.openbmc.org/c/openbmc/docs/+/53205 
<https://gerrit.openbmc.org/c/openbmc/docs/+/53205>

Advice on how to create interest in re-reviewing a design.  Use Discord: 
Ping specific reviewers and ask specific questions about design issues, 
if it is solved; ask if the design can be approved.



Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

