Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26247F105
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 21:13:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLJCW66tTz304n
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 07:13:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=eW8U6CGS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=eW8U6CGS; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLJ835tPGz3000
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 07:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640376594;
 bh=xgXOvOiI5djkt9bgMVQwlcwa+uldX2qpAJfM9bdL9Dk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eW8U6CGS/A39+2N3r17jp1rd8k/Soa3C42l4bgi8ddg/dSIwUGK2sXBhNW0/I+iox
 K34UB8lhSiq3hjiBoWRx9a4l2CouE8TzH4xY3hhn6SI8WDzQU/flKSLs4Tw+zyAKbS
 baPu33Km2YzR0g/b+vi12LjSKvlsxUBpwbCtZMUI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1n4ilU1PZy-0053e0; Fri, 24
 Dec 2021 21:09:54 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/9] dt-bindings: pinctrl: Add Nuvoton WPCM450
Date: Fri, 24 Dec 2021 21:09:30 +0100
Message-Id: <20211224200935.93817-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224200935.93817-1-j.neuschaefer@gmx.net>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jNQWeymtJVy6MUZXGKffNUHgUkUWkDV45wh7rG8QpjZRI7gRyz5
 +QM4XZwnMPW9VKkAwgnOZKQsc7tFCvlJ+GBiY9bCEx/3bJd3lyXe4+RvNNaBWSn3c3qc3uj
 YOinzF0LXh4EiTo52UiW+mFbexNxUUeQDSrdL1yw6Vij+oRYFugZoxMOSchn+vnQOj80W8N
 lp0a0hYpetET5r9EvGpnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WVy6bPb/yBA=:hUikcXEA4vZWNW/yTiufbz
 MhpQYNJSpPoujuc9taQMDvjOzscgrPptHHUHppr+1jXV5ZPSuTra2e23TjDaRT9h20dV6geba
 54lkitkGfxJswUN1lwUKWXhnFgn8yUzVe8Nsg6LIweqGpkO7Uv+CwWVHToHUqK5oLjaTYPuZ4
 AmaWHxyZkl0v1KMyxHHcunj65GoH1Ut/4dHywyOTQ872s6AQRRudoK+aeSx0Mj+nnNr5ylNRt
 T6TPUpSVkZLqKePQEFjU9uFbQeTcpogSro+DiTQ1dUE+2p+p6XUVzz6wI6CF5D7nu4sL8pVw8
 UWwSAKAmtfGKREmG5i1JAdpcxpcsvxaNdnOGhFAiPhVfYFMOw3KbUShIID0d2mjBdV4u9qWDM
 H7zIKrt78jak8BaeDF3c02aglABn86TWHpblDla86C3/2uCeXmM1TrAvws61hH1Sg/Q0SWfrg
 hDoCUZ3eHoNCzE2+9Pm2LbvpyV9So4kPXM+TNNhJWoQ2GyHxo81m9DErCTCH1858iiQjEj5ow
 Nkcz75UcniscotpGXbaa1nuBXtnOF0xpQWTqd6xufM2zxkbz5m+uqhoNSfyQ4fuwDuUpAOcJ4
 ZbWXdphB7VuZ41UXxNa8Cr1+GMDlWJkkqhWka8p+xDi4/3oybYZVPOeyBR9D6lJxCkQK9XcdH
 z0v+ajbEJ+z+avVd55ErGa23r+KEQM3QWDTsiy0EBFFYKcyh66ysP0MYnkaoFWIuBcl9c3p10
 vFyZVcdpMH4m3wZd0aAJuby1Erb0vC9tjd8QDbj2AG9B9kZESsuTCQV9okcFIfl/PiN3Qaslq
 FANvad285E3mFsPyy1BCltb+jlJYhLUN9hoozcklRHNmlts4K99OLAnH8oLzzL9fpkpigtYUq
 xpN5Dqe2nptf4PLNOdvm5816nUIBVU/vPQjHLKVCBYRE6S2xvx79XMcyUTKdo7Y4ULazCcEGl
 g3yUJE9x7GkW9yYNnr/EkK54rVSMHP5qbkTAuKTF7N5WvZCGhg/e5VegGc1LnRBZZFN7SzIMe
 mJ5FdRkcR0tu9EYmz5U0V/x/qTOZp2YtoUQ8p1M+TYOBKfvPn2kMQaKlhtFIfz9zW7XNzzBWP
 BIgTHpPcOyg41s=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
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
v3:
- Make changes suggested by Rob Herring
- Fix lint errors
- Simplify child node patterns
- Remove if/type=3Dobject/then trick
- Reduce interrupts.maxItems to 3: 4 aren't necessary
- Replace list of gpio0/1/2/etc. with pattern
- Remove nuvoton,interrupt-map again, to simplify the binding
- Make tuples clearer

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-5-j.neuschaefer@gmx.=
net/
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
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinc=
trl.yaml
new file mode 100644
index 0000000000000..2d15737b5815e
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.ya=
ml
@@ -0,0 +1,159 @@
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  # There are three kinds of subnodes:
+  # 1. a GPIO controller node for each GPIO bank
+  # 2. a pinmux node configures pin muxing for a group of pins (e.g. rmii=
2)
+  # 3. a pinconf node configures properties of a single pin
+
+  "^gpio":
+    type: object
+
+    description:
+      Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 a=
nd 18
+      GPIOs. Some GPIOs support interrupts.
+
+    properties:
+      reg:
+        description: GPIO bank number (0-7)
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+
+      interrupts:
+        maxItems: 3
+        description:
+          The interrupts associated with this GPIO bank
+
+    required:
+      - reg
+      - gpio-controller
+      - '#gpio-cells'
+
+  "^mux-":
+    $ref: pinmux-node.yaml#
+
+    properties:
+      groups:
+        description:
+          One or more groups of pins to mux to a certain function
+        items:
+          enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, b=
sp,
+                  hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo,
+                  clko, smi, uinc, gspi, mben, xcs2, xcs1, sdio, sspi, fi=
0,
+                  fi1, fi2, fi3, fi4, fi5, fi6, fi7, fi8, fi9, fi10, fi11=
,
+                  fi12, fi13, fi14, fi15, pwm0, pwm1, pwm2, pwm3, pwm4, p=
wm5,
+                  pwm6, pwm7, hg0, hg1, hg2, hg3, hg4, hg5, hg6, hg7 ]
+      function:
+        description:
+          The function that a group of pins is muxed to
+        enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp=
,
+                hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo0,
+                dvo1, dvo2, dvo3, dvo4, dvo5, dvo6, dvo7, clko, smi, uinc=
,
+                gspi, mben, xcs2, xcs1, sdio, sspi, fi0, fi1, fi2, fi3, f=
i4,
+                fi5, fi6, fi7, fi8, fi9, fi10, fi11, fi12, fi13, fi14, fi=
15,
+                pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, hg0, hg1,
+                hg2, hg3, hg4, hg5, hg6, hg7, gpio ]
+
+    dependencies:
+      groups: [ function ]
+      function: [ groups ]
+
+    additionalProperties: false
+
+  "^cfg-":
+    $ref: pincfg-node.yaml#
+
+    properties:
+      pins:
+        description:
+          A list of pins to configure in certain ways, such as enabling
+          debouncing
+        items:
+          pattern: "^gpio1?[0-9]{1,2}$"
+
+      input-debounce: true
+
+    additionalProperties: false
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
+        interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>,
+                     <3 IRQ_TYPE_LEVEL_HIGH>,
+                     <4 IRQ_TYPE_LEVEL_HIGH>;
+      };
+
+      mux-rmii2 {
+        groups =3D "rmii2";
+        function =3D "rmii2";
+      };
+
+      pinmux_uid: mux-uid {
+        groups =3D "gspi", "sspi";
+        function =3D "gpio";
+      };
+
+      pinctrl_uid: cfg-uid {
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

