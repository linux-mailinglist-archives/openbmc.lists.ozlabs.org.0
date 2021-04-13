Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76035DEF8
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 14:31:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKQ2w3FqFz3bVC
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:31:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kSxKRHfb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kSxKRHfb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKQ2g66d8z2yxx
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 22:31:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DCEKYD003918; Tue, 13 Apr 2021 08:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vj5EDoVLOzcJXmphaw6cXSd32ohnkTdQr94DOBY8650=;
 b=kSxKRHfbUIT8H6rq84JxuYWhlnGorT1lksF+h+aoentHS+DDKnPRFj/dvMbv+e9KZgC8
 IlyKEr81dCl0RUp9GJeKGuUVDDQevgS1QexQYWml+qVejXCPB4B+CES9FfcdeQv+hHv+
 SNa5D0OiS4PvISM3niJ2KKr3hUNxYcko8QKzwm5rL1ZF9O/vMligpM0XDaAF21L6tLEr
 sGFkdV9FP9YtNKF70755lQSkB+TruaUlFyfX8a2iX+7j0wqQLPbs/9S2+O6gQ81X2csF
 5OV21ni62RNM9V4foONMPSxuQJdvsSV2iO1mk0jg1Dj4gf0CPQrfZONH7oKxNGO28/jM zA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wb4f8g7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 08:31:32 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCL46Q007220;
 Tue, 13 Apr 2021 12:31:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 37u3n9ejb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 12:31:31 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DCVUwE37749146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 12:31:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58BF0112069;
 Tue, 13 Apr 2021 12:31:30 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CF09112063;
 Tue, 13 Apr 2021 12:31:29 +0000 (GMT)
Received: from [9.85.206.162] (unknown [9.85.206.162])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 12:31:29 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 04/11] ast2600: spl:
 Support common boot devices
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-5-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <34ecc817-4f44-5136-8e2a-ad9a438d5f64@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 09:31:28 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Wt_QP3-NZYRWClV0BZ7r0-m1rdwHYQMK
X-Proofpoint-GUID: Wt_QP3-NZYRWClV0BZ7r0-m1rdwHYQMK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_04:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
> Aspeed's SDK has some custom boot devices. There's also the common SPL
> code for loading boot images from various devices that the system can be
> configured to use.
> 
> This will use the Aspeed device types first and then fall back to the
> generic ones.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/arm/mach-aspeed/ast2600/spl.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
> index d794421b4070..527e14f8e3b6 100644
> --- a/arch/arm/mach-aspeed/ast2600/spl.c
> +++ b/arch/arm/mach-aspeed/ast2600/spl.c
> @@ -34,6 +34,7 @@ void board_init_f(ulong dummy)
> 
>   u32 spl_boot_device(void)
>   {
> +#if IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT)
>   	switch (aspeed_bootmode()) {
>   	case AST_BOOTMODE_EMMC:
>   		return (IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT))?
> @@ -47,6 +48,15 @@ u32 spl_boot_device(void)
>   	default:
>   		break;
>   	}
> +#endif
> +	switch (aspeed_bootmode()) {
> +	case AST_BOOTMODE_EMMC:
> +		return BOOT_DEVICE_MMC1;
> +	case AST_BOOTMODE_SPI:
> +		return BOOT_DEVICE_SPI;
> +	case AST_BOOTMODE_UART:
> +		return BOOT_DEVICE_UART;
> +	}
> 
>   	return BOOT_DEVICE_NONE;
>   }
> 

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
