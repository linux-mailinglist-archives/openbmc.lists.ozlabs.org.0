Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AAA355349
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:11:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5wT42gpz3035
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:11:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Uxe3CbSK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Uxe3CbSK; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5vr5fHKz3bqC
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:10:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711033;
 bh=Ei6Pp9zGAH2UxGqGf1ILV9gplHFrtV0jN6b2w9XiUgQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Uxe3CbSKpOm6Xjb/tBMqxVlX7pU8NGqAMR0U+WYWZYI+lpWh/DDTZ2XOzTX5VP+wa
 5UYLTdFeEOTYzYiKMGMdu+FqOUzE15uvLGW9eVom6TiqK3dmWukPf9ZDDGmOfbaNEa
 jZ/bqrk/MRxUPnPXZeplPaFMc7cOQG0FBbVHfj0E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1lImAa3WiO-00B19K; Tue, 06
 Apr 2021 14:10:32 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 03/10] dt-bindings: interrupt-controller: Add nuvoton,
 wpcm450-aic
Date: Tue,  6 Apr 2021 14:09:14 +0200
Message-Id: <20210406120921.2484986-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x8q4cLS4WXLc1W/b7u0t3d2Cr4ZR4ltZTViaG6lXP9IrQreiDst
 rG/QKW5K7k/Lk/7sEItyWuDsEgUNZ9YmmC0ef8sJdqjk0MIL9X1eL/QJ6NjUnm5B+XPM31t
 qxnDiLs66so9wJ7leLTgUkGl5MYNGfGIE8Es+WtQkS7YGovb0Vu0qFSxE8rc/7EK/L4nWxX
 oi63Di3OBHrx1aCGcFjkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oud94XjFQk8=:AkDPv0gvTXmAqGIG2PIoa0
 h2C/XAU1oGpjhTLHyw/LxPQx5H9HPwf44y8JayyciXb1GBuhGVvjtyqDzv+AryPZTlGsurPzd
 +BXDvfG01y5+AZhaJ49E3KHEBRR1rDjjg0ufRNnIeSjKidqtu/jh4UjIrn+OClG6FCCbEr3rf
 0jPEEH62kZ/U4pLtO1CltdVFz9UkstmwbLYuy3yyZzJxi7q+ySQyO4bfjGehKTv9QYVlkYuZ4
 fixVMJrgXUqazTPKtfvJuCyi+h4njd+pKCc5Ckji2DjKJFWbFqaTsuLtJg2Mx6FrLc6E5uRU0
 Liri9Q2snK/ka7aoI7sLvzyoxaBW3eTS761uN5R86EwUedGH3FYq7d/KMPVzkQ6iDhTIXRPIk
 fbM4hIrY2h0Vkp+s63ZV+w+TtTjMquVLliSzy2rQP1/tTyRXlZVjfK354YswngBQpg6EJS+vF
 wYfoTO3vf6R7Sqfdelaa64/Y4MSmjzNuO1xvvvvlxJbR/41OuW73Rl3WjxN5woC8ziK5kzf7O
 CVkbMN7Ybjfrdjv0aQR9r1aj6ZZuk5BBsF2NBGLAvK6jWRl74Sk4GZ9ZYon9y4U9/JbBC1Mdj
 F3Y9+ZJ3q+GFy8XT9idl+J1lhhEGuw/lfP5jgMhmgzMFjwcAzQja21vYg2QyoAZrLEAokcmk5
 C0szpssThPTJfmxUTo6GiZ+nDxKVlXJqsyZOT5AstjO4Odzv0SenN7CCaO1Q/z6cDa2wLuRrD
 /Bj7lrKo6zO+i8xEYUUO9vD90J6I941gWgwmcMhQVMtGnCNPCefEK7ZsvY769VWa2U39rWauW
 6hM0xnl/5ik8IFVVzkosxw3G1MdqZ/vbc1q+ZRi9a6pKgi/K/obLvt/FT/rzw9XhIykVt9sPH
 N9c//MTpOovi026RTcaYM0y3jm2qhjbiGeJgS05BSP7e/ZLkxaz1zA+OPPHM90iajqR23u9Ma
 tmSelE/SpVmCCVwKkGFR/dRGnc+UadtDaZeQREw/M0M3pS4QajA3rP2EtHc6fYfhWwGkXM8Me
 PLKoSbvU4yUlDZlOib48VcLnw098v4cNShXRdJRDt1TwEbeFFHW1Np2qxQFcbVOtEXQn5X9ge
 qUx47oazeWve8Ic+Z+J+w4IBovrB9KCS4OYBxA1CaNJc0sSmQI63cxjWnGbgJQQDYr9OquiWJ
 14N3qG5PJjxHh0je0iSsIcPEAim/JMeIrjKfoLcyvTNxXbgRGo4KlMx7V/YtXN79TOT3LmzCn
 TvnnwWogeqVq+7Bix
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
SoCs.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
=2D--

v2:
- Added Rob's ACK
=2D--
 .../nuvoton,wpcm450-aic.yaml                  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller=
/nuvoton,wpcm450-aic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/nuvoto=
n,wpcm450-aic.yaml b/Documentation/devicetree/bindings/interrupt-controlle=
r/nuvoton,wpcm450-aic.yaml
new file mode 100644
index 0000000000000..9ce6804bdb999
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/nuvoton,wpcm4=
50-aic.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/nuvoton,wpcm450-a=
ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton WPCM450 Advanced Interrupt Controller bindings
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+properties:
+  '#interrupt-cells':
+    const: 2
+
+  compatible:
+    const: nuvoton,wpcm450-aic
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - '#interrupt-cells'
+  - compatible
+  - reg
+  - interrupt-controller
+
+examples:
+  - |
+    aic: interrupt-controller@b8002000 {
+        compatible =3D "nuvoton,wpcm450-aic";
+        reg =3D <0xb8002000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells =3D <2>;
+    };
=2D-
2.30.2

