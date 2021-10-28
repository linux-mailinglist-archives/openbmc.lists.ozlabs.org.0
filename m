Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5E43E375
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:20:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg75L1ln1z30R6
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:20:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EU3xEG/3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EU3xEG/3; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74G3VM2z2yYv
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:19:57 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id m22so10599791wrb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3KiU206SAU31NUfwpS2+BkRGT20ITYrNtM1Dgg2dPQ=;
 b=EU3xEG/3dC9YXPW/ccVFr8K3ChYeYFaYcNGGtHp0RPz/O0Ec7X9YV2fflD58Vb/Xso
 e9oHK0zp1VWtKz/TtPv+KlKv0VY+4wEx+KVkrpdQYgTP+IHKbLJs/vKYgBthSHiLH7Si
 vHKFVvvoU6t7ADJSwLn97xxpdkBa55eS7kQUVcD/5VuGcYQ0EZQdV/4kyNJR8rHzS9Dw
 zuoHixsB5EbAsiKAUaK41cjTNEj2Fw4a5SWEgWTSkcH1v/pENY5Jitp3svHZAmly13W7
 zxc/xp4Gm+1aj3Su20bhbwplVlkYEdigikzOeMADEPj/FMzWEveXImKKEM85ea1SdlZA
 zcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3KiU206SAU31NUfwpS2+BkRGT20ITYrNtM1Dgg2dPQ=;
 b=hSHYSJjqLdEYUj1UJu6oMP+7rCr1spnnMaWkB2pPMhfXwV+sDlxfASPQo3lWN2v2DU
 uE5EJ3jkQSPBlO+ztV2zzv9i8riYqU5FJ1OQCE+Mm9Kj+MVl4U2n3VR/Rtkw6zH8nfpn
 njI/9vQ+wMItrvij8DjZLYQeCqJC0263/zmVlG5oeII8WdRv7b0dvFPvlgmC4yqJ07CM
 OLCwzuc/zpoVldCFDQ3uw7jWNLir2EY4VMNvzjoswyNFj4jxiK+7H+/3G4JjYYs3zjrJ
 NefXzoNP1z/02HS80PTOAVCdw1skpDWT8y7OCemsWvdemhImIcZlYVxjD/ORVvDmBV+j
 2ssA==
X-Gm-Message-State: AOAM532CLAjjY2QOrX9wd16E8RKDITzOIGFYaBBG6u7hGl8xUNpt5tp/
 Ybz696sJQgbcs4/25fMDkOc=
X-Google-Smtp-Source: ABdhPJwg3ZOGkOv7nfE4Q1CFcC2U67ylJHTUMHUX7NHf7xKUz3nmHuxjhKWOUj9v1S9QjSEYhiHxYg==
X-Received: by 2002:adf:c00d:: with SMTP id z13mr5966699wre.299.1635430794430; 
 Thu, 28 Oct 2021 07:19:54 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:19:54 -0700 (PDT)
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
Subject: [PATCH 01/13] arm: debug: remove obsolete debug code for DEBUG_ZTE_ZX
Date: Thu, 28 Oct 2021 16:19:26 +0200
Message-Id: <20211028141938.3530-2-lukas.bulwahn@gmail.com>
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

Commit 89d4f98ae90d ("ARM: remove zte zx platform") removes the config
DEBUG_ZTE_ZX. Hence, since then, the "ifdef CONFIG_DEBUG_ZTE_ZX" in
./arch/arm/include/debug/pl01x.S is dead code.

Fortunately, ./scripts/checkkconfigsymbols.py detects this and warns:

DEBUG_ZTE_ZX
Referencing files: arch/arm/include/debug/pl01x.S

So, remove the obsolete ifdef CONFIG_DEBUG_ZTE_ZX.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/include/debug/pl01x.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index 0c7bfa4c10db..c7e02d0628bf 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,13 +8,6 @@
 */
 #include <linux/amba/serial.h>
 
-#ifdef CONFIG_DEBUG_ZTE_ZX
-#undef UART01x_DR
-#undef UART01x_FR
-#define UART01x_DR     0x04
-#define UART01x_FR     0x14
-#endif
-
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
-- 
2.26.2

