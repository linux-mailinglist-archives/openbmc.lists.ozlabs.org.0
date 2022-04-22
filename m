Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B750BFD7
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNRm2DC9z3bbs
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=cPN+9d+K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=cPN+9d+K; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLZ4l1yz3bZP
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652314;
 bh=Cymelfm0dfRc/xEvMKwoybWU1kDdiYfz3b2fHT5KUdI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cPN+9d+KbcFfP/Rabi8abyM/lXhmut/YEfqQF/KKYe2vO9BaszkCjkmVRutdyGQ7Z
 tKFdYd9s7CKqIZ9bjA5VZvWMt/wULcqeL4QYd+usExVGqBP9UsYKnWQAglXfZNPMdR
 ZMm9jBtQuqFZwAlSn+yltkhrv6gXwPsuLW7r7YlE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1nNDlX1HTp-00WIyP; Fri, 22
 Apr 2022 20:31:54 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 4/7] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset
 controller
Date: Fri, 22 Apr 2022 20:30:09 +0200
Message-Id: <20220422183012.444674-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vVjrm1cK8AXlnpuGK08RSnmA6OQJ45C2q8UnLt+ebe9CliGV0GN
 Ti2LnJqA3CI0GUJriFLVzIgrC/GGhXhNMKKv5axP3W5W5BC44FV5INXkhXh9NVzreAFDXxf
 hYXaumjri/r402YVm6eqffixmakJCzbvAgc+taVHDAyxrjDdf0CQZBv5XXpMOXqvZrkmJI7
 35zbHFwBeKYBTxHW9dkrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tmZlAaWyGqM=:tw+2mnx7bshlkK7ct+VSf1
 JvEH74Z+si9qk/83YOPxFfZijnszwjKiBP8GsoEO25kCZLpJS3Qa6+xUsvJuCRhBJtyFdSeFJ
 bYmYkWwXQjAy7GY1ZaUorzwzIjwS672Y3GtrzGEcxTN2y4YBhK0bHEn7obU1bcHu6/iMgKuqo
 Nl3hut7pxJ0XJM4DzBTQgGYi3d+NMS+YaZ9yp5iMlDxPolb1RESlEACZlxEmGJ0O7CRcNc0Uj
 2nMJ7/U5ZtiiZy/I76qc9RWNo17wecpGpeIfFlFE2rro0bkNV0932htBmY9lut170+xVGq0LN
 5cA/PiSOhn6OI+yIDVDaRPnaixe4w6GjZOpF7SfTTDqjQEMBf8tF28/N7dvMR5y4/tfp8KdSk
 1KVfG3Ffg+ZnvBzYfpcw6Ik0IEQgUb71H68tJkGhpHV1gH+WC+6Rn5wkUE8kVh8gz+SQs7v9Z
 GuR1MCAaBd90q0l5lhoj49tP7sTOExHzYQCAUD7bfsg0I59pnS444+2nRikNR9Tea1CO4/1xb
 KxAzQxPkpf9QtRl8aObOdBDYD+tWrhIbMG0PWgouzSGV7K9vLnIpn0ckNlvoRDPCqfj95Okqc
 RWPA4odSF8/R+jm9ZN0OifrnDR/hZ5CBwappKUKKIhgp9kXIzoKYntRVVS1Vsjh19Yd7AbLZ4
 ReQj+aIm+OlLTUnkISApdZpvGHRbsULY28lRtJD+LvzhjHT+E9EYvD7NLItHgcXaNV0/N5gT2
 qzWi6312mFz9z2wAm8Azc9M5limwNIVUCWvjMyxodX4RfAjD1TnkUoL8hRH5JInQulC521EDA
 xcKOKr5Xsx+ezybIMEn/YsQPEf8NhLx6jI3TPMTU8uyx3FhQGCsRRIn/j7Vk3NL7aIKg9VWz9
 VBWHvXPi4glo+99R4aTZeb3mYZv/TjCcxVhLdSBvLMiyUW8NSFbCAGeqvDemVv6i3whCmF2wp
 gsqRiE0bPs6Q0IRiyk/8IP4Dzd6cwbWjqB2cz1BsxgwvzXste4l6Kl2GgcAJp+hdA2b17GJ4j
 MYamUFzjKRvJobgiOzdh9cN0Ep+9xgdWMirxaBl826IOscvBFmOd3bcvDC2USxEoxOwhCkKut
 87llxlHnOJRtNA=
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

The Nuvoton WPCM450 SoC has a combined clock and reset controller.
Add a devicetree binding for it, as well as definitions for the bit
numbers used by it.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../bindings/clock/nuvoton,wpcm450-clk.yaml   | 74 +++++++++++++++++++
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   | 67 +++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.y=
aml b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
new file mode 100644
index 0000000000000..0fffa8a68dee4
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,wpcm450-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton WPCM450 clock controller binding
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+description:
+  This binding describes the clock controller of the Nuvoton WPCM450 SoC,=
 which
+  supplies clocks and resets to the rest of the chip.
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
+      - const: refclk
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
+      clock-output-names =3D "refclk";
+      clock-frequency =3D <48000000>;
+      #clock-cells =3D <0>;
+    };
+
+    clk: clock-controller@b0000200 {
+      reg =3D <0xb0000200 0x100>;
+      compatible =3D "nuvoton,wpcm450-clk";
+      clocks =3D <&refclk>;
+      clock-names =3D "refclk";
+      #clock-cells =3D <1>;
+      #reset-cells =3D <1>;
+    };
+
+    serial@b8000000 {
+      compatible =3D "nuvoton,wpcm450-uart";
+      reg =3D <0xb8000000 0x20>;
+      reg-shift =3D <2>;
+      interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
+      clocks =3D <&clk WPCM450_CLK_UART0>;
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
2.35.1

