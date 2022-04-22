Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428D50BFD0
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNQN1hL3z3bZy
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:35:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=D5c6BNuU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=D5c6BNuU; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLT0dskz3bZR
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652308;
 bh=XAbU/WwnBQTi9/OidcyFLjRJfgJl6FaI1cL4Ta59NpE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D5c6BNuUtvegOGNSGvbeXaBV4pudnxeFpT9TW2nUtf+kLo3ykkOMzOYVOrPLHYw5g
 vFbQvoqirE9y4DP9GvWHiEEHmo6NJBRtYL9ApwQCufx6V4JkGsYzHPe8/MTpz+stcb
 gsl/C2AG5uzuCZCUDiZ63pyragftLNMtYn34PooM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxlzI-1o6V013bxO-00zIaz; Fri, 22
 Apr 2022 20:31:47 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock before
 use
Date: Fri, 22 Apr 2022 20:30:07 +0200
Message-Id: <20220422183012.444674-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uovlBSQszsD4TcZ6IjORpDv2zAitS8WCPXKi91TdybsXvyz7lqO
 rC2FC41F/kJUCpFHd1VviHlqQLLBrFbdETf+eE8nbVimOfnWkBZ30HFJmtlAYF1Jwirim+1
 uMWQPfc4mPu19lplwt6TaEE58ze9BYNz5EI1+XTE1tlzCw3t9XOIahvNn5e/tYf/l/wShmM
 vpo+JqSHVFco1wj+MDB2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kt2z91rRdcE=:58S2TF6gkz18jfO0KkiERs
 hYXl3pgxdM56NsrMXdy+48jlVZtKebIJPZdsLNGAekwywMoXJPAftncZrBRKPwsofFs6eAIMd
 8GOYdTMZ3RkIp5CNqUN4NOkblPX0hEof4DjTkgWo1dDn8on2ccfwq9VhbDfjOdaIviEWFkbxc
 waN5xv6bUUTujuCp0ZGS5q3lNHnjCbcGIfOKYDK8714sGTGrpCHtbTaEs5jXeddX3EYR9HCYK
 +Nz+ifrkt42tybWTZV+CzNvF6wG+gZTV15QogVYYzl2YBtnIs9UgwqxgHFBiIPBiCECkYjnEs
 oyG4QzzZLT0GrzU8RNAcdiqAHvE4YXkxGNCQo3Uy+I3unhsx0shQArXrhk5mHw89L99pIAGFp
 1PjM8VHO7dFzATycMu923lEV7ds7QlodUlhoYrU5ndAFYIxhVJwkawbnRidxi4ZsWMJ0IO3SK
 /8UiR5zMobx3EHo0WwEcxosaTU5T5UY0N3hkzFULUinjnLBGE/eHfWbwuZI8rqM4VOpr1tlft
 mcKHASvqp9gGShEcgxD8oKBE3hAndLnB4wFm5Txezwoz4Z6RShpFnoWX9aIiUUEjpsikF7QjG
 uRBltJhWu9e/ByVgg8H7pPbOIsSb1KSkzlOqS+3co32rPUCHbl6S763F6KcRFw7ELgNX/Hld9
 QgRRdGDrUSomfqkarX0gmbK/uhRONRzudIjTbMwIVb1ZoMyJqdy2GGg3kyofTM508PcEGP2pl
 x6ysQkBIsv/8JiEyxIs8nN0RGbNGjHXq5FjzHnDyE4XkY94S3Hh3clsKiLTxfBXDytOl76T7S
 C5UjU33sQGLByCz9tZvUiiaOHWDG0GCf+ZFyrEtGHu+gCyc0oYOrTIzvVIwYZCulwTJzPcc7A
 pMWAplCYze02hP03JHNCOK0QC23mlY6d6b2C/tgzW2JtdGr1+JZt4JMKwggRzIMbY4PoDy7iO
 OQHKOj+TUM96fn9n1j8hyOCDpeIuqo9UefhSbZQ815dJQcZIvibHeU1WW+BJDt1yDrQaTyyQS
 kYwtSxbHhoc/JOIBQ63O1VcTsFfbfIneg2aPbHE2Cu2DTaI4GGGxqrhrEg8XyxGpaJ+UnNP27
 JiwFSajrHCgMsg=
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

In the WPCM450 SoC, the clocks for each timer can be gated individually.
To prevent the timer 1 clock from being gated, enable it explicitly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/clocksource/timer-npcm7xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/tim=
er-npcm7xx.c
index a00520cbb660a..974269b6b0c36 100644
=2D-- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -188,17 +188,29 @@ static void __init npcm7xx_clocksource_init(void)

 static int __init npcm7xx_timer_init(struct device_node *np)
 {
+	struct clk *clk;
 	int ret;

 	ret =3D timer_of_init(np, &npcm7xx_to);
-	if (ret)
+	if (ret) {
+		pr_warn("timer_of_init failed: %d\n", ret);
 		return ret;
+	}

 	/* Clock input is divided by PRESCALE + 1 before it is fed */
 	/* to the counter */
 	npcm7xx_to.of_clk.rate =3D npcm7xx_to.of_clk.rate /
 		(NPCM7XX_Tx_MIN_PRESCALE + 1);

+	/* Enable the clock for timer1, if it exists */
+	clk =3D of_clk_get(np, 1);
+	if (clk) {
+		if (!IS_ERR(clk))
+			clk_prepare_enable(clk);
+		else
+			pr_warn("Failed to get clock for timer1: %pe", clk);
+	}
+
 	npcm7xx_clocksource_init();
 	npcm7xx_clockevents_init();

=2D-
2.35.1

