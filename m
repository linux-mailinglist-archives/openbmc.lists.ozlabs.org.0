Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B22B450EE78
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQGb5B5jz3bbS
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=G4kho5Ww;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=G4kho5Ww; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW4740Cxz2yNF
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:32:05 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id u3so5602757wrg.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3fKZVgWiqYXBT8yB5Wqg9we6vzNbiz0W2JSpJ4l8RQ=;
 b=G4kho5Wwtsae0tAO6Oeg9aVm2XKHcgCtrr4poLECj6jQYeqtWp1MpxHnRkmPv7WD5i
 MBLNkE8eoCsuPhNIdbsY8c+wOGWy3yqxNHAcx0Yi3YqU7SUtNpO9R3mUYi5acSVEhr3b
 ZV5I3yybM+h3QjVEtgkAdc5lekJ/t43aOnt2EhZxxmvtcqAYQxMroD1shD5JsSBTj/xi
 chkXSF9m9mHtPeOsDcJzZTcDDnOyxPF0VvctKy2v2yaMow8jchdupaLPsNvdXbqMZK3o
 n1gQMw//NHmdySmT9RyxxNTCvbPypBqLZGWPurNbCgJE7EowT5TPahStaNHIgic+EU7E
 OZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3fKZVgWiqYXBT8yB5Wqg9we6vzNbiz0W2JSpJ4l8RQ=;
 b=cPsQu08Z/UKf4dVdcAp3BVmuVrdxIkbTngbMkJmJQVdpWyhdthYnjORztvfiofg3RI
 JL+yj6O03OZCmDVKebxxOZ8rOMJroaKSA2klhop4MmDj7bTDy0wmm4fGbZBAw7vu76IE
 b1bQyjrUby0znTpS/BqOocyqjub3ViGrdJvwjhXW7LXXamXLNFd3dDewxEp7FWjNCKZM
 Q2DcE6kwBYU0PxxlFEn2k5OQ4kWmpt79VhdH1cJMQ8by/qMI5XegUm97309G0c8F9wml
 eOWhvndB/1bpl93MH76LiP6os9dKS6JM/VvJs+XT9XfoQB9A9fAd48hhNoHjiump38om
 w6bw==
X-Gm-Message-State: AOAM533tLF2SW5hyocPgiHNSYckGPVNzMl3KUbjq4Uf7jFJfBm8dibQF
 qRgM1BfoWJ6JIS//dEXfRyA7hw==
X-Google-Smtp-Source: ABdhPJwgNaz7WQgoCWyUF/sRmlPD/8NpV3aV4U0Gtw8Ul8pihM73SAEEMRrll6XJoQ5WFIsgEEdQtA==
X-Received: by 2002:a05:6000:154a:b0:20a:9529:aa8d with SMTP id
 10-20020a056000154a00b0020a9529aa8dmr14438047wry.93.1650529922220; 
 Thu, 21 Apr 2022 01:32:02 -0700 (PDT)
Received: from fedora.lab.9e.network
 (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1537238wmb.48.2022.04.21.01.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:32:01 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	zweiss@equinix.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 4/4] configs: Add IBM
 Genesis3 defconfig
Date: Thu, 21 Apr 2022 10:31:51 +0200
Message-Id: <20220421083151.1887871-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 configs/ibm_genesis3_defconfig | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 configs/ibm_genesis3_defconfig

diff --git a/configs/ibm_genesis3_defconfig b/configs/ibm_genesis3_defconfig
new file mode 100644
index 0000000000..76a3673991
--- /dev/null
+++ b/configs/ibm_genesis3_defconfig
@@ -0,0 +1,73 @@
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
+CONFIG_DEFAULT_DEVICE_TREE="ibm-genesis3"
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
+CONFIG_DM_I2C=y
+CONFIG_MISC=y
+CONFIG_DM_MMC=y
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
+# CONFIG_EFI_LOADER is not set
+CONFIG_DRAM_UART_TO_UART1=y
+# CONFIG_FIRMWARE_2ND_BOOT is not set
-- 
2.35.1

