Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D037FBDF
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 18:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgyWC674jz303M
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 02:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=G63fcJo5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=G63fcJo5; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgyVx0lkYz2yZ2
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 02:56:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620924998;
 bh=onM5oOku5nIepbwCuEcRoT5fQJgFFwHGcBnZTVFqqPA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G63fcJo5Rq1QnD7RuBjMuWx9GiLjKrTo4RNzUOucxmJPex7IiGq78XvtooDeBrSq7
 VAA80U5jw1FG0LgleO3SLcLl5r1xvE5PHjyP7eKlNYM6Bk8M63b9skZplmtlW827dn
 6dhOxIQdQq/6FeFcw5MxFyatwgOMKQGob4qHR0RQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wGi-1ldvmj3T2q-003QgJ; Thu, 13
 May 2021 18:56:37 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: npcm: wpcm450: select interrupt controller driver
Date: Thu, 13 May 2021 18:56:27 +0200
Message-Id: <20210513165627.1767093-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yvWbUY0amL+EGA42SjfSv8uHl/1arFixkeOF/iCkbk3WakCW7Iw
 QRdbFAOqgXggqvTXEcu5oOyz4thNUT1haRDCanj5143z/le6Q5alTeQRX/qtP1SrJ5yIeDL
 45vG0LGzAqavvIwtm/j6cqygxj47uuEfRnikyGp/iaE8QV/1kmgww8httzUekko2zQVyNHM
 Es8ezYv9FfiBlNKXsrCkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2vzx7pOgkXo=:nkh20ckrSg9oskYZfWWcgU
 h4u8+xo8fGH1yocKdKQsFGBhXiDwu9qrpZ5NyCFuWobRgICro3oA7amWk80Wac5IuuIwpFGgi
 eZbhFVNXeqDFjNzGSwkFB9GOWFaE31Qmq9aJqOXvveRcy9R3l1dzQWHc84jvU2eADLRu1+7JK
 lRQXEr4Gl6+S0NnzhC43l06z1aTUXNSJdGb2aSzhisxeKp7yaaOViU+yNPJzSjKcfs3DRVRmL
 5p2U7H6VPApw7c6UAXQ4pazQGraeHPqRyk9qgi7oXuFYjsjPSTw0rnGTSNTJ1TNEBihZ4bOru
 HpgrH9wZretxts9dsLO/zZdaC6ee91KV9rDWlj/PVJ5rkTLAO9M45LmwDKptvc4Mgj/pdXqBP
 pjkABeYfzAJHnR87J6bh1GNGcaN2vNg07XVU9z6WX73OofbdzW0qpccVYkoOBM6ujDtyMemAj
 2zqWTgtmv1aKKDI49/pvvlbQAHjCvqxsTfzAYF16mEUAyUS8/DoJUwToyvLZOnAviI9GPzeNv
 2y2T9LJ+ej1jBa0iCvpcMCiSDBsx0v/MbVzdiMkO5s5nP7BCelXQ315Uq7DXk56XvGQx9C70R
 F9rAe9ByU3uQBvyiQM0cMfzw3S9sbPL1/SN9IVjO38ZEcq/uUwVsxTjcD75D5YSNzmUVclP6K
 GjhowTTaibc2YGdpnd2YY40lknZYmY00gHAGIaH8PugrmmkVgZWaYRwv3EaisviFNNQnf+msE
 DESmqCiW5ezHC5HxNBSJ7fdQcbJ865bWyZmBenFFoi7Cgs9R+3sG7r5DvFrVVcQk3zCssYNBP
 gj33kgT8e5yTEiE7KMBSXywv0S8RzWma/oeEYsgp5oWSOwOLIn+AiHnfomFu/WDCWvpSNcb2+
 gHvUtDfJwfrCewSUO4kMou/tSa2J0sQlt4A+HkxP8b0wR7LXbggFyIQ8QB/y3S9Uq0lZMjSfe
 B7C3tJSWeFY7j6PdlHiaBtlMS8/PC3V4yZ3Wv6wy4s/DINJ8QZjZXZmvygjlo8yULMUEM8PS4
 mNhhOoTGn9gaAvloNUY3duomlAHF/2DWxXxldzoOI5Qv4FuufThOFH2avqEBU1E5HfZQL+/AN
 VPLvzJnYsUSkZgSP0kc1M9ZRi6CQ/tsrwzYw7MZ4SmiNUz6muF4CSnEtwpmIn5fDCq3rkcyOH
 dYtZ1HeZPDPFGxfaYANkxto9s1QRf8XwjpsCxKzyI2HHfEIuEEQ1CxSSvoHKZUpWWPvpG5fQM
 84OA0S+9tZtMDxrK8
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The interrupt controller driver is necessary in order to have a
functioning Linux system on WPCM450. Select it in mach-npcm/Kconfig.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/mach-npcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-npcm/Kconfig b/arch/arm/mach-npcm/Kconfig
index 658c8efb4ca14..a71cf1d189ae5 100644
=2D-- a/arch/arm/mach-npcm/Kconfig
+++ b/arch/arm/mach-npcm/Kconfig
@@ -10,6 +10,7 @@ config ARCH_WPCM450
 	bool "Support for WPCM450 BMC (Hermon)"
 	depends on ARCH_MULTI_V5
 	select CPU_ARM926T
+	select WPCM450_AIC
 	select NPCM7XX_TIMER
 	help
 	  General support for WPCM450 BMC (Hermon).
=2D-
2.30.2

