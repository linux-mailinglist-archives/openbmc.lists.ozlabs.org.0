Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039435534A
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5wv0Swbz3bqB
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:11:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=GpoTQjs1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=GpoTQjs1; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5w21KFFz3br4
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:10:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711044;
 bh=K29LebfL/JlBArqrMx0vebI9tmhwtrzN80KWOkBNjCA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GpoTQjs1gnmsWpgQhLkvQJqVRQWS4r1b17Nwp5uu86X+e+xMZt/hqen5Ont3b7dE+
 apeDkwr4SDLxpgcb+ON+rQ1Pm0b/1/nw0DQ7jk//vV2JNv95d0NcP9U0iE98Q6kOcJ
 SOGWAUCTp+J9b4on1R1EpAi4ddpXBVsH3VXus0l4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1lk1uR0MEF-00u1Yp; Tue, 06
 Apr 2021 14:10:44 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 05/10] ARM: npcm: Introduce Nuvoton WPCM450 SoC
Date: Tue,  6 Apr 2021 14:09:16 +0200
Message-Id: <20210406120921.2484986-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1SZS5HgxyMj1yOj+o4Yn5t3GkKyzLK8NZqeuc4M2TC4Qu3mjkHR
 nyik8sD+pzzZSLhkIPfhGy+m9TNBsfYVf/kNSpT+LAIr4O/WectpTSGQhhSh62SNVra3U5p
 5CLkg4o0DkHbdvMZOv7XFJUkfmYJbJbCluoBYYxIcWpL97lJTKC487imbaY2TITUN6p4Ixu
 RncHASyOeqCyIo9Pwa5JA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nlNfRwAkXhE=:qDWlOCVqfPhuXGVYUlIRX5
 M/4WcNdLmDNkMKHkXm6DTyYmuq0tvYOScbCTzilJ9M2Ff1oeQULqmwIscaffZtvRrW0hn6zDD
 OgiDyKB75L8Q6Ob7fAXQe6OEF/qpXCwG4VbmpeVEzo2XwhG/f1HjlRW/t26svjNqflvNRJ0I9
 AmdPPzGKWtFaH5Q90X7mkFZ0GQkbnFfJSnks/j84IyJon7+/T32e81IQitEkAE1QEK/JG/oFL
 QAZSh0PpzNC6+8DCx8jsjnc4pssbdl4j8ttHJ3kECO7nmYWFeXskKAUW1CbZK8Y5/XaRBz4h5
 AzNx0lwBSDPDDEdroYntVssl3X2GhnCqasRUvKUpgzUbbLLE8fopbvw7l+1clQtdrO/trkKZi
 W2tYEx+PvH+4d5HI5sGMrLNcjjR0zK4UKiX1Oa2+aalNcfphqwaztWMqzQ729ub/+muxuC8+Y
 TbcHeNkC8GXyRbud77OId0yhy7B6MCVm60lMtvUeqAG7pcw9X0EB1kg47j6s0B/rHRE+vqqtY
 1ol1PkMtAqmNJTHI1FZqbTssOKuyBn+gRsNNKKopgTaVil50KohqX6kgZEI9FZgYK+GTkvkhc
 C+MY1gpS/g8b5pezzl2l3W1/i7gkjiVCsk/uh3F6Y/dmFaUiafRW9R+Nfv+KBpw7MMdd7N/oV
 gaunvQVd36DQuG0xFnIdUSKP0fYeibmT/IENMBQDNh1VGfHZ3wZseqx24t2zeNiqo5i3eMmeO
 C/w9Agc/gavxudcWcVfcmhibz49u0/wDW4z5Ke8HHLNdcNE/ux35flsp4ZegDIm+lesvgnEJ7
 Ls8ATFO9tO8rD6kIlN/4bt9dSRXCQUelUN7Y4vW2dGkrNcsQrrw5by8eK6FK5+nIfWliNcYFs
 5IYPuZeXwep4+ssgOGDLWYhWjf5CvWVvVnn5M3VOubOSPZiLsuFF+WXl2ARklARUYeHcYbM0Q
 bMIjSkjmy/B9b99ZlzBf5auOSMMcv64SwMW26Q7Rvrsp62wfRERHPVAOPiETAD6Tj1DwW7G33
 QcRGIfNVsdpDpNxOheMRn+opUBZs2RvLJ4c6xzkrg+pm32sCzkqE3+MDcw+wszcc6MLWBiUSn
 +NGIxeTyBU95Tm/xyp8RLJNpf5LszzbYOqylHJ0Rh7Te2gDGUknQesgECEMiMQ1BScNiURo8x
 hgRdlAYlBAurZbpZzVb1GycczwvbkXO4WWgevY3I8O6jUiz7b2EGBLzrO899ca6Jj20bCbe3h
 AMPEycWxw1Xo3GnQl
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 is an older BMC SoC in the Nuvoton NPCM family, originally
marketed as Winbond WPCM450.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Reorder lines in Makefile by model number (WPCM450 < NPCM7xx)
=2D--
 arch/arm/mach-npcm/Kconfig   | 12 +++++++++++-
 arch/arm/mach-npcm/Makefile  |  1 +
 arch/arm/mach-npcm/wpcm450.c | 13 +++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-npcm/wpcm450.c

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 7f7002dc2b21f..658c8efb4ca14 100644
=2D-- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -1,11 +1,21 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_NPCM
 	bool "Nuvoton NPCM Architecture"
-	depends on ARCH_MULTI_V7
+	depends on ARCH_MULTI_V5 || ARCH_MULTI_V7
 	select PINCTRL

 if ARCH_NPCM

+config ARCH_WPCM450
+	bool "Support for WPCM450 BMC (Hermon)"
+	depends on ARCH_MULTI_V5
+	select CPU_ARM926T
+	select NPCM7XX_TIMER
+	help
+	  General support for WPCM450 BMC (Hermon).
+
+	  Winbond/Nuvoton WPCM450 BMC based on the ARM926EJ-S.
+
 config ARCH_NPCM7XX
 	bool "Support for NPCM7xx BMC (Poleg)"
 	depends on ARCH_MULTI_V7
diff --git a/arch/arm/mach-npcm/Makefile b/arch/arm/mach-npcm/Makefile
index 1bc3a70bfab8b..8d61fcd42fb19 100644
=2D-- a/arch/arm/mach-npcm/Makefile
+++ b/arch/arm/mach-npcm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 AFLAGS_headsmp.o		+=3D -march=3Darmv7-a

+obj-$(CONFIG_ARCH_WPCM450)	+=3D wpcm450.o
 obj-$(CONFIG_ARCH_NPCM7XX)	+=3D npcm7xx.o
 obj-$(CONFIG_SMP)		+=3D platsmp.o headsmp.o
diff --git a/arch/arm/mach-npcm/wpcm450.c b/arch/arm/mach-npcm/wpcm450.c
new file mode 100644
index 0000000000000..f17b3dab45af3
=2D-- /dev/null
+++ b/arch/arm/mach-npcm/wpcm450.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+#include <asm/mach/arch.h>
+
+static const char *const wpcm450_dt_match[] =3D {
+	"nuvoton,wpcm450",
+	NULL
+};
+
+DT_MACHINE_START(WPCM450_DT, "WPCM450 chip")
+	.dt_compat	=3D wpcm450_dt_match,
+MACHINE_END
=2D-
2.30.2

