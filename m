Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F95095F8
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 06:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkPdG4z0pz300Q
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 14:26:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=fmpDiHp1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=fmpDiHp1; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjxdN4XXPz2xrx
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 20:25:28 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id l7so2597146ejn.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJbmKb6qyoj+61fZTM2azH6TnlqPfgu7HXAb7Knh8HE=;
 b=fmpDiHp1gbUjJ/xIGAdQFjD9EKb9cmE56NBzS/2jkppD+x1LE/dNE7bJUace2od/ME
 +MmP7BGbm1XolrzN6IpFwdvbCMpZN0zBJu7nhuHa+Nriu9Vmx7wUY9yAq0jkvuYm+gBQ
 PZEu6bQajmiqzXskOb/n90lEpAAaSJnrL/E/btf6JY6dbpNbe9T07yb+n4FDQmd1sOQ1
 Y/YwL5GrEhFfs34/GWbwtNCZ9aj8KiCT1i7KMNc94tmQeshmL5tXopSGQXkp7YgJchJ6
 5vVwHx576BYYXVIr6zbJ3kfsKJbpWXxiJVgEqFdssUI9I3DA7C5G4yX942TK8B5BMlfx
 IUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJbmKb6qyoj+61fZTM2azH6TnlqPfgu7HXAb7Knh8HE=;
 b=MVIl9hjyod9F4rqrfJ2FIizQ6YlgrqZ8aDREOqwf6+JwNmnm4byz6hDpHXrYPmA+/2
 VdjkwD0MRwM9fDdUviX8wuLEybl7s3z8e2zwLbYYcg8Yuj2axkOIzdE0qU/M6H7XxFeI
 sovrb3f3RN4SX+vWacMsZSm1V4USw6Xp+S6mHJCX/bu4fr2Gc7cb8O6ZyggF8Wwpyrfc
 izWGo3eLoJEBvAvQherLDjCzg2OoyAqQydkqN40RaqtUqrok9gvZYXmtiyPlN/LphDTp
 mjyWsCE47QuT1eYG420L6NIgYt8+gkr/wikRWKpFByFvFppCHO47xp0Pq2vBN+2wpsgd
 n2dw==
X-Gm-Message-State: AOAM530jRc0XvaXBc+4LYxUIn/N/B71WtN9aNH/H32osXLbCv+Ldzdfl
 xaP199YCPyz0RtEZ5w2myX6TXg==
X-Google-Smtp-Source: ABdhPJxHrKzY3kzQHcQXN46iJfyBNHCTbo8t2JGIUJuTfEJ3NQmrSVinjOf9uGnLYcKH7htcFzbK/Q==
X-Received: by 2002:a17:906:1706:b0:6e8:9335:d554 with SMTP id
 c6-20020a170906170600b006e89335d554mr17073124eje.111.1650450325144; 
 Wed, 20 Apr 2022 03:25:25 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-005-146-070-114.um05.pools.vodafone-ip.de. [5.146.70.114])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056402020c00b00422e7556951sm7431346edv.87.2022.04.20.03.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 03:25:24 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] configs: Add IBM Genesis3
 defconfig
Date: Wed, 20 Apr 2022 12:25:02 +0200
Message-Id: <20220420102502.1791566-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 14:24:52 +1000
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
 configs/ibm_genesis3_defconfig | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 configs/ibm_genesis3_defconfig

diff --git a/configs/ibm_genesis3_defconfig b/configs/ibm_genesis3_defconfig
new file mode 100644
index 0000000000..b9520547a0
--- /dev/null
+++ b/configs/ibm_genesis3_defconfig
@@ -0,0 +1,72 @@
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
+CONFIG_FIRMWARE_DISABLE_2ND_BOOT=y
+CONFIG_TARGET_IBM_GENESIS3=y
-- 
2.35.1

