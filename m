Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19F42C8E1
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 20:39:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV1Y619ykz2ypD
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 05:39:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZxlDFzr3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZxlDFzr3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV1Xd2WbSz2yPG
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 05:39:28 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DGZMlG022152
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 14:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=r6FiT2KbKk2mv5VAzPWCAe2bZwBXuCeeqiLJnNOHFKM=;
 b=ZxlDFzr3OQPsFqRouzvkTvmkv25nXJ5Mx9khBBxfDGf4j4JUytpaKhgVo+34U3oLeKFZ
 4g+xw7L2P/nkvSiF6KK/KXq7FmFIpCcwpot5mL74qYHk/HK5r/K4ziRfEF8AgUQYwIzA
 tL4CAuRDjxqAmRRBkghJJB4EuARQZlKmz1yg9LLjKxn2FS31HyozcWyHlFPx3GmWZ5XV
 p7ZMYiApfNVL0pVJICV99ln8WOToVwc5SoHWmM1V/mbM5QBVKsAikywR66YviqcizKOu
 0WlIYRSiLcNZj29pyRKtS/IjJ8RuGzaZ34OM0pUHCunB9PGtEb8uuk1z0kESelmfMsZ4 +Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bns3fhfy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 14:39:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DIYSZV003869
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3bnm2dwym2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:24 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19DIdNq014352876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 310D16A051
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEB0D6A047
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:22 +0000 (GMT)
Received: from demeter.local (unknown [9.160.18.190])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 18:39:22 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday October 13 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <941f901c-dd49-5048-18d0-ace26e0978d8@linux.ibm.com>
Message-ID: <5e0f20df-c761-eff3-bde8-92aeded66ddb@linux.ibm.com>
Date: Wed, 13 Oct 2021 13:39:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <941f901c-dd49-5048-18d0-ace26e0978d8@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rjPCnU-2q8NaAmDwp5IGMiVvwOxEvFP0
X-Proofpoint-ORIG-GUID: rjPCnU-2q8NaAmDwp5IGMiVvwOxEvFP0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_06,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110130113
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



On 10/13/21 8:11 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday October 13 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1.
There were no topics when the meeting started.  We discussed 5 items:

Attended: Joseph Reynolds, Bruce Mitchell, Vernon Mauery, mbhavsar, 
Jiang Zhang, pravisash, James Mihm

1 CVE-2021-39296 is already publicly disclosed.  OpenBMC is ready to 
disclose.
Here are the existing public disclosures:
* http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39296  
* https://www.ibm.com/support/pages/node/6495437  
IBM PSIRT - https://www.ibm.com/trust/security-psirt
ASPEED Linux kernel patches are made regularly.
We discussed the desire to improve the OpenBMC Securty Response Team’s 
(SRT) coordinated disclosure.  Specifically, OpenBMC disclosed first, 
then whatever products which are built on OpenBMC disclosure the saem 
day and refers to the OpenBMC disclosure.

We agreed to publish advisories on 
https://github.com/openbmc/openbmc/security/advisories
TODO: Joseph to make this work, and look into creating the 
https://github.com/openbmc SRT team

2 Question about ipmi suite 3. This was removed: see notes 2020-04-29 below.
Existing ipmitool users can adapt in one of two ways: invoke ipmitool to 
use cipher suite 17 (`ipmitool -C 17 ...`) or use the latest ipmitool.
Was this change in the release notes?  Yes, here: 
https://github.com/openbmc/docs/blob/master/release/release-notes.md#security-audit-results-1 

The link to the latest ipmitool source is here: 
https://github.com/ipmitool/ipmitool/ sha 
7772254b62826b894ca629df8c597030a98f4f72 April 2018

3 We discussed “password over IPMI over DTLS” from before.
Email excerpt Oct 5, 2021 “SPAKE, DTLS and passwords + aPAKE and SCRAM”:

    Weakness of SRP (Secure Remote Password):
      - Server spoofing, there is nothing that prevents a server from
    being spoofed.
      - Widely adopted with very little proof of being cryptographically
    secure and has been shown vulnerable to pre-computation attacks 
      - No feasible way to check for password complexity in the protocol
    (true for most aPAKE - asymmetric Password Authenticated Key Exchange)
      - Some debate over if actually provides forward secrecy.

    Recommendation to look at at OPAQUE aPAKE:
    https://blog.cloudflare.com/opaque-oblivious-passwords/

    Suggestion to use SCRAM
    https://en.wikipedia.org/wiki/Salted_Challenge_Response_Authentication_Mechanism



The SRP Server spoofing weakness is fully compensated for by the IPMI 
protocol which prevents spoofing, so is not an issue.  The other items 
apply.  We’ll continue to study this.

4 https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756 BMCWeb 
“Fix authorization rules” was mentioned in passing

5. USB control was continued from the previous meeting
Use case: UPS power supply plugged into USB port, uses RS-232 protocol.
Threat: Physically present attacker plugs in a USB device which says it 
is a UPS which lost power and will drop immediately so the BMC can do an 
orderly shutdown.  [Never mind that same attacker can just hit the power 
button.]
In this case, do we want to (1) ignore the signals from the UPS, or (2) 
read and log the signals but take no action.
In a hypothetical BMC systemd service to serve a UPS, if we wanted to 
disable it, would we (1) stop the service, or (2) reconfigure the 
service to continue to log signals but not take action.  Which approach 
is better?

BMC hardware SuperIO provides USB port capability.  Are there any other 
use cases within the OpenBMC community for BMC USB ports?  Is this an 
IBM-only use case?


>
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

