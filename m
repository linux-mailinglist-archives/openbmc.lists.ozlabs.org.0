Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CC5151BA
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 19:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqfS46wx8z3bcV
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 03:22:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=PLZ4JQRY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=PLZ4JQRY; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqfR30h2Hz3bbs
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 03:21:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651252837;
 bh=n+fYbs1revJrCSfeZGgMBlQnPyJ+1djPv/sSqDYSh2M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PLZ4JQRYGDdEFKjhek+GvIAHzcaErcttl2lIEORTdJhliutBiTJTgwvytTYmfljkJ
 6bDKgIwQw/EPjBDGh9Wlz2ZYCoevf9lqi1zFIqkHcab+gD6ot/YKU+TXRlIi6HT2RV
 JgNNjjVkM1YCX1I1JwFaKPThaBtPvCmVUdx/8fb8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1neAlY3EL3-00Flrr; Fri, 29
 Apr 2022 19:20:37 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/7] dt-bindings: timer: nuvoton,
 npcm7xx-timer: Allow specifying all clocks
Date: Fri, 29 Apr 2022 19:20:24 +0200
Message-Id: <20220429172030.398011-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429172030.398011-1-j.neuschaefer@gmx.net>
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p6rSWqprkd/QaVYN6U31GBpxz/6hVLr3+Oe2BrJnZNSPt2M7+ap
 dIJpPkkVmy4PvlULhC3lfyadwa2uR7z0xdBxu08izsSoANi5UpMgvVG3M8758BuTEdEqfDp
 SXMWPYfeGd3DwBI7KsQgFo4+mFaIVJDZP/XgzcRdp0C74wSDFrnCXaLfDN9aRzOOon2Hvqi
 Gtneq4HkjbdpmIP2StEeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p+Br6C7z6cY=:5VhrNBlpnMvwTXnoJIWo0M
 fsPgh8JUsRjopAOMXm+IqN7CIaYvdtSpvvOu3Yvme81d8vAX152vwnm3ydnmYWiD+1oVzInDH
 PvwYxYc0oZJTbEHyRlCAgzlShAizuPb6ipvCQY654AnqONXE/xF2XlBQkFxvBDKJntb1PtNUZ
 B9+3Xf3l8crGm/4s4YONxnsK2ALiQ8RgDwOwLNv/d1O1EZB7owOzOWXP9GItnCCBY02MKGIr6
 az8S8CGf9OI9ePp3np7+LpOk395xdV8rGU1jsET5tkOAU7su5yYropkAlX4r1gBP0hHwDun1t
 lTrKMEHAF7WyruQ+Hv6jm0+HPieAKaWo4KLAqRm4SH0COU55hdf9pgg3IuoJWI13NnCVOh69j
 gnDTKzZDXGJiNGpSWmDx/V94C1R2u8Hrp75utgGstsAcavvuYnMJEjewD615sqFQ8r2BPQXQp
 7+ba2m83qDCt7cZGwRnNbAVd1X02LVmmsSslAMi6HBA8dNl1OeIq91v2r4158KUyVJaxnfRQg
 P2SyWpWiYCdHQUFWFLngCMFgDRE80/Ix0ncpqbQZK3d9xOWrVA1q9h3Rq50agWsv5lV/i4JJ1
 o38OsY41VaAP6/4NBHAIOBstQevqspfmH9bSUZ9Fl6n4AXNOfJBwp5y+e2pSA/YODpAygTHUd
 zN/72o3UsfA9lv0kkN21X8tlC0DvWrbSY6D0mQRK9SuWJIkf2Ke6XV1wQwMXtetjJZNw0kwOf
 KqfVjufYpwbtYCdindy99eV9xK5oyrWb8Wvbc/LAXv/MvYuFPgLaTi6eQI2wRv7/hcIuNmvjM
 oaBNO8GMZkIE0KKkjrkDFqwCeIxVenlh3ubWSLv/jkM/9buldVbIse1maMXAe2vhAUEzAz/do
 0MNva4VMUQqlyC6P2NczzLlNPeuYkk/kt1jaohguMmHDVGyO9Hd9A54cJBl5TPgZbU8y3Eg4E
 vsuqKDHPGtcDNPOWtXWOtxdLssivm/4nI/2Wh3MrPuWy6uaIhBGEbffqAjwHsZHZQoLr7o3rc
 l8vSZPMvFauIAvNj8m6LnfwyGorowL7HMe2GhXINK6iKgDKznyZmO+T+TXwNsWyhDiPsBgRi5
 V1n3uMv0lbXoMM=
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

The timer module contains multiple timers. In the WPCM450 SoC, each timer
runs off a clock can be gated individually. To model this correctly, the
timer node in the devicetree needs to take multiple clock inputs.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- no changes
=2D--
 .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.yaml b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
index 0cbc26a721514..023c999113c38 100644
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
@@ -23,7 +23,13 @@ properties:
       - description: The timer interrupt of timer 0

   clocks:
-    maxItems: 1
+    items:
+      - description: The reference clock for timer 0
+      - description: The reference clock for timer 1
+      - description: The reference clock for timer 2
+      - description: The reference clock for timer 3
+      - description: The reference clock for timer 4
+    minItems: 1

 required:
   - compatible
=2D-
2.35.1

