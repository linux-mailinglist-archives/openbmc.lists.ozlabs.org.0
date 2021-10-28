Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4705743E387
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg78Z0yjlz2x9d
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:23:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vv/9qsMl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Vv/9qsMl; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74Q6TfPz30R6
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:06 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id z200so5125742wmc.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQff7+i6dxs5PfhTnnbZH3nPeykRVJI64ISY+jsjutU=;
 b=Vv/9qsMlGnB5JIv0T0bguI2eXKZZglN8vGu/a/Wi14UHFC0DGYOe02c4xk/bnwoGoN
 dMZ4KkpWjBfYiBx8ubbcr30vjuQgLNbriVJXgIvFZSZUjtn/kdZR3MdN6xyPZ3n2fFAk
 gEtQqS4k7BKSydKweSEzGIGdyC5vXQesJVhjSQXhqD2jP4iTgnAYmDOCAEsEjJlk872Y
 43xQFIBGQjEPEzd2p6VNPkc3BFthNPM6tmoSvIEEHxS/rqlFU3L3K3aZmP9kS0HoaorD
 KxhxzfjAGk0jg+k9Q2IzkaO9FNyj945peXcoFyHCDtCJx3qLPzcfsvEtpgV5iudiOHRs
 wg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQff7+i6dxs5PfhTnnbZH3nPeykRVJI64ISY+jsjutU=;
 b=YIkQrs19STAVIY/U4Re5M/4BfoPPm/ZofDgHxFCdQCDDalQJj7bspDXeBINlEo5QiV
 TRk5Tgi6hntOVndwFzd3UURsC9S+ieSKgq2o1TCzsAd+GZIyN7QdR5Sswj2qf6D/ShhW
 aWwZtx0iEGmTMjoxawZAqarElYgQ6UMKNBmcG0qnvw3UZFhNB3OVQvZ7s8BcO1Np2TFd
 NLWGTEGu4OIepIRKXZmS7NlRFDkF6+lq8Lo2p/pmly+REUqmi7PE0r0lOIazlNcfainf
 XmpBAWvI/zTN1zF9YPJZhQdR0htj8O+h6e7UPwqry8uaG8jEvaBlkcztNM9mBHxquqtc
 zZRw==
X-Gm-Message-State: AOAM531Ky9i8sOVTnq9Fkvs1MakbeKAExGiBIPbdhdnyRLo9lyk9SEw7
 G5YyQQkN40s7tU3inuib9sY=
X-Google-Smtp-Source: ABdhPJwnM173mMYgr46CHrhZ8lGPRb0soVkFAU/YtafftscaPvvp7hPJclRSsKpcCdMWgvZ4cK6y4A==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr9732659wmj.64.1635430803441; 
 Thu, 28 Oct 2021 07:20:03 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH 05/13] arm: davinci: remove reference to obsolete
 BLK_DEV_PALMCHIP_BK3710
Date: Thu, 28 Oct 2021 16:19:30 +0200
Message-Id: <20211028141938.3530-6-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit b7fb14d3ac63 ("ide: remove the legacy ide driver") removes the
definition of the config BLK_DEV_PALMCHIP_BK3710.

So, remove the obsolete references in the mach-davinci architecture.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-davinci/board-dm644x-evm.c  | 3 +--
 arch/arm/mach-davinci/board-dm646x-evm.c  | 3 +--
 arch/arm/mach-davinci/board-neuros-osd2.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index cce3a621eb20..df6dbb3f0faf 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -834,8 +834,7 @@ static int davinci_phy_fixup(struct phy_device *phydev)
 	return 0;
 }
 
-#define HAS_ATA		(IS_ENABLED(CONFIG_BLK_DEV_PALMCHIP_BK3710) || \
-			 IS_ENABLED(CONFIG_PATA_BK3710))
+#define HAS_ATA		IS_ENABLED(CONFIG_PATA_BK3710)
 
 #define HAS_NOR		IS_ENABLED(CONFIG_MTD_PHYSMAP)
 
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index ee91d81ebbfd..744ece6b6b9a 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -151,8 +151,7 @@ static struct platform_device davinci_aemif_device = {
 	.num_resources	= ARRAY_SIZE(davinci_aemif_resources),
 };
 
-#define HAS_ATA		(IS_ENABLED(CONFIG_BLK_DEV_PALMCHIP_BK3710) || \
-			 IS_ENABLED(CONFIG_PATA_BK3710))
+#define HAS_ATA		IS_ENABLED(CONFIG_PATA_BK3710)
 
 #ifdef CONFIG_I2C
 /* CPLD Register 0 bits to control ATA */
diff --git a/arch/arm/mach-davinci/board-neuros-osd2.c b/arch/arm/mach-davinci/board-neuros-osd2.c
index b4843f68bb57..81c21fe5748a 100644
--- a/arch/arm/mach-davinci/board-neuros-osd2.c
+++ b/arch/arm/mach-davinci/board-neuros-osd2.c
@@ -164,8 +164,7 @@ static struct davinci_mmc_config davinci_ntosd2_mmc_config = {
 	.wires		= 4,
 };
 
-#define HAS_ATA		(IS_ENABLED(CONFIG_BLK_DEV_PALMCHIP_BK3710) || \
-			 IS_ENABLED(CONFIG_PATA_BK3710))
+#define HAS_ATA		IS_ENABLED(CONFIG_PATA_BK3710)
 
 #define HAS_NAND	IS_ENABLED(CONFIG_MTD_NAND_DAVINCI)
 
-- 
2.26.2

