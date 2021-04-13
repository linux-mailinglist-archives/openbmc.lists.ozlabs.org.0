Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E739635DEBC
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 14:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKPz95yK0z3bpP
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:28:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HpNGFHox;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HpNGFHox; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKPyy0rtQz2yxx
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 22:28:25 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DC3gJ8076419; Tue, 13 Apr 2021 08:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iqfWOQ/Z/UeN0lw5C181WopudR4LIB/wcXchoWXnFEE=;
 b=HpNGFHoxTfnIK+mIeeKO9kiv3UOpN5+WE197soqruSkYZLr6DJ0Ya9a0c1XzywXxE1af
 k/uae27+8Zc6Jh6D/B5WoLVTkilWLyqkD6vB5hbUrEHknWzK8RHVoSL4lz3o/4DTom3F
 MfqhhcYUjV7vLXHdwHu3VTcvLUBmuWCvefsBKjOC2p+ghpS/7SuyeDykGwbSyiUZ4L8Q
 UrCkmJ/haR5e34enOI1d7Tw+5vVqvA4JLFC1mGQBmCDz0eWjGG5OvcBYcGYloLXNqC4N
 ISXo1W503rAX1GeWAi4c/ro+F3+9DYYZ5ilL2dZH9coozQ6Xo70fuNFe5hvkUiWetWMH eA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w6wmgfv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:28:11 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCJtwO026786;
 Tue, 13 Apr 2021 12:28:10 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 37uhcmmry6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:28:10 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCSAIY36307296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:28:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36AD4112064;
 Tue, 13 Apr 2021 12:28:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A480112063;
 Tue, 13 Apr 2021 12:28:09 +0000 (GMT)
Received: from [9.85.206.162] (unknown [9.85.206.162])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:28:09 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 01/11] aspeed: Build
 secboot only when enabled
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-2-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <68ab971c-6174-de08-3b98-82e9575d3769@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 09:28:07 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hWHHvjbqTTgILs5dY9sCbwOr0nm876o6
X-Proofpoint-GUID: hWHHvjbqTTgILs5dY9sCbwOr0nm876o6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_04:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130086
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/13/2021 5:07 AM, Joel Stanley wrote:
> The configuration option controls if the secboot code is used. When
> there are no callers it is removed from the final u-boot binary. Instead
> of relying on the linker to do this, only add it to the build system if
> enabled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/mach-aspeed/ast2600/Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-aspeed/ast2600/Makefile b/arch/arm/mach-aspeed/ast2600/Makefile
> index 0abac4c233e4..aafc4b2fe37f 100644
> --- a/arch/arm/mach-aspeed/ast2600/Makefile
> +++ b/arch/arm/mach-aspeed/ast2600/Makefile
> @@ -1,2 +1,3 @@
> -obj-y   += platform.o board_common.o scu_info.o utils.o cache.o crypto.o aspeed_verify.o
> +obj-y   += platform.o board_common.o scu_info.o utils.o cache.o
> +obj-$(CONFIG_ASPEED_SECURE_BOOT) += crypto.o aspeed_verify.o
>   obj-$(CONFIG_SPL_BUILD) += spl.o spl_boot.o
> 

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
