Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14335E7AD
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 22:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKcx45Zmgz3bnf
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 06:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lcOftJPi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lcOftJPi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKcwr4ggLz2ym4
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 06:42:20 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DKXcH7124240; Tue, 13 Apr 2021 16:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RV3s01hHlxfT2QPS4MLuEZVe+lRQqRVJURvL65kTDwE=;
 b=lcOftJPiTsA6ugaUkFfRQX203dr8aJI0Cq0aklP2qwFiCw9aTEcnvNusQJt99aiWK1Cg
 f0N4hz8+QUR1GEbJTgFt7Zvz8f5yHzKGqUB4Z2mR4GA5M9Z+YZFbB0AlYtnIj8/bhZ6L
 ixiTUAGqURPMGygfYb3lKSEF4bfq2iZpdXytAhauxIgya1WVzkWqR8KCJghK0UyscSXm
 eb1bRjPvqTvT30kTvrNTHG6Sed8hRI3pt/K3kTsfKpS67CUBFprhUpFa/PA93lBmF7/g
 j10Fe5rfPv7ItJI6M94mFIP1VWSQ9ykfKzmjHoy5RrSj/Scm7cBFwTrX4JtvdEeFllHZ Sw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wb9x4dc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:42:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DKc24O009161;
 Tue, 13 Apr 2021 20:42:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 37u3n9jjw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 20:42:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DKg7Qt30933250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 20:42:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10EBD78063;
 Tue, 13 Apr 2021 20:42:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 094737805C;
 Tue, 13 Apr 2021 20:42:06 +0000 (GMT)
Received: from [9.80.229.103] (unknown [9.80.229.103])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 20:42:05 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 11/11] configs/openbmc:
 Enable hw accelerated sha
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-12-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <370a4d0b-d9ff-ebbd-6034-1e88f64c1f80@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 17:42:03 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413080755.73572-12-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JE_VZvIK0oWpVXSklDRnNLIHAGzOINI0
X-Proofpoint-ORIG-GUID: JE_VZvIK0oWpVXSklDRnNLIHAGzOINI0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
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
> SHA512 will be used by the openbmc secure boot implementation when
> verifying FIT images of both u-boot proper and the kernel.
> 
> The hash command is useful, and adds only a small amount of binary size
> given the algorithms are already included in the image.
> 
> Using hardware acceleration instead of a software implementation saves a
> significant amount of binary size (approx. 12KB for the SPL).
> 
> Note that the hardware implementation is only useful when booting from a
> payload in memory, as is the case with MMC or network boot. It cannot be
> used when booting from SPI NOR.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>   configs/ast2600_openbmc_spl_emmc_defconfig | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index e59d3595ebf0..05069084cbc5 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -36,6 +36,7 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
>   CONFIG_ARMV7_PSCI_NR_CPUS=2
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_FIT=y
> +CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
>   CONFIG_FIT_SIGNATURE=y
>   CONFIG_SPL_FIT_SIGNATURE=y
>   CONFIG_SPL_LOAD_FIT=y
> @@ -53,6 +54,8 @@ CONFIG_SPL_STACK_R=y
>   CONFIG_SPL_SEPARATE_BSS=y
>   CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
>   CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
> +CONFIG_SPL_SHA256_SUPPORT=y
> +CONFIG_SPL_SHA512_SUPPORT=y
>   CONFIG_SPL_FIT_IMAGE_TINY=y
>   CONFIG_SPL_DM_RESET=y
>   CONFIG_SPL_RAM_SUPPORT=y
> @@ -80,6 +83,7 @@ CONFIG_CMD_DHCP=y
>   CONFIG_CMD_MII=y
>   CONFIG_CMD_PING=y
>   CONFIG_CMD_NCSI=y
> +CONFIG_CMD_HASH=y
>   CONFIG_CMD_EXT2=y
>   CONFIG_CMD_EXT4=y
>   CONFIG_CMD_EXT4_WRITE=y
> @@ -97,6 +101,7 @@ CONFIG_SYSCON=y
>   CONFIG_SPL_OF_TRANSLATE=y
>   CONFIG_CLK=y
>   CONFIG_SPL_CLK=y
> +CONFIG_ASPEED_HACE=y
>   CONFIG_DM_GPIO=y
>   CONFIG_ASPEED_GPIO=y
>   CONFIG_DM_I2C=y
> @@ -135,4 +140,6 @@ CONFIG_USE_TINY_PRINTF=y
>   CONFIG_SPL_TINY_MEMSET=y
>   CONFIG_TPM=y
>   CONFIG_SPL_TPM=y
> +CONFIG_SHA_HW_ACCEL=y
> +CONFIG_SHA_PROG_HW_ACCEL=y
>   # CONFIG_EFI_LOADER is not set
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
