Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2E554EF4
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 17:19:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSn9Z1LpZz3bsv
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 01:19:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V6GH7Y2b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V6GH7Y2b;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSn975MgGz2ywr
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 01:19:07 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MEpGEv018528
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=dJh0Gy/WJwdCJn5gzwGxnw85iXMWbCmVsr3badBGd7Q=;
 b=V6GH7Y2bZJegdoKc2Dcb4cZ1QJSuoYnwUOolNR/ok3PZjjTp7akqHcGiHr2NguzCB7eH
 q9uy5rSszGjg25wOnr9M3Lg1jL/pZv8bBwv0mBphlhWZ9jPrzchqFgTDi5PNYDKTn3LI
 mOqMXjnOzbve7wndvTn5VH4D6lPBIyE8CGgItnBzwXJLuE0fZ2n5xpkZjoqcR6PlM+7h
 oP54dNBWJ92M+MUhnfdr5RYwR+Zufv2H32/ToxXAYDe46sqssf0nVRpgVM6MOIKBbyNy
 7t/ByQuKRlTERTOf5mvkI12hNqc/Rcxdw1cnP8V+CtF2+Nyg9HLd8CFY7e0BLi3TD6Q4 Zw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv56x8tbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:04 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MF6eI7010839
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01wdc.us.ibm.com with ESMTP id 3gv5cjr1dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25MFJ20E64750012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C1F124054
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28BB3124052
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 +0000 (GMT)
Received: from [9.77.148.104] (unknown [9.77.148.104])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 15:19:02 +0000 (GMT)
Message-ID: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
Date: Wed, 22 Jun 2022 10:19:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday June 22
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L8-_CFOYiiq-mL9cWwEofuGw6JL_b4j4
X-Proofpoint-GUID: L8-_CFOYiiq-mL9cWwEofuGw6JL_b4j4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_04,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=540 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220075
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday June 22 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. Cancel July 6 meeting?
2. Continue discussion securing Linux internals (like with SELinux).


Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
