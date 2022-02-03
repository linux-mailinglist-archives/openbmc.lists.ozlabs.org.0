Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A34A89E9
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 18:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqQYN0wgsz3bbQ
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 04:25:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l+mdONMB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l+mdONMB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqQXz6shDz2xC6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 04:25:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213GfCgb021697; 
 Thu, 3 Feb 2022 17:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=R4T/E6jv+QymARDrPchXFicKdt1NB4vWGBvrcJE83XM=;
 b=l+mdONMB5Epy0Fv6RuLz1qppLthCshK1SHeK7mc3zVPv9SroEFAwQT+HB4fdybU+Hl2V
 b3bdsCbowgBt1uNakLMqT5uZhQLZaidJ0obg4I4bUc5qMtQgWea0DTav8eg/x/IA/dGr
 V3JOUpHpjTzgEw969I8zCCdTD6hXO/vyGsi43kcuyCRZSay//w/d3QJzU5beNyblv5H4
 sqMP+bpyTZZGx/Wm3X0cIY3+8Ye89+1AgFKXDBCvMJh3JUZuVJX9umRCsjgRf+/cuSXN
 S//thcCLS5qoyogWTOpnB2ZUpe+N8u5R66Xivrc3yTHVGN+HSXEPvbvTyRpq6U7jr7vh Ag== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyvcmw66q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:25:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213HDIH6032767;
 Thu, 3 Feb 2022 17:25:17 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3dvw7c1mnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 17:25:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213HPHQg31850994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 17:25:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51B5DAC060;
 Thu,  3 Feb 2022 17:25:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15190AC067;
 Thu,  3 Feb 2022 17:25:17 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 17:25:16 +0000 (GMT)
Message-ID: <8abeada8-e53d-4c77-310c-478733bf4891@linux.ibm.com>
Date: Thu, 3 Feb 2022 11:25:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/6] ARM: ast2600: Control
 FIT uImage signature verification at runtime
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-4-andrew@aj.id.au>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20220131012538.73021-4-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h42vAwYHNiNE_9zwv1v6Kcv1TsoJ8ryP
X-Proofpoint-ORIG-GUID: h42vAwYHNiNE_9zwv1v6Kcv1TsoJ8ryP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030103
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


On 1/30/22 19:25, Andrew Jeffery wrote:
> Implement support for disabling signature verification of FIT images at
> runtime by sampling the "bmc-secure-boot" GPIO. If the line name is not
> provided in the devicetree then secure-boot continues to be required as
> if the feature were not present.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   arch/arm/mach-aspeed/ast2600/Makefile      |  1 +
>   arch/arm/mach-aspeed/ast2600/secure-boot.c | 53 ++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>   create mode 100644 arch/arm/mach-aspeed/ast2600/secure-boot.c
>
> diff --git a/arch/arm/mach-aspeed/ast2600/Makefile b/arch/arm/mach-aspeed/ast2600/Makefile
> index d07e8c737cfe..70b7ae11df56 100644
> --- a/arch/arm/mach-aspeed/ast2600/Makefile
> +++ b/arch/arm/mach-aspeed/ast2600/Makefile
> @@ -1,4 +1,5 @@
>   obj-y   += platform.o board_common.o scu_info.o utils.o cache.o
> +obj-$(CONFIG_FIT_RUNTIME_SIGNATURE) += secure-boot.o
>   obj-$(CONFIG_ASPEED_SECURE_BOOT) += crypto.o aspeed_verify.o
>   obj-$(CONFIG_ASPEED_LOADERS) += spl_boot.o
>   obj-$(CONFIG_SPL_BUILD) += spl.o
> diff --git a/arch/arm/mach-aspeed/ast2600/secure-boot.c b/arch/arm/mach-aspeed/ast2600/secure-boot.c
> new file mode 100644
> index 000000000000..ced353686387
> --- /dev/null
> +++ b/arch/arm/mach-aspeed/ast2600/secure-boot.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// (C) Copyright IBM Corp. 2022
> +
> +#include <common.h>
> +#include <asm-generic/gpio.h>
> +#include <dm.h>
> +
> +static int aspeed_get_chained_secboot_state(void)
> +{
> +	struct gpio_desc desc;
> +	struct udevice *dev;
> +	int secboot;
> +	int rc;
> +
> +	rc = uclass_get_device_by_driver(UCLASS_GPIO,
> +					 DM_GET_DRIVER(gpio_aspeed),
> +					 &dev);
> +	if (rc < 0) {
> +		debug("Warning: GPIO initialization failure: %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = gpio_request_by_line_name(dev, "bmc-secure-boot", &desc,
> +				       GPIOD_IS_IN);
> +	if (rc < 0) {
> +		debug("Failed to acquire secure-boot GPIO: %d\n", rc);
> +		return rc;
> +	}
> +
> +	secboot = dm_gpio_get_value(&desc);
> +	if (secboot < 0)
> +		debug("Failed to read secure-boot GPIO value: %d\n", rc);
> +
> +	rc = dm_gpio_free(dev, &desc);
> +	if (rc < 0)
> +		debug("Failed to free secure-boot GPIO: %d\n", rc);
> +
> +	return secboot;
> +}
> +
> +int board_fit_image_require_verified(void)
> +{
> +	int secboot;
> +
> +	secboot = aspeed_get_chained_secboot_state();
> +
> +	/*
> +	 * If secure-boot is enabled then require signature verification.
> +	 * Otherwise, if we fail to read the GPIO, enforce FIT signature
> +	 * verification
> +	 */
> +	return secboot >= 0 ? secboot : 1;
> +}
