Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB524A031A
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 22:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jlrbw1vD1z3bPJ
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 08:45:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=AlWODT9n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=AlWODT9n; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlrbV6974z2yP9
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 08:45:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643406287;
 bh=P84tyrXYJDCkUgk9lKDmYiZswR055eF1GEXuSKNmM7g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=AlWODT9ntTG9aoafUzGV3ofl2a1P8r1ZculmqAs0zR19VnHpz297JT/3faXeCsQAN
 O5q6qC+dEPjoh6cAoD5tBA2tTTDie0JfbaBwayT20vjuD2npZJRTxb0VWiGQF/LMag
 ZiHcEMFkd+y9Qc0nr+QKF0WSlWVxL0MRdx7hn4zI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.80.162]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1mM0vC1NUj-00sQZ6; Fri, 28
 Jan 2022 22:44:47 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] dt-bindings: timer: nuvoton,npcm7xx-timer: Convert to YAML
Date: Fri, 28 Jan 2022 22:44:26 +0100
Message-Id: <20220128214427.1990183-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7zFHR3oZpCRvermhRWwMjjfCEewDVqTz/9ti8jC0h0TomfWOKKc
 8rmAh+wu3xGqphVWIZlPwO45zoBn4aIon1nqFG7MbAahZVLifYMJBGY20kxHYeHsQ3mcKcW
 y92cikwXkqrP75bKDw4DeC2U5fRbzxIi2vAOP+RzpLji1QiEVv295cSFoxLH1mTywCNvVhY
 7jyv0SAV/w80Y/WYyT9lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UG0/RIO59cE=:6E1eBsUUTcW3ap1iXFiUIo
 D/rA4pLmT4Owlbhrmz4ad0ChIq+POLcMpN4hyGp8OUEKsjS4QzqLjqniClZTy0HS4NezWy6z+
 AuXAkmbrR5nu72PehsGQlZy6/4afM/FunCVQ7XPK9NJxyJbmyWTUCtNLXlnuOiEbJwRJuzkqN
 7GvD0+mPIe5P4OuuvRuL/FGrm36Dv15nf69U0bT6MEzuGn182ry8AgLKyzpljKR7O/C0q5kLr
 C6IIwbMP3rxHXTnOltWGh9tkCiMsHSUqDVHdzRsKzUYzozLbaC8TGxqnjGHX+30m0+mgpJxUh
 HVBPywMmv2/fqIbKkfdWOGu2FfvMxePiL3LI73VendiHJ3b9uRH7YlZ1VyuKlwY30Na8A2cZy
 200CahOBHCsUh8rUo3QEHGPutFUPUpbHLhPO3ZO6EaO9UDDFnucX7m7fTYLtrC4Wa1YIZLGLI
 GMkPSD2Xr1pBj4XgB2kKVSgTE3jiJQrToMU0XgwMXvgoFaEMoYGSid52NwaNsli2Ca8jmW/SA
 A+T6ipBnu7dCZbDmzcUEI6af/rBkWgh+0P3R2ymvut+/lXJWGH4QNtE7iIz0kpd/A3+ntAETM
 20O8iRHj/3pHK32WLWg0Uzdk6qtPEovDQevuYGwib9l+qXEmWkAaT9WyR5LANDKzQoPDIu5MT
 HxDBGjrAGKSXRMKmK+LP1mvK2bzIXk2ChMYrzSGSdvuSoDSUF3gecPQdLKLQnnxT5+/hV+OP/
 fwcocVN1PgPDy0Xj9tQTk35lQAEgohSWgHL1kEi0AGBrtrlrH2ZlSe9KGqNRDzhArP8yCbIEF
 3lx0KPFTDOXDytdoY0U8XhKw9nABPg6q2y3ZhlZHUxNnoK4iaVbTcWsWaabHmu1gXidTJ9LoK
 QO0ScEL9CPfOTfSLzhWOwtUHXNXLHP78DEDT+DDRaR3cvL2auDRkYk1XgR4SxFcBdzWToqp9P
 0wT8FCtUlge6mFWIgyZpt8JzEK+N4U7FuROLFfD6gZokf2TJIZh+uy4naGxa6ARQTgwja6dJj
 yKvhFyWzvnkuUXoE+BeiUcyHsfhjlGaK1yaKvA9+0cKlMNTEhMrx98Dk62AvM8mw6X2hzPg7K
 xCtProyB+Tw1jI=
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
index 0000000000000..33f9bacc8423c
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
+      - nuvoton,npcm7xx-timer  # for Poleg NPCM750
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

