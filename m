Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97828F488
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 16:15:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBrsN2vwczDqQm
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 01:15:20 +1100 (AEDT)
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
 header.s=pp1 header.b=Xh4WC+az; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBrrF5WJ2zDqQk
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 01:14:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FE1ZbU151518
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=quKPAnrqNTIm9Xly7oddYt6kW+IBYetwwDgodSRSC1E=;
 b=Xh4WC+az0FHkxnBpvMD2ZSt0LpjOSBo0hI3kZUleuMlv8YHWYDKG3jcMwu/RN5U6yUcw
 5DBIpQBdQv27DPgbHJQEJFvCjz8Xj+7ErkF4UwG6+rh+BPjzAWEyjDfSohKsIF5QJVZ0
 A0l4vFVKb9tTdlO6pz4z4qSapH1SV3Oa1rUbBlXHDUAs6s2TwoLrmmWkdzol5fYpVpjg
 r7YR33mcCpzqMoGabsO5EtHMU76kSTFCzXgDdkugyZcpFtQ9gHrF9osueYpORPC61ep1
 5EFf9aFBPr62Nfd5D6b1nkLHMEKO4KdGCEtvWx+B/OxayVDV54SUeWFPuGIJ+408e6T9 AQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 346nb8x7jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:14:16 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09FECeWI029179
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 343y2tj9ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09FEEEdA4129530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C756A124058
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83F06124052
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:14 +0000 (GMT)
Received: from [9.80.201.12] (unknown [9.80.201.12])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 14:14:14 +0000 (GMT)
Subject: Re: Security Working Group Meeting - Wed 14 October - results
To: openbmc@lists.ozlabs.org
References: <CAC1Cx+sq1RM4YBnbbiKq1uJ-1bjdETj2u116cSzsd2vhSo2K7Q@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <0c8a7bd5-e437-6460-b309-c9146477e120@linux.ibm.com>
Date: Thu, 15 Oct 2020 09:14:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAC1Cx+sq1RM4YBnbbiKq1uJ-1bjdETj2u116cSzsd2vhSo2K7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_08:2020-10-14,
 2020-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150096
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

On 10/13/20 2:06 PM, Parth Shukla wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday October 14 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
>  1. (Joseph): Follow up from 2020-8-19: Gerrit code review: BMCWeb
>     webUI login change:
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/35457
>     Question: What are the security risks of using the proposed config
>     flag BMCWEB_INSECURE_ENABLE_UNAUTHENTICATED_ASSETS=YES?
>      1. Fingerprinting (leak information about the BMC’s manufacturer
>         and version).
>      2. Attackers have an easier time getting the code to find and
>         exploit security bugs.
>      3. May make DoS easier.
>      4. More?
>

Yes, those are the main risks we talked about.  And it seems reasonable 
for some environments to accept these risks.  We discussed 
fingerprinting, and the desire to minimize this surface going forward.  
We discussed how the Redfish standard requires files to have 
unauthenticated access to static files while the OpenBMC project has 
uses cases that don’t want to allow that, for example, discussion in 
https://redfishforum.com/thread/375/mtls-enforcement-openbmcs-redfish-implementation



> 2. (Joseph): Per 
> https://lists.ozlabs.org/pipermail/openbmc/2020-October/023530.html do 
> we agree on the approach?  What security categories seem most important?

The Microsoft, IBM, and Common Criteria schemes each have topics that 
seem appropriate.  No other high-level scheme was proposed, so we’ll go 
with these for now.

In particular, will someone please articulate topics from Microsoft 
Security Development Lifecycle (SDL), and we’ll add them to the list. TODO

It was agreed that the list of topics have information that can be 
leveraged by various security development processes.  For example, a 
team that uses OpenBMC in their project and wants to follow a security 
scheme/process/evaluation should be able to use these topics to find 
what they need in the OpenBMC project documentation.

We agreed in principle to organize OpenBMC security work to a subset of 
the topics listed.

Two subtopics were discussed:

2A. We reviewed the security reporting and bug fixing process.  
Specifically:

  *

    The OpenBMC security response team:
    https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md

  *

    This is what github advocates using:
    https://github.com/openbmc/openbmc/security/advisories

  *

    What tools do we use to:

  *

    Identify which open source pkgs are used in an openbmc build,

  *

    Identify security bugs in those packages, and

  *

    Ensure that we pull in fixes or otherwise mitigate the problem.


2B. Given that OpenBMC is a Linux Foundation project, what resources 
does the Linux Foundation offer?  Specifically, we want a private secure 
bug tracker for the OpenBMC security response team to use.

The following topic was added:

3. Anton update on privilege separation work

ANSWER:

Progress on ipmi-net & bmcweb -- working on dbus config, sockets; which 
areas to sandbox.

To make the migration work (changing from root user to another user), we 
will need to migrate the process’s environment, for example: bmcweb uses 
files in /home/root and it won't have permission afterward.

We discussed how to do the source bump to help CI go more smoothly.

> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> Regards,
> Parth

