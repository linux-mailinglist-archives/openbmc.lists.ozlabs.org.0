Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5AD1A286A
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 20:23:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yCM73s4NzDqjX
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 04:23:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yCK62h8xzDr6T
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 04:21:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038I2udv085427
 for <openbmc@lists.ozlabs.org>; Wed, 8 Apr 2020 14:21:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 309202dpv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 14:21:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038ILBcc023993
 for <openbmc@lists.ozlabs.org>; Wed, 8 Apr 2020 18:21:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3091me0uwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2020 18:21:20 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038ILH2Z60359156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 18:21:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDEA5136051;
 Wed,  8 Apr 2020 18:21:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C7713604F;
 Wed,  8 Apr 2020 18:21:17 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 18:21:17 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] configs: Add OpenBMC spl
 defconfig for AST2600 boards
Date: Wed,  8 Apr 2020 13:21:13 -0500
Message-Id: <1586370073-71433-1-git-send-email-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=868 spamscore=0
 suspectscore=1 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080130
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

This is based on the ast2600_openbmc_defconfig plus the spl
options enabled in evb-ast2600a1-spl_defconfig but without
the SPL_YMODEM_SUPPORT due to space constraints.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/ast2600_openbmc_spl_defconfig | 126 ++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 configs/ast2600_openbmc_spl_defconfig

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
new file mode 100644
index 0000000..d87da43
--- /dev/null
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -0,0 +1,126 @@
+CONFIG_ARM=y
+CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
+CONFIG_SYS_DCACHE_OFF=y
+CONFIG_POSITION_INDEPENDENT=y
+CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x10000
+CONFIG_ASPEED_AST2600=y
+CONFIG_TARGET_EVB_AST2600A1=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xE0000
+CONFIG_SPL=y
+CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_SPL_FIT=y
+CONFIG_SPL_FIT_PRINT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20100000"
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_ARCH_EARLY_INIT_R=y
+CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x0
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RAM_SUPPORT=y
+CONFIG_SPL_RAM_DEVICE=y
+CONFIG_SPL_WATCHDOG_SUPPORT=y
+CONFIG_HUSH_PARSER=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_BOOTZ=y
+# CONFIG_CMD_BOOTEFI is not set
+# CONFIG_CMD_ELF is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
+# CONFIG_CMD_NVEDIT_EFI is not set
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_PART=y
+CONFIG_CMD_PCI=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_EXT2=y
+CONFIG_CMD_EXT4=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_FAT=y
+CONFIG_CMD_FS_GENERIC=y
+CONFIG_CMD_MTDPARTS=y
+CONFIG_EFI_PARTITION=y
+CONFIG_SPL_OF_CONTROL=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_USE_ENV_SPI_BUS=y
+CONFIG_ENV_SPI_BUS=0
+CONFIG_USE_ENV_SPI_CS=y
+CONFIG_ENV_SPI_CS=0
+CONFIG_USE_ENV_SPI_MAX_HZ=y
+CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SPL_DM=y
+CONFIG_REGMAP=y
+CONFIG_SYSCON=y
+CONFIG_CLK=y
+CONFIG_SPL_CLK=y
+CONFIG_DM_GPIO=y
+CONFIG_ASPEED_GPIO=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_MISC=y
+CONFIG_ASPEED_AHBC=y
+CONFIG_ASPEED_H2X=y
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
+CONFIG_PCI=y
+CONFIG_DM_PCI=y
+CONFIG_PCIE_ASPEED=y
+CONFIG_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_RAM=y
+CONFIG_SPL_RAM=y
+CONFIG_DM_SERIAL=y
+CONFIG_SYS_NS16550=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SYSRESET=y
+CONFIG_TEE=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_WDT=y
+CONFIG_HEXDUMP=y
+# CONFIG_GENERATE_SMBIOS_TABLE is not set
-- 
1.8.3.1

