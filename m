Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC536528A
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:48:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ5S1TwFz2yR4
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:48:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GyOhuxph;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GyOhuxph; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ423nflz2yhk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:14 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id w6so10324949pfc.8
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGoCgBRlhNTiLeF5NSNJvH1b87Ep8SZSdhMeSLwqqZg=;
 b=GyOhuxphPWpdPv/pd2RBn647Zy2oXNsq2btV9d8k5H0jWBK+vlByEWuj0KLbfIMqPT
 QlBtEcKiUxY8RqX0j4lW8CigdoXuPlSMLoLX8bMgoBfQABMAXdc7W+/KuT+5J6v1mYIX
 S7OodENvNzQbeDdhYXQvfDc+kxIzzCGQZBHRtiGBeNMH4jVMt8m2rupJqYfSClFwZwBB
 3kjJvodevbVXYp/7G4n82UELBEHaC0C5s9G3EPCLkin1rUloGyHhVSyk9mjWLIsLo7cw
 ksL7DlPRCEsrSiwLntizaSsJBVjIavqZNmeGK3cL699uWESkGen1svvov7YY7L1zFsWs
 p7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UGoCgBRlhNTiLeF5NSNJvH1b87Ep8SZSdhMeSLwqqZg=;
 b=BV9DgvcpoKJ5a1UjXKlsolx5t0JFDUSL01Tp/zP42zrgwSLFa38sMJ28MPLmmctCST
 ryrcRbr898TEIxhOXhhg30eLx7P1kguatTcTJiv6R4aUiNrRuDFLzuqOjLrSveKQ9grH
 PiAfO2Tyxp3V3Msx0YA5FjaKOdQmSp7PCoLk9nSGlcxU7M4+z/Yo7Dmh5nsLx2NTXCxn
 r0xc601+blgw41hUYxwEtRFJ8fgyfErIJEsAHltNwvzjpyI0n3ASfYTm2G5VMJxA+lb9
 oRhM3vrbaGwlTjc3+FBeT5a9SucL2dPzmPbWmgtj73zGbOQLQy0uvQvKQ9DaA43ZShCC
 dQOg==
X-Gm-Message-State: AOAM531Tj8fRjtzOfQk4LnmJxVqL9g4WpDOyTyVLZ2XfNiv72V3TdaQR
 iozqKaavnEyzkGyFuTho9JUa7j5JLm0=
X-Google-Smtp-Source: ABdhPJzSCTM9oykrHE18/YRavtklnugTU+Upk6WSdSxXKFsdXol2mqUqDkCNjeKCWfeTeK7ViYXl7Q==
X-Received: by 2002:a63:f056:: with SMTP id s22mr15383683pgj.369.1618901231638; 
 Mon, 19 Apr 2021 23:47:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 03/10] ast2600: Enable HACE
 probing in SPL
Date: Tue, 20 Apr 2021 16:16:41 +0930
Message-Id: <20210420064648.994075-4-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Look up the driver by name so we don't cause a link failure when
building without the HACE driver built in.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/spl.c         | 13 +++++++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 54f89b0e8431..e1eef121d5c6 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -32,6 +32,19 @@ void board_init_f(ulong dummy)
 #endif
 }
 
+#ifdef CONFIG_SPL_BOARD_INIT
+void spl_board_init(void)
+{
+	struct udevice *dev;
+
+	if (uclass_get_device_by_driver(UCLASS_MISC,
+				DM_GET_DRIVER(aspeed_hace),
+				&dev)) {
+		debug("Warning: HACE initialization failure\n");
+	}
+}
+#endif
+
 u32 spl_boot_device(void)
 {
 	switch (aspeed_bootmode()) {
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index f58a677f1914..ed0233379fe9 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -48,7 +48,7 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_ARCH_EARLY_INIT_R=y
 CONFIG_BOARD_EARLY_INIT_F=y
-# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
+CONFIG_SPL_BOARD_INIT=y
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_STACK_R=y
-- 
2.30.2

