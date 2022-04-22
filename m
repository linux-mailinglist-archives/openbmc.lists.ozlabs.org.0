Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0F50BFC6
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNLw1M55z3bYk
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=XcrOKbKj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XcrOKbKj; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLR3sB2z3bYZ
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652307;
 bh=nH5nbmzHe/xRwz0pWDdjzn30b813GPDvATKACfo4I6g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XcrOKbKj5+k5k5MRW3lnNx3b2BzH1muMhUPLRVbJ3jIMoPSPgc2ydeSkFlAb2Fr8L
 zce8KB4yozHjdmE5SKTbziLmYiyG0YjClyndUaO3Zf20ugQ9QDlAt4/KbtS5KUxZ6Y
 1VGkDJIhm7QY6/sDlCOHs9JpkW/PtYC98dYI+R+o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1nh6473Djx-00GnuC; Fri, 22
 Apr 2022 20:31:46 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/7] dt-bindings: timer: nuvoton,
 npcm7xx-timer: Allow specifying all clocks
Date: Fri, 22 Apr 2022 20:30:06 +0200
Message-Id: <20220422183012.444674-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lnBh/Tpvgmu7+wHhf+H5KmdyA2JGqflwIdExxJyori80ywRZSGg
 flOvQpXx/6FTotPushCAlRjkrTtc6+4Al0ktSv+PUZ0hpSYy2O5QKr8ZpiSt5c26UcjQFfW
 MAWFL4Hz8F9vQWjXrGC1jMgB2bGBiqgY4p203hrVJHH/jNtRhzgk4N0vl6J4PqBB2kLE79S
 VYINyKnXBIFnjHKOVSF+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cTH8WXWnjoQ=:lyV5jFTtKdRZz3DTJCjI5K
 mMu7S2YOs5tSjCYabifnHXAu6aLwokhANbJBAXa850vOgiyWU7hoQjs1uYSwaVB3opmvKlijU
 9sCH4DrNAvCwuPr5qXzGlwMmbMkgcwER0V4LnWbLX8pSrfzCf7eumPMOLGkOL50gn+aqREL1y
 iuyrMGetPG6BhSTgLdYSK5rkYdoDSrkHhrDZ1fhnRjGEfiEPvJt6bMPIULYXVDxRuDEBku7LI
 dD91EvU2c07T6C2xaERVV1JYaeaAy6WAwmTwXuXuBO0T1YcEIvo46N5GUnQ4ulHvvzFFokFZU
 AoddDQhNJ5a9RM21vR12Fg8LaE8UfSMly6JWVoYIQ6X81wvDqEWergSxPGL0bF/ArVf2D08S4
 jbaSkZPYPM6pBdkUA/oqcB//2KPWtDuuprFFTdGSmeP3G7PWIfeUxcIC58rbjPKj649758P/Y
 eFk3Ki5KPk0jLwSqGZqx+A6pFh92myD4e9bxPIYvxfpwM2zHdvslnkddGtepywQCTVDts9l12
 rWkY/1a+4TFvEvxuAvINqegQ/NmR5FyDjgQE5QXrPK8FOS1RZDxzgAbuP/XM3jpO1bjAPxYVo
 2H9gKY/z7anwlvz9ZUHvfC7dTDwEe32zCezbFVioI1+hwZwr0OuTOJjIkRosoy+K3kyD3BlTF
 am4dFA999wmVKr/p8RyKDm6IeIsxN8Fw3OqFz3KVFeEbJaoqczlw2BubXLb+EZsMTqWlRjWWF
 AeKjWRncurTd/jruVjBIB2PlHsQ8HUzXt003PKInqjDXn2m5B1LEIXBy1bBqF41g3SdRxyLE1
 mMO/pPcKnuiOiYTgJQazuOrVOzZT0AiiLniXGne826dzY/ntmGCpmV+Tk22L7Ver5H1FhIGlx
 ft00hCqlkyzAqExTQ87j9PDfmv4Pk0JCr3cficbv9NdU09tnuMjEFD2sA66yK6N5y84ULPHxv
 0hwo6NQTurSuzuxXvIcYvmRoBv+z8peIZZpOgsi+mVTni/zD/kV5qMjzeq6SiEvSNk+qBji4w
 C0+PvGKvhnqu2oaDDKOkNf0fTeko0p98st5ZpNpHhafcClsEDeAhidX2CCKOUrJpM6Bk4OzCm
 gSJVOmEh6V8ZYg=
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

