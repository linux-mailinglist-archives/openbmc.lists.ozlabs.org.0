Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C451F0DC
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:46:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFCt1HYZz3c8t
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:46:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Tbtd0oOd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Tbtd0oOd; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB25G76z3bd9
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039027;
 bh=XVfOBublJT697s4b334rAe6W/GabYUlUTBRHBuTBhbk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Tbtd0oOdkMsDXF1n3Ux0ph2RxJiqyYb0tDY6P++BmhN/e+iznGvekhTOLxOzVjlT4
 igmUWjro1WUZHg1O3GobuQXl0BpDFZpHh+RzHq+mWs93r8mllPLNSgLuc78oVS0MTA
 GoHI1D2jI1TjKTaS1G6BElFwn6Rtoo0LjwXgEf2s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1nu3cK3CBq-015oXV; Sun, 08
 May 2022 21:43:46 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 3/7] watchdog: npcm: Enable clock if provided
Date: Sun,  8 May 2022 21:43:28 +0200
Message-Id: <20220508194333.2170161-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vzkFSMPPiFMDmjP7Vq0zkUC7L1qOOrUXx77prPxKxM5JG7X5Bw1
 6failCDgS4gKXyhQaublZGP7D3tqW6fJyFX+9hLCjc4rpt4Yr9g0gzqZfWifABWCas2Wndz
 sjZOvqDUULn6wEzEb12IPa41+sDFls2w5G8n4cfH2kYLUF2O5u7/oj7N3wEijQ9tGuI0Bgj
 2hgBVc30Qr2xnLxdevVRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zl9at1OVUvw=:DHCHsKZqeDHrG2eeIxE8MF
 4qykzY0abfuq0Nkh5diTE0IlRkrYeqRBk4630PBA6ruBHDa+Ezxa+ot4w4lgE33zPIyNnzJ3D
 dTgHMGKzj/TNLRLTx1B+IJvHoh1sY1RCogaNWJ/Pgi3y5Wd4Iffv/9mUGLb3pW4RK81+q6YTK
 YY9iPL5F3pX7DQrO/xJkWme/oUAwJP049gm74EBn4LKnV1rP54dBRhQTj0stCHXbZ8aCY8gYc
 v+89X6RltU5Ptb2Wplvt99sdnEyb85zS3lw57Hl5Z2hkAxRKmy/tBpt72WWGmtjZRWT/fkAPM
 TZtomYXwpNTdtRl94Pyv0/HmkIMSA4L4jyNGsB3drYBol3oyyJ/4niEfLXlFgKHT4lzeO1MHM
 j9qk1YSMlEx2v7KgVvluc/x3vyoj/pcbLHdkL0xkoEunfPrfyWsxwQU5C87K9H2Y9GoE/Hhcj
 Gepabk1f5e1dxVFrAvHpxwyCV1/0G4NxjvOSqZqXN//P+uEm3SLlnOmldfKNOtdlLakHrghc1
 H8hnJS1BAOhZwpnAEer3KlxPQqHkY6zAHs4Fldia/ANUy9viBMrqaclFJsRNO7fzEoyX6N73f
 af9xtZdr4ZbMf4WwzO9q2VGJg5h+Im0ILjUqgYgoA/JbzQBSire9ErIEo9J7TVxWa4hEuqVxF
 wrmhCChpMAMlbRqg9XbsID3FQoGPSZIBWgbBt0PrE8ntkr6yGlcyC9ezBxoIG6XowiLHivzG3
 0KxC2DBXJ2pGwWLjXjwafwGCF/d3S4bfVe8f5XuLIZ0p2tFyC32Bgt5ZlpU3CmvcNg4gitiB9
 r3nVhoqycmtQ0bs7fgyryAZUAxNw5dmJ4Bp9hl196irU/Fdy6a1zwH8JfUPB4XQ4OHCVG8YQw
 05NoycP93i789V7ZzsaZiS5o5SBXCfx6OFBF0sIgNwJqKxxDyQo7RY0sRcOf8TzSNEEURmlw4
 oXiH8aqVL4yvLfIYhfclXD1zZzjV2YMiM5dd77brc30OBr09C7oe/iYeOP6eV6tFHMa/29MCp
 mrXYnCy+yaAY4f49g9PWbpiQ5E6c55GInx41N2637GQAekCA81AeHcb8d4lUb6X0574Gg1DeH
 hm/fEOJSKndp18=
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

v3:
- Add enable/disable calls to npcm_wdt_restart handler
- Not applied due to the above change:  Acked-by: Guenter Roeck <linux@roe=
ck-us.net>

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-4-j.neuschaefer@gmx.n=
et/
- Add clk_disable_unprepare call, suggested by Guenter Roeck

v1:
- https://lore.kernel.org/lkml/20220422183012.444674-4-j.neuschaefer@gmx.n=
et/
=2D--
 drivers/watchdog/npcm_wdt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 28a24caa2627c..a1240a906ef2a 100644
=2D-- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018 IBM Corp.

 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -43,6 +44,7 @@
 struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
+	struct clk		*clk;
 };

 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -66,6 +68,9 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
 	struct npcm_wdt *wdt =3D to_npcm_wdt(wdd);
 	u32 val;

+	if (wdt->clk)
+		clk_prepare_enable(wdt->clk);
+
 	if (wdd->timeout < 2)
 		val =3D 0x800;
 	else if (wdd->timeout < 3)
@@ -100,6 +105,9 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)

 	writel(0, wdt->reg);

+	if (wdt->clk)
+		clk_disable_unprepare(wdt->clk);
+
 	return 0;
 }

@@ -147,9 +155,15 @@ static int npcm_wdt_restart(struct watchdog_device *w=
dd,
 {
 	struct npcm_wdt *wdt =3D to_npcm_wdt(wdd);

+	if (wdt->clk)
+		clk_prepare_enable(wdt->clk);
+
 	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
 	udelay(1000);

+	if (wdt->clk)
+		clk_disable_unprepare(wdt->clk);
+
 	return 0;
 }

@@ -191,6 +205,10 @@ static int npcm_wdt_probe(struct platform_device *pde=
v)
 	if (IS_ERR(wdt->reg))
 		return PTR_ERR(wdt->reg);

+	wdt->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(wdt->clk))
+		return PTR_ERR(wdt->clk);
+
 	irq =3D platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
=2D-
2.35.1

