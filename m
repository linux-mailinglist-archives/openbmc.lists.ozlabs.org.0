Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D74443E37E
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg76m1wPjz3bSn
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lyqxw30w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lyqxw30w; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74K5VJxz2yY7
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:01 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id b12so6071658wrh.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTzwjJSMGjlHkXTlA0zITL/LluZlDy2EIE8RaOC2PJI=;
 b=Lyqxw30wY1+Qu4YrrWv9AZrP77iWbXkCezYcd7gBlUxCmuguq56Kt7O/I3OeUVxue3
 rpG4PDB3E3/aw+jz5NL7Slz2PX8qtVXrIVNe6fWe/QhrtnLm22Ii8qST2l0DYrwPmXQd
 Ya4P/NxByV+cJRgmL7TlpNl/cpYBCSYkIZtcsgVEH5cinRAX6/kmkscyJlDRWb+hv3VR
 QXX/hGigeX5hioY7ibMAMHKzwaH3T3NOkMTc1aHizfOXTTvMJrZog92IVUrZoEaNSMEu
 Oo77pnlXTobtewh2RVDxsfueEgIy5sBr8NcizYz5GpbzXkMJ3kU/Aa5EnA4cmosZieo3
 cf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTzwjJSMGjlHkXTlA0zITL/LluZlDy2EIE8RaOC2PJI=;
 b=BFKq0Lvv5b3MB6V7jPD2UZaqtEtSWQm8YhjSMxp7LUr5RSi5jAw4a4/Pw5+dgihh7R
 cKeZ2vVuPNs/Lo0Rc0xK6qsjqcidOLNaUGhyW6FaRn2h5+Ahuicc1b6sAgxo3APBbGWo
 dzGjBBu+i7L0+m6YWwCMmhW4w4U17fVWtOOTcXRS/MUpITNBOQ97Snxs4f0LSGdxhCE2
 ib6np2ovO5IaP9vtYoTOwH1eSDoRSfoXDC+D2qRx4lPz9dABumcOOnsYXDQdM6LcO2ij
 Q5EKtrQzvG0ttEY/2mQx6lQZep2sjPeu69qt0xj9SY7lxwSEafJiIb+7bbgHHzq2xsUu
 bwnw==
X-Gm-Message-State: AOAM5326vcOhHZcyV1lTLDA1oca/gcrpIVpQ5EkkZUFXZEs3A3n7Jqdn
 7zvj/Yo6wiXOpcfh1fUhyTw=
X-Google-Smtp-Source: ABdhPJyDRNj6li3loAoD7ixRNKCJ3lHGxNkXGZ+nglud05oQ0vkYfqtyVHtcULhBtjciYHnjgbx2aw==
X-Received: by 2002:adf:e489:: with SMTP id i9mr6253592wrm.22.1635430798893;
 Thu, 28 Oct 2021 07:19:58 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:19:58 -0700 (PDT)
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
Subject: [PATCH 03/13] arm: Kconfig.debug: drop reference to removed ARCH_MSM
Date: Thu, 28 Oct 2021 16:19:28 +0200
Message-Id: <20211028141938.3530-4-lukas.bulwahn@gmail.com>
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

Commit c0c89fafa289 ("ARM: Remove mach-msm and associated ARM architecture
code") removes the definition of the config ARCH_MSM. Since then, the
reference to ARCH_MSM in the dependencies of UNCOMPRESS_INCLUDE in
Kconfig.debug is dead.

Fortunately, ./scripts/checkkconfigsymbols.py warns:

ARCH_MSM
Referencing files: arch/arm/Kconfig.debug

Drop the dependency on this removed config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 83484564b1d9..87aa6e92ee6e 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1886,7 +1886,7 @@ config DEBUG_UNCOMPRESS
 
 config UNCOMPRESS_INCLUDE
 	string
-	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
+	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || \
 					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
 	default "mach/uncompress.h"
 
-- 
2.26.2

