Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906843E38A
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:24:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg79H0nT6z2yxx
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:24:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UfgmKlup;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UfgmKlup; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74S5Qdkz2yp0
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:20:08 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id s13so3339551wrb.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6qCaetzo2bs6A7edSV2Oql0KSOh/v96h0FaEf6Bxg8=;
 b=UfgmKlupugzoAbKp7xujF4Bioo5jj0psmD2waMtBu3v7UgPgx1LgBlYUNypUZlf6hg
 FeyfH2CeOit/1NOWH/Oi7HhoRtCQoBU81UGvbinCaD9crQRtPP8kNuqNmI6E0z0iNtJX
 pg/52AU7f1xFH0sU9Yc9veasKpTmSs6GOs9EmA0gBO/wh8XjrIl0L/srAtCpsIhXhB/q
 6I34wff4lmabQEuSj9N4F1sMq0VMWsCOS8RGzTXbLuehS+cQ7Ch0qETCZy3apszMJekD
 R+SZ1NKFydq2p9x6MWvT/oqP35PqIrWxv808q1kpio5EW5ZPKg/qy7FSqUs8Naw6SOJS
 00vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6qCaetzo2bs6A7edSV2Oql0KSOh/v96h0FaEf6Bxg8=;
 b=eKcMCa+C3hmBQ4uTuGP7wLHHxOmxtnXZmYrMw5qkvs9QyWC8921vp6f0/n3Xp9jD5q
 UXepD8drVO53D6LJUc31v0Z3K+7cCFQN3VQodLkVQgqJZvZBNJTdoH0R1nomnJjAUNee
 pZvqZQhj/UFO+yfk2JFPzIc1nFk4euFLVhCTrNxZq6hTC6GBiaBIftCQsPOEQzGbDptQ
 QxOdnDroqS311XQV4qMCbt4twC4TNwxGyJ0MsqJost0E2C0AqjP1mo4xfXsrvQxkFmFa
 YdGi67x0DcDMavwxrS6ceRd5eZbE7dVCqqcD/Zh2iS0DXiM85ijDzwNGOWaeEeCB1BG3
 iKug==
X-Gm-Message-State: AOAM532yWDbDg32tnwFfcAagk21yR+lGMQCZLGusncPhMBzni59FHRxm
 GZ/EtS9XMlcDHaPLJf87sPKHDyCdkM+E8A==
X-Google-Smtp-Source: ABdhPJwsYeCVobccll8qJYf0Xr5UYFyrFoG4o3B6V4rxDH3/wnWoB3yXN3/SbpxMCO72VgT9uV2yPw==
X-Received: by 2002:adf:efca:: with SMTP id i10mr6042738wrp.289.1635430805719; 
 Thu, 28 Oct 2021 07:20:05 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:20:05 -0700 (PDT)
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
Subject: [PATCH 06/13] arm: ixp4xx: remove dead configs CPU_IXP43X and
 CPU_IXP46X
Date: Thu, 28 Oct 2021 16:19:31 +0200
Message-Id: <20211028141938.3530-7-lukas.bulwahn@gmail.com>
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

Commit 73d04ca5f4ac ("ARM: ixp4xx: Delete Intel reference design
boardfiles") removes the definition of the configs MACH_IXDP465 and
MACH_KIXRP435, but misses to remove the configs CPU_IXP43X and CPU_IXP46X
that depend on those removed configs, and hence are dead now.

Fortunately, ./scripts/checkkconfigsymbols.py warns:

MACH_IXDP465
Referencing files: arch/arm/mach-ixp4xx/Kconfig

MACH_KIXRP435
Referencing files: arch/arm/mach-ixp4xx/Kconfig

Remove the dead configs CPU_IXP43X and CPU_IXP46X.

A further quick grep for the name of those two symbols did not show any
use of the two config symbols; so, there are no further clean-up activities
beyond this config removal needed.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arm/mach-ixp4xx/Kconfig | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index 365a5853d310..4c787b4be62b 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -39,19 +39,6 @@ config ARCH_PRPMC1100
 	  PrPCM1100 Processor Mezanine Module. For more information on
 	  this platform, see <file:Documentation/arm/ixp4xx.rst>.
 
-#
-# Certain registers and IRQs are only enabled if supporting IXP465 CPUs
-#
-config CPU_IXP46X
-	bool
-	depends on MACH_IXDP465
-	default y
-
-config CPU_IXP43X
-	bool
-	depends on MACH_KIXRP435
-	default y
-
 comment "IXP4xx Options"
 
 config IXP4XX_PCI_LEGACY
-- 
2.26.2

