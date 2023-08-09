Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A47764B8
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 18:10:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H95hwHe9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLZlC2RkDz3bst
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 02:09:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H95hwHe9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLZkc0dcKz2yTv
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 02:09:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379FlG5d015372;
	Wed, 9 Aug 2023 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WssAi1OrFCxSeoeiiFg6gyNUPfKVd66Q7ZYs7cd+YyM=;
 b=H95hwHe9UifH8ikCtjJLgoGOkVIlqpqDlb+cAAKlyA8l8llJpRtJa7WkSbZguZRl/La+
 gBq4hN1ilrdv7gRJBaY4ppZ+c1bliSJQ+IxrYMg8paguKBhEn+eSr0xBjjdTLB5Mh2ci
 gkBBVd1lRDyx59jnfYJwaGeiKWwXnWy51oexjWlv72O+Z6kY8R8wIblB0Qg2/mYxkpdh
 MNZWaZoDcVO/rxS+u3D+MeH9OEM8wmVr/+95YK2Zg/G1MqbAmX0RhqgGKbdxc80adK7r
 qJ/w4gxFkZvgJrUgaU/LW/MThPUefMaV7YkVLnIEc4/3a2LRPgxHaT1HnWmBrXzbsuJW fQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3scdreru7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 16:09:22 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 379FnVTd000404;
	Wed, 9 Aug 2023 16:09:21 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa28ksj0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 16:09:21 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 379G9Lq535979902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Aug 2023 16:09:21 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0055958056;
	Wed,  9 Aug 2023 16:09:21 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C622758055;
	Wed,  9 Aug 2023 16:09:20 +0000 (GMT)
Received: from [9.61.73.158] (unknown [9.61.73.158])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Aug 2023 16:09:20 +0000 (GMT)
Message-ID: <49ae7035-dc79-0205-03f3-1f38dde2f430@linux.ibm.com>
Date: Wed, 9 Aug 2023 11:09:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH linux dev-6.1 v3 0/5] ARM: dts: aspeed: Reorganize P10 FSI
 tree
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20230809074921.116987-1-joel@jms.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20230809074921.116987-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qW6_txDjW3qnHTQhdmZlLyeoFy4HK-BN
X-Proofpoint-ORIG-GUID: qW6_txDjW3qnHTQhdmZlLyeoFy4HK-BN
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_13,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxlogscore=810 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090142
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


On 8/9/23 02:49, Joel Stanley wrote:
> Hi Eddie,
>
> This is v2 of your patch[1] reworked into a few separate commits. I
> found it hard to review the whole thing, so I split it up a bit.
>
> Let me know if you think it's okay.


Yes, looks great, thanks!


>
> [1] https://lore.kernel.org/openbmc/20230412195017.2836161-1-eajames@linux.ibm.com
>
> Eddie James (2):
>    ARM: dts: aspeed: Add P10 FSI descriptions
>    ARM: dts: aspeed: everest: Reorganise FSI description
>
> Joel Stanley (3):
>    ARM: dts: aspeed: bonnell: Reorganise FSI description
>    ARM: dts: aspeed: rainier: Reorganise FSI description
>    ARM: dts: aspeed: everest: Move common devices up
>
>   arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts |  384 +---
>   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1837 ++++++++++--------
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  678 +------
>   arch/arm/boot/dts/ibm-power10-dual.dtsi      |  380 ++++
>   arch/arm/boot/dts/ibm-power10-quad.dtsi      | 1305 +++++++++++++
>   5 files changed, 2782 insertions(+), 1802 deletions(-)
>   create mode 100644 arch/arm/boot/dts/ibm-power10-dual.dtsi
>   create mode 100644 arch/arm/boot/dts/ibm-power10-quad.dtsi
>
