Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110966462ED
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 22:05:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NS8v16JMlz3bj0
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 08:05:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkJ2lXO0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkJ2lXO0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NS8tP0jwJz2xG6
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 08:04:44 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7Kv4nH025915
	for <openbmc@lists.ozlabs.org>; Wed, 7 Dec 2022 21:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=riYdeTmI84pg6J0njIZgy/mtxiU3yvLmcjdkS3l5J7s=;
 b=bkJ2lXO0BYx12X18RApvpZeq52eaKXwYW8Vox2V7DK+k5dnjipjsO5Wk66PPNrRdf35U
 eAS1+SjJttoTfDISjgymjo0x5Y6GWaslYxDY545D1NHqU4zzzXFaHB3P2ErdGJAEiLdG
 vZr0hiE7toFuSMB2tyE/zx3DH04Kkk2ng7CsCWRjUiXvECfydVebQkOwR8p8ZIg0qG4E
 JrhJTKvYg79qiu3niAU+wtJewtUps2ThoOlW6M42Mwbg8F8VDY8T5EAr9LCodEI4L43i
 7WtjE6s3JPc4NRsAe4wzQIZB6lW5I0R44IfDLRbL6CXsnfs+ThgjW4NtXOpG3PNfN07O Tg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb2ag85u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2022 21:04:41 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B7Kcuwm019047
	for <openbmc@lists.ozlabs.org>; Wed, 7 Dec 2022 21:04:40 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3m9nq8dy3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2022 21:04:40 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B7L4dGD66191642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 7 Dec 2022 21:04:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0ACB58056
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 21:04:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67D3258065
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 21:04:39 +0000 (GMT)
Received: from [9.65.196.87] (unknown [9.65.196.87])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 21:04:39 +0000 (GMT)
Message-ID: <cbb94a8a-06c1-9a06-66c9-ecd68a305fff@linux.ibm.com>
Date: Wed, 7 Dec 2022 15:04:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Security Working Group meeting - Wednesday December 7 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <b3a548a8-fe43-ee21-a4f9-bf47cf18a163@linux.ibm.com>
In-Reply-To: <b3a548a8-fe43-ee21-a4f9-bf47cf18a163@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VdSMtHdAmYCoUo8vbdsKw9-sKEiPqh6x
X-Proofpoint-ORIG-GUID: VdSMtHdAmYCoUo8vbdsKw9-sKEiPqh6x
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_10,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 mlxlogscore=865 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070177
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

On 12/6/22 8:28 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday October 12 at 10:00am PDT.
>
> The meeting is on Discord voice.
>
> === MEETING ACCESS ON DISCORD VOICE  ===
> First, join Discord via https://discord.gg/69Km47zH98 
> <https://discord.gg/69Km47zH98> and confirm via email.
> Then, to join: navigate Discord > OpenBMC > Voice channels >  Security 
> ~ https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>
>
>
> We'll discuss items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> items proposed on the Discord OpenBMC #security channel, and anything 
> else that comes up:

We has one topic, the security aspects of a BMC access vector which is 
often overlooked

1.The BMC physical UART serial port provides access to uboot and then to 
a Linux login process.


- Joseph

>
>
> Access, agenda and notes are in the OpenBMC Security wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

