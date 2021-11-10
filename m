Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992244CAB5
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 21:35:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqGp315Qqz2yPq
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 07:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNpKtBis;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hNpKtBis; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqGnc2Cslz2xsW
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 07:35:31 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAID8Xf010394
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hgy5HZWgjoW59LDGTz1IaRjlF35gqCmW/+ERaqxXB1M=;
 b=hNpKtBisOFTaCvYXs/Kr+N5gW63Sqa4vCGTM3mduIIbBgm1D6FUVsGoGbPBP4+jPv1f7
 wlmk3sIX7QI6lkdvnzHEJ+sdCZTLvUiSOaaQ9KMTnPFbE+17q6pDX/kb1y1TPoHnGFp5
 4GDsLRcAAiqWrguWOneC8XT6Ojbv7seoaw+yc8VzHII1sW2gAoLB3R+eIrpDE/2t7Guv
 dHna5cQbDqoz9N/imUUTpbKGrXmXvWdzCreM1MzWIl8W8HHgp2NkBIN7Jp1nvS/PGpGP
 QNGjqbDB3o1NPnAbeHV10NEfbZ9/1JvYx2vG4l/WnBgoWPcgrZ+oUTGnQpHmKxrKLroj 7w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8k5vb1jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:28 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKUmam025126
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3c5hbc7aqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AAKZQMN48693598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 591C1C6061
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04030C605B
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:25 +0000 (GMT)
Received: from [9.65.237.168] (unknown [9.65.237.168])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:35:25 +0000 (GMT)
Message-ID: <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
Date: Wed, 10 Nov 2021 14:35:24 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Security Working Group meeting - Wednesday November 10 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <4ea0015b-3280-c5b3-9f9f-c424046f23c9@linux.ibm.com>
In-Reply-To: <4ea0015b-3280-c5b3-9f9f-c424046f23c9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dO-JM6zc-i2pZhg06HOFH7haIAPrrjW8
X-Proofpoint-ORIG-GUID: dO-JM6zc-i2pZhg06HOFH7haIAPrrjW8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_13,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 mlxlogscore=990 lowpriorityscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100098
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

On 11/10/21 8:38 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday November 10 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attended: Joseph, Bruce, Vernon, James, Caci, Jiang, Dick, Ratan, Dhananjay


Agenda items discussed:

1 Next meeting Nov 24 “Thanksgiving eve”

Votes: cancel, cancel, cancel.  Agreed.  Someone else schedule a meeting?


2 Should OpenBMC become a CVE Numbering Authority (CNA).

Ref: https://www.cve.org/ResourcesSupport/AllResources/CNARules 
<https://www.cve.org/ResourcesSupport/AllResources/CNARules>

This would better integrate the CVE process with github.

OpenBMC looked into become a CNA years ago.  See the old review: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621>

Is it worthwhile for openBMC to become a CNA?  Yes, we have had multiple 
CVEs per year and believe this will continue.  We have filled out the 
form (at cve.mitre.org) to create CVEs and have become familiar with 
writing CVE language.

We agreed to pursue becoming a CNA.  No objections.  James will follow up.


3 Make progress on these competing reviews:

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48564 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48564>

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48633 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/48633>

Ensure we have a CI test for this.  TODO: Joseph to contact George on email.


4 The OpenBMC security response team (SRT) is working toward improving 
the way it handles private security vulnerabilities before they are 
disclosed.  (See notes from previous meetings.)

The repo https://github.com/openbmc/openbmc/security-response 
<https://github.com/openbmc/openbmc/security-response>was created for 
this, the idea is to make this private to the SRT members and  use  
https://github.com/openbmc/openbmc/security-response/issues to identify 
issues and track progress.

Open questions: What content should this repo have?

How to add content? Do  we  need  files?  Any private content? Web 
interfaces vs gerrit vs command line (git submissions?)

The README should have content like:

  *

    the purpose of the repo (to track security vulnerability issues for
    the overall openbmc organization before public disclosure).

  *

    the fact that the repo is private and access is controlled by the
    github @security-response team.

  *

    Link to
    https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md
    <https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md>

  *

    Instructions to use
    github.com/openbmc/openbmc/security-response/issues for new issues

Nothing in the README needs to be private.  The content which must 
remain private is in the issues.

Code reviews for fixes would use their own repo, and perhaps private 
gerrit review process, as stated in the 
obmc-security-response-team-guidelines.md.


The question for github is: What should a security response team (like 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md>) 
use to track private security reports before public disclosure?


The overall structure might be like this:

  *

    github.com/openbmc/openbmc/issues -- currently stores security
    advisories: search for “advisory”

  *

    github.com/openbmc/openbmc/security/advisories -- proposed place for
    all advisories; this is what github wants us to use.

  *

    github.com/openbmc/openbmc/security-response -- new PRIVATE repo for
    the SRT to track new security vulnerabilities toward closure


See

https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization 
<https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization>


Next steps:

  *

    Add github.com/openbmc/openbmc/security-response README -- see above
    for ideas

  *

    Create first low-sev issue in
    https://github.com/openbmc/openbmc/security-response/issues
    <https://github.com/openbmc/openbmc/security-response/issues>and
    ensure it is not accidentally disclosed via a Discord bot, an email
    bot, or any other way.



>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

