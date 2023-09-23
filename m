Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE277AC220
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 14:54:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=l/YZ0AtI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rt8Gm4qZlz3cHS
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 22:54:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=l/YZ0AtI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rt8F52PB3z3c2V
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 22:52:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695473553; x=1696078353; i=j.neuschaefer@gmx.net;
 bh=I7aIv/vlyeo+vl/9kemBxv5Kp8uK897scWG8qKqLOLw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=l/YZ0AtI9q4HikU2nhGwSRPmgsrsgRRQpvVJYVKyEr/glxZBtDstmfQaSiiJMmjOs/RxNLid+4R
 VKtJyn36u1vM5v6bIBxQugIKpMf8rD76+eIcRvjmOT9TvheqiTPOXZnwCfGjK/3yjlM7zw/Vr9HmC
 8Ugu8NaCTJA+eT98w6JWWcHn1shTuzCu+a8l1d6eshXwXgbVpy2vNE6hSvdiZf/QIdkBG8MXjwwmM
 iW/KKr2zcay7HjhhcgRpWDaqDUBmikAgUIEI9/yRno98S3Pexw05Gx95F7ws7xEU4Tf+14/hLcjro
 2/Wo6mv2v6go96E1cWliK+W7VokBw2jtLb1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.152]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1reSBv1hbu-00vxeN; Sat, 23
 Sep 2023 14:52:33 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] soc: nuvoton: Add "select REGMAP" to WPCM450 SoC driver
Date: Sat, 23 Sep 2023 14:52:27 +0200
Message-Id: <20230923125228.1770991-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923125228.1770991-1-j.neuschaefer@gmx.net>
References: <20230923125228.1770991-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k21NPkH4GANoX6/PdO1KSlxDu/mRSbml4Y4eFZwDlynA73UEvlL
 smPNP1PsOhXy9JDEw+TAKHCvltOHJZwz2AD+EwIUwOHvyC6YPHcDpvlneFDJadW8vL7El3q
 9zOc7Hlv8+LgGLBJF8BZBjt84G/abTL+j7QMchcoejbD+5zHG+ws0rN3i49tFFrvvhni7RK
 rhh5pOQpq0aLipbz10wMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/KmbPWIkQ9s=;lnD8gZztCTxRiPb+VBt0bAXlU8E
 p+i3NoKQj3TDRb5CCibeHiCCLZuzo7buNINP4XtgDUo+V8Q9qa+k0SSKZyp2l1rXm3jHq7rTC
 o71MLIFLnCEMTzQhCNqRP4wViiVNNMwGOgK6uIGstlQmJUS8lUTwSyt7g2JcBJHioX/Ssp2+Z
 M9HhgK5Rwr8xnUhThlhqulh/3TXYn1O2lDOYpI5xoxLEYF71Ok/h5PaCja3WQb/l0lvvB94JH
 VwNbB28zk3gPxi0Ft9scX69kRZzKUZlSrMAsFnnJUBLsQ6TBm7BYrW0YHST2NKOb+ge/eWvu7
 6qSIdOTb7nkBbLlHhWdXYd2bOpmZdTUTN+d3Ezwlb8jDoKQNV2NVkCDlyszMUeyzMkTn0EKwB
 wuh68QqISbDQ0gUUiYt+ycBeQxj959kTISLM8jVO+W5tzucOnxJCoHq9eeYaugqmi2gclc9OJ
 IFP3xgDT7wReznl8EnPlPcFQVzUc+ykx+l1YdFJRxgDLGHS8kg2HESx+jgwG4F9cAkUXLDpu5
 7RR/vF5mWdmyMFyN1YBT6XDjEsDE5YL2XltYk7iesJHeZlKQURaI07ivkaUk5ykV/y5B78051
 vU6AV7XNtbfzrSPX07C6NBi6dHWTnEGRyySGueV6IsX/X+Gtj0jLhREDHe9WUuleMmlMfpSdz
 eoCUE+wu1xIyo8x9oZK1xAjVObwZNdzwDrKSQ5coXR4PSu5+/Y8GPzo7BJzFwEFdNj8wQTSmc
 X6JvIn2tlcQO+b82unwNGQLOUQQ2zuy74rC+mtsG9e+BweM7JhI8yKbAsklMrR+tPcWLZJ0gv
 WMme3qf1g7uNXdFo3JjOhDsRw6xuVmaGmH7AbGTYVKu0eqD/qXA9845drRIJDNTqg4PEXGpAo
 gn+G2aH5MkVlKt3VIx+b1LigZzrd175TXAXeDEjspUd9mv3GLxUcQKQP/gQ044HabgD6vhJcW
 Ovo7TQ==
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

Select CONFIG_REGMAP from CONFIG_WPCM450_SOC, because the driver relies
on regmap to work.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQ=
mQ5u+4Q8c7-wYQ@mail.gmail.com/
Fixes: 7dbb4a38bff3 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
=2D--
v5:
- Rebase on v6.6-rc2

v4:
- Add Geert's R-b tag
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
 drivers/soc/nuvoton/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
index 853392c8a9151..2167d3d739d84 100644
=2D-- a/drivers/soc/nuvoton/Kconfig
+++ b/drivers/soc/nuvoton/Kconfig
@@ -6,6 +6,7 @@ config WPCM450_SOC
 	tristate "Nuvoton WPCM450 SoC driver"
 	default y if ARCH_WPCM450
 	select SOC_BUS
+	select REGMAP
 	help
 	  Say Y here to compile the SoC information driver for Nuvoton
 	  WPCM450 SoCs.
=2D-
2.40.1

