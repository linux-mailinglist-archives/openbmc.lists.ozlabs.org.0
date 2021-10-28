Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77643E3A0
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:26:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7Cn5TTbz2ybB
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:26:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A6WnNrgN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A6WnNrgN; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74b6XvCz3bWC
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:15 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id s13so3340341wrb.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Nx/FXuZHmzN2GOFSI5UkCtNDgB6jstgst0HpHC3bhg=;
 b=A6WnNrgNuUzR2IdplG9xU5Gda69cXlfGiU1iEpuut95+ObDoQu1P91FrbNMRKlmqZa
 OE1Nuc1KwLULHd2xdii8m0/7wQoIC27d/Z4SpOeEosVI7QfrR9PaO6bnH0ZNVySIxccR
 9I70Iyl98aAfQZ4NRYpvp8TQ/ooZaDTsb5xfmQ3/7B8HKq7gVupxZAgvGtzZZGrw8zkf
 Fb7VblpEaH3Ydc7Wm3zYsqDHt5nAQ0r7VgKWFdIrJ8LGr9oBLjW4kclFyV2mePgpQ4+q
 xXtNmYzt+EEBS4miFg4Q/gJqhzs7yLP1pexOC2O44eqyGMdROaTEAGRJ2jNP6XLuc70M
 jvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Nx/FXuZHmzN2GOFSI5UkCtNDgB6jstgst0HpHC3bhg=;
 b=VlZ41o+tP6I2kuO6+Zdj1PyANF5xHDPjdiJ9rVnNGOL8wsiu/OXR+plbc/PUUbsn4+
 ojTe0WsGaiUhfS9F+Oh9PmSQhM0iL//JvJ0FUI3zekpitYAzxK5zvtWn9GA6KWp7IZRU
 kTsUJP8nNaJ0ta6sCNEuQ6WhhHUV14+uLMf2i6k17oZsz3fUSY8wIY7SfvOR6wCr/JOa
 TnmmI1fbnYJjlX1xg3PU0WkI8uoOI3hOyxem/99kf717wUWJP6JdOkH4R1XdFuedoWWt
 bAheGswhmQRjaWLuRqmOH791cctH0NY0EoM9wLY96vYhgX7u8HB65XO5ip/WpVG/ZksC
 ifoQ==
X-Gm-Message-State: AOAM533e0vEQOHh7SukX/Zf0x6uHtd/h2Uq6RBX2UAVYoo6f7ZZs8jK2
 cudMKx+3J+v9eF+dksbeTOI=
X-Google-Smtp-Source: ABdhPJzKYyvK9ywN7FVlYbhzQ1DkLGKtk+llarpayFZ0BWuSbPQgbsxmQR6e6DL+lCwMCTPH0zsAJA==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr4967054wrw.25.1635430812973; 
 Thu, 28 Oct 2021 07:20:12 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:12 -0700 (PDT)
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
Subject: [PATCH 09/13] arm: milbeaut: remove select of non-existing
 PINCTRL_MILBEAUT
Date: Thu, 28 Oct 2021 16:19:34 +0200
Message-Id: <20211028141938.3530-10-lukas.bulwahn@gmail.com>
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

The patch series "Add basic support for Socionext Milbeaut M10V SoC" (see
Link) introduced the config ARCH_MILBEAUT_M10V "Milbeaut SC2000/M10V
platform" in ./arch/arm/mach-milbeaut/ and intended to introduce timer,
clock, pinctrl and serial controller drivers.

However, during patch submission in March 2019, the introduction of the
milbeaut pinctrl driver was dropped from v2 to v3 of the patch series.
Since then, there was no further patch series to add this pinctrl driver
later on.

Hence, selecting PINCTRL_MILBEAUT in config is simply dangling and
referring to a non-existing config symbols.
Fortunately, ./scripts/checkkconfigsymbols.py warns:

PINCTRL_MILBEAUT
Referencing files: arch/arm/mach-milbeaut/Kconfig

Remove this select of the non-existing PINCTRL_MILBEAUT for now.

Link: https://lore.kernel.org/linux-arm-kernel/1551243056-10521-1-git-send-email-sugaya.taichi@socionext.com/

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-milbeaut/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-milbeaut/Kconfig b/arch/arm/mach-milbeaut/Kconfig
index 6a576fd8521e..f9d1006f9442 100644
--- a/arch/arm/mach-milbeaut/Kconfig
+++ b/arch/arm/mach-milbeaut/Kconfig
@@ -13,7 +13,6 @@ config ARCH_MILBEAUT_M10V
 	select ARM_ARCH_TIMER
 	select MILBEAUT_TIMER
 	select PINCTRL
-	select PINCTRL_MILBEAUT
 	help
 	  Support for Socionext's MILBEAUT M10V based systems
 
-- 
2.26.2

