Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A86F1E87
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 21:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7MVN5flkz3f6y
	for <lists+openbmc@lfdr.de>; Sat, 29 Apr 2023 05:04:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=SSrkzV2J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=SSrkzV2J;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7MSw5SBsz3cjQ
	for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2023 05:03:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1682708558; i=j.neuschaefer@gmx.net;
	bh=Js9FxogsamlgriAmt68MFrYcEC9TrqhADJOZjoSKHkI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SSrkzV2JlfVOrdhFHOMVjp8PoKl9Ssn0ai9tFBMP0J5UrUbF4+oL5Z82/vM0XIPh6
	 82E3wrMuJHFsSiA88vR0IQCKSTZYOmywfipMidUsNioPoBXKVTZJJ5Z3LpQBHsSWil
	 G5YMbP0hl0kOICbdRaOSN+3F6xc10TIkBOVWh5B2bz6nYIDIx8MmpygPBAH6164oxp
	 q1PWYy5KjtokCK/TjVJsG+eewvOIq8NLCKkite43rtBzAQc0jJBm6BZ4XmXYO9IdrB
	 dqFCRSwVWpz/hdOuQ1+adHYJAoit/opHphKrpGxE2PNB13yWca/xhlbbCtaVIFYpAz
	 8MzLmINdc+Yxw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.41.149]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1qA0iH1ZDT-00syau; Fri, 28
 Apr 2023 21:02:38 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v8 1/2] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
Date: Fri, 28 Apr 2023 21:02:25 +0200
Message-Id: <20230428190226.1304326-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428190226.1304326-1-j.neuschaefer@gmx.net>
References: <20230428190226.1304326-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:osNpePVciuQ0ZKGX3a0im/XQmlkmw3hZl4fd7lH8z5WrqiXS+lz
 vsO5UIgjYwSuCiOye+n4tfmgnau2VCYMA3nJgUe19uIcJ6v/hQFw0r8jfRrra/bXDX8C34o
 Pvp0oL1/ai0UKlBhC3vuVdW9g81MHAdE24pIXi3UK2ERnMQNu221PE/a9+ndO8pm/PlHoCY
 965zFDMLQjYyORCu12E4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lPqfS78iB0c=;8pkNi2Fk/rb37ZMPImCcnitHxWi
 5Yc/2UqtNRmPsrl8dEo0JiM2VI7K2qQNjAzD5Is/cYlws+YbO7iHMJaZZj25Fvpr0FMd4gIfK
 fRFY++75uEG/DL2rGVR4W2jOTTM9AaIEUHTNB3FKssL9+je5kR7HNgaBVkyuyRKGAiVGt4pi9
 MU35+eZfXw4EGX3UdiTEMDtPEkvKx1mRRq1v0OsuJVbjOLi7F3eUvjNWtU0Qyb0yjEbYFxpfU
 qhgInhXe8TJE8skoRbp2zWyzhiIt/gNQz0O/NskN8U+N7hYtCYDnrc4fkGD16Y9LkGTWE7u0a
 C20r8Gz7GG+dG6Ca8X2vHHFsz0gBVj8q3J1tyLxDXAZJWpGzATL5H1UwCxmmiKOh3nRk9pVsU
 NAzdUE66jBWyL1gE+sE3HCS+YPxxIUU1fGNrUGq5ldDm2GzjrA/sjP/cOVuUAtHP3vCLNk/aX
 KiP57tp2gICOf8FQL0TeobqiB3eP3DzUzG6/Hoe2m3muWAA6b5mwKJlNmnN6mw2+WOHJLSYHo
 HWEOcKhG3ShusBG49vIaqNISwQaoG2vi0rzytbM3qlzStfNQr5GbSCXWhCoiNJGkv2m4VYiX7
 y9ZG9GgOYysVl3m6REyF3VchT2Vpm6TID/rUPAAca7xMKHBTuzTS/lptyDur9akdkWAzBUxsA
 HK3QOqEEZvs7tplHsSB4z/ygNedbe8EcAB1gnSRtX+3PaZRVszIULecp1tvpEk/PRssHvdbe/
 M/DOCm0FF8ktyZwddbOZAZY4OGcsiAqHiJo93qd4bj9lLYVHX/JdqfrdJS7zIZzHntSX/t8oR
 057m4iDzQvzzvNolhEaAkzStrD/xmBz85GLwrJFh3zbAHExy+brXAV17Wa/zzS0Avo0Dm2xFx
 etDLJ804vlV+7grmwp7hOazaKCFtt/Ar+UEKKQSiZBdQrVdp27utjfzEDXkcSSYkj+cqJ3D1y
 nDxWbANj0wa6Yy/N+g0P+obGsHw=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benjamin Fair <benjaminfair@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Nuvoton WPCM450 SoC has a combined clock and reset controller.
Add a devicetree binding for it, as well as definitions for the bit
numbers used by it.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
=2D--
v5-v8:
- no changes

v4:
- https://lore.kernel.org/lkml/20220610072141.347795-4-j.neuschaefer@gmx.n=
et/
- Add R-b tag

v3:
- Change clock-output-names and clock-names from "refclk" to "ref", sugges=
ted
  by Krzysztof Kozlowski

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-5-j.neuschaefer@gmx.n=
et/
- Various improvements, suggested by Krzysztof Kozlowski

v1:
- https://lore.kernel.org/lkml/20220422183012.444674-5-j.neuschaefer@gmx.n=
et/
=2D--
 .../bindings/clock/nuvoton,wpcm450-clk.yaml   | 66 ++++++++++++++++++
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   | 67 +++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.y=
aml b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
new file mode 100644
index 0000000000000..525024a58df4c
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,wpcm450-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton WPCM450 clock controller
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+description:
+  The clock controller of the Nuvoton WPCM450 SoC supplies clocks and res=
ets to
+  the rest of the chip.
+
+properties:
+  compatible:
+    const: nuvoton,wpcm450-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference clock oscillator (should be 48 MHz)
+
+  clock-names:
+    items:
+      - const: ref
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    refclk: clock-48mhz {
+      /* 48 MHz reference oscillator */
+      compatible =3D "fixed-clock";
+      clock-output-names =3D "ref";
+      clock-frequency =3D <48000000>;
+      #clock-cells =3D <0>;
+    };
+
+    clk: clock-controller@b0000200 {
+      reg =3D <0xb0000200 0x100>;
+      compatible =3D "nuvoton,wpcm450-clk";
+      clocks =3D <&refclk>;
+      clock-names =3D "ref";
+      #clock-cells =3D <1>;
+      #reset-cells =3D <1>;
+    };
diff --git a/include/dt-bindings/clock/nuvoton,wpcm450-clk.h b/include/dt-=
bindings/clock/nuvoton,wpcm450-clk.h
new file mode 100644
index 0000000000000..86e1c895921b7
=2D-- /dev/null
+++ b/include/dt-bindings/clock/nuvoton,wpcm450-clk.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLOCK_NUVOTON_WPCM450_CLK_H
+#define _DT_BINDINGS_CLOCK_NUVOTON_WPCM450_CLK_H
+
+/* Clocks based on CLKEN bits */
+#define WPCM450_CLK_FIU            0
+#define WPCM450_CLK_XBUS           1
+#define WPCM450_CLK_KCS            2
+#define WPCM450_CLK_SHM            4
+#define WPCM450_CLK_USB1           5
+#define WPCM450_CLK_EMC0           6
+#define WPCM450_CLK_EMC1           7
+#define WPCM450_CLK_USB0           8
+#define WPCM450_CLK_PECI           9
+#define WPCM450_CLK_AES           10
+#define WPCM450_CLK_UART0         11
+#define WPCM450_CLK_UART1         12
+#define WPCM450_CLK_SMB2          13
+#define WPCM450_CLK_SMB3          14
+#define WPCM450_CLK_SMB4          15
+#define WPCM450_CLK_SMB5          16
+#define WPCM450_CLK_HUART         17
+#define WPCM450_CLK_PWM           18
+#define WPCM450_CLK_TIMER0        19
+#define WPCM450_CLK_TIMER1        20
+#define WPCM450_CLK_TIMER2        21
+#define WPCM450_CLK_TIMER3        22
+#define WPCM450_CLK_TIMER4        23
+#define WPCM450_CLK_MFT0          24
+#define WPCM450_CLK_MFT1          25
+#define WPCM450_CLK_WDT           26
+#define WPCM450_CLK_ADC           27
+#define WPCM450_CLK_SDIO          28
+#define WPCM450_CLK_SSPI          29
+#define WPCM450_CLK_SMB0          30
+#define WPCM450_CLK_SMB1          31
+
+/* Other clocks */
+#define WPCM450_CLK_USBPHY        32
+
+#define WPCM450_NUM_CLKS          33
+
+/* Resets based on IPSRST bits */
+#define WPCM450_RESET_FIU          0
+#define WPCM450_RESET_EMC0         6
+#define WPCM450_RESET_EMC1         7
+#define WPCM450_RESET_USB0         8
+#define WPCM450_RESET_USB1         9
+#define WPCM450_RESET_AES_PECI    10
+#define WPCM450_RESET_UART        11
+#define WPCM450_RESET_MC          12
+#define WPCM450_RESET_SMB2        13
+#define WPCM450_RESET_SMB3        14
+#define WPCM450_RESET_SMB4        15
+#define WPCM450_RESET_SMB5        16
+#define WPCM450_RESET_PWM         18
+#define WPCM450_RESET_TIMER       19
+#define WPCM450_RESET_ADC         27
+#define WPCM450_RESET_SDIO        28
+#define WPCM450_RESET_SSPI        29
+#define WPCM450_RESET_SMB0        30
+#define WPCM450_RESET_SMB1        31
+
+#define WPCM450_NUM_RESETS        32
+
+#endif /* _DT_BINDINGS_CLOCK_NUVOTON_WPCM450_CLK_H */
=2D-
2.39.2

