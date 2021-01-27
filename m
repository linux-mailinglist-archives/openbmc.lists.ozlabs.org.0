Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C53053F2
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:08:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZSN2tW4zDqlc
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:08:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wf9wpqEH; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJh3b2PzDqlw
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:24 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id g15so759586pjd.2
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrZTzDHA3vbkouJx6E784QZjaaDOGKLDzGBTF7xl4wQ=;
 b=Wf9wpqEHkCtTaM8fHdYwS2BlyCl8d0sr+vkZK1d1N+zL8UBtY1X8u9F3uw/g5p3iL+
 JbbaLtPZLTMm9Rt3cpFBBnwkyF9sWHRTR2AwIW5I6NJbLzJYc0yUdKcNoCMmfReNekHt
 ksOm9SKito4MDnsCAc8mEKGCehfbY02iC4W6h6/IdGa7OWpZilXvD+1s5bjKZvcAb5zz
 Mqjcj7iJDTQiTYtPZl5WELQOg78l42aUDYTueEDDBbT5iWMjaUpPuU6rVfcpZCcGGxJn
 f3qMqrCxBoHvdV3S5C0GxDACv+i7FvtxkMWJzUaM5R59f99MlehDuhgUWyBlB2j/vjLt
 5MXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rrZTzDHA3vbkouJx6E784QZjaaDOGKLDzGBTF7xl4wQ=;
 b=il19ZMPWleL94tlSp99Nttd9B6wKw/Z9FV9X984tu46Yz6a0tsn5YpIZjh5RINKyJp
 tfRprAOC7zgG2xH2tZVjpBnc7LHDlggtWZrwTrt7XoNmDYUtfuSROxB4c2QGVL+gvKUX
 8wC3XrSu347eFF4GqrbHLauypa+5n5BD7/Qa/EP/kJkE5fKGyaI1n2oDzBM3amzAfOov
 EGYJ4Vpj0BFlutT9NYRSkRwV/lchKfNQzwf2Et2zU4XVKek39FEGbIRxfOLOGZHugyPQ
 qsDZ5vK3YKJK9+/2POlvjaXQOd652r+9l53i03wBwwAdA2xPIyOqHSJ5Uv/ezqdoskFY
 AgDQ==
X-Gm-Message-State: AOAM5304uSVczea1MPWcLiaokSNHYjS5+foFyeOlgu5igOGT7F9OHU2B
 2x/SFljAnBrrQJj6rFonrSQ=
X-Google-Smtp-Source: ABdhPJwxNiV0u8ffkgdw7gsUYPdtBVOZB9N2dYf1fgDPkL5tYmXRV3gg2qvsqjufzxhP58hf7fIxaQ==
X-Received: by 2002:a17:90b:3550:: with SMTP id
 lt16mr4202647pjb.139.1611730881884; 
 Tue, 26 Jan 2021 23:01:21 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:21 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 4/6] config: ast2600:
 Disable unused features
Date: Wed, 27 Jan 2021 17:30:52 +1030
Message-Id: <20210127070054.81719-5-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 20f2e7019cb3..3f2de64e077d 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -83,6 +83,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_CMD_MTDPARTS=y
+# CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_ENV_IS_IN_MMC=y
@@ -100,6 +101,7 @@ CONFIG_SYS_I2C_ASPEED=y
 CONFIG_MISC=y
 CONFIG_ASPEED_AHBC=y
 CONFIG_DM_MMC=y
+# CONFIG_MMC_VERBOSE is not set
 CONFIG_SPL_MMC_TINY=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_ASPEED=y
@@ -128,6 +130,7 @@ CONFIG_DM_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_WDT=y
 CONFIG_USE_TINY_PRINTF=y
+# CONFIG_REGEX is not set
 CONFIG_TPM=y
 CONFIG_SPL_TPM=y
 # CONFIG_EFI_LOADER is not set
-- 
2.29.2

