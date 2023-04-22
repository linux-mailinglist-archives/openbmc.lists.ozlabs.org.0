Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F426EBBF6
	for <lists+openbmc@lfdr.de>; Sun, 23 Apr 2023 00:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q3lm16xpPz2yJT
	for <lists+openbmc@lfdr.de>; Sun, 23 Apr 2023 08:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gDoJTKn6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gDoJTKn6;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q3llR0kqzz303h
	for <openbmc@lists.ozlabs.org>; Sun, 23 Apr 2023 08:03:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1682200971; i=j.neuschaefer@gmx.net;
	bh=F1Grkj953zwVKs4nIxZ4Yp9h3/qApBD4MDny8Zz+RTo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gDoJTKn6QFZO90j/ALq8+QRTQQEMqpfo+1dOU6XRCPuWzllwKOR3llkrTbqVf3LFO
	 NXhq2WakSv3+uHMSUfmI1PalAcD58rznc5LmlIUUiaBKxLN5orVuNE2+Em160FDyXq
	 8iWRxG0hLFvhqvOf4ybLmDlNXVL0PIGpyrfRo/F2JN9NsYgaMMysgrVyroZICnDeiR
	 pNalOs06YBWSEMEpgl86rCfM2a5+ZNmjzWl6YYgi1Xd56flSxRmmDRGOXhGZbFih0c
	 0WPWZi+BYqF3U0uAbNTSvFqgCOk1eAimmVNxaNJWSAert4WKVybjFFE000ouXermoi
	 Vyq09LH2MDFBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1qdihs19Ix-00nO4P; Sun, 23
 Apr 2023 00:02:51 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v7 1/2] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
Date: Sun, 23 Apr 2023 00:02:39 +0200
Message-Id: <20230422220240.322572-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422220240.322572-1-j.neuschaefer@gmx.net>
References: <20230422220240.322572-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OWdR7VJh/vvHcNCmD6tkDp+Xp8F53Yg45BxhzOQS5QprEZ5hQ9J
 YxmPCuY6uHSzjXLXY5Gr4lCJLnnvhHbXPBavk58U8GljhfArPkTZFF8JjkcREdwmmRjPxOc
 DeED1/vfaRVssSDoWmE/d8Kjeft6mMHpoaz4C5kbPgwA6JDkXvj/V4I12tF1WSDUoKndArw
 yVvpKyZaOS3fg0RDNn+Rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z7HnnnMQbW0=;8AVzbt2BnHLpi+0qyT2mOR4iRm4
 NU6qaZOPI636NHcxxZ6DPIu5YP+dW3Mc6PurhZsxrO0NtSXIv4VHDMZdOJBHg4ZQ1rRc/L1P8
 7xG8DA++bSuCPs1U0wpdgz7//uVthn6E3Hi6bDpUw0VRYDUO2f8+alw4D1K/Y4wEFVGuB7EkI
 5yTc7phD9uZLkwStR+j9g88racV24r7e+czkGK7XimvgcTiR4SBEtG5aim51oBKql8SsCqiTL
 FXZIo5Fufu1byy88449RgYxlalAIzxQbfg9ffmv/cKgguk7+uwxzxLRfB5ZVtJsJT+44FjmNw
 gESz8yXoPSNLUQag570ZYcjpZ2/dmKQB57QeTODDOu1Djyk9t6v6XcFPslfJJVgxT2wdk722P
 Zuv8bi/Qpm6D7sWZqk0721dRdeKlX46OEDZhwmeEGj0OXDzBAxgh8vgZs1PZkOJ44aSxWuC64
 dWwKqAG5y5vnbZJFRJlmsUmYIvsaXTi6ORqJoO5oedHjQtlH41UndlKGvX+djIotGgyi5d68q
 VDhT5nruagDA9WYuFbr5AnYvgGWXBjEm9q0SRzfI/255Evsxh4JrcSHwrxTXvAjqrwOh8ZjIO
 +5auGGooUKJEnwnhLgGOeSLHGdu4VShqN+2BsTzM0hy8vwgS6UNdKGKq820JLShKymn56WRed
 +UlreX85zUWjpoJaycpM0WVxLzBxqjp4SJdc9dX/tA/u7UzmGZH15H2rgvFB5RMOEBy3Ap44s
 mwgxSfhDfbtRDl1WxXkWE9KxAzrYhC3u+BG4X6sq4iquektV79KC8I4DUiPmYbAbv9a3pHkyC
 Ii91Jq7Hsk8tivI6LivfUkFYy5e36L79xAoyAywP9/+vPcwt5tM5W1b/BoUQRoZbeVL3/D78B
 pMVdGGZkr8SUubua5uATrElAyBNcIB3NTszDmjXiR9I4lx/MdjETvi9WOSracaNGf3A9IjVVd
 UcP7TDB0hCZftWmWqQfiPiXghXA=
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
v5-v7:
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

