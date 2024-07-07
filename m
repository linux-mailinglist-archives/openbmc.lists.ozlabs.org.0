Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D875E929A0E
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 00:39:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VCOfdjfX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHMcb4kpYz3d3Z
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 08:39:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VCOfdjfX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHMb61qpLz30W1
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2024 08:37:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720391850; x=1720996650; i=j.neuschaefer@gmx.net;
	bh=L/WjbQC0Uxb9SVhmo+C44+NRCf/fM7QYCwbjyktZyvc=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VCOfdjfXrXGH7FtPZDHvukuK0439dUvXDsGIXzaavJS7Sk2gSMVpDFICWGf5/DAd
	 r+9F7zVZT8HlRkukWzvcX71OJlfutxpVUpda233gIX5aksIbA4bMv8w6dVcoJLtCW
	 arzp097FdRFGCJNu3eVVxNJ+p6EI1eKnrPEOIHjtvzzBiXZTFS+BRWC4Rfthy5QiT
	 vWtqJAaLaz97TI8OKKAc7UzlIytL4GYRZ+VbHtVVdmv5qaVo0WH7uWLVH572Syn0s
	 DJ/tdjTatQW6oXDA2Nqx1/rejSRHmchn0HhpNmM3yaYUShf3NikT/m2OKxAP2mqBY
	 ElUgQwrYmopJjaHkQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRRZ-1ssRSD0dvH-00HyUx; Mon, 08
 Jul 2024 00:37:30 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 08 Jul 2024 00:37:14 +0200
Subject: [PATCH RESEND v12 1/6] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240708-wpcm-clk-v12-1-1afac539c37d@gmx.net>
References: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
In-Reply-To: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720391846; l=5540;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=QPzdQUVDkB9QA3Xv6+gOkAHNqMRKKV6HeNLuZ6QtTHg=;
 b=h/J92RiiRFFIsVp1MtZDBR0dZiGxW1z7+Cv3z9scXqOenpPVDmTsunXxwCY+mj16nIlmzZbye
 lAk412XwPtgDY3VyalfZxNOxnVUzaCaqoh1NzSWB4501hztB50rShcq
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:Q0HJd+wUc0/gOo83ZttBPpmnQQ8yz+fJlfgR4GXh/Cp2eFQC/rV
 kUzy4Pek9sCEuXwo5Jh9BZJxfjdqhkvf+jWwImFIzlX3LBouHlLYZkkpV20FyVEhMYXG0D0
 FwDIcPtn5a6YjvJITkc0NYU40KKKe9C69/6sFsfTixu+YmE87KRrYKh9PmtMT+G8BRwcspV
 Hz7zvu4tfMIznUyJl//ig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B9ougdFV4w4=;ZYgjYENRwVY4Dum+B6lyN9JrBJd
 2Z2WE0j+/W3mhLJIGcgU8yAgNdJkhWXfMVdvQSqjvMlZW43xqAOEpzULxuGTMIPp4NUgMTYsc
 cTnYsjUmkkPDpoS3n+rx8LqOIxywLmnLaUZ7uE86mTyte+9vuhft5UsyiB6j+oCIjtnDf0mZ+
 8UACCMPL1+Azrx8OTcSvt+s0bn4Dvi3Zh+P5ATp7TtoO8FxuLOXxECn5iSySTQxOZyFEnI0Vz
 Mud/U9h1juBr6c5Qz1sS9J6vhDjt84DltZLeZ2ePaUXJPW02VomXdQNlZ1zkbohebNqxLECp7
 Q3hjuO40HKRopKSkruXmK3svDMEbICctipenk3sx5bfo6e05EN/lH7Cno1eo/ScyoIaxxmbR6
 RD7HDXGdhV9/Yr8sUA6xOVo5lYWnHROMIHZaNApSgbqN0Y9ZN0aoV2PjzqAuVpuPuX90lcBNK
 bE8wB5iE3jjiH9Nd2m5vRDw7BonRZyZirrzxG9Ha5rq1BFZHkqSBGjaTBHSpuIYr2TtK6vZR5
 t6AnQaCufTxpLL2MU9PYCkaRwh1YwDo340tiFzSgWeGDIBHRpTZdfpRUyA2Tw3rTK8nGkDi3U
 dftwgoUaF2i2cjuVOamMn9hBsDqWR3tYXZUhvq51KmRwv4oiQYrOGe7hEy2oZrC5s803Nz+aa
 tWL5afss04wjzmDG5hGl7dN1bmRIz4+eKpO2/O5K3M49iMffYkvvFiE3xDVIXtLheyCNErTMb
 LIDZrgNZ1r/B4ehSNmCAYWI6d0e9cCaB+l9cptt/h0xTRoRhaewJpPUEAEBQqv4Vi0X+FXi2V
 UNWSCHWm2pTRKyQS9oKU2hI9TJ7VNmWR5BxpekMskZ1xw=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
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

