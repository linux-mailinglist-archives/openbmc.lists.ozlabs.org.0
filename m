Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AB3988F1
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw76K3Hz6z3by7
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:06:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=XEpTcTJK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XEpTcTJK; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw7403kWWz306j
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622635447;
 bh=2ut7fjvCRXp1vUUCh5jcJNV1bWQfWdPByri+EnaApG4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XEpTcTJKIpUmN+jRuMfsthO1SugHY9sL+kIJZWtp+JUGmd5BVuB9nqyW9WzrGlKzB
 jiruRmE73d3tzDqcA68xNJ6S2GSuqrzIFzJcArEYPnKV3/CvbNnChW7guzOSLJlciQ
 pV+nHz+yVNqQqFaEG9QMWLylQNf8BKOfoF0n38ME=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1lleRh0AGI-007Eso; Wed, 02
 Jun 2021 14:04:07 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Date: Wed,  2 Jun 2021 14:03:25 +0200
Message-Id: <20210602120329.2444672-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E6+ZEj70X9yV7fiuKCDzxr1LhJdKjksAzp/xm8VL+BUlNTseNAy
 okeguoiss3CzSzhZbxUI/g8cehAHeD7BYclX1esdvc/7SzljFeMilw82uESa2irNjwShC6Q
 +ga7VcY3dY3MetH3iuAhMK8bWENWkzICY+Gglqp5UWPQ1qs5H/lemP4T9TStx+g0Oqy9QPw
 WhabaSlPxi7wEN+qX+qbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l4v+Hockw6I=:sOCxMcqqcQryI1ft9be5w1
 JYsHx3jlluDR2PiCP7kBlHApH55MTdTHpTgE/+5RrRTb6JVeSL+Jp4pfRzlc7w8IJ1xj1KqGc
 RyKzrHax0LTh5qyf5qaM9fmwbjk0J1oO1ZnoZO8BdULLZYnZUte6RkifQtos1+qThbpzLpn7e
 UIQqUiIFRi+QqRUOeRsNuBqKgmZRtDNleM8P9KriRfsdsOJN+BWA0GFvUjdIASn9EAAWvtmjS
 FauoUBzK1Wh0Y85GC/4uLg7QonpojwChodBI5wW7XzKwMxhj7j5hV3vIoebP8H+S5BL0PzIcP
 4lMJO0Lr+XlUGrAiCkjNl4odHDweti/2B56O9T3WV8klgPuaCfc+Q+HCePVKeIREQy7AA6WyX
 NeA5iTyVYcBcsZ+yRVtd9ZDVIAf5P4MRrxF+dc2bQwRfUNhtef9eDmH44HNid9jNkFE39XWyM
 7aJybtk2rc3y/TceTbOIWUHriypazDKwZKP1zigqsguajAzzTGJyM68luKZ9PNXlXHHzfY2Gl
 sB37k7bMm6RidcaeqyE5IuGvX30ZRs/visWcYp6djR9Ukc5Nltdgn5ToHsihRXZIWZz0PV+zP
 GhBvTxpwIoQlM18YczB5ZUNsnKGYVqH231qfT/hEsvAGfeuZWd+nhK3cvK0QVvu7BQbjwXcSs
 MDfMhPSkDaHUzIip+1q5vk/krtu9j32+0rwjkvrL4IagrzcVf7bBYf396cJxZsi2c26sRdbAK
 Tl6x33itHEJuwNW4iyfwLxrvTaGWUWnzadcwnW7WIsG5IxWqzBn/rLMzrcPM84Xnicb1ZoTJq
 pxZJ9+2N/bNjxCT8qOvJJMgREOFfCHE+3mffre+XfPnc33wA0yphDsu0pMgFOtuDZlRDFHL6l
 B+kTUiwfU2pfIaFRn2CUPx6883svpHQxJKoAXLKC6ggyefvjZKw+2UipuppqASeUW0wtYBMOk
 d5Z8HPxwh0jTQjD6/VHOxEYvHHy4mAkdqKudExmYssz4JjhPIFYtg/k0+trb34FofblfbQWdx
 mE9wNCNMa3h37GjVSTh1lKdxr5/9lkciOMcq7PYBRwa/0DFDc4siZAfPr5WEfwWDq8Oo0Sl3Z
 Yh/OnC9cU5KIiBsTASd8G/0i0cLNXwf0t31bYGp9H1ygXMX+TSaGBFKRw==
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
hardware is similar. One notable difference is that there are no
sub-nodes for GPIO banks, because the GPIO registers are arranged
differently.

Certain pins support blink patterns in hardware. This is currently not
modelled in the DT binding.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinc=
trl.yaml
new file mode 100644
index 0000000000000..0664fe2b90db6
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.ya=
ml
@@ -0,0 +1,142 @@
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
+    const: "nuvoton,wpcm450-pinctrl"
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts: true
+
+patternProperties:
+  # There are two kinds of subnodes:
+  # 1. a pinmux node configures pin muxing for a group of pins (e.g. rmii=
2)
+  # 2. a pinctrl node configures properties of a single pin
+  "^.*$":
+    if:
+      type: object
+    then:
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+      properties:
+        groups:
+          description:
+            One or more groups of pins to mux to a certain function
+          minItems: 1
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
+                  hg2, hg3, hg4, hg5, hg6, hg7 ]
+
+        pins:
+          description:
+            A list of pins to configure in certain ways, such as enabling
+            debouncing
+          minItems: 1
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
+        phandle: true
+
+      dependencies:
+        groups: [ function ]
+        function: [ groups ]
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
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
+      gpio-controller;
+      #gpio-cells =3D <2>;
+      interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
+                    3 IRQ_TYPE_LEVEL_HIGH
+                    4 IRQ_TYPE_LEVEL_HIGH
+                    5 IRQ_TYPE_LEVEL_HIGH>;
+      rmii2 {
+        groups =3D "rmii2";
+        function =3D "rmii2";
+      };
+
+      pinctrl_uid: uid {
+        pins =3D "gpio14";
+        input-debounce =3D <1>;
+      };
+    };
+
+    gpio-keys {
+      compatible =3D "gpio-keys";
+      pinctrl-names =3D "default";
+      pinctrl-0 =3D <&pinctrl_uid>;
+
+      uid {
+        label =3D "UID";
+        linux,code =3D <102>;
+        gpios =3D <&pinctrl 14 GPIO_ACTIVE_HIGH>;
+      };
+    };
=2D-
2.30.2

