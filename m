Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B2637F83
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 20:16:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJ75h2nf4z3cjY
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 06:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XKdzizcM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XKdzizcM;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJ73068X7z3cNY
	for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2022 06:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1669317247; bh=A7+kRg9M9OJjUrVN+1XPzm8xYzLJxjTtaBFDySHGKIg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XKdzizcMj/O2kXKtKqgBCj872UihpKCmQ4RLJEuNI2lgqxHqzLUWfqVWBm6rbQ1kE
	 TTe/ZMfYpvtUFrM0Etw8YEILZVRwAoDZxUd5yYABEqBvuby/pGqMNfLVPOGxyRTH4g
	 paqtOdVX4x8fGwqoPcK+Qey9jZ7jZw7JqlzT46MFfh+X2ZW9sjAx/hIlT0oE689zsT
	 uF7skhibkQL+LwLd0jFSbMhd0KZ1LY7MNODrI85uDlXLuK1zfea8cy436idIc3FGRH
	 shLIMnMzpySWta4QPZzK8NEg8P+PAhIvMGzD9fxUuB/PZZiJNuertwJA9/yRzJ1sD6
	 QZk4tfrPYhl7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQeU-1ons4H1EKU-00AS86; Thu, 24
 Nov 2022 20:14:07 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash Interface Unit (FIU)
Date: Thu, 24 Nov 2022 20:13:58 +0100
Message-Id: <20221124191400.287918-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221124191400.287918-1-j.neuschaefer@gmx.net>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ckIn9pSJN3WyPdbYcKFI7A6cVRRUearrUf0sPopHpbcINteKWjG
 omFY4zDNUITjwoTj7QLzl95Muz3yWfdgiVwPaxBQLPrcwNTMB/EDv2FriLlhZ6sSucYsWg0
 xLL+lzvpBuyjmZf4rwvRdU0MZZ7R2lHheIAz+rpcu6h5PuVUTkLeFt1BHwvyNJ/cF2zgImy
 +d5VlAe5ykNxCzM03aR6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AU9B7Gf2Lr8=;Smh9J9Ev/mBdm6dZKHdLh0SLauO
 MBeaG822gFbmtFbpq6XAL2QpnAflSWXTeuWeNAGPF+Zo5LEEFye2aJDKYKIyuIQg/Ajw9Uqao
 vvDt3tSQ53JFWtjZcjeIDZj3gkG+d2bSa2JC5bmATR5PuhGgYHM1nye+TMrpctSwtitI0o1tA
 maUAJbSxPjTdzo/yXFYKufnWt89tqrMyc9vOMrvEv8QmfP1eBfg886p1MA0JMP5m0vHrf3On/
 +glG/HCUZljG9qq4Sn0YbZ97K7UMuUdLdFC1F7uKVXuzVElZ5WVCJEKJ5/jX05b9tB1zLJNKC
 EFFaZes8pXFPgqy70Dm7W16QkGiqibXcib+R00DtRFPZeUJ3h6/hgdqeWBQFS6Tr/EYUIksJn
 BZ6hVBuu13MevbylCSYt9mWpNLAwzTb5mZEhn67kG3vFaLspWuTR0dTLf0hj+YH0b8ssFdWzA
 uz+riMudVfR9s565eLtdJoaCqGGR/K0Km2rr4Z2ceUFrG0Mrhj902Rlltym2fJwbixA3WNu3J
 mlrjzeEu6ph4QmBS66wZip7hwUVjgmWAasps6Anfx9blyPD6GjzNWAbytoSknIqsDXqkMiDht
 xVmGXHqJoTCjBTyZ7I16EorO3LeeBBcQhPPOyJPGs8HWejhEiTSB9QgtWcQ+0KblrcmXF60T6
 XUi58vHff/aYKY350zt69PwYtXqS/E/b5p5lxu1bejsDFgZDddX9P4esmRnqPhs6GXkoA32V1
 2eosHzxl4BjSlb9GCpJjhLoCZai+95z+TxqnBkoQAO94nFpUnk7dEyOWNwnNkbOnN+ecAZMQb
 watOz/2FiMeWDkTNniSzPYKXCwynN+NjoFyUDOnNQAKFw+FhX6zhTQblHR416Q969XYPHPLX5
 teWgLpfSNNUHK3nT/Oeq3DI9fyR7+NYjzTLBgCofl9qg7kiBA60nyVaygVwAtumCI3s+95zZH
 uzn2Urqd25ag1E//yVZB0oJs38E=
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Flash Interface Unit (FIU) is the SPI flash controller in the
Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
(memory-mapped) access to 16 MiB per chip. Larger flash chips can be
accessed by software-defined SPI transfers.

The FIU in newer NPCM7xx SoCs is not compatible with the WPCM450 FIU.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- A few cleanups suggested by Krzysztof Kozlowski
- Simplify binding by making second reg item mandatory

v1:
- https://lore.kernel.org/lkml/20221105185911.1547847-4-j.neuschaefer@gmx.=
net/
=2D--
 .../bindings/spi/nuvoton,wpcm450-fiu.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,wpcm450-=
fiu.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yam=
l b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
new file mode 100644
index 0000000000000..ef94803e75d90
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -0,0 +1,66 @@
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
+  - $ref: /schemas/spi/spi-controller.yaml#
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
+      reg =3D <0xc8000000 0x1000>, <0xc0000000 0x4000000>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
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
=2D-
2.35.1

