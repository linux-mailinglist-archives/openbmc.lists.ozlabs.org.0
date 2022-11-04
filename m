Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A1619D01
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3m7R1xCkz3cMl
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:20:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LeN39DnS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LeN39DnS;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6m4dT1z3cGv
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578744; bh=tqgQ7pawhIV4t9HvNdKf2jVTg7Dq96Y1ZvNJLJ1+csY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LeN39DnSIJFltd1q0GRj0/rLFNblWaRZrO5sUWBuw0Uuq2vZ1WXmaer2vkUaVO78S
	 Bp3DFTH1UHAMYM819LJEnzeY1SwNue5QXNVnBDHVQ3x0hAhzze13SBr4knJcEAFYTK
	 JiDHcmcR1Qbb/HbmsjMbWrGlRuuS4wLCOfArD6PcMzBI/cmrwmLkP6Imznr7PkV1I8
	 g6PRp/3kMEjJ0/0n6kB9r8HM2ruMMqWvxYqPwRruENG070LPeBG1YRubmaXBpvnuyw
	 KIYbqzJBgmOEbzS+5mPKcmzV/TteZGn+liRwJ/Gpi5iZ4QMi/m3I5uwEkHEWztfHZe
	 OWmHLN5gxlOQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1pEGyy0Xkq-00ykiN; Fri, 04
 Nov 2022 17:19:04 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 2/6] clocksource: timer-npcm7xx: Enable timer 1 clock before use
Date: Fri,  4 Nov 2022 17:18:46 +0100
Message-Id: <20221104161850.2889894-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AcLaAkbCO8V1wMAgSOaX3/AGdk7f/JhdypdOHpr/VMjkCavhWCj
 DA4QJ2+U9R4Vmq4sT5ZO5NL6Yk+NdzVX5DxYzvz3qw6sM2FsvSjhicOQzbIOkEdAzO45wpo
 bFMS6RMVfGSQSZLnUwxFGwGtpvBoMy12/GR2GJ7XuEsQclttCEj/xNyZSxyPHpb+KFC6a3L
 EKkDwSoBcLubHKN+ZDsoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NVVijpYq+Pk=;5OKIg1RcUiXCS6JevaCWZe+ZBEB
 XMH8/xamCxMyuihH3uIjXBCZIbC7gZntVPSHTooLhp/B1oS2cc91Hxz6jcwf9kZWpkHo+Qube
 CW8hpFyTz6TZr7ABc6Orq1uSriIXt1cX88NvwASgasOIy5bfAA+jG2T3PtAay20SGDHVTG32e
 tB8XfVU6MW41rORmsUJ7XNfo0rZv8vX/RQ4opsiRILAvbxdLTe1kMhIeMhD5fyyneKcs/mK94
 1cM/NYe6LvX4WRvV1eAj6lrCGABdExxsFr88pnSsjJ882ooUXld15kpa2PwxSVGkS4wqOvtiG
 vQFTWGnLSuhUSbdvgJbBdhl699Sfb4bw7P8rVBCf4+LW/xlf1S9EZd30CNiMdd1aIE4Ty7avS
 HXUUgfy2O/2ayCZbYwhAHUNwGY2VKLaOHvS1h42cu2q5HwKStNWDjhIyxEHN/lee3WJenwBzr
 ARDACNLRfVpWXlvCJoqOO19vczgrXOaxOjXBB+4B/sXJJn97n1YBZ4NSfeztjEwDx+msIQ2jF
 vJ6I3j5S8IgESY4vmPlm5RJbb75cX9cTM6ufdMLCvwqf5vipC0zk/lRG/XY08Mq3cq7aVbs9U
 AoxYOvwhAv9KWd3tFWPxIs0OiOGi6+OxgDEc9ph1wesRTPkY0ZMqrH9wdW4eliwPl+Ju1w4X6
 n5pSPHc28WfdE4hRDzUkFhWHdzqK0EFO4PYEKRS5Hri5PG90a9i8vdWdOKP/AiQJ8AoNjNsi+
 JDL2k+6c64DOXWuQySRO4b9vej+SgZBsgzw+8BKRoemn9s2euovELFJhxxAZwVfg+5+vqw9dt
 egFBAaaec0cl3vqOYXIyuRYpMnsBYi6REoiwHi1yt8d2UDAFiyld9z+kL5wPo4KKBcqFN83gq
 XyS5VUoAZ+gsshDDl8ZSVJ+MXb7uSHbFm9CC2m2oq3/90PPb7sN02Jl0OvjiymjwaF/QjILXP
 pNJItw==
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the WPCM450 SoC, the clocks for each timer can be gated individually.
To prevent the timer 1 clock from being gated, enable it explicitly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

Daniel Lezcano mentioned that he applied this patch, but I wasn't able
to find it in linux-next, so I'm sending it again.

v5:
- no changes relative to v3

v4:
- not included

v3:
- no changes

v2:
- Provide context in pr_warn message

v1:
- https://lore.kernel.org/lkml/20220422183012.444674-3-j.neuschaefer@gmx.n=
et/
=2D--
 drivers/clocksource/timer-npcm7xx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/tim=
er-npcm7xx.c
index a00520cbb660a..9af30af5f989a 100644
=2D-- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -188,6 +188,7 @@ static void __init npcm7xx_clocksource_init(void)

 static int __init npcm7xx_timer_init(struct device_node *np)
 {
+	struct clk *clk;
 	int ret;

 	ret =3D timer_of_init(np, &npcm7xx_to);
@@ -199,6 +200,15 @@ static int __init npcm7xx_timer_init(struct device_no=
de *np)
 	npcm7xx_to.of_clk.rate =3D npcm7xx_to.of_clk.rate /
 		(NPCM7XX_Tx_MIN_PRESCALE + 1);

+	/* Enable the clock for timer1, if it exists */
+	clk =3D of_clk_get(np, 1);
+	if (clk) {
+		if (!IS_ERR(clk))
+			clk_prepare_enable(clk);
+		else
+			pr_warn("%pOF: Failed to get clock for timer1: %pe", np, clk);
+	}
+
 	npcm7xx_clocksource_init();
 	npcm7xx_clockevents_init();

=2D-
2.35.1

