Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25D43E376
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7637572z3bTS
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pnI+cDc9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pnI+cDc9; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74J335sz2yY7
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:00 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id d3so10497241wrh.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gyvzNad0Xx5R9v5YeX/jyfVB5cjv8pWIdrWsMdtOKeU=;
 b=pnI+cDc9pgmeUAnEprJ7/g4BWiQOQtOOfpQNHyw3VF2sBk/yxpLfYNtbnA4fAvsbzv
 +DdHd6ejGKxE3mz93ID2DTOqwhVuISJvg+EYrF122ReobcnkAtX3JdQaMCfYD5aOdqxt
 tn+DosTSrlI2W7nHzvKH80PUuO8b+5SkBOGl5wnksLRPsgqEabF4Av2vkPbXeq3JMdeG
 eIQOPCkjUT8qbpJfBNSVZy8OPEftyNcMBoyeTW0qUaTDRVCuKcfC6PmVliubGi7YiuEn
 oLehjjga+IdY0b9Zznh0Zne8SGdgDPw49DXo88qGqGf8udnQqu/8tCdT/tybaYzf9BDb
 +Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyvzNad0Xx5R9v5YeX/jyfVB5cjv8pWIdrWsMdtOKeU=;
 b=sAbVBQBkVRLmHDyrfAwiU6dKMj5h6SAq7XWOXLPx2tRzopaWUgMj66BFOl8quCt5zX
 RZjT509xvpHGEVxNn9xOWrVg3zTej742WvrCHqk3yDGiHIwAgE6WKoRaKvV812J+CbB8
 SsdEPCl6lREAb9/xPeUpRotp1apoa8fjZGxWubJTIPYQUUIw66AbHzAE12q/WuZOlPho
 FWPXvAlNuLhO0LLERtcuK+xPTSxqQU4oX2IiOBaqe0CrKv7gC9KgoeDbHropy0fERHhl
 k2Go8QgafzunLv5DTdcNzcqUid1UqYgWtSTcCWOywHh/VaX6/Axccssk+13521++2wfZ
 5B6g==
X-Gm-Message-State: AOAM532+iNHcb1Pn0c3i9FOEOMOuM2PiwvuMycIn+ep/pf2YZUqUTneG
 34a578VKlVxvOIEX052IsiQ=
X-Google-Smtp-Source: ABdhPJyezFwmqtsLn5aBEOCfGdfBxksRSaz4BYGyosYiXwUImog8O0a6Qn+fFMD6OKMmrx4b80PO/Q==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr1609524wrj.274.1635430796683; 
 Thu, 28 Oct 2021 07:19:56 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:19:56 -0700 (PDT)
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
Subject: [PATCH 02/13] arm: debug: reuse the config DEBUG_OMAP2UART{1,
 2} for OMAP{3, 4, 5}
Date: Thu, 28 Oct 2021 16:19:27 +0200
Message-Id: <20211028141938.3530-3-lukas.bulwahn@gmail.com>
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

Commit d2b310b0234c ("ARM: debug: Use generic 8250 debug_ll for omap2 and
omap3/4/5 common uarts") adds address definitions of DEBUG_UART_PHYS for
OMAP2, OMAP3, OMAP4 and OMAP5 in ./arch/arm/Kconfig.debug.

These definitions depend on DEBUG_OMAP{2,3,4,5}UART{1,2}; however, only
DEBUG_OMAP2UART{1,2} are defined in ./arch/arm/Kconfig.debug, and
DEBUG_OMAP{3,4,5}UART{1,2} are not defined. Hence, the script
./scripts/checkkconfigsymbols.py warns here on non-existing symbols.
Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
separate config symbols for OMAP{3,4,5}. So, just delete the dead
references to DEBUG_OMAP{3,4,5}UART{1,2}.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/Kconfig.debug | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 98436702e0c7..83484564b1d9 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1643,10 +1643,8 @@ config DEBUG_UART_PHYS
 	default 0x48020000 if DEBUG_OMAP4UART3 || DEBUG_TI81XXUART1
 	default 0x48022000 if DEBUG_TI81XXUART2
 	default 0x48024000 if DEBUG_TI81XXUART3
-	default 0x4806a000 if DEBUG_OMAP2UART1 || DEBUG_OMAP3UART1 || \
-				DEBUG_OMAP4UART1 || DEBUG_OMAP5UART1
-	default 0x4806c000 if DEBUG_OMAP2UART2 || DEBUG_OMAP3UART2 || \
-				DEBUG_OMAP4UART2 || DEBUG_OMAP5UART2
+	default 0x4806a000 if DEBUG_OMAP2UART1
+	default 0x4806c000 if DEBUG_OMAP2UART2
 	default 0x4806e000 if DEBUG_OMAP2UART3 || DEBUG_OMAP4UART4
 	default 0x49020000 if DEBUG_OMAP3UART3
 	default 0x49042000 if DEBUG_OMAP3UART4
@@ -1782,10 +1780,8 @@ config DEBUG_UART_VIRT
 	default 0xfa020000 if DEBUG_OMAP4UART3 || DEBUG_TI81XXUART1
 	default 0xfa022000 if DEBUG_TI81XXUART2
 	default 0xfa024000 if DEBUG_TI81XXUART3
-	default 0xfa06a000 if DEBUG_OMAP2UART1 || DEBUG_OMAP3UART1 || \
-				DEBUG_OMAP4UART1 || DEBUG_OMAP5UART1
-	default 0xfa06c000 if DEBUG_OMAP2UART2 || DEBUG_OMAP3UART2 || \
-				DEBUG_OMAP4UART2 || DEBUG_OMAP5UART2
+	default 0xfa06a000 if DEBUG_OMAP2UART1
+	default 0xfa06c000 if DEBUG_OMAP2UART2
 	default 0xfa06e000 if DEBUG_OMAP2UART3 || DEBUG_OMAP4UART4
 	default 0xfa71e000 if DEBUG_QCOM_UARTDM
 	default 0xfb002000 if DEBUG_CNS3XXX
-- 
2.26.2

