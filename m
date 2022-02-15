Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B24B7B57
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 00:48:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyyT40t0Kz3c5j
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 10:48:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gf/ctdlV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Gf/ctdlV; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyySg67Wvz3002
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 10:47:45 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id m22so668990pfk.6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 15:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2Bdaje8zrkmHj3PV4EQQh5UlviVp1k3LmK5pYerKN4=;
 b=Gf/ctdlVtjGQVdXwt6iHyWxCAsuj6irAC2bC1BRklMH6nPlxccjWTvcE678DVC38pD
 STqNqHzFT8hNVLFXL5xZVhx3ib/A65U7omNtVOh2kHqmQFU0uuj8ZyJuFSjbAUE3P+n0
 A1mSm41VSDTfxzmdBvNiXgmH3BSYTV66bOwf3skW+UIa7XPhJE6zyeHBo2t9LAHuz3QL
 DPiaUFhE8dry5o4h11gSP6efjl7YK66KFFTSUP4iI8n1I2qQRmcVQ7CntUeCbXxRGi5E
 KzsH4OXLe3WzOd5qS0Na9ujUymJPFN9b81VXiRCbd1+DwURbh55QuW20f1VCyBqZV9Dm
 BRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=h2Bdaje8zrkmHj3PV4EQQh5UlviVp1k3LmK5pYerKN4=;
 b=J9gIb+3hS7wi0l2nf5R0egzcbZdXR5f4czAL+QvCjqO0DbQ202MHTF/Y+G6JPEt1mX
 Jw6j777TV1T/77TWqThzJTJmvQUew0uT/BoCZpBfuoN1A6OUreFXmO1H7gU4Q/Xjm5gE
 SS5uPizKhAM435nxAWfZZMbxacMKGu36ngWf8VN8bZVtoGmF8msjBBlIy07qndYQxpGE
 4CNpkx/3eAFDXtv0q8/vYbSXCWE0yi5LvnyXFsehE9Eceia/xBrQgnG3VrYOH9qEb5AW
 0Li4R+UhTFdLApN0SlzuH+SexnklLXXs49mBty0qvz+Mh/SRiPm9E+KBLdFBJPiRtCmy
 if8g==
X-Gm-Message-State: AOAM533ewaXd7qHGUmc1lBPG3C7ZU6IcQMp7rAwtYDpoZ1wVwUC/iDws
 dZqikipPLpTJrS8PFPyxMTEdK6HLXfg=
X-Google-Smtp-Source: ABdhPJw1BLuZS3SJZ+kzwrpWtpjmkQ9YTFjKTeyrxWGMiX5AV0XBflBsCqTHGfkx70t6+knz676vyg==
X-Received: by 2002:aa7:909a:0:b0:4e1:6d4:5905 with SMTP id
 i26-20020aa7909a000000b004e106d45905mr434551pfa.34.1644968860850; 
 Tue, 15 Feb 2022 15:47:40 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id w12sm3462239pgl.64.2022.02.15.15.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 15:47:40 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: Disable unused loaders,
 add STMICRO flash
Date: Wed, 16 Feb 2022 10:17:30 +1030
Message-Id: <20220215234731.130682-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

By removing the unused loaders we save enough space to enable the ST
Micro flash devices and still fit in the size limit:

 text	   data	    bss	    dec	    hex	filename
 340614	  13608	      0	 354222	  567ae	ast2400-obj/u-boot
 340923	  13632	      0	 354555	  568fb	ast2500-obj/u-boot

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/evb-ast2400_defconfig | 4 ++++
 configs/evb-ast2500_defconfig | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/configs/evb-ast2400_defconfig b/configs/evb-ast2400_defconfig
index bb9c80a88521..f92dbfd668cd 100644
--- a/configs/evb-ast2400_defconfig
+++ b/configs/evb-ast2400_defconfig
@@ -17,6 +17,8 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
 CONFIG_HUSH_PARSER=y
 # CONFIG_AUTO_COMPLETE is not set
 CONFIG_SYS_PROMPT="ast# "
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
 CONFIG_CMD_MEMTEST=y
 CONFIG_SYS_ALT_MEMTEST=y
 CONFIG_CMD_CLK=y
@@ -51,6 +53,7 @@ CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
 CONFIG_DM_ETH=y
@@ -65,3 +68,4 @@ CONFIG_DM_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_TIMER=y
 CONFIG_WDT=y
+# CONFIG_EFI_LOADER is not set
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 000ed3f90bdd..91921cf76e62 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -17,6 +17,8 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
 CONFIG_HUSH_PARSER=y
 # CONFIG_AUTO_COMPLETE is not set
 CONFIG_SYS_PROMPT="ast# "
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_XIMG is not set
 CONFIG_CMD_MEMTEST=y
 CONFIG_SYS_ALT_MEMTEST=y
 CONFIG_CMD_CLK=y
@@ -52,6 +54,7 @@ CONFIG_SPI_FLASH=y
 CONFIG_SPI_FLASH_GIGADEVICE=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
 CONFIG_DM_ETH=y
@@ -66,3 +69,4 @@ CONFIG_DM_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_TIMER=y
 CONFIG_WDT=y
+# CONFIG_EFI_LOADER is not set
-- 
2.34.1

