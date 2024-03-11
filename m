Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773D5877949
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 01:22:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Ug/TvaBx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtHXN5BYCz3d4L
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 11:22:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Ug/TvaBx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtHWn0NQWz3cLj
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 11:21:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1710116476; x=1710721276; i=j.neuschaefer@gmx.net;
	bh=U+sxRRHPcpCTUp9Fy/kQzoAU3jSMw5ywh6nROufz+zs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Ug/TvaBxp+kz8KuaVU8O3X+kLj/R0zXkBti/xkje89GKMIcf04ilWR26/FgI3zBA
	 Z+50hVCa+FWZ4K7LpwATrlfWdtmBXbghHVSBlX5mobATmIL61DnrLmrZgT6ltVQbg
	 0xLACTfLw1t0DMclq6myvPBiXB9Rmn33qYZcydcoqgavJXwmeJpQKyTB1ZQCZipiT
	 x3/vtgxL26+MAJb8pfIhI4INhwQNNwGPVv7Jrpqaw4fhlpoWyn1kw7QgkO1v+7lXU
	 BjCjjHhDaFqo7ZyMBDeI60P8TijYyZvkekRQZAvDEYXXpR5Ah5xM91lL//FiCzeDd
	 McQLSk6JTtxLMeyYlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.216.168]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V0H-1qgOMF2KNT-013zfW; Mon, 11
 Mar 2024 01:21:16 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
Date: Mon, 11 Mar 2024 01:20:59 +0100
Message-ID: <20240311002104.2829298-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kUuwesSoIoTkia1ovBbz6lZETCKVQRyngZikpSKFzmdu99ATNVs
 QcMXLBDlWFLz2v707upXcCAUX1y9gI5Naq7jWD/p9LDmNT8rWfIDIdeTphrDa7RrPOBroPa
 ogwlKumg96QtW0Po7krBD7ho422LnpFHtBZ0B6/ksT1R9lbP5SAplMhcgFYEViTxFeQQZlO
 clxKXskFp2ejxLijggMmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LJ17IaWkbrM=;3zEqmJio95wLAbDJgUu14/E9N4W
 6w95NL807o3c9MImNJ7DL4qa1JGF1fA7V/92mbVe06OztD2W/LFXrhuOQurr+U8ynct/eOj69
 fx4ajdnhlPA6oGsqBv/zq7jqC4HFDkm4YznDOJ+GxmHCyfXU1PI8vxrtSJbGaPWaJpj1l4515
 QbIyT+jHlPY6BsXcTbdfYcghJv/y/14vx/vXQok887j9Nqsduya3KuhanbYQOQzTbZFrLFmRS
 TFaUcED80cbc1SXhRx0h5NoGXjGNqlWQPZ+SFSnA24dBc0pO+rExXfpcNe/EEkVnv4PQ25Vhn
 /NX/BZegoLxbIhYnc8smjT2WSvIhJ7hjTSfdRrhTTM2qO4uveYJJRoaDqTmEQ6TbrskmheKP7
 TtzRtfhUp9pJXhIWduW5N7Yx8AXUFa/w1WZ9gZAVm+yM9jbMx1YIJi7lHpLB83mgdlYRNN/Ud
 yhsYDFf84irkkqeYCP0bXAqVFAlEtb9Q/SDndLBstY5ozNGauym9uecwTsm9d411SzMdJlOfI
 +H7yCzVAuYrsQzPfdBZxWs5QQ3UkAYZLFMlK4oTeKyY98HiyiSfbhEJBAWhRJEwvysK5AFVpD
 rRghoajQb7nkF3A4gURI5C+vF2qbiwjO0Bwav3fgRAtp+MpajghZwoA03zB74BLAVrosLVdEk
 uSPUpgvlctQy/X/aicNRFiKRRer0gJ25E91mgJ1Yb62JS8SRHM357STyBGi91Q9cnIJaMg9FN
 Bxg/gp/GcLkeoSz4OE4lfPrwBoh0F5CswyvUWt4LYngAJRRxEN4hUS09PJsZkWMGva8rS5SOM
 fGcM8U3+Q0shhfwwBnR0auXsMbqksCZwV9fPQbzZEst4Q=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
SoC drivers later on and to prevent asking about the Nuvoton WPCM450 SoC
driver when configuring a kernel without support for Nuvoton SoCs.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQ=
mQ5u+4Q8c7-wYQ@mail.gmail.com/
Fixes: 7dbb4a38bff3 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
=2D--
v6:
- no changes

v5:
- Rebase on 6.6-rc2

v4:
- Add Geert's tag
- Fix commit reference
- Change Link tag to Closes

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
index df46182088ec21..853392c8a9151a 100644
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
2.43.0

