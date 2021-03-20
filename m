Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C8A342ED7
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pvb15cZz301n
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:19:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=b1H2QJ7V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=b1H2QJ7V; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2ptl70m8z2ysq
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:19:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264329;
 bh=dHUgBpT9QQjoFQftq32LUJVrKqm/fc7+0UwILWtni2w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b1H2QJ7Vwt2U1v2UWA3ag5dQpf7gU/Dxio3T7zxBZnJHMKq9nOjtCPlwqvNSu7Z+N
 7nfodrn5ilg/JwgcsCly548MqfR7PaT2Ny7Pc/UJKGBhgg/Sl1NHeWb/jtxgQiYcbn
 LZlQFXXNvEZrpM1L7+j+XejHOtZjUNjRB+8rtyC4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzOm-1l2osv2pZc-00PLZY; Sat, 20
 Mar 2021 19:18:49 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 03/14] dt-bindings: interrupt-controller: Add nuvoton,
 wpcm450-aic
Date: Sat, 20 Mar 2021 19:15:59 +0100
Message-Id: <20210320181610.680870-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XznFuKONMVCd+6zTs5uKe+pfd1wC0iL1uzgHflpsQpeaPRggoF3
 LB0F3RTxHWfaW1Oik0aO8NiCwAcz7Estguxwbe6/QbBErH5lSaLFFSPFZMkXxOa8TvlXFcp
 SGu9xF9WAG2roFkamj5JiQuVp9zMXd43Jp04HTHRZxPu83wtESFUhvqjes9GPZID4SpgkDP
 XRhghpNzpbJ1mA3mX4L2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mqWEJi+PBgY=:rM7nDzMCGqFGKH3xMoO+HS
 UUdWiaZ2J/x4ahTOJFQDAw59FK/ZLpoXP6ow1Q0E0SM/EQkHoQhyvpwRPdNPIvHWU0qCoHHL6
 4Ls7JQD6RVMQJqr3Y+JRGVQt0IIV1YyV4ydezyuPcqwE5u+oyHxPjm+mgxKtUf7dXAUmWTEZ8
 kKQWjebYmK/v1L/gblSRbzkjBu3czJmwRqAxLJ3W3Vknplxhw2e6gTccb+jUjr1SrldRvgYAv
 u96MMeYIV3G7Rp7pM2k6VQuGN58mjc8hkt9xtGDVRCtHaOV9Q1v8Oe+UpoOta1/++UdF+PVn9
 d2fqiNrsH1MgaLsmsy0wER/vwBy741ypJuHMbVI0YLrQeohZVTHeMH9Yhp6524N2+C+87wzUy
 +A3MxYx0uT6onQvhI3B5omiH0G6QxcxZlDXMSfaXqU/4uXlUrCBcUH4FjucR3SnGGxBGwb9yZ
 ks59BTkUhlMjz+xiftwlxLYuz6lLPo8jGx+Km6zvCIA8O8LGN6+OdgD6yPtn1o8AlLkYWjFEV
 /ht3UkeE12LoI20p2AyMGe4zVWqcC5Ntsh1+/sk9VLqfOBfBnr0UHpxdCypHuPo8ODpIqAdWW
 mxuD45DHaSez2768yQHXRM0xPOpJgx0iMFdfChuEz76rZcOyjrpjJqnweblgili5guPntltrA
 iY3v65CjyypM9LzMVSOLk/JidLbT6RPHjzkvvvZ6p8dyEi/3ylS2JIChMsMjvAQXIJRxSum1Z
 oZ5LYbwM1ZQLk9S3SeemQ/w3wJJp0j8ypvwJGHFPD0DtKvVwZjZ0WLqarNVXJOBRE/zB2DB9M
 2NoY63ssBq8Gp5p1ZwB/5oVd7ffxfHs9ouYgk+RasWUJ4fscJb7ldKKch93FGbx2kKy4ETIBO
 bUxLEDBKZJePutISbJlw==
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 AIC ("Advanced Interrupt Controller") is the interrupt
controller found in the Nuvoton WPCM450 SoC and other Winbond/Nuvoton
SoCs.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
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

