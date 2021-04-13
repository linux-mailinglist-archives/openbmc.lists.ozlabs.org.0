Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90335E7B9
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKd343Xzpz3bSw
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 06:47:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XRe/QFtL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XRe/QFtL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKd2r1l8Qz2yhd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 06:47:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXFDP055702; Tue, 13 Apr 2021 16:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vx7fIUlHN+viIcDedfm6hsQ8vJe2uKgyfP+AKZnqbLg=;
 b=XRe/QFtLzHYOi9YhowanhBksTpR9skmexo7c7kPhHaSsoE69DCvRoFHndE1zrHS3emAC
 VkLzxAAEUfVd6dm/FkVXdAskTjonlCF5ovYckj/XTVpjl7RbGhS2iIFRIrsjinAqQTlq
 jYH86OPGorUZ96cXpCJkh0L1ypWJ8+Og6RapT2YMXCu0FkeYjRGFHsXdo/3CkIx6zkJh
 bHN04jfO9BgOi42MKQOUgAR14r/d3gV3BXHqEACVI40WPjZ+1L7LVM8TRBeeA+oRumg9
 boekH8eXIqpmh85UYYQOFtT9tgajZb4xNwNj3s8DMr1QArqqpA6Oij36E1EjEH5c7zMh Rw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wdgar9m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:47:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKbulN023340;
 Tue, 13 Apr 2021 20:47:22 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 37uhcmr177-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:47:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKlL7G15270376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:47:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B1F27805F;
 Tue, 13 Apr 2021 20:47:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5345A7805C;
 Tue, 13 Apr 2021 20:47:20 +0000 (GMT)
Received: from [9.80.229.103] (unknown [9.80.229.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:47:19 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 05/11] config: ast2600:
 Enable common eMMC SPL loader
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-6-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <f22d9ea3-e092-8e90-cd25-41369d8704c7@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 17:47:18 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-6-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -Zbep7tmc3_07STxQpY41XRRbGataJzR
X-Proofpoint-GUID: -Zbep7tmc3_07STxQpY41XRRbGataJzR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130137
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
> Notabily the link address changes, as this is used as the load address
> by the loader.
> 
> Given the Aspeed loaders are linking u-boot at 0x10000 but running it
> from RAM, the u-boot relocation code must be fine with this setup.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   configs/ast2600_openbmc_spl_emmc_defconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 6daf6343478b..e59d3595ebf0 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -7,7 +7,7 @@ CONFIG_SYS_THUMB_BUILD=y
>   # CONFIG_SPL_USE_ARCH_MEMSET is not set
>   CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
>   CONFIG_ARCH_ASPEED=y
> -CONFIG_SYS_TEXT_BASE=0x10000
> +CONFIG_SYS_TEXT_BASE=0x81000000
>   CONFIG_ASPEED_AST2600=y
>   CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
>   CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
> @@ -47,11 +47,12 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
>   CONFIG_DISPLAY_BOARDINFO_LATE=y
>   CONFIG_ARCH_EARLY_INIT_R=y
>   CONFIG_BOARD_EARLY_INIT_F=y
> -# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
Guess this is unrelated?
But still, isn't this required for booting from UART? I had
the impression that the SPL ymodem boot would not work with
fitImages.


>   # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>   CONFIG_SPL_STACK_R=y
>   CONFIG_SPL_SEPARATE_BSS=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
>   CONFIG_SPL_FIT_IMAGE_TINY=y
>   CONFIG_SPL_DM_RESET=y
>   CONFIG_SPL_RAM_SUPPORT=y
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
