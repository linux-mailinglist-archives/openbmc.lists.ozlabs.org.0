Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0A50BFC7
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNMc2kmRz3bdg
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=McZMXG4R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=McZMXG4R; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLR5xhCz3bYw
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652310;
 bh=8RE6J/48SaezMLYOSRQdb+dos/63a0S80cGWNaaY89M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=McZMXG4R3dWFUQumN0DawVnIhuFfInIU4+KAy6T4wMDKADtRF2feoamdWEVgEA9mm
 KVEFezUzWXB3zfjm7+7ENohEgD3Ueb0qxcdw5x6IXYN/Gc6Y1gfOpTVKLsOm98g+SF
 2LCIifg50JAi1AkvsYryxYXvb0lzyi1ewlGH8/Ro=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1nNDlI3YKj-00WIp0; Fri, 22
 Apr 2022 20:31:49 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 3/7] watchdog: npcm: Enable clock if provided
Date: Fri, 22 Apr 2022 20:30:08 +0200
Message-Id: <20220422183012.444674-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DzdlIpOpxoHVmzoWSwK/nL5QieYQdzPf0cfyielup2/bHsKDAwQ
 N2kbPBEm068bJ2qlsUpy1PuMDBxL0Al4q+6mC29jVCwWJ/ZDGDodyr0gOx42IbCkPI7CSfx
 IoV+Hxjssgj5OQwTO2pN9A2e91iagZFyoIx2I3C0VnPPyceNuz2gFz1TMWf3aXtkNj8+Rde
 HcSt22thU4XWdRXPBq43A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q6muYwwBmOU=:XBhc30hzd6wXZguPW3xRtz
 DdwsVQEK+pMfcJV1KuXz0Npbh+HhJQLX0+wE3ri9G7EcUC5WJabgwj4V2SD4EG2UpjpiN42Uh
 T+r46GZk/HV1bG8IuSGaKzivCcLgt2PnzhI9YIDPZJHtIQM5aRVAjs/OL1qh/b8DIq4SpFbhl
 hgqyy8MVvt2qJqiN4mgUPa3wPDthiqN5znkOYf2n464i/RXsJwS4EEsp/AGAtzj203GYJOIjO
 lgMz7Sa+Duk3nVijDKYztt0Iq1M25PAA4SIQ1xdapXzKNlLNNn5IKzrmJDdoQeRB7uZ4v6FD1
 0fd3z29P2Cdw8ROipnR5+rMLAEcc2T4UcOFzmmOL191tGuIfX8x8s6hJ1c3YJJwY3f3Shla71
 rztw7Z3PsZSiUh97FyjliYtbgos3c81W+aE94RZ9olujmqRaGT0k0IiHMYGX5pEKRuRVXjvn9
 MvQYxfk+AA4Nx0jdMZiwJA12RUkPBpmM6QuOCMF+s/Tix/FP/iUtNqFBmmi1J9e894firyGlF
 Knz1ZgnOxnHBUReHAJrOgyLdTtCCJ2Y0lpULtYOY5grwuOgcehlLwravbwWxc1pKKjXRM8FwJ
 EKHYCcnUDwuFt0XM+jWkCYXYjgLqiaTFIj3dT+YiV8wAPzZp7QyJm9zkbpbfxqgisJSvZ0vK0
 dIdyTA/6hsg66pUbiMSHRn4DkCT7GKfys+uriHvPSKvkPrOnVdg1Oq3BUNsvYmywcOEkAJEU7
 MkWZ9hCZaAa2jI/Abpw5ZxhNm/IGG0Wf2S/vFz229V4xz+TbELanPk9YiUW9pvBvKWNbQeYuD
 k2NGQGzrVbTSLk4BnyC7n0KzZY8t9yCHeqmAho7S0BgaRuJIaMc8wc0qxo1XuTsEP65NiDMq7
 t4G/aJyN8NIW1SnhryNHziwGN2V5+LEG1jU+1Kfr9Cqayd5nVjTmNr6l/J/wZbHlv0GeyxpbP
 OHIJ/NXBW7HWOne3TpERB58jIxvqL6PxdC7Mx/y6wD7a09apUebc7cEVWkcKW3zEdZWvLgF7B
 Os1/OWt0TztONeUSqkVtFt+Rr6NuJQ8VLASaJC40j+QBrjCajzDjE0zoqvj4vQ1Qu8IA6x3AF
 7hX0ZgcbdvFMSQ=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On the Nuvoton WPCM450 SoC, with its upcoming clock driver, peripheral
clocks are individually gated and ungated. Therefore, the watchdog
driver must be able to ungate the watchdog clock.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/watchdog/npcm_wdt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 28a24caa2627c..6d27f0e16188e 100644
=2D-- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018 IBM Corp.

 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -180,6 +181,7 @@ static int npcm_wdt_probe(struct platform_device *pdev=
)
 {
 	struct device *dev =3D &pdev->dev;
 	struct npcm_wdt *wdt;
+	struct clk *clk;
 	int irq;
 	int ret;

@@ -191,6 +193,13 @@ static int npcm_wdt_probe(struct platform_device *pde=
v)
 	if (IS_ERR(wdt->reg))
 		return PTR_ERR(wdt->reg);

+	clk =3D devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	if (clk)
+		clk_prepare_enable(clk);
+
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
=2D-
2.35.1

