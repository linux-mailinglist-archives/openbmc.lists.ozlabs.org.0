Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42606459436
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 18:47:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyZTz6bbrz305v
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 04:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=eu4RINqR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Cy3+tKEg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=eu4RINqR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Cy3+tKEg; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyZTY2NyYz2xXd
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 04:46:56 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 891DA3200681;
 Mon, 22 Nov 2021 12:46:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Nov 2021 12:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm3; bh=2cJ4g9Qk7Q/3i
 xKDnkrEm62RXCHiYzcPZ6d+usxksdw=; b=eu4RINqRj4RW62oj4mJzQ7Hi7fdHq
 vZ1hg9HawSIBQVVjAD2B6wZfas0gbyF3fAE1faTt2x8buC3qxaHCyVJiul5AYAvG
 3xbtz1PmcBSptGVu11A8oJL9uK2Ljes+8W2cBXglQmRy2LxZYPeEG1xA6s4mzbeL
 tzvMpFFkWdY837Wisr0r9T08Tyu/uJ+IEek8WPn4/+93E3t/2ZME9g6cuXfRggL4
 kI/zDxDF93hR/QdzfI2AFgKMDVoswsZMOE5FfpUtFi2LqgC10izYGCQa1aBLU0k1
 7n6nA8NYrCaV6TaPoWSQo+38ivxwhVdUixAgklgRZfsRzTuOFEPMeKvFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2cJ4g9Qk7Q/3ixKDn
 krEm62RXCHiYzcPZ6d+usxksdw=; b=Cy3+tKEgZT243iHziBdRgF/l70ArHo62X
 yDucWe64c3DCevyRvKbb+c8C5ieQt93cLFVMbQP0FD4oxG1vh02o5SR8+mkvdG/U
 q57WJm6RHvGCm6h1MgaQdGF65/LMQOV4TQA3P6uF/OSof5Yu87su8/6M1QEj3GWI
 gTXMjC2y5Yj0zEjeF7XPwm2RNgXrdbFdfMZTPR7R9z88q3bHonpN6Lq44GYFyp/J
 hLCBG0gE0JhWn92TJmNsdWUlemcTPN44ERVANfYG1h3yMzKHFMw7Jc9ys6M6/Klq
 mUOgZESkvFF2yvCHlh9+o2rtQcL9NIn0iWbvxQR51rq6K1k/LH9/g==
X-ME-Sender: <xms:jNebYYQyx8I02INmR8J7WUVM4u9iYUa7kwCQw4Uvtybd8NrgNabs9Q>
 <xme:jNebYVw22TdpXEIIvzQ1vc9lzYcT_g-rN5XERfRp853QwGf3hOx7SxK19YQI_QfWJ
 _yBPObagQrBGlt59io>
X-ME-Received: <xmr:jNebYV0lg8q59MDF7SRJIdqbFurlBCNu7gQsKRdET_DML5GYe9A12fcFPk2-diyiEFLkwOHG2pFe5d00xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
 ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpefgvdefveehueekvd
 dtleegtdfhhefgleelheehvedtgeevteelffekfeegudekjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:jNebYcDiB2rEcJSjx4fGg_WJybgbclltCqkSNR8oNTjC8FVLMczt6A>
 <xmx:jNebYRjQVwAyq-CZaWmQL6SBtGNqdLC0ytXXOu-VLL3ZR_EwL06o7g>
 <xmx:jNebYYrGXzETbJb-5V008DEzwP_rNJ_KyRltB8co6_9gWrbWwlQq_Q>
 <xmx:jNebYWuzQieQEZyBiiWletvjieFEtlU7ck__9Pr3OXKrhyGePxMeZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 12:46:52 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	cjengel@us.ibm.com
Subject: [RFC PATCH u-boot v2019.04-aspeed-openbmc] aspeed/ast2600: refuse to
 boot
Date: Mon, 22 Nov 2021 12:46:51 -0500
Message-Id: <20211122174651.183392-1-bradleyb@fuzziesquirrel.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: andrew@aj.id.au, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a hack that purposefully causes the SPL to fail to boot.  Enable
with CONFIG_ASPEED_AST2600_SPL_REFUSE_TO_BOOT.  Added a clone of
configs/ast2600_openbmc_spl_emmc_defconfig with
CONFIG_ASPEED_AST2600_SPL_REFUSE_TO_BOOT enabled.

The intent is to allow testing of a production signing process or keys
with an image that refuses to do anything (and thus if it were to
escape, cannot be used to do anything harmful).

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/mach-aspeed/ast2600/Kconfig          |   7 +
 arch/arm/mach-aspeed/ast2600/spl.c            |   4 +
 ..._openbmc_spl_emmc_refuse_to_boot_defconfig | 134 ++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 configs/ast2600_openbmc_spl_emmc_refuse_to_boot_defconfig

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index fcdc425de5..4b03de4126 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -40,6 +40,13 @@ config TARGET_AST2600_INTEL
 
 endchoice
 
+config ASPEED_AST2600_SPL_REFUSE_TO_BOOT
+	bool "Unconditionally hang in board_init_f"
+	default n
+	depends on SPL && ASPEED_AST2600
+	help
+	  Select this option to build an SPL that will never boot.
+
 source "board/aspeed/evb_ast2600/Kconfig"
 source "board/aspeed/fpga_ast2600/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index c759a7575d..d269831e0d 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -27,6 +27,10 @@ void board_init_f(ulong dummy)
 	spl_early_init();
 	timer_init();
 	preloader_console_init();
+#ifdef CONFIG_ASPEED_AST2600_SPL_REFUSE_TO_BOOT
+	puts(SPL_TPL_PROMPT "development image, refusing to boot\n");
+	hang();
+#endif
 	dram_init();
 	aspeed_mmc_init();
 #endif
diff --git a/configs/ast2600_openbmc_spl_emmc_refuse_to_boot_defconfig b/configs/ast2600_openbmc_spl_emmc_refuse_to_boot_defconfig
new file mode 100644
index 0000000000..f3b6106068
--- /dev/null
+++ b/configs/ast2600_openbmc_spl_emmc_refuse_to_boot_defconfig
@@ -0,0 +1,134 @@
+CONFIG_ARM=y
+CONFIG_SYS_CONFIG_NAME="evb_ast2600_spl"
+CONFIG_SYS_DCACHE_OFF=y
+CONFIG_POSITION_INDEPENDENT=y
+CONFIG_SYS_THUMB_BUILD=y
+# CONFIG_SPL_USE_ARCH_MEMCPY is not set
+# CONFIG_SPL_USE_ARCH_MEMSET is not set
+CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x81000000
+CONFIG_ASPEED_AST2600=y
+# CONFIG_ASPEED_LOADERS is not set
+CONFIG_ASPEED_AST2600_SPL_REFUSE_TO_BOOT=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x5000
+CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
+CONFIG_SPL=y
+CONFIG_SPL_STACK_R_ADDR=0x90300000
+CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
+CONFIG_ARMV7_PSCI_NR_CPUS=2
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
+CONFIG_FIT_SIGNATURE=y
+CONFIG_SPL_FIT_SIGNATURE=y
+CONFIG_SPL_LOAD_FIT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="bootm 20100000"
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_ARCH_EARLY_INIT_R=y
+CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_SPL_BOARD_INIT=y
+# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
+CONFIG_SPL_SYS_MALLOC_SIMPLE=y
+CONFIG_SPL_STACK_R=y
+CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
+CONFIG_SPL_SHA512_SUPPORT=y
+CONFIG_SPL_FIT_IMAGE_TINY=y
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
+# CONFIG_SPL_DOS_PARTITION is not set
+# CONFIG_SPL_EFI_PARTITION is not set
+CONFIG_SPL_OF_CONTROL=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_USE_DEFAULT_ENV_FILE=y
+CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_SPL_DM=y
+CONFIG_REGMAP=y
+CONFIG_SYSCON=y
+CONFIG_SPL_OF_TRANSLATE=y
+CONFIG_CLK=y
+CONFIG_SPL_CLK=y
+CONFIG_ASPEED_HACE=y
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
+CONFIG_SPL_TINY_MEMSET=y
+CONFIG_TPM=y
+CONFIG_SPL_TPM=y
+# CONFIG_EFI_LOADER is not set
-- 
2.34.0

