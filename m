Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB504B924A
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 21:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzV520XTgz3bc6
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 07:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gN5HL38k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gN5HL38k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzV4Y4NR8z3bc3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 07:32:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GJGYNs024349; 
 Wed, 16 Feb 2022 20:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : references : to : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=En5CuvGxn/6eQ2V/biVEjN/fD83uFtkyAqXzU77ibGo=;
 b=gN5HL38kiH2X7ofDKBrZy3abMajxzrXP3jPe0VLvj0kDbX7vM/C+bbFWn0HoCiiLhvOO
 UFv6hya9fUkqSiT28tYKdOWGULLVfmaaL2+pkSVi1qxHDoYDTNx+jPskDyZXna5IXXUB
 Ubaez+knpbnzEnRx+89kE7AkD8S+XbZ+U01CfP1jlHlNfJ3dGnEMNDsckTJdW55/4Pji
 UBy8V9rB45Fjntirv2C9C+Pa+2AQna4FCYRgPg+GhGC+7M+u0UKNcXX42jYAK8o2nnZS
 F9j6xQwFblymBmJD/cclA7U/BYx8h0xcWN8/G2w/KCR95mXzkHEszJwvo8WcaN09s4xc 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e91gcjg6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 20:32:10 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GKGTDQ029045;
 Wed, 16 Feb 2022 20:32:09 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e91gcjg6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 20:32:09 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GKSDSM005901;
 Wed, 16 Feb 2022 20:32:08 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3e64hbr7ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 20:32:08 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GKW7mK21037350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 20:32:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88662B2073;
 Wed, 16 Feb 2022 20:32:07 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4581B206A;
 Wed, 16 Feb 2022 20:32:06 +0000 (GMT)
Received: from [9.65.84.126] (unknown [9.65.84.126])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Feb 2022 20:32:06 +0000 (GMT)
Message-ID: <41f57009-93da-2920-8074-40f8d146519d@linux.ibm.com>
Date: Wed, 16 Feb 2022 14:32:05 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Is priv-noaccess needed?
Content-Language: en-US
References: <cb1a8c54-5a5e-cc07-2f41-95c2036b4dc9@linux.ibm.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Deepak Kodihalli <deepak.kodihalli.83@gmail.com>,
 Ratan Gupta <ratankgupta31@gmail.com>, Tom Joseph <rushtotom@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <cb1a8c54-5a5e-cc07-2f41-95c2036b4dc9@linux.ibm.com>
X-Forwarded-Message-Id: <cb1a8c54-5a5e-cc07-2f41-95c2036b4dc9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pjNySMTfsaQdI8h-TCgnApsEkK9iW0l9
X-Proofpoint-GUID: c1Y7le-YMzQg2ik5ROqnK95LjCoe1jef
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_09,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=897 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160113
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

User manager and IPMI maintainers (and please forward to additional 
interested parties):

We are trying to understand how the NoAccess (priv-noaccess) role is 
used in OpenBMC.  See the discussion below, the gerrit review, and the 
IPMI questions.

What are the use cases?  What is this role used for?  If we need this 
role, let's understand why.  Otherwise, can we deprecate this role and 
remove it?

Joseph


-------- Forwarded Message --------
Subject: 	Re: Security Working Group meeting - Wednesday February 16 - 
results
Date: 	Wed, 16 Feb 2022 13:31:25 -0600
From: 	Joseph Reynolds <jrey@linux.ibm.com>
To: 	openbmc <openbmc@lists.ozlabs.org>



On 2/16/22 7:21 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday February 16 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

Attended: Joseph, Daniil, Dhananjay, Dick, James, Jiang


> 1.Do we need to discuss the concept and need for NoAccess users and 
> how they would be different from disabled BMC user accounts?  See 
> discussion in 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295 
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295>

DISCUSSION:

Does the project have any NoAccess (priv-noaccess) users?

Is noaccess needed to implement IPMI Callback users?

Note that we prefer to disable ipmi users, not change their role.

Can ipmitool be used to create a callback user?  If so, what role does 
phosphor-user-manager use for that user?

Is the IPMI callback role deprecated?  Can we remove it from OpenBMC?

Is callback needed to implement trusted system interfaces and 
sessionless interfaces IPMB?

...snip...

Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

