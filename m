Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CC43E395
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7B03Lnnz2yY7
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZyet1jp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fZyet1jp; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74W3Ybhz2ynw
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:11 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id s13so3339786wrb.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=le2hzZSknGbN32j+WyPBSUphMiDhY48ycCDRlUrmOR4=;
 b=fZyet1jpHTyp6VrkESIendSjAXNfzPrPLAR6SiYMpsO2hpA1CHmWoU4oL0LwcRnXaH
 R6LUm9v8niok9TSIHUNh6JKXcTCj2RLkkEAlV2TL7wcssA9Q7j9qRrZdCIeLgYUEYjOl
 S9jEpoC1YR8Q33EwmWarOFgCoqhl8PxSPSs690us4j5VsBHH8dfhNW07cmVQJcM8V5Ve
 DUh4QZoHipLRXYsSzL/CJzs7Uo3GIwjHoRsLHiCCcDkAB2GIF3S7sqnJAmGMRrF3RlqI
 8sh/9yJkUy7/hvu0m92m9++TNNzrmhRvDPC1wSk9WHNJIgLEFdKXxdKB/PyKf9tt0Y9E
 Dl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=le2hzZSknGbN32j+WyPBSUphMiDhY48ycCDRlUrmOR4=;
 b=EXfH1QIiVMsZMGhBkb5E0j6DRzxWP+TeZJgC0dy7s3MxLX3UCYvHJXRY/8NpmmWTkQ
 f2C0hwtZcHsLb9cxBwDM6VT7cOHE0ufQe3CWa4bdKifSkvFhKnBDU4Wb16/365WLub0Z
 EhZjINrJ+Pl8Def266gVjYoEJEHrPOSuK6KRGqWKyvDywEdPxb5HzWK574kmYVkd/KwR
 TBGpb7xxgB0N1f2rizeSw7f4LPYO0yaFp59kyaTlaDNh2h0QQ3uNOZu0pFM+pnuZ31Mx
 6pVaXFkEniHVbTYh251SwXQemxkw4kGf79Wc5RXIISCFT2etGjTk5uCsm2C4hJb6mK1w
 ZV6Q==
X-Gm-Message-State: AOAM5313E9Y17qFrlT2RNrjoQyehi5cVydXzyV0a16mPWhvGI7lDqjYi
 MheODwss63tvNsbPY6kElvw=
X-Google-Smtp-Source: ABdhPJy4C/+R0zhTRyO5Ty3sYcOvSI81tuUGNdaGW1vIgobW8JDjdh2Y3LAk2e7WtMKDJ59YhVDa2A==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr6100112wrb.336.1635430808034;
 Thu, 28 Oct 2021 07:20:08 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:07 -0700 (PDT)
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
Subject: [PATCH 07/13] arm: imx: remove dead left-over from i.MX{27, 31,
 35} removal
Date: Thu, 28 Oct 2021 16:19:32 +0200
Message-Id: <20211028141938.3530-8-lukas.bulwahn@gmail.com>
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

The commits:

  commit 879c0e5e0ac7 ("ARM: imx: Remove i.MX27 board files")
  commit c93197b0041d ("ARM: imx: Remove i.MX31 board files")
  commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files")

remove the config MACH_MX27_3DS, MACH_MX31_3DS and MACH_MX35_3DS.
Commit a542fc18168c ("ARM: imx31: Remove remaining i.MX31 board code")
further removes arch/arm/mach-imx/3ds_debugboard.{c,h}. So, only some
dead left-over in Kconfig and Makefile remains.

Remove this remaining left-over.

This issue was identified with ./scripts/checkkconfigsymbols.py,
which warns on references to the non-existing configs
MACH_MX{27,31,35}_3DS in ./arch/arm/mach-imx/Kconfig.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-imx/Kconfig  | 12 ------------
 arch/arm/mach-imx/Makefile |  2 --
 2 files changed, 14 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index b407b024dde3..f296bac467c8 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -21,18 +21,6 @@ config MXC_TZIC
 config MXC_AVIC
 	bool
 
-config MXC_DEBUG_BOARD
-	bool "Enable MXC debug board(for 3-stack)"
-	depends on MACH_MX27_3DS || MACH_MX31_3DS || MACH_MX35_3DS
-	help
-	  The debug board is an integral part of the MXC 3-stack(PDK)
-	  platforms, it can be attached or removed from the peripheral
-	  board. On debug board, several debug devices(ethernet, UART,
-	  buttons, LEDs and JTAG) are implemented. Between the MCU and
-	  these devices, a CPLD is added as a bridge which performs
-	  data/address de-multiplexing and decode, signal level shift,
-	  interrupt control and various board functions.
-
 config HAVE_IMX_ANATOP
 	bool
 
diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
index d1506ef7a537..d5291ed9186a 100644
--- a/arch/arm/mach-imx/Makefile
+++ b/arch/arm/mach-imx/Makefile
@@ -14,8 +14,6 @@ obj-$(CONFIG_SOC_IMX5) += cpu-imx5.o $(imx5-pm-y)
 obj-$(CONFIG_MXC_TZIC) += tzic.o
 obj-$(CONFIG_MXC_AVIC) += avic.o
 
-obj-$(CONFIG_MXC_DEBUG_BOARD) += 3ds_debugboard.o
-
 ifeq ($(CONFIG_CPU_IDLE),y)
 obj-$(CONFIG_SOC_IMX5) += cpuidle-imx5.o
 obj-$(CONFIG_SOC_IMX6Q) += cpuidle-imx6q.o
-- 
2.26.2

