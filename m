Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440F52D6FE
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:08:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3tXW1kqjz30D0
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 01:08:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=SQ63Eey/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=SQ63Eey/; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3tWQ6Fykz2yyh
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 01:07:28 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id i19so10503387eja.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GoTsVclPIS6mTCu1dG5Xb42sNV8zF1raq7z9vtB6rLI=;
 b=SQ63Eey/mWNafU0M5lFSKDEw/Zwd7gUrhEE2dqkBqECh+QeRNB3IEL/N5KE9DROpYz
 JeuoRx60n9S1bHsy+bwvXvb606qc+pKczwqyIUMx1AeZ8kDOA48PhtESQfsU+2gUjcs4
 U9Dykt1OQRPLomUJwvb8mS/X5Qs9GbtFh/JmFEIcM52QP9SRDagmNg3j06/huZ7RDo6u
 5Oye9+d+A9KATwsdBG5LiZgeULuCogM7/Y231Rsh6wYV/iChV69FBEekMXpkDGJ4LWVf
 NSH0LSvz8SqVI3WExwCuEBgpY2jDAL6SrDJSpnnawTiCPvHDtzLocTtx+rsULhvpavqW
 O2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GoTsVclPIS6mTCu1dG5Xb42sNV8zF1raq7z9vtB6rLI=;
 b=3b8BBZyehrxyjmtZWbHFxAqNj9a5Oqwquv/KEp8YWArP1qcHAMIHV5VnNA3dbrZWnj
 QgXEiYZr5+kqw6iJbV4mKywpZyTy/xPXCaLF6tXq8laj3Nwb4uhH3APsz6UEikA1il8X
 LltmV3esiEDizgZie1c1/qbfdHvkTIRMElD6HgLt/DEvKpAIAk7ujiw+/mhovELyhEgg
 uXI57SYVjwdFumrQWVDNQmGV3tqK7LNrecGN9kfYQWhQXN64Z8GJahNGqA3HUZ5qrLqS
 NDbST4sjkSKsYRBh7OiY3Tk+b/rtIEfWuqDuKqMg0Tftj1g0OtLwLqA0odisSBcMZEgi
 qOKw==
X-Gm-Message-State: AOAM530pWiKZJiXOKRGUAmnjTZ1MHXnpFcuCOg69aTErg12Ssx8ktq3U
 Ak9vLD0e7eh+4fdi+Eqr8EcgTOGcfsl4Tg==
X-Google-Smtp-Source: ABdhPJyz55mCIuC4inywRXn6IofWFFhVZzHC7+YjQVyzIAkmcvPNDN07fQAy1OfdMgo9qg2AZS1luA==
X-Received: by 2002:a17:907:381:b0:6fe:9ca8:c4b4 with SMTP id
 ss1-20020a170907038100b006fe9ca8c4b4mr2676457ejb.147.1652972844806; 
 Thu, 19 May 2022 08:07:24 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a056402124300b0042617ba63d5sm2962263edw.95.2022.05.19.08.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 08:07:24 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 3/3] configs: Add IBM
 Genesis3 defconfig
Date: Thu, 19 May 2022 17:07:19 +0200
Message-Id: <20220519150719.22338-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220519150719.22338-1-patrick.rudolph@9elements.com>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the evb-ast2500_defconfig as reference to add support for the
IBM genesis3 board.

Changes compared to evb-ast2500_defconfig are:
- Route debug uart to TXD1/RXD1
- Disable MMC and I2C support
- Use DTB ast2500-ibm-genesis3

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 configs/ibm_genesis3_defconfig | 74 ++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 configs/ibm_genesis3_defconfig

diff --git a/configs/ibm_genesis3_defconfig b/configs/ibm_genesis3_defconfig
new file mode 100644
index 0000000000..1a81b66c62
--- /dev/null
+++ b/configs/ibm_genesis3_defconfig
@@ -0,0 +1,74 @@
+CONFIG_SPI_BOOT=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_LOG=y
+CONFIG_BOOTCOMMAND="bootm 20080000"
+CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw earlycon"
+# CONFIG_SYS_I2C_ASPEED is not set
+CONFIG_ASPEED_AHBC=y
+CONFIG_ARM=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x60000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_FIT=y
+CONFIG_USE_BOOTARGS=y
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_PRE_CONSOLE_BUFFER=y
+CONFIG_PRE_CON_BUF_ADDR=0x1e720000
+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
+CONFIG_HUSH_PARSER=y
+# CONFIG_AUTO_COMPLETE is not set
+CONFIG_SYS_PROMPT="ast# "
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
+CONFIG_CMD_MEMTEST=y
+CONFIG_SYS_ALT_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_DHCP=y
+CONFIG_CMD_MII=y
+CONFIG_CMD_PING=y
+CONFIG_DEFAULT_DEVICE_TREE="ast2500-ibm-genesis3"
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_USE_ENV_SPI_BUS=y
+CONFIG_ENV_SPI_BUS=0
+CONFIG_USE_ENV_SPI_CS=y
+CONFIG_ENV_SPI_CS=0
+CONFIG_USE_ENV_SPI_MAX_HZ=y
+CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_SF_DEFAULT_SPEED=50000000
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_REGMAP=y
+CONFIG_CLK=y
+CONFIG_DM_GPIO=y
+CONFIG_ASPEED_GPIO=y
+# CONFIG_DM_I2C is not set
+CONFIG_MISC=y
+# CONFIG_DM_MMC is not set
+# CONFIG_MMC is not set
+# CONFIG_CMD_MMC is not set
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SDHCI_ASPEED is not set
+# CONFIG_MMC_HW_PARTITIONING is not set
+CONFIG_SPI_FLASH_SFDP_SUPPORT=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_DM_ETH=y
+CONFIG_FTGMAC100=y
+# CONFIG_PHY is not set
+CONFIG_PINCTRL=y
+CONFIG_DM_SERIAL=y
+CONFIG_SYS_NS16550=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_SYSRESET=y
+CONFIG_TIMER=y
+CONFIG_WDT=y
+CONFIG_WDT_ASPEED=y
+# CONFIG_EFI_LOADER is not set
+CONFIG_DRAM_UART_TO_UART1=y
+CONFIG_FIRMWARE_2ND_BOOT=y
-- 
2.35.3

