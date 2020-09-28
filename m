Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718727B651
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 22:32:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Z2R33ZxzDqDW
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 06:32:31 +1000 (AEST)
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
 header.s=pp1 header.b=Fyk0oqU2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0YxL3309zDqLR
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 06:28:06 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SKPIP8028108; Mon, 28 Sep 2020 16:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YTkMxS+QgRy1a5m+UT3qnv0l1dDuSQAWHOqM8YRs/UE=;
 b=Fyk0oqU2WTlZHWcB7F4QMZZyB381+jIoZdLg2qi3l9bybmZwvvn77lSHdFKN2Ski18Xc
 Vp7Uee8b6KhWKdXz92PPrviuhaK4HzeRYCYxNmMNzOLvofogf4BGe4mB9lIZC+hNq0my
 0TfVDO72aq7mOAhcc+qo0efwDEqmrvCxsZCAffYdxq/gFIEOHI+dUKd2wjzyQ7tblrzD
 W6nNsCaaXDbChnTfn2Fzs/68r1UFno/dWM2DlURyCw9oe2h4ObwmNAEw4hZfkejgF7nM
 S7Z88eU47s2jUBgjZzjLBmotAhgiCYjDXFx6uDpP9U4Ld+yLIdPNtc/IYEH0fsPyHVYu Sw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33up8g9122-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:28:03 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SKR2x6026647;
 Mon, 28 Sep 2020 20:28:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 33sw993n37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 20:28:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SKS1xD45547900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 20:28:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A593B2064;
 Mon, 28 Sep 2020 20:28:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0783B2067;
 Mon, 28 Sep 2020 20:28:00 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.158.203])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 20:28:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 3/3] configs: Add AST2600 SPL
 eMMC configuration
Date: Mon, 28 Sep 2020 15:27:53 -0500
Message-Id: <20200928202753.58351-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928202753.58351-1-eajames@linux.ibm.com>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_20:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=15
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=788 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009280148
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

U-Boot and environment are to be loaded off the eMMC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
 include/configs/aspeed-common.h            |   6 +
 2 files changed, 136 insertions(+)
 create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
new file mode 100644
index 0000000000..68d18652c9
--- /dev/null
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -0,0 +1,130 @@
+CONFIG_ARM=y
+CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
+CONFIG_SYS_DCACHE_OFF=y
+CONFIG_POSITION_INDEPENDENT=y
+CONFIG_SPL_SYS_THUMB_BUILD=y
+CONFIG_SYS_THUMB_BUILD=y
+CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x10000
+CONFIG_ASPEED_AST2600=y
+CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
+CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
+CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
+CONFIG_ASPEED_UBOOT_MMC_PART=1
+CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
+CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
+CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
+CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
+CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
+CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
+CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
+CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
+CONFIG_TARGET_EVB_AST2600A1=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x5000
+CONFIG_SPL=y
+CONFIG_SPL_STACK_R_ADDR=0x90300000
+CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
+CONFIG_ARMV7_PSCI_NR_CPUS=2
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20100000"
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_ARCH_EARLY_INIT_R=y
+CONFIG_BOARD_EARLY_INIT_F=y
+# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
+# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
+CONFIG_SPL_SYS_MALLOC_SIMPLE=y
+CONFIG_SPL_STACK_R=y
+CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RAM_SUPPORT=y
+CONFIG_SPL_RAM_DEVICE=y
+CONFIG_SPL_WATCHDOG_SUPPORT=y
+CONFIG_SPL_YMODEM_SUPPORT=y
+CONFIG_HUSH_PARSER=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTZ=y
+# CONFIG_CMD_ELF is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_GPT=y
+# CONFIG_RANDOM_UUID is not set
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_PART=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_NCSI=y
+CONFIG_CMD_EXT2=y
+CONFIG_CMD_EXT4=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_FAT=y
+CONFIG_CMD_FS_GENERIC=y
+CONFIG_CMD_MTDPARTS=y
+# CONFIG_SPL_EFI_PARTITION is not set
+CONFIG_SPL_OF_CONTROL=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SPL_DM=y
+CONFIG_REGMAP=y
+CONFIG_SYSCON=y
+CONFIG_SPL_OF_TRANSLATE=y
+CONFIG_CLK=y
+CONFIG_SPL_CLK=y
+CONFIG_DM_GPIO=y
+CONFIG_ASPEED_GPIO=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_MISC=y
+CONFIG_ASPEED_AHBC=y
+CONFIG_DM_MMC=y
+CONFIG_SPL_MMC_TINY=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_ASPEED=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_GIGADEVICE=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_PHY_BROADCOM=y
+CONFIG_PHY_REALTEK=y
+CONFIG_PHY_NCSI=y
+CONFIG_DM_ETH=y
+CONFIG_PHY_GIGE=y
+CONFIG_FTGMAC100=y
+CONFIG_MDIO=y
+CONFIG_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_RAM=y
+CONFIG_SPL_RAM=y
+CONFIG_DM_SERIAL=y
+CONFIG_SYS_NS16550=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SYSRESET=y
+CONFIG_WDT=y
+CONFIG_USE_TINY_PRINTF=y
+CONFIG_TPM=y
+CONFIG_SPL_TPM=y
+# CONFIG_EFI_LOADER is not set
diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
index 4c83035d3c..876958735b 100755
--- a/include/configs/aspeed-common.h
+++ b/include/configs/aspeed-common.h
@@ -41,6 +41,12 @@
 #define CONFIG_SYS_BOOTMAPSZ		(256 * 1024 * 1024)
 #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
 
+#ifdef CONFIG_ENV_IS_IN_MMC
+#define CONFIG_SYS_MMC_ENV_DEV		0
+#define CONFIG_SYS_MMC_ENV_PART		0
+#define CONFIG_ENV_OFFSET_REDUND	0x15000
+#endif
+
 /*
  * BOOTP options
  */
-- 
2.26.2

