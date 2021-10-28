Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1043E3A2
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg7DV3tlBz30Pj
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:27:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qXON4UmK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qXON4UmK; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74g1QLfz3bjT
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:18 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so5213645wmz.2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9UTPRxPPIM85WFH39byVhI0Wop1oatVXrCc+qxiWlw=;
 b=qXON4UmKXQcP3NyhCCpnEw7n2l5yB9V8mlAogARYrAB3yclwFzmLFQ/ndWp9T6CMTY
 ztl8rrU+HBOIlZwo9wUdrS7gRpDB23pgvHskYu5INA9Ne/uoohF4H0KKhxVTd39MLxgb
 OCuLdYH9tL6kVMbEYs1qWb81bC2bMbLAr9H9d3ZmVzAZ6U65Y6gKTVTfSaQJHWvZf8E8
 8h7WN22vOD1L2sxDA4eAQzexsiB6soe4/k2tPxVqWue76hG1CDfRA6Y1PSYhmoQkpyNl
 Q6lVcW6L55qvTE6mH/cxuaWQXREKcMuLHSY+c11NNIob5it5e7F5Cqp8jY3sl+HqszXb
 UC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h9UTPRxPPIM85WFH39byVhI0Wop1oatVXrCc+qxiWlw=;
 b=gswQ6OMnLuWFIaymYWtBj9NB0C0Kf04huIz5EYf/EjFggBmof9uqLIBadNiOYMYp5R
 AU9aqlKpoykxM6Suk2kh4Zn2/tBcIwreQKfrkAzs+tAHhfxe0JYS790SAaAJaEGiNRVu
 p6Qz7A/Vgm0Q/8JRcyrWe/PvdpmCWWGYaKy0MnLz10yW3aACfX0ltpWBl9m8QP+Ezlan
 IyTyhuS00Qh3IFnYVPCTk1oHv31OjN6YFpoGeyfIUlArTDXYyC9RycpiArDBgvEsLY3n
 BtsAnERXUfUbLeW7/nvhFrK2vCm43mVKz7MCFzsEWsOZvpY9XfGbGXxrlKzHgv+KVLh/
 iKGA==
X-Gm-Message-State: AOAM533sb1ilTguUa+rxqwL2keRlTL7gFRYvfPwrz6kp70UpCiIQnLVG
 pR+6DWDKpptMQYXVTeZzLoc=
X-Google-Smtp-Source: ABdhPJwTApopXsu78VNhZKnyHSCssVCqkMXqxaLoxvpVRe0ZrqH/I2RaRROEgoJ+KRMawHk/qDAl1w==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr4958277wmk.51.1635430815273; 
 Thu, 28 Oct 2021 07:20:15 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:14 -0700 (PDT)
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
Subject: [PATCH 10/13] arm: nomadik: drop selecting obsolete
 CLKSRC_NOMADIK_MTU_SCHED_CLOCK
Date: Thu, 28 Oct 2021 16:19:35 +0200
Message-Id: <20211028141938.3530-11-lukas.bulwahn@gmail.com>
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

Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
SCHED_CLOCK") removes a sched_clock workaround and its corresponding
config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
effect and ./scripts/checkkconfigsymbols.py warns:

CLKSRC_NOMADIK_MTU_SCHED_CLOCK
Referencing files: arch/arm/mach-nomadik/Kconfig

Simply drop selecting the obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-nomadik/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-nomadik/Kconfig b/arch/arm/mach-nomadik/Kconfig
index e98429be2b18..ab52b1abc453 100644
--- a/arch/arm/mach-nomadik/Kconfig
+++ b/arch/arm/mach-nomadik/Kconfig
@@ -5,7 +5,6 @@ menuconfig ARCH_NOMADIK
 	select ARM_AMBA
 	select ARM_VIC
 	select CLKSRC_NOMADIK_MTU
-	select CLKSRC_NOMADIK_MTU_SCHED_CLOCK
 	select CPU_ARM926T
 	select GPIOLIB
 	select MFD_SYSCON
-- 
2.26.2

