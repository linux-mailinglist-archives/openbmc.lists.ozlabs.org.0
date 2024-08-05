Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935C947C7D
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 16:08:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C1j3HkXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcyvP56JHz3clf
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 00:08:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C1j3HkXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcytt64RKz3c6n
	for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2024 00:07:34 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475E2mVr012260;
	Mon, 5 Aug 2024 14:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=l
	yqMfdpx0SPmkFVa/QFaArOMF8OSNQfmW/F2ugYjqr0=; b=C1j3HkXT0XL0DrXm7
	zVhGSAH69KfO/U3LpSdm1r5R3BCoWu8YCEg54552sbYlB04K8KnX6uyTFNvCMCr2
	P6IDJtyZvHiKUrKRAQx68U7CWRgDKJkDHslql1JrtyUOcG4koto4CtK3ZVWMECWl
	sqA45Gp7d50UFXwbUDz4534ZmzPLOKMcrwTZrHXgvbXPY5rit2Zp0W1zk1tCQ8U5
	sSBtKOno9j7GkkBCURK70pDvganxyC6ioBPE0fcJKke4CzdDhMr07yMxR6QdKxsw
	NQwRC/RTSwh6nve/Yw728HqWap/TQ7NQY5Ec1T6JO30V5y8a5zdd/31c8vmGRPAY
	07/Nw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40u04v00gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 14:07:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 475DCoMh030487;
	Mon, 5 Aug 2024 14:07:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40t1k2xaur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 14:07:24 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 475E7Loj14418466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2024 14:07:24 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF2595803F;
	Mon,  5 Aug 2024 14:07:21 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813F758054;
	Mon,  5 Aug 2024 14:07:21 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Aug 2024 14:07:21 +0000 (GMT)
Message-ID: <20d66f04-cf84-4cf1-8647-770c5bb1f9d9@linux.ibm.com>
Date: Mon, 5 Aug 2024 09:07:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.6 v2 1/1] ARM: dts: aspeed: system1: IBM
 System1 BMC update
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com
References: <20240801143004.993503-1-ninad@linux.ibm.com>
 <20240801143004.993503-2-ninad@linux.ibm.com>
 <6bb592d634fb842861db3efc4138b53b4c7e0ae1.camel@codeconstruct.com.au>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <6bb592d634fb842861db3efc4138b53b4c7e0ae1.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QEWsfCTvokIiAVU-qu_ZgYdz-V7cR8az
X-Proofpoint-ORIG-GUID: QEWsfCTvokIiAVU-qu_ZgYdz-V7cR8az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050096
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

Hi Andrew,

On 8/4/24 23:18, Andrew Jeffery wrote:
> On Thu, 2024-08-01 at 09:30 -0500, Ninad Palsule wrote:
>> Updated MAX31785a pmbus based fans in the device tree.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
> I've applied this, not because I think it's a good idea, but because
> it's something the OpenBMC tree already supports. If that weren't the
> case then I would require that you work with upstream on the bindings
> as usual.

Thanks!


>
> That said, please now do that work with upstream to get a sensible
> binding together. The less difference we have from upstream the better.
Yes, I will start working on this.
>
> Thanks,
>
> Andrew
>
> PS: In the future, can you please try to be more descriptive in your
> patch subject than "IBM System1 BMC update"? At the very least I would
> like it to say something about fan configuration in this instance.

will do. Thanks!


Regards,

Ninad Palsule

