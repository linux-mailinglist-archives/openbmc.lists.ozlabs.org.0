Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324006DFDE4
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 20:47:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxWsr0fkpz3cdG
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 04:47:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=RxMYj/Ms;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=RxMYj/Ms;
	dkim-atps=neutral
X-Greylist: delayed 356 seconds by postgrey-1.36 at boromir; Thu, 13 Apr 2023 04:46:05 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxWrF6SbSz3cMs
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 04:46:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681325156; i=j.neuschaefer@gmx.net;
	bh=XeBl/5t7UZ4TzAdwmZ2UA9/ZarMbW1PhJCcszk78i7Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=RxMYj/MsFPlKDlwkKmnI6eoFJEoG2kB2bAKbYFakoq1GRMYcIt0lkwxB3KbY39twp
	 lHuCkYpOIdXrOnRiuaii7JAFT7cykTYBWNyJ3pWPXFUY/mlN7rjsP8jEn8PV8BQWwr
	 FIjbCatbVkqfsQr0lqe0Q2VwIz11/jZr7phqTrXDpqPEi8/vwfuHGLo06E9+z9v2g+
	 aKhOCca9fBog/K6wB+yDmyoxYfcMi8jpeuVfFPUP3TVs4fzqdS4arjMmpffiLeCbeO
	 747sN+ygbbgJpGT8oNoVZClS8hDWtrHkwyd+uZ/3IjlJLSk/ikJ4WhWwpz8rWf5z10
	 QRBEH+wKkUHZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([185.66.193.41]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MA7KU-1pfTHg3b2o-00BbAY; Wed, 12
 Apr 2023 20:38:38 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
Date: Wed, 12 Apr 2023 20:38:32 +0200
Message-Id: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0euLrYO+TWx5yPIpbwwSG/oxIf0i/WtN/pDJPApWgfXg7uSArUC
 viSBsOw/okp8bGMeD3UBPwh5K1fsreKnKbLM2mcadU8mCXpg0j51ze2RTmXf5N/6rZphiap
 KwXCZSM9GGM9cCyzZUGR6zaEcvyfsVOFtNk6p2WGHeADyyZxCtewnD2usYA3HFQBLvpwAcq
 2Is66ujuiCaww7S3ek9MQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QW07ReCkl+E=;oemanA/KchKkwkdi+VgYCHx/pow
 fM/Lbyon4g6y4DUq8XAGmOZMdUOPpDEVzUzq71wBZzGj0Bhp1aQI9NOmO9h597gMJJ1pFv1LN
 x7wulOwEeMf6RQCwxAnizB022TKGwd2fGhmTYyX3dgXWjr83J4wKncM0V9Kf8JlbtUnslNXBx
 2ljMLDQL/8rhjN6eeDooOkk5uzhWujdpy2EI1vTqPcdfn5LJYmJyf+ftfKahjImDkbRKzimUY
 Lcsf9YNcjsfA+QGv49ocbR/Ox7bYxr1Qal9hrs7H2isQIAkiqDcp/xT/hBUCMD0NtiMGJKRX6
 bNE7TOH0G6az2ICcfTOt5BI8OOpLSWdyn9J4JFPTco9vLkajWvoBQuFsD22TpvhIfdH83y879
 g2vqON/4baQUJhuDaHBHOfijSVjKPRzqz8bFRGszHt7mcjdvdQ/14Q1WdhpmJ1KEXnmVXRAvs
 7NCsJDCGI4PSQQf9+VG4YtspAODwOa6LMsJkskOVMEDebC3D8LEjdqllgafTpi2HQU+m2L1f4
 6EcSKxLSdDEYz9PnVJkFBnKTKzKyDCTElre5itnhalKReRK4/oNKTwWVmLugKQAx9qt8gWtn7
 lG+Y/P8Jsxjb8FRmE2PR/rtBOZzwO16WHI+O9yuoa4xPDbvmrjiUqeaKNo1dNwgpoPObaI+Pt
 oV1XdOMwCG9yzk/uDaEEF1rQtV1z9uAkeq3poG7rR27b8ZECDuBjxUqRqjO33n1/OW7LXEsHA
 T7YFRvD9rNjEtCBqYbBP8zGyMulD/D2K4O0zZE2SC3RYqXf2A4zDbaJVY5KUBDOVL5aISfQmR
 Bdxhko7Ujsy9VOnFxJivFA+wMaPhWBpRfO6zIMWun+zg0gQUcWUppw2f30FNAqQPZLkckANQQ
 yihTNZOqF8PoYkVMyKAHACHHAGF3HvrR73xzMkJDuJeAM5/tFm0GPOCZdpzk2eZA7r/iqC0bl
 YZRt5FJCVJxs3r8gA7RcnlRvJZA=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
SoC drivers later on and to prevent asking about the Nuvoton WPCM450 SoC
driver when configuring a kernel without support for Nuvoton SoCs.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ=
5u+4Q8c7-wYQ@mail.gmail.com/
Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
v3:
- Split the commit into two
- Reword the commit messages a bit

v2:
- https://lore.kernel.org/lkml/20230212215234.2608565-1-j.neuschaefer@gmx.=
net/
- Commit message improvements, as suggested by Geert Uytterhoeven.
- Add Link after Reviewed-by, as checkpatch.pl now suggests
=2D--
 drivers/soc/nuvoton/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
index df46182088ec2..853392c8a9151 100644
=2D-- a/drivers/soc/nuvoton/Kconfig
+++ b/drivers/soc/nuvoton/Kconfig
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-menuconfig WPCM450_SOC
+menu "Nuvoton SoC drivers"
+	depends on ARCH_NPCM || COMPILE_TEST
+
+config WPCM450_SOC
 	tristate "Nuvoton WPCM450 SoC driver"
 	default y if ARCH_WPCM450
 	select SOC_BUS
@@ -9,3 +12,5 @@ menuconfig WPCM450_SOC

 	  This driver provides information such as the SoC model and
 	  revision.
+
+endmenu
=2D-
2.39.2

