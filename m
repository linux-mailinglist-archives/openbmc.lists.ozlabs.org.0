Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7E51F0D2
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFBW122pz3cBn
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:44:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=KPG+FxkK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=KPG+FxkK; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB25Hrvz3bdK
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039024;
 bh=mGjWYLEwtu+ry5GXvt2ravbif89/+OFp+v9Ndwokqdo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KPG+FxkKQDZ5nsfn9b/rDbyRj/EIqKAafJrmd0UKHk3sF7F0EpIr9E0HuW+sj9MmE
 F6jSp87+YhIrpWvSy/70KQZZgiUasjqmT3gk+bqpdehgm0Tu1LSAxs+xcWauIFHWJO
 LN0zyxBJ2Q90EaNevt4+QnKnN3sWHZxrhChH4Y5M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59C8-1noskF3cxw-001D9L; Sun, 08
 May 2022 21:43:43 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/7] dt-bindings: timer: nuvoton,
 npcm7xx-timer: Allow specifying all clocks
Date: Sun,  8 May 2022 21:43:26 +0200
Message-Id: <20220508194333.2170161-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+B8D9NNv1GquKXyh+yewe8u/YXwDSp0omRF9EcPdcedfR2AXylE
 J1AAfDCtk1qY+HAxFunLVRrV18OJHIvc7EDyOOtcTwouPCChp/DNsHnUQHZDqgWERyuPagV
 X3P1BvR4gdkav6U/K/2NPsrhWLngw/NR5mURmKEnd+ZzDRYHM7q7F0VB6IL7wxqCkulSdi9
 N3W8ciYjZX4nRwIkhXYvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3V62gOaobJc=:u7MPmttD/cbQagij6o+M6e
 A1ZgpIfOP04t2VpF2yls4Fr1yKyPFRpoJAVOsfVK3lip+W4IH6N1atgx+OYVetTttNeE6sJe8
 UFvKAKZ7rIDLPMnxXkzCQ1HTarfQ8W+Zdsks+9dSjg25zN1RbNF+wUUfeS1qBa4yj21neK38i
 +FsmfZSiHWlv9dIa14fF+lceiHFEElLdVfZK1uj+YZbqPveniamE8ccpQIK0/U1xuFaFgCKsU
 6CsIy0FsbEE9DdBDpwL0FDsfkAUHJ8CLvvIVEtmHIAf8Xo3YId+07sCAZLFKCPH12bvRQPqSx
 AtdPOYd+4htYu86XBjRSkKiHSkG9w2hG/XtTEGea32xKLScSm7Mue2rPzc1PhK8FyelEb3Fhk
 kfB65E7zXM3FTwmUcSkZKQsMSHpsobQpHu7t3+mYvYFt0E3iVe3ld0dsWUGL7l8/0veOTPTdk
 Hfl89lyE9m/kuTbw2DycNFTu08GAlP3+8hfpCdI8Qbp0GvmYlYqyGDOlAJ3sZCqZor6+x1OkE
 fks595DFnq3ROcqdSVcSqvtx5Gp5WLVrAwAp+pC0MyzboFr/0erS1Wosk6O6QCSrc+xrGw4Du
 s9ZnU7q9PXs6aiR06M8ckI4AZuIUlxggw8Aa1lGiOh69MokAfR3mnxSZ83zwopw0Np1eYRneb
 5mkm5b3cok+GZ8QLShpqXTBICOXyzxW9/d1gXsL7PY7QfCvjA6y8IvFt/8n60BT+Jxj6YMfsl
 EvTPmKJSW3pcYtthQu5mPTaR9BL3KvcHzROGLEFbAszRf6BhamQJx8zWC7oGL9NAzEowy/ZIE
 39fepLWo06hJoD64GqoCZmf6uQ6gK/wV8Y8EcIGhBe5yRniHbRo43EzVlwppfdWCjwYASYEca
 QQRS3fC1+C71MdUIpJdvuRq9k85w7VejOD/Oj5bLgM1/5EihGiA0CsjHWs/m5Sjw3633cTci2
 tdmO2yicl189R7qgV92XYLkvyVi2TL/C+WASWvEkZ8F4VwBKk289fpCssVSTDQRCud5PwkTpU
 AGVvu1qOjbkaFI/DRQsk+P2ODF8N6DLo9cKituwDI3IwO8qU7ifhLkfAnKzWfMAIcD64b30/8
 6v6fStfcg2PBro=
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
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
Reviewed-by: Rob Herring <robh@kernel.org>
=2D--

v3:
- Add R-b tag

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

