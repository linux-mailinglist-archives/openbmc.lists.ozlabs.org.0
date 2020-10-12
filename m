Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B4B28B81A
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:49:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C90R2436nzDqQy
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 00:49:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TU2JkmLe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C90G26xCzzDqjT
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 00:41:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CDWvkt071815; Mon, 12 Oct 2020 09:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sDXMZ8yda2qlXA1W95zkZCIfn7fECeNjzdokE7nsNfM=;
 b=TU2JkmLe+/FqCoFE+VLsw0CogVDAlzI0HqBB9LvPArpPjwgRKrDUS5RBMRZ8Res/uuAj
 LZOLcjKp5F7WFBzkT6SxRDbLREDzVC/kCAhaeSPT5GolUq7gh+eTsR+9s0d9QJAPNA6V
 zzhf9JnEfyxtr8TALwCNf/SPJoVj0H7c8bWa9sRv6j/1GQdT2x98mzMKBzTEQrAniPMM
 IBgfuu4oMa8MsMqAHbhujAhiJ/4OS7u+zx7BAnuZyftaMdZo3K0mtAgGtE6sfuw18pFz
 vZyCKO4/gnUv0iTU0LuzCH9MtWl5xKpUxM99wUf47vNYxr8oL4xUsyWz1fK/TyBZGYCm Vg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344r2h0av5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 09:41:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CDXfMe021488;
 Mon, 12 Oct 2020 13:41:42 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3434k8bydy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 13:41:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CDffmV14746248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 13:41:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67064AC05E;
 Mon, 12 Oct 2020 13:41:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31667AC059;
 Mon, 12 Oct 2020 13:41:41 +0000 (GMT)
Received: from [9.85.207.95] (unknown [9.85.207.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 13:41:41 +0000 (GMT)
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600
 SPL eMMC configuration
To: Joel Stanley <joel@jms.id.au>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-4-eajames@linux.ibm.com>
 <CACPK8Xe0qx75t8+mVfQ7gF-wzdxdSunyQ_NN2uZ_9S0E_bF6XA@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <307362eb-6dd9-3413-746c-3fa58651a401@linux.ibm.com>
Date: Mon, 12 Oct 2020 08:41:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe0qx75t8+mVfQ7gF-wzdxdSunyQ_NN2uZ_9S0E_bF6XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_09:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=786 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120109
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/8/20 10:50 PM, Joel Stanley wrote:
> On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>> U-Boot and environment are to be loaded off the eMMC.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
>>   include/configs/aspeed-common.h            |   6 +
>>   2 files changed, 136 insertions(+)
>>   create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig
>>
>> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> Here's the diff between the emmc and nor configs:
>
> $ diff -up configs/ast2600_openbmc_spl_defconfig
> configs/ast2600_openbmc_spl_emmc_defconfig
> --- configs/ast2600_openbmc_spl_defconfig    2020-09-24 14:39:38.129075805 +0930
> +++ configs/ast2600_openbmc_spl_emmc_defconfig    2020-10-09
> 14:16:35.786706472 +1030
> @@ -9,9 +9,10 @@ CONFIG_ARCH_ASPEED=y
>   CONFIG_SYS_TEXT_BASE=0x10000
>   CONFIG_ASPEED_AST2600=y
>   CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
> -CONFIG_ASPEED_UBOOT_SPI_SIZE=0xe0000
> -CONFIG_ASPEED_UBOOT_MMC_BASE=0x000000
> -CONFIG_ASPEED_UBOOT_MMC_SIZE=0x700
> +CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
>
> Can we remove this from the config?


Yes? The build might complain if that isn't set?


>
> +CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
> +CONFIG_ASPEED_UBOOT_MMC_PART=1
> +CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
>   CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
>   CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
>   CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
> @@ -27,7 +28,7 @@ CONFIG_SPL_MMC_SUPPORT=y
>   CONFIG_SPL_SERIAL_SUPPORT=y
>   CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>   CONFIG_ENV_SIZE=0x10000
> -CONFIG_ENV_OFFSET=0xE0000
> +CONFIG_ENV_OFFSET=0x5000
>
> What's the 0x5000 here?


That's the location of the environment within the user partition of the MMC.


Thanks,

Eddie


>
>   CONFIG_SPL=y
>   CONFIG_SPL_STACK_R_ADDR=0x90300000
>   CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> @@ -81,13 +82,7 @@ CONFIG_CMD_FS_GENERIC=y
>   CONFIG_CMD_MTDPARTS=y
>   # CONFIG_SPL_EFI_PARTITION is not set
>   CONFIG_SPL_OF_CONTROL=y
> -CONFIG_ENV_IS_IN_SPI_FLASH=y
> -CONFIG_USE_ENV_SPI_BUS=y
> -CONFIG_ENV_SPI_BUS=0
> -CONFIG_USE_ENV_SPI_CS=y
> -CONFIG_ENV_SPI_CS=0
> -CONFIG_USE_ENV_SPI_MAX_HZ=y
> -CONFIG_ENV_SPI_MAX_HZ=100000000
> +CONFIG_ENV_IS_IN_MMC=y
>
> This hunk makes sense.
