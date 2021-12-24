Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233BA47F103
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 21:12:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLJBN6kFdz2ynK
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 07:12:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jhkv18wc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=jhkv18wc; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLJ7v0kVvz2yfr
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 07:10:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640376589;
 bh=gmLdgXnIZUtcHkOafM+YRv4CZWt2fQluG2qXyM/bdnw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jhkv18wcQ/HnzDG/AWp2IYA5oSoo1dR0fuwZd+bIcHokKoiYj9iMgve/YppIC/Bgy
 usB9NZxnRTNHorSXb4ttFwwVkxTEEytstReDvIWxx4NiKIlOiiA8nD/uljUhWtZ7+0
 FCNh2QeFJ+jx0qiYY8k8UBba6y9GmlR4KAASbDuc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxDp4-1mGs2X0nKy-00xf9c; Fri, 24
 Dec 2021 21:09:49 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: arm/npcm: Add binding for global control
 registers (GCR)
Date: Fri, 24 Dec 2021 21:09:27 +0100
Message-Id: <20211224200935.93817-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224200935.93817-1-j.neuschaefer@gmx.net>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EaMYBks5YHh4cjN5iJWNk/uYmtpfs8oEHCJ8qwJVAfSBQ2T9YW2
 4jNb0C1n8No85Xln8MpzhQVobT/KTN0sNq5vqafeWaPr8zozGmUnCOJTbNYVN+242LxgjKO
 5yFdg5sNs1H5uX6DgwZb9G1/SK/tCIv9vaT8G7pHX35M1m3ZWRmXvXAv9LyySdccyr6ueZU
 znTcgtoaaDECtIyugworg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SeCVIGNsipQ=:AjEhZ2WKlJThqjfN2+ozqU
 bZEggaTrxOko95GULfLvor5ZxZoRzV25w0pVREANTjuaicOpUH50h+0R8+Zg5iaytHPC3x+8Z
 fINlpRDwihpGojuXwtt8zqRnsZTPP2f3Scei+eZwWONGCltDX3qA3md+itbbSKiKzX9aw3T60
 DjLbhr8r7TJpw+ksbxVRAEmbAW8jRTEjzNPhvQ8NkNo/9yZsarYGNwEalk8zH/jnLILzVCGC3
 0g8nvYSSTTrMgKvjRNtFnmKOwu8wpzOPGFO0Wmz/phRtDZVdYBKG2g9JjQHAXNeCcNfi44Zks
 oqXxthX2lcdriKn6eAbg98QSOFWcQcPde448M5Mf5/pWRAbWvDpec1CRZUCtm79RJpgDHGccr
 r1FtGDNfawEI/exFMNk06t2fAaXICa/lOCHRSB0xW63zp5PYhvurfObs9huUkWLlfo1qrn7QE
 ctCEqNXMB1GT3VSmpetCtQC0G4VTJWbtGA1npaEh1+nAGaIUG9Q1ngZCREDoRW8dRFbM6Q6LJ
 fHgjuqs3v/fok97BzOKJGOgrHVdak/M8j0H+wNfbRjt3EWkpGcSO/HAfniU0cowvUg/yo+Rhb
 QwiyeclF0EPWuY9B3mJ1k2bMouG9cl6Ry6VKh9rGoOVmp4qlLCMDkxDrPWuv7aa4v4X3ntGl+
 G6fWvomoQMgYapSuF9J+JQge4RFsUHT92794G99q9+hbuqKnb6GWidR+p1v+D8Eql2j1RTXyq
 Q5Zjw02SiwQOUGXa4D1FbfBANBk7ONfE9A6vEEQ2/UKEa/730EXY+0KSsOxKvtgNp0p3skEwa
 OAHOXbnfate7mD4BBjRhYJ+N7hR3PUGmuKNsMB/4huO9qbYNyACip4lZJN1E57w2W0/2CrkTd
 9Dhhr0WB5Aev9gIOR+WrfUVZBM0CK0ptwg2iPBh9ouRbBlk5HGUW1GftXivznjzx4sFi/eLDF
 v4pUUcmKCpd7WLu//Usg+xDR9QrfrG/Dq4Zp56B7vimRxtGq23mEE2yJszraobQ8usjmER4UI
 j7gKixSWI2l6tJdNez6DpqQuejwAWqbtZguy4rsOTzQTNbNs6wwg5QU0v1WgAEI1zXCFU4ORq
 nJiBCGtTqd7vBw=
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

A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
version information.

This patch adds a binding to describe this node.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

=2D--
v3:
- Make a few changes suggested by Rob Herring
- Change name of mux-controller node to appease the linter

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-2-j.neuschaefer@gmx.=
net/
- Rename node in example to syscon@800000
- Add subnode to example

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-2-j.neuschaefer@gmx.=
net/
=2D--
 .../bindings/arm/npcm/nuvoton,gcr.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml b=
/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
new file mode 100644
index 0000000000000..fcb211add7d37
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gcr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Global Control Registers block in Nuvoton SoCs
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+description:
+  The Global Control Registers (GCR) are a block of registers in Nuvoton =
SoCs
+  that expose misc functionality such as chip model and version informati=
on or
+  pinmux settings.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,wpcm450-gcr
+          - nuvoton,npcm750-gcr
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    gcr: syscon@800000 {
+      compatible =3D "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
+      reg =3D <0x800000 0x1000>;
+
+      mux-controller {
+        compatible =3D "mmio-mux";
+        #mux-control-cells =3D <1>;
+        mux-reg-masks =3D <0x38 0x07>;
+        idle-states =3D <2>;
+      };
+    };
=2D-
2.30.2

