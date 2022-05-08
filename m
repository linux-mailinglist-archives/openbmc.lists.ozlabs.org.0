Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB851F0E0
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFFy39RGz3bff
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:47:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=JsMF/b6z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=JsMF/b6z; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB25B9dz3bd4
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039025;
 bh=n76/hLRRaMIrLkiSBCnvLg8F9/bppo8blXTP7lMhyu8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JsMF/b6z2Skbt7dmEjaQFgi6n9aqnm+yZEXi1SShVosusMlDmprqtCk7KYMW+xJGh
 Kzzk9IFiSm7haSLwph0ncQnntmtHe5hKRPQh+fH6h58KpHinu+tm6JFvzfa+G0M5us
 Vf7GANO/ublwGjiAzpZccFqkGZMm1bd0N7eyaHJI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzfl-1nH8hM1DHl-00XIKc; Sun, 08
 May 2022 21:43:45 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Date: Sun,  8 May 2022 21:43:27 +0200
Message-Id: <20220508194333.2170161-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pWq1JPNigWSSaZHAqUAune7+HNV0oDFRi3ixapHifQJW0Vw3bl/
 ZoyJWWix1P1YxeKAny6kOHF4FsWecJhiDo5Op2QjeFM+JDOeeYyzhycm3Hw/owLu+uB7wj/
 VLvVbzMZeQ9vIrhVFIlFCv/3JfTOULSFwDy3qoDCRrYVsVipPTVfSv+YfbSTYkNyvE0TRd3
 UzseGXZwNwnHRnzeqk74Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9SqJwJa9skw=:TtwrXU+6EBNvKZjWzfmS89
 Op3XOyAcftg/gHGbODC7HSllJCQpDC4Q6PGOTYQsPRxJXHQakAPqqg1f0SD1KV+oePCXNTgYf
 L2CsSSYunb75A1sOVWh287HuaW8PsMNscNn5caV/yZ2Yvs8c9zUth8DWjfk+3v4guVXxkw9Ht
 H37inUOmOpm5ryEzdTiaFbSk2EtggvmfDAXi2m2kzxYjW54dXAF2dd0ly+MYezDoST4aVEMjj
 0Rg4/8lp4FlmvVL1GtmGW9dIcAAAxO1Zn4hXmKKwsmkq9+R8FOAUlyPVu0wLJ/XHENWR4q4t0
 bmzvxRE78a47zxKMe7qZMUGl8mS+wmPExe4HqCfL9Bq4Y/i1JdaQB1n58fahr0p90AdIyUsAh
 6AUc8ZlTc9c82fexYbiigJpo+IB+m5pnGPK2pUP+Z8xNC7Yixminpqm3ZKTHDL9B6Z04yRuxF
 eqoPCuxO17cKZ8k2D5g7gXiqz9DrlfhQEeWzjRRwEJZXbHcu994oU8zlaffRRYCDZUwZPgMHp
 PIi8g6IfWxMHqHjhSAbn4dYEEasd4DlIkfqCsWEKbYj/Ts65v2q3xAAHeo41XiBPflBCWO1+d
 f8sfLZqyTi8K0WhsiDmRlIcWGyi1U4BqL+UuwlIpZMGiEQ6bT2a99QU8smbictQWGntTrWYDM
 vyhk4/T02WVt69YxD7GtcaDqzAbEsQFdz+Lvi/Lufkkn+qLfa44pysndmuGhGcQ9CEHuUqtkq
 34ybixg9Mb7U9OiKBrODAltqZ2nJhxr1ZzMWgUBJgNfsj9WsfIuD2VhSO2/nFdSQe+MnvWTh8
 YD8cFADF+QJnsS+rPo7h4bBFdmPQh3X8uC5j43xasIZawB/Sx5bXpLiucqjgZVs4ij8JSpR7M
 YaNfTJi9hKV2/CeFnRj43RUsRZ7DvNV/KR7PxTE1lHSJ22nS8fLyp2HdMUv34wBo7Wyo9ri3B
 mT2Mag489GvzYFH4uOrKxK/y9W5KAVd6pSBKia123ORKtbX0b1rzdEMrRST9gIFr2c2xdqo3+
 hYPbmoy/Ptem282D/WFggiKkkgtaLs3B+4Lil3tRlwsDyvd0K4qofFScheSdTXvj9+OsXnVsG
 4NGl0QfWIdGqXA=
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

