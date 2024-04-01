Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DC893BF3
	for <lists+openbmc@lfdr.de>; Mon,  1 Apr 2024 16:11:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Elufcq2i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Xxv313kz3dRm
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 01:11:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Elufcq2i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7XsQ441cz3brC
	for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2024 01:07:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711980451; x=1712585251; i=j.neuschaefer@gmx.net;
	bh=L/WjbQC0Uxb9SVhmo+C44+NRCf/fM7QYCwbjyktZyvc=;
	h=X-UI-Sender-Class:From:Date:Subject:References:In-Reply-To:To:
	 Cc;
	b=Elufcq2iQIdYpEQBHoIfA5libXleYoD9eikYHEEBvSZeXKgoCla/AdgqoW1pl9if
	 8wv1HF2xpDT8bSirRGshS3IVCRoUzp6aKW1MCSra9mqopjJ9LXnwUprMLWsy2Y4nE
	 7wFscSpWh8gD6HGHRnvX6v0y19n4PC+v2v3queSYyn7uY1Qh03wBcvW1xuzB9PuZE
	 /2v+AR73UspAhW726uc3dg+9CTp28kIxRDA8fzG48BkzMiEhnzHPxv0axintJi0Oe
	 R5uEhgXdcWz/2yJ2lGVsjg5gUyPoKlIuYlEYGjoh9L6vrL/qq8aBvf8d26gHLlIIm
	 rMWS0SSvzXOMRjPhSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1saDNW3Uoe-00jGGw; Mon, 01
 Apr 2024 16:07:30 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 01 Apr 2024 16:06:30 +0200
Subject: [PATCH v11 1/4] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240401-wpcm-clk-v11-1-379472961244@gmx.net>
References: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
In-Reply-To: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711980406; l=5540;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=QPzdQUVDkB9QA3Xv6+gOkAHNqMRKKV6HeNLuZ6QtTHg=;
 b=aELc8e1LxZHvhFng8A7HIeehmO0xMUKmyP9dfbaEhVHrinX1fJ0JQnqArOdOYhpwAiX8L3mr9
 XzPlWbluUZwDtAa3iWD9xajGSSLeUoT2yl7LS0KO2pBIYks4fiIba6R
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:S9so0wpYCtcZ/lkABhTBPtdLAFziUGm7uUQVLAJijyzK+yReS7d
 Egnptog85PlgsAqCRH4WPrFSZ+485sp7I7HPOztvcJpvN011+z0akd9YZKPhBEBNfIESnZn
 r9wNvkUzDg1b5pIVilnYT5rLE77/hCKUTp2+W50873H5mKb5eszL3J/ftm0sNabOubg2e1v
 nXOgr+Qg2t1n0mRKXnvQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F41cuxMVn6Q=;O5+yG+BX7rvVudCXMrI26NPViVR
 zu1i/VVWdWb1lHknMR9LtNBrFyFOMLlAfPjX2BVtduYzzZfE305q7f3geixwCEHqCKw0WicA4
 EO0Mq5wLSnma397Mb7aImrL6ebgJlo6bF5AZxRhxku8c60VTHo208rkxyReczMmzL9NKrG45a
 D/0Y+r47SFY65DqjKNYPB0H6wJ0FHqLekOI5B4pDhX54TOctEgfLICWQiSA2EZEdkomRC+X63
 webXhDJRrusSJ9lwR4vuTyjsSxD3wcAihhuIq6AG75/QgXAsGfJj7B3zXuc874GT5sl7Tnzxq
 uu6slKfFmB63UloGE7FL2tyRpn8v51jUP89OGCrMbcoNzU3HQKlaX6ryxnkz5rpUvjGg12cA9
 OtwP1uQLdQ6TEe5PJy6c+L5CsGIfSMQ+OOZRdodUF2THsayyqyC9wqE/pgMyQlgaHDoShPpkH
 n063njOmtokAClIdQCGgHDoqVcNMhIE8IDf9bprE31s8k52Yk3sanuEwFuJebik9Szxh1QWJf
 AdlWWCbJ2akh1b6KSmwIao0EciDcM7dSE71a4Ry/bGNuTf2DwIYsKqWLW+J8oWNPi+tjgpgH7
 LgtIwLCB2Jg+miZJ0cWz2ZtxJeHGTN1JZrgCta+fdroHYyof+lRcnAYhLlD+RNrTmyxfe2WZO
 MXODXPS2EQNWc1JcaJaSM4BKapzlOUkTrmKLoS3dJAzEH5oDtFljF3f+QqInCQmI3XHZmcCG8
 rOk+yYfoi35E+UjhoOXkRG09i7MniG6cdCeDXJRyHhMphWTukXlZ+ygFymr8spQ4FcP11SA1V
 HBNrFwSjgnokqT7R+8OZZiYqWFeOZHiHX3ZRhMUzRXoKL0ZPJ7EPlmURAhrhCVoWd0
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Nuvoton WPCM450 SoC has a combined clock and reset controller.
Add a devicetree binding for it, as well as definitions for the bit
numbers used by it.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
=2D--
v10-v11:
- no changes

v9:
- Remove clock-output-names in example, because it's now unnecessary due
  to driver improvements

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
 .../bindings/clock/nuvoton,wpcm450-clk.yaml        | 65 +++++++++++++++++=
++++
 include/dt-bindings/clock/nuvoton,wpcm450-clk.h    | 67 +++++++++++++++++=
+++++
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.y=
aml b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
new file mode 100644
index 00000000000000..93521cf68a040f
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,wpcm450-clk.yaml
@@ -0,0 +1,65 @@
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
index 00000000000000..86e1c895921b71
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
2.43.0

