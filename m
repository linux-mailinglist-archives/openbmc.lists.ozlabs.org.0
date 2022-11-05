Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDE61DD89
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 20:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4RjX23hCz3cMh
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 06:03:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Z9sT2LWs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Z9sT2LWs;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4Rck1j1gz2xfV
	for <openbmc@lists.ozlabs.org>; Sun,  6 Nov 2022 05:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667674763; bh=0zlGVmWFUJWAxvnZusk8TMaPc0CG35sV5kM6R3yKrvQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z9sT2LWsbOVZ0gISJr2OamL1OHDHt0LHMzUhGvXkZ7CIJwhcuCk4Vqx3sNrCvOEIF
	 BjGRMCAY8ekPr4mpqE8oAaiyvMzcjX4Mjcw4IAFOwWOQDgFsC3uNiKVZ+fSzTn2ViP
	 jlxKdbGWYCOXh7js05ZRiCq1FxcpAX+4Vvp6HVCfSzBLezO4oja2kRfRBRF0cixx1j
	 eFVpR9VntQoCRXdEemXJgKUUy+Y9/3SvozOQQNRqRFUuHFNCdiqRM53d1KYQXUBmpC
	 RdJ/Yw9d9+m6Hq70OaCd8Z/ws3mvp0Pl8yeCWW604NHcQJbJ652irDKk7uvL2olSS5
	 xxewg8QnXXotw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1osmUp3DC9-003cZd; Sat, 05
 Nov 2022 19:59:22 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 3/8] dt-bindings: spi: Add Nuvoton WPCM450 Flash Interface Unit (FIU)
Date: Sat,  5 Nov 2022 19:59:06 +0100
Message-Id: <20221105185911.1547847-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4mhJHiA7uzMLYJ28yXXBf74eXRxCJyYO5pHRgHTydKeBdEX8Xng
 jKj6nr7av4t9KvdfbSaYqoC3m8aehbRPG7urF+6tCT5rfmaaWOdhonv92WnicRVsm/GbOLf
 7itL2tJ/L/HFZJjH9ah3OR0WI+V4DNBD/FbE7pEwRgZ4mfbf1X88XnS6xrwVUTnrrbgqtcS
 Qgyh3Tesm9geoyrBpkP9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MmDo+WVVpq4=;yqWimBjtK0/euTlSj8+VYUx4t1y
 AjazQdJ3cov+i4w0b9Gg+zq589JFK2Bj0jg61kS7n4VXyzrvO0Na/Q366ZYVTclXXldEtFfmm
 1YBa3b14OMfyL/GDQfCTZwckWFclfhTqOLXfmjuVhM/+OJanN0JiEQITYiN7XGX1Uwdv0L637
 jAN81dS6UPmo7h6uwZpxsmlpVjbJ9nOVGN1/MpAmDFCn7abEYEcWNRUzEp+bWauk2/P2qWGun
 WGnYAVl6wGLLjT34DfP6eNfvyFIUAZPC+4wL2VHjV8EHg6j2HIgyHIxBbrQrpTmg4jsrbKAzV
 oLjx8lEZ5MBRHyojqoDLF6F7iEOHG2KX75EUBYUm6PVHvvRz0P1oWhPeVaUoH8btnkPLOjEyW
 GHXLIhKqxaghjaFdLkIzQbBQCsA3me8wjFFB36k/YOkQBegkkYxtOGwiyX1P4VTxM25F3XeeZ
 HY65++p2HYQICeB1VlbLSKcDOHad+3CzkzJwuAII8s0VCUvAnD2Nxhm2qaj7V95zJ2S4ixz0E
 HOtQwyOJgCcEOp0IGMcqOMcOi5oODq8tVNWEtN69HQl9Us81kK7F45DKt+EGlgdJU+vf3QJ5B
 nuczmjLXWS8bLne8x2EJMs0ajDMokB/evw5ZiNN0kEs2af5dKokEaLP/GsVgAgHykJQlNXGh1
 03mWs8vUqxGuNQBOK6vn1ubFj+pEtFz9X53Y+1Ik2HmbkJCqxug/qQZwdauzlq2nIartKE5v0
 mJgg9DUODgbAdJ6jQVPk2XQ2ktpEWZ3o8yzb3PExP3JCdNyl1stsNVDDu79rUYMgGvaTzM5TA
 t12QYCheXgpRmi61yk6g+MovRsxKQHVrII+56O7u7WFLFvELClRmfsFiKYpXkOaGKJpaE80tq
 s0b1hk1ZQmGMRBoT9XV2ouCbZBjZtNu+M5VK8wExT0P9td+glPjyV+zaKWug9AL6Cgh3A7ENz
 +WdSZg==
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Flash Interface Unit (FIU) is the SPI flash controller in the
Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
(memory-mapped) access to 16 MiB per chip. Larger flash chips can be
accessed by software-defined SPI transfers.

The FIU in newer NPCM7xx SoCs is not compatible with the WPCM450 FIU.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../bindings/spi/nuvoton,wpcm450-fiu.yaml     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,wpcm450-=
fiu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yam=
l b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
new file mode 100644
index 0000000000000..dc0ea2184f8d0
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,wpcm450-fiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton WPCM450 Flash Interface Unit (FIU)
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+allOf:
+  - $ref: "/schemas/spi/spi-controller.yaml#"
+
+properties:
+  compatible:
+    const: nuvoton,wpcm450-fiu
+
+  reg:
+    items:
+      - description: FIU registers
+      - description: Memory-mapped flash contents
+
+  reg-names:
+    items:
+      - const: control
+      - const: memory
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nuvoton,shm:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the SHM block (see ../arm/nuvoton,shm.yaml)
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
+    spi@c8000000 {
+      compatible =3D "nuvoton,wpcm450-fiu";
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+      reg =3D <0xc8000000 0x1000>, <0xc0000000 0x4000000>;
+      reg-names =3D "control", "memory";
+      clocks =3D <&clk WPCM450_CLK_FIU>;
+      nuvoton,shm =3D <&shm>;
+
+      flash@0 {
+        compatible =3D "jedec,spi-nor";
+      };
+    };
+
+    shm: syscon@c8001000 {
+      compatible =3D "nuvoton,wpcm450-shm", "syscon";
+      reg =3D <0xc8001000 0x1000>;
+    };
+
+  - |
+    #include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
+    spi@c8000000 {
+      compatible =3D "nuvoton,wpcm450-fiu";
+      // the "memory" resource may be omitted
+      reg =3D <0xc8000000 0x1000>;
+      reg-names =3D "control";
+    };
=2D-
2.35.1

