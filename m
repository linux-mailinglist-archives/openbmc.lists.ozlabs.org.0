Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3746C66B
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tKD4kWlz3dc4
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=bL+cKa60;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=bL+cKa60; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tG25jLgz3blF
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:09:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911332;
 bh=XAzA8gvNpKYxrPkC0Q1zECWGCmnDKj0uKiKMhz6ztHY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bL+cKa60ZM5sm30/i/0jdhGvCYLujzDXWTFZSeEdlAYpjSHcnvHcQOKXJP/z4o+eP
 03WE9F6bZJR4wgByFjH+j77YI2Cmz6KrwaUUIhfggGoc3YrF64wA5MWC0LLeqyJ6em
 W0GOi+75eSYOZU10RM1apgxukgR4DP6ArUxS4fDg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1mTaOk0OlW-010J7u; Tue, 07
 Dec 2021 22:08:52 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Date: Tue,  7 Dec 2021 22:08:19 +0100
Message-Id: <20211207210823.1975632-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1MLPD4Rdetv/nS3WvDAQiqkzqdHcUec68aeb50CZV3RSLW7tw0
 UQbvBLDrf9O8Eo0oyQV68Roguo4L5B6kl2D3B3lmkmGEFTQ/txhnsguPrBmdP8dGfryZFBz
 O8XyZVgBbGGGqth1qDH2psdTIaK3RIUDscTXk414qvaduqpjIcqmaOf2oSjUiy4pMQ39svw
 LDF+caezVgq7nWShRawwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2syvsrT2Qy0=:Ltlj6+/0LlH3WvLBRPEca4
 3Gdn9wu0nn3hceYE3KpZrbJDzNaSjeH/lh0jamDw8/0u1XL+vInB98uZY4XhfnrdRja7Ywdj7
 NCbUKTjUktboDLq55SMIaG4eAfNVMvJO5Ga7g07sjHlqyDdWQYYOPQ261Q/zoFgNYOszSY3y6
 4TBgobR4v4sYk5QyZlW8D4R9c+Bqm/D5Tq6cF3EZ13yoSkZvsAfcvTmf9hc+8GTITzho58QH8
 1330Axs868e0FJysfks/2kcXKRBQLCsXqCY8fCvcgEKnyUFM6eaLIC3U+wN47RZjU32WjQbeO
 0V9aYPJ4eyiOGJF2YEg0bybbEZrsmIkqPDXXRVYA2+CYEV3iEaxBqKMF/iXHUDZsfLeDMiqpI
 qD4CMfoww5+ZwNJ5SIwckUiYSvjErK30IwcIQftT5fL61g1/LREMrrejokC0l8Hk9H13+ciUk
 ajkYwnGjOOzvHKG2Xe0uDw0xffpyPBEnYMNoYl2kj5+PTaNPRaqCICMRngWexMXnDEldODJ87
 y1SZtCXpnFIietHmaCf44RJ4zr+FsvjCLfMngSFrE51ps8mJCeIIZ4wJTPyQnMi77Vtk2kBVS
 vopc2clT9m1uoCBsftUuaALw8xJFCZ+DPSScKSRaz/yMJU09k7pNQ5yPr/TX4ViKTdLQll7P3
 3yP3T0y+1fNTsJie3QrmFZtCi99Aw4FEv5c04auiSvdYupfyBy9IFXGkXA/2i8n3RtV3L0T7P
 HOiour2LrYgbXKbQFxoGJnMckEHz+3mzevdd4h0gnRNNt3EEvivb9YQjkGXJbIlj89CjmtXbG
 IpXvGGxeZtoNPvgCamXu6vBDc8dzrPhZfDoACDztNv7Mezaxx6ZV5cgygYKdx4xq69K9AD8Jm
 EGGKFB657+UxUbYy5dIVSI8JfZsSR/1mzbNWlYr9gBS83pA8hqNnY3vo4qpYQFpMW/QFGA3jf
 wXQq8kw6wOCiga5nBthLQgYSsI7mlSNgy48tb5gowU4QD3Bmq70jrB92u/cy6exTCIRh0oDVR
 1tQxqNwPwN18asc8TFD2foC2I+7YPodJCHLCNd0Cox9iyT3oZIYOo++DtRvP8SpqaxQhQz2Y2
 NRs6LQsftKgtTk=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This binding is heavily based on the one for NPCM7xx, because the
hardware is similar. There are some notable differences, however:

- The addresses of GPIO banks are not physical addresses but simple
  indices (0 to 7), because the GPIO registers are not laid out in
  convenient blocks.
- Pinmux settings can explicitly specify that the GPIO mode is used.

Certain pins support blink patterns in hardware. This is currently not
modelled in the DT binding.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v2:
- Move GPIO into subnodes
- Improve use of quotes
- Remove unnecessary minItems/maxItems lines
- Remove "phandle: true"
- Use separate prefixes for pinmux and pincfg nodes
- Add nuvoton,interrupt-map property
- Make it possible to set pinmux to GPIO explicitly

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-5-j.neuschaefer@gmx.=
net/
=2D--
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinc=
trl.yaml
new file mode 100644
index 0000000000000..2b783597794d7
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.ya=
ml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nuvoton,wpcm450-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton WPCM450 pin control and GPIO
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+properties:
+  compatible:
+    const: nuvoton,wpcm450-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  # There are three kinds of subnodes:
+  # 1. a GPIO controller node for each GPIO bank
+  # 2. a pinmux node configures pin muxing for a group of pins (e.g. rmii=
2)
+  # 3. a pinconf node configures properties of a single pin
+
+  "^gpio@.*$":
+    if:
+      type: object
+    then:
+      description:
+        Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14=
 and 18
+        GPIOs. Some GPIOs support interrupts.
+
+      allOf:
+        - $ref: pinmux-node.yaml#
+
+      properties:
+        reg:
+          description: GPIO bank number (0-7)
+
+        gpio-controller: true
+
+        "#gpio-cells":
+          const: 2
+
+        interrupt-controller: true
+
+        "#interrupt-cells":
+          const: 2
+
+        interrupts:
+          maxItems: 4
+
+        nuvoton,interrupt-map:
+          description:
+            This property defines which bits in the interrupt registers
+            correspond to which GPIOs.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          items:
+            - description: First interrupt bit
+            - description: Number of interrupt bits
+            - description: First GPIO associated with an interrupt
+
+      required:
+        - reg
+        - gpio-controller
+        - '#gpio-cells'
+
+  "^mux_.*$":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pinmux-node.yaml#
+      properties:
+        groups:
+          description:
+            One or more groups of pins to mux to a certain function
+          items:
+            enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2,=
 bsp,
+                    hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dv=
o,
+                    clko, smi, uinc, gspi, mben, xcs2, xcs1, sdio, sspi, =
fi0,
+                    fi1, fi2, fi3, fi4, fi5, fi6, fi7, fi8, fi9, fi10, fi=
11,
+                    fi12, fi13, fi14, fi15, pwm0, pwm1, pwm2, pwm3, pwm4,=
 pwm5,
+                    pwm6, pwm7, hg0, hg1, hg2, hg3, hg4, hg5, hg6, hg7 ]
+        function:
+          description:
+            The function that a group of pins is muxed to
+          enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, b=
sp,
+                  hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo0=
,
+                  dvo1, dvo2, dvo3, dvo4, dvo5, dvo6, dvo7, clko, smi, ui=
nc,
+                  gspi, mben, xcs2, xcs1, sdio, sspi, fi0, fi1, fi2, fi3,=
 fi4,
+                  fi5, fi6, fi7, fi8, fi9, fi10, fi11, fi12, fi13, fi14, =
fi15,
+                  pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, hg0, hg=
1,
+                  hg2, hg3, hg4, hg5, hg6, hg7, gpio ]
+
+      dependencies:
+        groups: [ function ]
+        function: [ groups ]
+
+      additionalProperties: false
+
+  "^cfg_.*$":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pincfg-node.yaml#
+      properties:
+        pins:
+          description:
+            A list of pins to configure in certain ways, such as enabling
+            debouncing
+          items:
+            enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio=
7,
+                    gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                    gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio2=
1,
+                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio2=
8,
+                    gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio3=
5,
+                    gpio36, gpio37, gpio38, gpio39, gpio40, gpio41, gpio4=
2,
+                    gpio43, gpio44, gpio45, gpio46, gpio47, gpio48, gpio4=
9,
+                    gpio50, gpio51, gpio52, gpio53, gpio54, gpio55, gpio5=
6,
+                    gpio57, gpio58, gpio59, gpio60, gpio61, gpio62, gpio6=
3,
+                    gpio64, gpio65, gpio66, gpio67, gpio68, gpio69, gpio7=
0,
+                    gpio71, gpio72, gpio73, gpio74, gpio75, gpio76, gpio7=
7,
+                    gpio78, gpio79, gpio80, gpio81, gpio82, gpio83, gpio8=
4,
+                    gpio85, gpio86, gpio87, gpio88, gpio89, gpio90, gpio9=
1,
+                    gpio92, gpio93, gpio94, gpio95, gpio96, gpio97, gpio9=
8,
+                    gpio99, gpio100, gpio101, gpio102, gpio103, gpio104,
+                    gpio105, gpio106, gpio107, gpio108, gpio109, gpio110,
+                    gpio111, gpio112, gpio113, gpio114, gpio115, gpio116,
+                    gpio117, gpio118, gpio119, gpio120, gpio121, gpio122,
+                    gpio123, gpio124, gpio125, gpio126, gpio127 ]
+
+        input-debounce: true
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    pinctrl: pinctrl@b8003000 {
+      compatible =3D "nuvoton,wpcm450-pinctrl";
+      reg =3D <0xb8003000 0x1000>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      gpio0: gpio@0 {
+        reg =3D <0>;
+        gpio-controller;
+        #gpio-cells =3D <2>;
+        interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
+                      3 IRQ_TYPE_LEVEL_HIGH
+                      4 IRQ_TYPE_LEVEL_HIGH>;
+        nuvoton,interrupt-map =3D <0 16 0>;
+      };
+
+      mux_rmii2 {
+        groups =3D "rmii2";
+        function =3D "rmii2";
+      };
+
+      pinmux_uid: mux_uid {
+        groups =3D "gspi", "sspi";
+        function =3D "gpio";
+      };
+
+      pinctrl_uid: cfg_uid {
+        pins =3D "gpio14";
+        input-debounce =3D <1>;
+      };
+    };
+
+    gpio-keys {
+      compatible =3D "gpio-keys";
+      pinctrl-names =3D "default";
+      pinctrl-0 =3D <&pinctrl_uid>, <&pinmux_uid>;
+
+      uid {
+        label =3D "UID";
+        linux,code =3D <102>;
+        gpios =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
+      };
+    };
=2D-
2.30.2

