Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871D693702
	for <lists+openbmc@lfdr.de>; Sun, 12 Feb 2023 12:32:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PF51227l7z3bh3
	for <lists+openbmc@lfdr.de>; Sun, 12 Feb 2023 22:32:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Z400q/FQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Z400q/FQ;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PF50L508Dz3bgj
	for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2023 22:31:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1676201479; bh=gKBqQtIfBEVq7yV5CnOjrJlvisaFqLrJnSZnk3EJCzo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Z400q/FQb6SZHab7k3Ie6Wbo9qmNuuuVXbl0cFmI7ZUojmtp1L/Y6h7dcz9EmrC3X
	 AkXoLPSaY909GXx0yytahBaiJLqzoS5m4+mjEqZiFvZ/pIuQAV3U6wUXRnx5ayU4bG
	 SEEX4X1kcJabgdOT0MdYW/Go2jyNoV6aGCm8l3eynNcU8Qxk9R9i0mZdIAQWcnHVqt
	 87J/oMZ+ofaiILxqLCTvVqnwdoFZ+oVuHkKjeZzEGOe/E0SeHVjmirS8MF0uXKm9gb
	 ba6k0hKEBvGD1d2EAc9alAg2049f9DZ3Abph7O/O+EDqeTi+qP84gigXgTjGH7m6IA
	 un7gI04qkHByQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1p4ab243R8-00YlmE; Sun, 12
 Feb 2023 12:31:19 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] soc: nuvoton: Fix Kconfig
Date: Sun, 12 Feb 2023 12:31:08 +0100
Message-Id: <20230212113111.1720685-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yLKJRwKH0j/kcqOmXwtM6ZooQ266YuDPRchRkA5R9WXrflmv3uB
 O3JnPXxW1K7379Hxu275AhbDt+QwjISpL7QZmd/EcaTh7VQ6+CsU1nRTTNZK7XvT4SQ/Urk
 bp+d0EOaDNfGnQWuiGNPMwBrux0psF8To6uUkPPpvqQVxqgMfEq/Ka7HnqQMLMkEz0jxeGK
 6gxJxXkSghEgSoDE9rpbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hPz1ubOp300=;N6Pz4MtFc0SCFWyBNr3efJ5vVUV
 G8REO5XjaQJ9CSd4CQSFdcTEB4PijopweXbH0KOX2xhGnb5R6MuSWMep14eLgVtLr4rfxAZfv
 Y+kJZzQTG7zvYAasygEXoXsdyMpv25dD2pC3TbGxPBt9U/xC727Os9C27gwnSC+uPLEwsPDTe
 v2pZtkfy63+IuxtfCVAkm1OOpAdFr+GO/jJ+mvRWGehEeGVzMYImrDda7qtt0mmictN7OV6i4
 rt0PbOzO3hymtnVvnFt6yt5WdQQ1ajjvoauyVYIOyXGx3rRTPtFtau2CsTnWar70IMdIudjsN
 8LGLRRo7hubhttgDD9CJSlI+/J04JFsfiuuk6/u/1ZMYZpjqv13LhfWimE510tK6IuDJK5JcC
 mOyLDWaRbZaJYxbale6MlHAGTQNnzTkVd7XufrSvWMhWG6tva22/X0q+VuJ2+ApXIdmsiV2w0
 aa9GDpK25LlvPzqsqateQFFn0X0qJx9V//eGZo5WOiMESCMoS10ODwUINqEDb7RQRaFysrgvq
 dQghWVWpBNHa+WJN32nbAZyc7JRQLPd+79iWFzapBrqI9E34UJjL+HCCF7J9kbsAkgLdEvHck
 wR38NX+k7Oii7MHlwGlv0K0zvKabdGJPxspea6mOfxGvnQejdHxf+mIVdTsHebOwweJRwHWaz
 CBL9uL0lKhYwtAG5AqZaiLWOynbIRnOgdZGCspQHzyHhsSbZp8gkU60z6K39Uq1/tYHllbh+z
 XQ5kqhnzYJk/AAA1eyKlBBLrC9jVcObyPK1vbT2AXsffVswr3bSDwz3AJzzPscfvCY0Mkr+qy
 vGdiU5EB4Azvda6D21qGwFD9RvgWY0sE4VYKb4Lxe6xEQmhHKmaphNrkjZJ0mi6qxEUrGAHhS
 3zd6hoyo23fedt8bXyTQZG70JmRlZlKAqOhoqL/VHv6dxiHcv9yqBBHb81olm3X8VrpWhrpF4
 1aDVlYe88dOWF09EbWmqlcdSK8Q=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Geert Uytterhoeven <geert@linux-m68k.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Unfortunately, version 5 of the Nuvoton WPCM450 SoC driver was applied
to bmc.git, which misses a few fixes that were in version 6.

This patch adds the missing fixes:

 - Add a menu "Nuvoton SoC drivers" to make it easier to add other
   Nuvoton SoC drivers later on
 - select CONFIG_REGMAP from CONFIG_WPCM450_SOC

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/soc/nuvoton/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
index df46182088ec2..2167d3d739d84 100644
=2D-- a/drivers/soc/nuvoton/Kconfig
+++ b/drivers/soc/nuvoton/Kconfig
@@ -1,11 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
-menuconfig WPCM450_SOC
+menu "Nuvoton SoC drivers"
+	depends on ARCH_NPCM || COMPILE_TEST
+
+config WPCM450_SOC
 	tristate "Nuvoton WPCM450 SoC driver"
 	default y if ARCH_WPCM450
 	select SOC_BUS
+	select REGMAP
 	help
 	  Say Y here to compile the SoC information driver for Nuvoton
 	  WPCM450 SoCs.

 	  This driver provides information such as the SoC model and
 	  revision.
+
+endmenu
=2D-
2.39.1

