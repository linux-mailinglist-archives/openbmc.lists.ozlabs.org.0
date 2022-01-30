Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25E4A35B1
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 11:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmnV26gmSz3bW9
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 21:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jvwp6E6+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=jvwp6E6+; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmnTd6tsnz30Mn
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 21:28:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643538476;
 bh=hLhVxqGCTT0SP56FBjtCArN7ldgzwA2hHFxUD+0qoX4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jvwp6E6+c0I1HPRshmZVKx/3PmawessslXIx0iGawpZgTE+JRA7bI7yJlPwrz2STn
 S4UgugeSjEWGMdakugdAqTlr8wM3l3pJkg0BIqdy82vUlo9rfBOn2qnI6os4oB89Si
 fFoNLLAoi2vkEA+jqo1tfhiq1KHg5HVEQKR831dA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1mUrFb2Atz-00k7Ri; Sun, 30
 Jan 2022 11:27:56 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] dt-bindings: timer: nuvoton, npcm7xx-timer: Convert to YAML
Date: Sun, 30 Jan 2022 11:27:02 +0100
Message-Id: <20220130102704.2892072-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KgtyDL+sIGlvIqmFNv5lxED6AgqBgd0MW4vhsZxXY8xPzRN58ac
 pvD1snTbOu6LxvDIvsPXQXg40l3eL6So6P/nIgrnSyGjL6NdoZXO1gI3lWkuj8h9joAoWk0
 U/dFm0n2p/o3s5ujR5/OM2m9t9vuRGqIII2hrMI1ubtRQpe3I2+8A9LobdXZRRUvbx68GrT
 pWNj/e66MU/c9cRlsNUUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hQ45Lk3Mggk=:R+IrEDbT4qG6RbIBApp5eG
 0x4AvFnZDxms0Dl9fm/Q0BnXhMkNcQGlH1hR2FgKyUTWEWZDtkwBJ6Fko925mbx9TZH5YPiNO
 Dr6qGq3UQfmIH2ff6AWPAw+6H2pzXAREPJsFViTMB0Yvsvv5JiziHwPIElqReI04WdAeF1Km+
 invSUMnlgLC0C+VC6XC1ZbQQT5XSnI7UTSPXps2bzzQyRX8w/mwb8b+lrM1/6E4NbOTVkmPzI
 Kd7PU7B43cqBziZcuA215YVAU5UcsK9KU4F8uqtmsT8DUGDx3r0U0mIO80/x+aDJXddCspbL3
 FslEmtXsyvNgPuoSoKeVjvA+OZiZTpVhn9IHeV5wrOQt2gJdr0iMrQ0iaiKBsYNkrFB6xnRVz
 j5qWGrjh8tU5TP5en3NniU+ozZdz02aIq0+6mNItk1axPNvUqk8rr1djuU+e69DoLN/iJhXJQ
 ZGSz0JanUaCxNUkR/eisEUfgEJksy25i5D7ihu2E+zuUnO6PXXaSeC9lZY7fgNkDJlrcdvFv9
 hrxpnpHlLVCpFRpPlF4ZQVKP5ZTm97UMoJz7GBgtLXEyT3YbsA9INiRYUqOoYhC+R2YW9+MBT
 T9OuxHHD6FogGvaLr76gDp7A87qRCqsSabcZYXDS89eGjEVcH1Kf6SkzJa/7YOe5H+JzVCwo+
 Ez9msY/8hvNPUhtp0TmadZU1qyk0SgIwmR6hK1ldVTjmkAWJ1jW9eMIRT+yhgg2cnr1f3RACy
 eAlCrGxOk1H28Ychc5mmzIRjrSo5Xu2il3+gU1kvN2hGT4KiQtqHdv/4/X2INy2dHc/nmVqQP
 3lEpHdViBnqPYgz1KujlbNsoagPgPY/dDjC8qHf8jXrtzpJLqz/GWWid+UwvqqNtWm38H5ofI
 JFlgdZ4WA7gDro425m0pQm0YAEKv5hkRNRGjWfN1VlI6E3QMVy1hiRmzN4ppDIRPFJ2pNd8Mt
 wkDIYR7xbCW/qSbwqNGZziRGdfjDf6pPhfbLD8BNlscffxUVziydvS6YjDet4vYbntuHFjavk
 wDddxQbytywW6lmfGsGonxuO5P/RlLhGwwXfdS0huN2ali557LQQgtrwW/vL71u1kcxrbN9ST
 EuI4r6ZophnO4U=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Let's convert this devicetree binding to YAML, to make it easier to
extend later.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Fix nuvoton,npcm750-timer compatible string
=2D--
 .../bindings/timer/nuvoton,npcm7xx-timer.txt  | 21 ---------
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7x=
x-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7x=
x-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
deleted file mode 100644
index ac3a5e887455d..0000000000000
=2D-- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Nuvoton NPCM7xx timer
-
-Nuvoton NPCM7xx have three timer modules, each timer module provides five=
 24-bit
-timer counters.
-
-Required properties:
=2D- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750, or
-                    "nuvoton,wpcm450-timer" for Hermon WPCM450.
=2D- reg             : Offset and length of the register set for the devic=
e.
=2D- interrupts      : Contain the timer interrupt of timer 0.
=2D- clocks          : phandle of timer reference clock (usually a 25 MHz =
clock).
-
-Example:
-
-timer@f0008000 {
-    compatible =3D "nuvoton,npcm750-timer";
-    interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-    reg =3D <0xf0008000 0x50>;
-    clocks =3D <&clk NPCM7XX_CLK_TIMER>;
-};
-
diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer=
.yaml b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
new file mode 100644
index 0000000000000..0cbc26a721514
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx timer
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,wpcm450-timer  # for Hermon WPCM450
+      - nuvoton,npcm750-timer  # for Poleg NPCM750
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: The timer interrupt of timer 0
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    timer@f0008000 {
+        compatible =3D "nuvoton,npcm750-timer";
+        interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+        reg =3D <0xf0008000 0x50>;
+        clocks =3D <&clk NPCM7XX_CLK_TIMER>;
+    };
=2D-
2.34.1

