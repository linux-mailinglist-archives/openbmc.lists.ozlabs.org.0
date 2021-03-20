Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B08342EFB
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:25:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2q1t1ckTz2ysk
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:25:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=XDaYKRXW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XDaYKRXW; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2q0h0swxz304f
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:24:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264651;
 bh=cRfWA5R1fJ5FGd11SNvO8ZcOB+OoWYmC3HHkh1uT+BE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XDaYKRXWa8HDMRm3Rp8wwFl7I5lZhsArc+4JDMptV1fYZQgy3o6YycJ+IYy0ntMat
 +cIbMr1+fiHw0IlFS2tsjkq8vcZtbc2tnQjJ05FlH4tabc2VqPglOxyW1g1ctwWQiq
 3Cb08QSfpXd23KO8prAnM2GVqaKF95PWWvNN4xU0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1lP2e63H3d-003ht6; Sat, 20
 Mar 2021 19:24:11 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 14/14] MAINTAINERS: Nuvoton NPCM: Add wpcm patterns
Date: Sat, 20 Mar 2021 19:16:10 +0100
Message-Id: <20210320181610.680870-15-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+/m8+Ew9kOublJzm4+L1AeTlyuOvvvyZG3GyrV0FrzuiBdG0TVD
 raXC/64LQaIXG9lpQDNKs/ukQMlXgTTRGkJj0fDJhvQInvCI73UTj/08uU69bAnSqLDgHD/
 iQKKn5genx/qPQSNzcpVdRtz/ZNOgJ0BBXJuNa3PzD5OwLaFA25OGuGlhUw657kYD5A56Ic
 49zLnM0L3iuUQKo5I0kkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7vCqhzdpnTY=:TAIB+s7h+V1wG6glWf8vmZ
 hutayMs5l6dlY0bEDborbI1fTAhqxEv/qAXsknWkal8S5Wh8Ufsh7+kfqm2Ta5dr7LniOvhc+
 NY1dKGRmy3LeTJUn6ewn2iXX8J2Ye1k4s3dfOuKzMYEgVdPlgfzSRbXgHZu3G2UYE7wyhIfpC
 qmt4J/tgIhcBy0M/LQm9Fo3wp8bfT29S0NbsOjce2QI3wUM7izlJWMIpSBTRMlaK4zxPewYTF
 XJuG4lLjRYFzCaPOFaHT1o0Ht2Dbr2rpotnhRQagK7yq1BsY/W2p3Om9RF3dlmyVixaSRW6qw
 dLoibW2Hh1xkWjLj0gfOu+U0v1S8mMHn6dXDr2uBDjCz0CLxQwzn+oubOw1vKhuUIA1LxqGTE
 9Znum7Mc+ydon4faXqpsRCYtmHqbJDRmWGkT56+MpAXkq8oHZd9OlM75unU9XjHXG1d/8NwbK
 246kXT9B9CZZ/+El88umb8dGkFsfSEb3NneMQ0pV7uskmFnsawGvJ3ImTPTC/DOxcgbMPuWlx
 4L4jljGtVM0U3yrtU3ZIq19OUvfrchdmPIcX8Of3fA5DFGjmLlG7Xf/8Z25F5TdvukVf4S7Zy
 6o7MMiTYrGUOCTbYFDJLpGf1U4+Tl3wMnfVnpu+0IaycaYF8upslR7Tavggag6tNzLrD1zU3P
 tRXdPG2MX2ieipN78/9GFAnCYq9ymtO6HHZNvhh6fbMagzUlmxC2uN9rVs76nMGpmPyjVQlip
 reY2aDkyU4zf6f90P8CUlKwqO2HgoKlJ1Vujw/t+y+UcwDXTyLqw/WIVOcyQ/23AtyPbwPiLv
 J1qV6k6XwS5vJn3Wabz2xRCxhGf3VVb5vFxfnkOxAHpcj7nlNRMmoQmmLosqeJiaMyB9f3Wb0
 MCiTugheLgXjW6CwD9xA==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make sure that patches related to the Nuvoton WPCM450 (part of the NPCM
family) find the Nuvoton NPCM maintainers and reviewers.

I am adding myself as a reviewer, so that I don't miss these patches.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
=2D--
 MAINTAINERS | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d3..97923952679a8 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2184,14 +2184,15 @@ M:	Tali Perry <tali.perry1@gmail.com>
 R:	Patrick Venture <venture@google.com>
 R:	Nancy Yuen <yuenn@google.com>
 R:	Benjamin Fair <benjaminfair@google.com>
+R:	Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/*/*/*npcm*
-F:	Documentation/devicetree/bindings/*/*npcm*
-F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	Documentation/devicetree/bindings/*/*/*[nw]pcm*
+F:	Documentation/devicetree/bindings/*/*[nw]pcm*
+F:	arch/arm/boot/dts/nuvoton-[nw]pcm*
 F:	arch/arm/mach-npcm/
-F:	drivers/*/*npcm*
-F:	drivers/*/*/*npcm*
+F:	drivers/*/*[nw]pcm*
+F:	drivers/*/*/*[nw]pcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

 ARM/OPENMOKO NEO FREERUNNER (GTA02) MACHINE SUPPORT
=2D-
2.30.2

