Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC7532F25
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 18:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L70Pc0G59z3bph
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DfSZyMKR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DfSZyMKR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L70P73C8yz2ymf
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 02:42:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFfjmZ016583;
 Tue, 24 May 2022 16:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eNTm/qw39kU9xpSukUU0pQeLMDlaQW8mGQv0CHFugjw=;
 b=DfSZyMKRNLp1+35XwQVMSu8ax6R/vCUvmWi+0feUwHHpsv3sfq8wd/EwuuQdmuz0lvO7
 tfN9zYv33IoK6U96rqAtT37cFygyRZnYFGDTA74zJul8B8X+s2t8vsI1v1c+wmmDVjqm
 DDC++4em9IFFo282wb6rmbw96o3xPiWuSPyjYraTlD2sXDKDz1avHXdN6BvIugy4H2VS
 65pF+IHot0aKMyn6rCuT8SHINn3BZl+G8BQX4pkOnTsCEM0ai47uTf5kbReIgSXP5n5b
 kNvrR0xil68E7nQFXOLvjPuD4Nimmd03rBoRXeHA/E22hM6r+m2qMk7wv4H3WcY1q27Y NQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g927usdcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 16:42:47 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OGY7OV024478;
 Tue, 24 May 2022 16:42:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3g6qq9qpen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 16:42:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OGgifS32047446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 16:42:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C58DCAE05F;
 Tue, 24 May 2022 16:42:44 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66F69AE05C;
 Tue, 24 May 2022 16:42:44 +0000 (GMT)
Received: from [9.211.82.60] (unknown [9.211.82.60])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 16:42:44 +0000 (GMT)
Message-ID: <090d906b-e863-e8c6-cdb2-f82223a7a6b2@linux.ibm.com>
Date: Tue, 24 May 2022 11:42:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 9/9] board: ast2600-ibm:
 Add AST2600 BMC based POWER10+ servers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
 <20220513170715.43475-10-eajames@linux.ibm.com>
 <CACPK8XcE6JXxQ58_Z88gv8keC_oWkwOZ6L3Nm4wv-g3KsRr6xQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XcE6JXxQ58_Z88gv8keC_oWkwOZ6L3Nm4wv-g3KsRr6xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oFvMGF-4k7PtzP4tWJRFJGELzUT6wQX7
X-Proofpoint-GUID: oFvMGF-4k7PtzP4tWJRFJGELzUT6wQX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_08,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240085
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
Cc: cjengel@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/20/22 01:30, Joel Stanley wrote:
> On Fri, 13 May 2022 at 17:07, Eddie James <eajames@linux.ibm.com> wrote:
>> Support IBM-specific options for POWER10+ servers built on AST2600
>> BMC.
> Enabling the TPM command and the TPM2_TIS_I2C option adds 32.6KB to
> the u-boot image, bringing the total to 406KB.
>
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/mach-aspeed/ast2600/Kconfig |   7 ++
>>   board/aspeed/ast2600_ibm/Kconfig     |  13 +++
>>   board/aspeed/ast2600_ibm/Makefile    |   1 +
>>   board/aspeed/ast2600_ibm/ibm.c       |  46 +++++++++
>>   configs/ast2600_ibm_defconfig        | 137 +++++++++++++++++++++++++++
>>   5 files changed, 204 insertions(+)
>>   create mode 100644 board/aspeed/ast2600_ibm/Kconfig
>>   create mode 100644 board/aspeed/ast2600_ibm/Makefile
>>   create mode 100644 board/aspeed/ast2600_ibm/ibm.c
>>   create mode 100644 configs/ast2600_ibm_defconfig
> I don't want to end up with defconfigs for every machine we support.
> Is there a way we can avoid that?


I'm not sure how we could, unless we just select this board for openbmc 
defconfig, but that somewhat defeats the purpose of adding the new 
board. May as well just add the tpm poison to the EVB board code.


>
>> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
>> index fcdc425de5..412ea639ad 100644
>> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
>> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
>> @@ -31,6 +31,12 @@ config TARGET_SLT_AST2600
>>          help
>>            SLT-AST2600 is Aspeed SLT board for AST2600 chip.
>>
>> +config TARGET_AST2600_IBM
>> +       bool "AST2600-IBM"
>> +       depends on ASPEED_AST2600
>> +       help
>> +         AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ servers
>> +
>>   config TARGET_AST2600_INTEL
>>          bool "AST2600-INTEL"
>>          depends on ASPEED_AST2600
>> @@ -43,6 +49,7 @@ endchoice
>>   source "board/aspeed/evb_ast2600/Kconfig"
>>   source "board/aspeed/fpga_ast2600/Kconfig"
>>   source "board/aspeed/slt_ast2600/Kconfig"
>> +source "board/aspeed/ast2600_ibm/Kconfig"
>>   source "board/aspeed/ast2600_intel/Kconfig"
>>
>>   endif
>> diff --git a/board/aspeed/ast2600_ibm/Kconfig b/board/aspeed/ast2600_ibm/Kconfig
>> new file mode 100644
>> index 0000000000..38ee579ed7
>> --- /dev/null
>> +++ b/board/aspeed/ast2600_ibm/Kconfig
>> @@ -0,0 +1,13 @@
>> +if TARGET_AST2600_IBM
>> +
>> +config SYS_BOARD
>> +       default "ast2600_ibm"
>> +
>> +config SYS_VENDOR
>> +       default "aspeed"
>> +
>> +config SYS_CONFIG_NAME
>> +       string "board configuration name"
>> +       default "ast2600_ibm"
>> +
>> +endif
>> diff --git a/board/aspeed/ast2600_ibm/Makefile b/board/aspeed/ast2600_ibm/Makefile
>> new file mode 100644
>> index 0000000000..ae1aded893
>> --- /dev/null
>> +++ b/board/aspeed/ast2600_ibm/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += ibm.o
>> diff --git a/board/aspeed/ast2600_ibm/ibm.c b/board/aspeed/ast2600_ibm/ibm.c
>> new file mode 100644
>> index 0000000000..d9e06fafe0
>> --- /dev/null
>> +++ b/board/aspeed/ast2600_ibm/ibm.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2022 IBM Corp.
>> + */
>> +
>> +#include <common.h>
>> +#if defined(CONFIG_TPM_V2)
> The headers will always exist, so this is unnecessary.
>
> Even better, we know this machine will always have a TPM, so can we select it in


Good idea.


>
>> +#include <dm/uclass.h>
>> +#include <tpm-common.h>
>> +#include <tpm-v2.h>
>> +#endif
>> +
>> +__weak int board_late_init(void)
>> +{
>> +#if defined(CONFIG_TPM_V2)
>> +       int rc;
>> +       struct udevice *dev;
>> +       /*
>> +        * The digest is just an arbitrary sequence for now to ensure that the
>> +        * TPM gets "poisoned."
>> +        */
>> +       unsigned char digest[32] = {
> const


Ack.


>
>> +               0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
>> +               0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
>> +               0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
>> +               0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
>> +       };
>> +
>> +       rc = uclass_first_device_err(UCLASS_TPM, &dev);
>> +       if (rc)
>> +               return 0;
>> +
>> +       rc = tpm_init(dev);
>> +       if (rc)
>> +               return 0;
>> +
>> +       rc = tpm2_startup(dev, TPM2_SU_CLEAR);
>> +       if (rc)
>> +               return 0;
>> +
>> +       rc = tpm2_pcr_extend(dev, 0, digest);
>> +       if (!rc)
>> +               printf("TPM: PCR0 extended.\n");
>> +#endif
>> +       return 0;
>> +}
>> diff --git a/configs/ast2600_ibm_defconfig b/configs/ast2600_ibm_defconfig
>> new file mode 100644
>> index 0000000000..3fe85bc57a
>> --- /dev/null
>> +++ b/configs/ast2600_ibm_defconfig
>> @@ -0,0 +1,137 @@
>> +CONFIG_ARM=y
>> +CONFIG_SYS_CONFIG_NAME="evb_ast2600_spl_emmc"
>> +CONFIG_SYS_DCACHE_OFF=y
>> +CONFIG_POSITION_INDEPENDENT=y
>> +CONFIG_SYS_THUMB_BUILD=y
>> +# CONFIG_SPL_USE_ARCH_MEMCPY is not set
>> +# CONFIG_SPL_USE_ARCH_MEMSET is not set
>> +CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
>> +CONFIG_ARCH_ASPEED=y
>> +CONFIG_SYS_TEXT_BASE=0x81000000
>> +CONFIG_ASPEED_AST2600=y
>> +# CONFIG_ASPEED_LOADERS is not set
>> +CONFIG_TARGET_AST2600_IBM=y
>> +CONFIG_DEFAULT_DEVICE_TREE="ast2600-rainier"
>> +CONFIG_SPL_GPIO_SUPPORT=y
>> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
>> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
>> +CONFIG_SYS_MALLOC_F_LEN=0x2000
>> +CONFIG_SPL_MMC_SUPPORT=y
>> +CONFIG_SPL_SERIAL_SUPPORT=y
>> +CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>> +CONFIG_ENV_SIZE=0x10000
>> +CONFIG_ENV_OFFSET=0x5000
>> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000
>> +CONFIG_SPL=y
>> +CONFIG_SPL_STACK_R_ADDR=0x90300000
>> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
>> +CONFIG_ARMV7_PSCI_NR_CPUS=2
>> +CONFIG_NR_DRAM_BANKS=1
>> +CONFIG_FIT=y
>> +CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
>> +CONFIG_FIT_SIGNATURE=y
>> +CONFIG_SPL_FIT_SIGNATURE=y
>> +CONFIG_SPL_LOAD_FIT=y
>> +CONFIG_USE_BOOTARGS=y
>> +CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
>> +CONFIG_USE_BOOTCOMMAND=y
>> +CONFIG_BOOTCOMMAND="bootm 20100000"
>> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
>> +CONFIG_DISPLAY_BOARDINFO_LATE=y
>> +CONFIG_ARCH_EARLY_INIT_R=y
>> +CONFIG_BOARD_LATE_INIT=y
>> +CONFIG_SPL_BOARD_INIT=y
>> +# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
>> +CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>> +CONFIG_SPL_STACK_R=y
>> +CONFIG_SPL_SEPARATE_BSS=y
>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
>> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
>> +CONFIG_SPL_SHA512_SUPPORT=y
>> +CONFIG_SPL_FIT_IMAGE_TINY=y
>> +CONFIG_SPL_DM_RESET=y
>> +CONFIG_SPL_RAM_SUPPORT=y
>> +CONFIG_SPL_RAM_DEVICE=y
>> +CONFIG_SPL_WATCHDOG_SUPPORT=y
>> +CONFIG_SPL_YMODEM_SUPPORT=y
>> +CONFIG_HUSH_PARSER=y
>> +# CONFIG_AUTO_COMPLETE is not set
>> +CONFIG_SYS_PROMPT="ast# "
>> +CONFIG_CMD_BOOTZ=y
>> +# CONFIG_CMD_ELF is not set
>> +# CONFIG_CMD_IMI is not set
>> +# CONFIG_CMD_XIMG is not set
>> +CONFIG_CMD_MEMTEST=y
>> +CONFIG_SYS_ALT_MEMTEST=y
>> +CONFIG_CMD_CLK=y
>> +CONFIG_CMD_GPIO=y
>> +CONFIG_CMD_GPT=y
>> +# CONFIG_RANDOM_UUID is not set
>> +CONFIG_CMD_I2C=y
>> +CONFIG_CMD_MMC=y
>> +CONFIG_CMD_PART=y
>> +CONFIG_CMD_SF=y
>> +CONFIG_CMD_DHCP=y
>> +CONFIG_CMD_MII=y
>> +CONFIG_CMD_PING=y
>> +CONFIG_CMD_NCSI=y
>> +CONFIG_CMD_EXT2=y
>> +CONFIG_CMD_EXT4=y
>> +CONFIG_CMD_EXT4_WRITE=y
>> +CONFIG_CMD_FAT=y
>> +CONFIG_CMD_FS_GENERIC=y
>> +CONFIG_CMD_MTDPARTS=y
>> +# CONFIG_SPL_DOS_PARTITION is not set
>> +# CONFIG_SPL_EFI_PARTITION is not set
>> +CONFIG_SPL_OF_CONTROL=y
>> +CONFIG_ENV_IS_IN_MMC=y
>> +CONFIG_USE_DEFAULT_ENV_FILE=y
>> +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
>> +CONFIG_NET_RANDOM_ETHADDR=y
>> +CONFIG_SPL_DM=y
>> +CONFIG_REGMAP=y
>> +CONFIG_SYSCON=y
>> +CONFIG_SPL_OF_TRANSLATE=y
>> +CONFIG_CLK=y
>> +CONFIG_SPL_CLK=y
>> +CONFIG_ASPEED_HACE_V1=y
>> +CONFIG_DM_GPIO=y
>> +CONFIG_SPL_GPIO_HOG=y
>> +CONFIG_ASPEED_GPIO=y
>> +CONFIG_DM_I2C=y
>> +CONFIG_SYS_I2C_ASPEED=y
>> +CONFIG_MISC=y
>> +CONFIG_ASPEED_AHBC=y
>> +CONFIG_DM_MMC=y
>> +CONFIG_SPL_MMC_TINY=y
>> +CONFIG_MMC_SDHCI=y
>> +CONFIG_MMC_SDHCI_ASPEED=y
>> +CONFIG_DM_SPI_FLASH=y
>> +CONFIG_SPI_FLASH=y
>> +CONFIG_SPI_FLASH_GIGADEVICE=y
>> +CONFIG_SPI_FLASH_MACRONIX=y
>> +CONFIG_SPI_FLASH_SPANSION=y
>> +CONFIG_SPI_FLASH_STMICRO=y
>> +CONFIG_SPI_FLASH_WINBOND=y
>> +CONFIG_PHY_BROADCOM=y
>> +CONFIG_PHY_REALTEK=y
>> +CONFIG_PHY_NCSI=y
>> +CONFIG_DM_ETH=y
>> +CONFIG_PHY_GIGE=y
>> +CONFIG_FTGMAC100=y
>> +CONFIG_MDIO=y
>> +CONFIG_PHY=y
>> +CONFIG_PINCTRL=y
>> +CONFIG_RAM=y
>> +CONFIG_SPL_RAM=y
>> +CONFIG_DM_SERIAL=y
>> +CONFIG_SYS_NS16550=y
>> +CONFIG_SPI=y
>> +CONFIG_DM_SPI=y
>> +CONFIG_SYSRESET=y
>> +CONFIG_WDT=y
>> +CONFIG_USE_TINY_PRINTF=y
>> +CONFIG_SPL_TINY_MEMSET=y
>> +CONFIG_TPM=y
>> +CONFIG_TPM2_TIS_I2C=y
>> +# CONFIG_EFI_LOADER is not set
>> --
>> 2.27.0
>>
