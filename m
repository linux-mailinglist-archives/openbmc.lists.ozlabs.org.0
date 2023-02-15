Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE969843F
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 20:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH78r2Sbkz3cfX
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 06:16:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyWyMmnw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyWyMmnw;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH78C1BVHz3083
	for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2023 06:15:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FJDcfg017817
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=YqbzQOeTEdp4IK2aFYnnM0vIwG+cMZ/LMDOWwjprv44=;
 b=lyWyMmnw//eXAxanUGDBvPcxLnfLfp14xeWJmJ1KRRRsHeWSEO+tXJjlwF+63F23Wg67
 9JrLj+upL+NGUkAwLE72UHWyd++qzjDCyEvtDDQSu2J2SKEplW40pJJJlRSzRrLdPnd2
 k2LLNfqILBOLxfIh/kevOFwKjqnngQk8C8CtfeJKBzCbnbE0+M4IRRZYUXTlXUDReVIn
 UcvvrIcY8RRzJwiIhMHy9pqJBygq3/oD7XmBB+i1I+SHQa6uenkLdd9D/7OPeGIQawr3
 Id34ZjUSW4Zc04R9bmv6FHbXPERzJ4wcnZtLenGx0F+wkAKJuf336AJ9J0dnkv+8vOT1 PA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns4gv26p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FIiFG6007056
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:34 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3np2n7caxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:34 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FJFXia31719734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:33 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 354555805E
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:33 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED33158056
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:32 +0000 (GMT)
Received: from [9.160.121.126] (unknown [9.160.121.126])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 19:15:32 +0000 (GMT)
Message-ID: <15bc9481-bec7-af3f-56d9-9748433bb1bd@linux.ibm.com>
Date: Wed, 15 Feb 2023 13:15:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday Feb 15 - results
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aC3jCAVgfCHZEQHLExuE5sPgV9kh8qKn
X-Proofpoint-ORIG-GUID: aC3jCAVgfCHZEQHLExuE5sPgV9kh8qKn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_10,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1011 mlxscore=0 phishscore=0 adultscore=0
 mlxlogscore=920 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150165
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

An OpenBMC Security Working Group meeting was held on Wednesday Feb 15 
at 10:00am PDT.
A reminder was not sent.

MEETING ACCESS ON DISCORD VOICE
First, join Discord via https://discord.gg/69Km47zH98 
<https://discord.gg/69Km47zH98> and confirm via email.
Then, to join: navigate Discord > OpenBMC > Voice channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>

Access and notes about the Security Working Group are in the OpenBMC 
Security wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

The meeting agenda and minutes are in 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
items proposed on the Discord OpenBMC #security channel, and anything 
else that comes up:

Attended: ddaniil, Dick Wilkins, RuudHaring, skhoteswara, cacih, Daniil 
Engranov, James Mihm, Joseph Reynolds


TOPICS:

1 What security guidelines do we have?

DISCUSSION:

For BMC firmware builders, installers, and BMC admins, see

https://github.com/openbmc/openbmc/wiki/Configuration-guide 
<https://github.com/openbmc/openbmc/wiki/Configuration-guide>

Interest in adding topics for: Build > bmc secure boot and for 
attestation.  ← Please edit these into the wiki, referencing project 
docs as needed.


We should have a threat model so the above-mentioned people know which 
security features to enable or configure.

Consensus was to create a new wiki: Threat Model Topics

Purpose: Collect existing thoughts about threats.  Note this will not be 
complete, and does not follow any specific threat modeling process.

Use cases for this threat model?  (1) Inform developers on needed 
security features, (2) guidance for integrators, installers, and admins 
(per the Configuration Guide), and (3) for security audits.



2 James mentioned work toward having the OpenBMC community project 
provide information needed for downstream users to certify their 
solution to the FIPS 140-2 (not yet -3) spec.  To be clear, such users 
must necessarily refer back to their decision to use the OpenBMC 
community project, so this material should be in the OpenBMC community 
scope.

DISCUSSION:

We discussed an example of a FIPS 140 topic: an entropy collector needed 
to create cryptographically secure random numbers needed to create 
secure TLS connections.  Specifically, AST2600 entropy generator 
https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program/details?product=13789 
<https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program/details?product=13789>, 
versus entropy collector - 
https://atsec-information-security.blogspot.com/2019/10/stephan-mueller-publishes-sp800-90b.html 
<https://atsec-information-security.blogspot.com/2019/10/stephan-mueller-publishes-sp800-90b.html>


The consensus was to produce this as a new openbmc/security/docs 
document which would list each of the FIPS requirements and give info 
for each.  For example, how openbmc satisfies that requirement.  Let’s 
create a gerrit review (marked WIP) for this.




- Joseph
