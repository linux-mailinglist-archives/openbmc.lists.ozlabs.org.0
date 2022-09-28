Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D4E5EE4B6
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 21:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md5Sf6sR3z3c38
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 05:01:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YviKxnwB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YviKxnwB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md5SF1q2rz2xb4
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 05:01:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SHEAnj020403
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=5i4cmijYpHAaV3tnwjxnt+6hepAD23mIOy0RTGMqyZY=;
 b=YviKxnwBA6U19KPR0pLaHRBjGqBd0PrJa8mAE9UtV26Y7Wz4Oitnc3BZKEzen+h+VV9K
 sNiucZCRqnTZyV5zrOr6AUgXKtPepnwXE2x/PDhN7z96MvrymCafmfPCqbovzNGpRuhC
 xRyW1io76g/inXi3aUFK0R/pKfHs38CZtQe+/xqrGNHMtVqcQ5fK1s1WQno5wKKyppeF
 Si6rJq1LT4jUEnmUVJ58ryWa7Qx5JZlGkwbY+2g89kgwhUA1AjQxOrfkYt7ZnVnVw5d3
 yjjZe6VJtT/ps38BkN41jenXBNeJYF6QKZ5jsoOfEQvCZkAcURx/Ug4/X10p4SKXN1lR Yw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvsa65882-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:07 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SIpFC9009638
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:07 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma05wdc.us.ibm.com with ESMTP id 3jssh9vy6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SJ16Qx3408556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:06 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 977DC58081
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:05 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 575735805F
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:05 +0000 (GMT)
Received: from [9.65.232.132] (unknown [9.65.232.132])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 19:01:05 +0000 (GMT)
Message-ID: <aae9113e-ad6d-d435-1b90-bbf558588065@linux.ibm.com>
Date: Wed, 28 Sep 2022 14:01:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday September 28 - results
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YOdCXNndZPu_KqV4XQ8enTzSyo3XTfOC
X-Proofpoint-ORIG-GUID: YOdCXNndZPu_KqV4XQ8enTzSyo3XTfOC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_07,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280109
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

There was no reminder for the Sep 28 meeting.  Here are the results 
as-if that reminder was sent.

> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 18 at 10:00am PDT.
>
>
> ATTENTION - Venue Change.  The meeting recently moved to Discord 
> voice.  Please update your calendars.
>
> === MEETING ACCESS ON DISCORD VOICE  ===
> First, join Discord via https://discord.gg/69Km47zH98 
> <https://discord.gg/69Km47zH98> and confirm via email.
> Then, to join: navigate Discord > OpenBMC > Voice channels >  Security 
> ~ https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Meeting held 2022-09-28
Attendees: Joseph Reynolds, Dick Wilkins, krishnan, russWilson, ddaniil, 
RuudHaring, dsp, YutakaSugawara, edtanous, skoteshwara, radsquirrel.

1 Question about user management over interfaces: Redfish, IPMI, SSH.  
And related password management (change expired password with same 
password).
DISCUSSION:
https://github.com/openbmc/docs/blob/master/architecture/user-management.md 
<https://github.com/openbmc/docs/blob/master/architecture/user-management.md>
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md 
<https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md>
Please followup by re-asking in public forum: email, discord…
Please push changes for better project docs.

2 Measured boot.
DISCUSSION:
Port Facebook Measured boot to openbmc
Also need work from uboot community , and  revisit openbmc’s uboot fork 
(and update to newer version) -or- use uefi boot
Follow Up in gerrit review.

3 General issue: firmware image size limits. New features require more 
space.  There is an ongoing need and effort to reduce image size by 
removing unused pieces.  New features which consume image size must be 
configurable (out of image by default).
To help find how much space a change takes up, see 
https://github.com/openbmc/openbmc-tools/tree/master/rootfs_size 
<https://github.com/openbmc/openbmc-tools/tree/master/rootfs_size>

4 (Joseph:) Can BMCWeb require additional authentication for sensitive 
operations (like changing a password)?
DISCUSSION:
See Redfish public discussion: 
https://redfishforum.com/thread/540/additional-auth-sensitive-operations 
<https://redfishforum.com/thread/540/additional-auth-sensitive-operations>
See previous discussions in discord, email list.  Example: 
https://lore.kernel.org/openbmc/959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com/ 
<https://lore.kernel.org/openbmc/959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com/>


Joseph

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
