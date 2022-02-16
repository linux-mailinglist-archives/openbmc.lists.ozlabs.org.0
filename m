Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7624B9131
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 20:32:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzSl51xKxz3cN6
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 06:32:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k3CRGIpt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k3CRGIpt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzSkb3Vrnz3bc3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 06:31:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GJGPtc023844
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Nik/okr3tCT4v/i2jG1xCJxzApCxwehba06XEJn5tuw=;
 b=k3CRGIptVn20JT0c4Eqjbu6nhMyjkzlSii+TTMBjN0prJ/edbJe6Gki5O0TdwvNyuV1W
 yLy09d5O0EEAkiuGumVs1cJaL5DrVPiUmHkbLVHBCkEHjRXu1iCg4g7UDGOZR/tl26rY
 gXwV2rPxq3MZI2T1PwTjxWouLk2nbrIXjBzwB96qsJ8hylVDj19vGRhfK12ihXcexNfm
 z+IPIe3Az3JiCNlBQeq5eoDXYhtWh3hlRLrMweLX9RaIv0bu4GyhIkuKU9IrnWXGZ3uQ
 x5tXYEVBI3s+PjDRbxqdNt4Usho/Jq8ZIK2n+0dlIxIWmvEfL8tkGY/bIf0Xp3eie2lm 0w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e91gchaty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:29 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GJSFDr010552
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3e64hbq7h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GJVRO147317258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1252B205F
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3C54B2064
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:26 +0000 (GMT)
Received: from [9.65.84.126] (unknown [9.65.84.126])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 19:31:26 +0000 (GMT)
Message-ID: <cb1a8c54-5a5e-cc07-2f41-95c2036b4dc9@linux.ibm.com>
Date: Wed, 16 Feb 2022 13:31:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Security Working Group meeting - Wednesday February 16 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <ff7efbb5-029a-6b93-68d1-2bed292999e4@linux.ibm.com>
In-Reply-To: <ff7efbb5-029a-6b93-68d1-2bed292999e4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UG0spIEkV3hJ-CILcMfWusGMc8ttkuKR
X-Proofpoint-GUID: UG0spIEkV3hJ-CILcMfWusGMc8ttkuKR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_09,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=604 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160109
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



BONUS TOPICS:

2 Update on OpenBMC becoming a CNA.

James got CNA admin credentials, and is able to create test CVEs.

James is working on documentation for OpenBMC security responders who 
work to create CVEs .  James is working to document the process for the 
OpenBMC CNA to work with Mitre’s CVEs.  (For example, how OpenBMC will 
reserve CVEs and ensure they are published in a timely manner.)

Next steps: (1) Document process steps in openbmc/docs.  (2) Reserve 
CVEs for existing privately reported vulnerabilities.


3 Question: How does BMC respond to too many failed login attempts?

DISCUSSION: It uses (the deprecated module) pam_tally2 (and should move 
to pam_faillock).

See 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853 
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853>  
questions:

Background: 
https://github.com/openbmc/docs/blob/master/architecture/user-management.md 
<https://github.com/openbmc/docs/blob/master/architecture/user-management.md>

Note: The default is to not lock out users due to excessive password 
attempts.


Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

