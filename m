Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C35251AD
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 17:55:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kzbvw0mC2z3c9C
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 01:55:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lm96k1uV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lm96k1uV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzbvQ3nrJz3bxS
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 01:54:57 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CFHuLM015356
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rP7U77gOCx/479aihsLeRgd9FdtB/S/0SPR5fEzLdEM=;
 b=Lm96k1uVTRwOCXuDy1qLThA3hfrdTOlhAhmbPUE6WFdZX3rYcbXxYX+T89tmdMxWvoNF
 dBzTijRijOrkPiWnS7YbzyBH/kR+ggDspm937MFqQgICOOVmEKJvxd50E0WGfH5ylUeR
 FcgTR74QcPvpTWHX7MK97MldWtkOSFbY6pulgmbVJ0K7yrCViMA/i+UbffI3lSPdAVln
 4k1T40j7VUWAcp/EDH1TuxN9HlRqGqbpfKIwJBXg+bjwHjXX0BV7YIBzIArkUiZ5bG94
 BwDVhKVmOPFRjFgE3idLwza4vELVpXoZiYmQC6vI4sN2uR9NN0r6VJ6RCqz4qvgR+2Ky Ng== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g14rh8sv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:54 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24CFlRdR012678
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3fwgdaccny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24CFsrTD44302660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11C74AC064
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6FECAC062
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:52 +0000 (GMT)
Received: from [9.65.238.111] (unknown [9.65.238.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 15:54:52 +0000 (GMT)
Message-ID: <5bf3bb06-5eae-e2b8-95cb-170b10c8d3e2@linux.ibm.com>
Date: Thu, 12 May 2022 10:54:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Security Working Group meeting - Wednesday May 11 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <2c32e77e-9f57-36f7-52da-15fa2d4ff17a@linux.ibm.com>
In-Reply-To: <2c32e77e-9f57-36f7-52da-15fa2d4ff17a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lUP7BGjE7_ZIGPeZUh1LG6JoXdEzXQ1y
X-Proofpoint-ORIG-GUID: lUP7BGjE7_ZIGPeZUh1LG6JoXdEzXQ1y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_12,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=725
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120075
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



On 5/10/22 9:51 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday May 11 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

Attended: (did not record attendance)


1 Dhananjay - progress on writing CVEs?

DISCUSSION:

James has credentials (as a CNA) to write CVEs for the OpenBMC project. 
TODO: Dhananjay and Joseph need to get credentials, then the response 
team to start working vulnerabilities through the new workflow, and 
approve the workflow.


2 Review D-Bus threat analysis is work in progress

DISCUSSION:

What bmc resources do we need to protect?

Idea: Push the authority model bmcweb has into the D-Bus layer.  That 
is, currently services like ipmi and bmcweb perform authority checks, 
and then use their root authority to invoke the D-Bus APIs.  The idea is 
for BMCWeb to drop from root to the user who is requesting the 
operation, and use that user’s authority to invoke the D-Bus API.  The 
D-Bus layer sould have to be enhanced to support this.  (It currently 
requires root to perform most operations.)


Protect interfaces which implement sensitive functions, for example 
mctp/pldm/spdm.  Or explain existing protection mechanisms.  For 
example: a bmc non-root user should not have the ability to run 
arbitrary spdm commands.  (The BMC should only ever use a subset of the 
commands.)


TODO Nirav Shah: Document BMC/host interfaces in a way similar to 
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md 
<https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md>as 
a way to get started with a model for what need to be protected.

For example: Both bmcweb and the network IPMI service both have user 
management functions, that is, they can create new admin users.  They 
use the phosphor-user-manager D-Bus interface to do this, and user 
manager uses Linux functions (useradd and usermod commands, etc.)  This 
model would help us systematically identify interfaces which need to be 
protected.


3 What is the current status of bmc secure boot?

DISCUSSION:

Progress to  date: Uboot  merged,  secure booting the Linux kernel


The design is under review here: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169>

Some discussion here: 
https://lore.kernel.org/openbmc/20220131034147.106415-1-andrew@aj.id.au/ 
<https://lore.kernel.org/openbmc/20220131034147.106415-1-andrew@aj.id.au/>


Some of the discussion related to system lifecycle (like how re-key the 
BMC, or how to temporarily disable secure boot).  TODO: describe use 
cases for system lifecycle.

TODO: Follow up on design review.

Ref: 
https://www.opencompute.org/blog/ocp-security-announces-version-10-specs-for-root-of-trust 
<https://www.opencompute.org/blog/ocp-security-announces-version-10-specs-for-root-of-trust>

Use case example: Example: Always enable first stage secure booting with 
no way to disable it: hardware checking uboot spl.  How to use secure 
boot jumpers?



-Joseph

> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

