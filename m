Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858D5B8A06
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 16:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSMg21V5Tz3bnM
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 00:10:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gkYSonfJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gkYSonfJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSMfc5hcxz3052
	for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2022 00:10:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EDcKe8001958
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=1XQjB7eM3lxhvjEOGRF9d5r34KLvqj9QYh6KH46YGHg=;
 b=gkYSonfJC5LifNxIPgViiuZiAhejAZ8U1rd7uGZdExMbmd0otLrn+rTr64ngMiz723hN
 kqoO3EUiAjFp+V4Hqh6558nkHPOAklP+WXVOyhSMb4YPOOMzMkBWG0I8llN+RLUKRge4
 1Zv5GIak0N/QSpkksK5gVEMNb9wB9hrxrObbLJhfhOCpK8sHcoWX0YHycp2Vxzb5HnAF
 5AnoF8fr7y98YJrCH7wPyVog4kn3GuEgIe2fjNi+/EXB7/eFJsOvwtGucrA6QmKVllyQ
 hvPI5X6qU89F07hdVTCBplBbvouX/q4MJ/mtUG5KV8EHM57hYd4Qxug9s0axI6p0Mt7T ww== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkfmpj689-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28EE6041028163
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:56 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma04wdc.us.ibm.com with ESMTP id 3jjydh51sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28EE9ujV5308990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 001B4C6059
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9A87C6057
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:54 +0000 (GMT)
Received: from [9.160.44.236] (unknown [9.160.44.236])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 14:09:54 +0000 (GMT)
Message-ID: <816be499-3dde-8a71-ff3c-d41a25a6d688@linux.ibm.com>
Date: Wed, 14 Sep 2022 09:09:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday September 14 (on Discord
 voice)
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AWIkd7HXG8tVrdCbrqmeS8vUrMGasTDY
X-Proofpoint-GUID: AWIkd7HXG8tVrdCbrqmeS8vUrMGasTDY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=759 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140068
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
scheduled for this Wednesday September 14 at 10:00am PDT.


ATTENTION - Venue Change.  The meeting recently moved to Discord voice.  
Please update your calendars.

=== MEETING ACCESS ON DISCORD VOICE  ===
First, join Discord via https://discord.gg/69Km47zH98 
<https://discord.gg/69Km47zH98> and confirm via email.
Then, to join: navigate Discord > OpenBMC > Voice channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>


We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. Discuss alternate meeting times



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
