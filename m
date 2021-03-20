Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8712342E6A
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 17:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2mjP6Ddyz2yYw
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 03:40:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=e9ygfgMl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=e9ygfgMl; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2mj9359Rz2y0G
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 03:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616258432;
 bh=YH9XORTfn1PpxKNFKfrJeDcEQVyGUJ9q2ohzY93Pbv0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=e9ygfgMlHg8G8uYjUvARw2l+tFBErylXVSlAfCw0+u+5Oh4V0IJMzA6q91r6C5Uhf
 hvWONorUJaDA4sJtpiZ7CCINyI9ld6UY6wLJl1A6IaPNk36izdzA9g59t2QVF37Cmw
 GClRuoZj90G7m3VmIYG4d7Tx7O3cCpmCZZbJKe9c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1le56l0LUl-00swy2; Sat, 20
 Mar 2021 17:40:32 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: Convert nuvoton,
 npcm750 binding to YAML
Date: Sat, 20 Mar 2021 17:40:21 +0100
Message-Id: <20210320164023.614059-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5mcEISnS4ytZc1DrW7VlEyN1Uokwd9BkTpb49mWOTy+A529zSzy
 NRO979GeLVz1VFHG/mU53D0khQYFNen+S9LBf21FUW7iDTqOxecZcta3Z8OCFRlMPQZg8+M
 Ljt8K7Qjj3nFk24Xakr9jHcAUw0wzRlgk8JppJxEEF2P00h4zsl5RzdNsEjhEG2G/IUZwiY
 Bx4gi15BVLirkUkc51mdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhgu733j7xE=:3vWRqFrgXnB+oO2F71xL0W
 DooYj1dnNhi6zt9vvcxMG5qd8tCPnYbst+mq0TxbLffgYeAxMTBpU7XHn3CXxe2O32Pby83fa
 VcOd3gurR+rMFn+43uPpePcLvUFwmE+HULXPm/HA+xGYp/u+DX9F/059Rl/dWvMFHVkONzKKx
 5d9h6MMwpTnj8QIrysGB9Gb5+bVrJZC8daDgZW3mJjK4ia9accgnKs7tn2x4XMzgTlfCcxanJ
 WVg0i72QXdvPuZNbncpdh8kshLP3qr2Owbn/ubs8pqKnXVqGcCWCvDDvUq6LuEQ77fiH5mfAw
 xqMe2Jvxg9U9Hwn8TEfe9Lh2aBedNOwdtysVaJ3oWKpaC0EDcWI2jSlx55tBqsNbo3MpGHdaT
 Iww9cR1OFPC8Ii6ZWyfIHRFDoln1n5SgTv+1V+ytPrtE1wQXg+uQSnORiHOQnHZlz4oGWBnGa
 li8oA4DI0z75UpUpguGiGlCDbwUjkHL2SZQ+10jBzgo0HuP4dfzdeyGl2BLqbhbpKKusqKHMN
 uuiSWvkp/zbhjhVgHmCFiAfxacDS4IGYIZYzmELw4YYpMp0F9cIiBmxpAl94Rtusn0RCw8RG6
 50pwU9FW8qu3b3nHieQipYvRMmXHz0pgRw9lFQfebklXkg1YiEokvNk9OQZ4Ho1PiQ2cK+zKo
 P5KFAJ8fsq9UStGQS6oXamNRSq3LSbIqgnYe36GAMsMbLbKyaWYNeHPg/rSfWwm27PAmnhxOu
 23wUzWSrZXvbU9aR6FNGjLZFLYAjtRHR/eUjkzWfeijtCMTXqNoKcC5PStTGUk8q1x1dKwLVu
 itYlMcIKpPBACIwkZrW2dCGQoUN/It6Fp/6Y8UvUjxHoeJPHfxAU0K8p+JCQK54hiWDff4V2k
 oxL4QNJp92XfzVS8uqDZgB0M37RWlWl5RBz6c03zZSLmOIvtyGBL6IgUdFu69zG9iV2swossb
 BfkkL8Ce+q2lBhzEqZvhN8TgNZ/Tgb3+P0AX4QyS3mqrg3NIVKnib8mLgwOzeG3Lv58D1P0V9
 7B0hPDWw78ybA5d0ymBDFeOxsyDFX0OmEGKRZu1+9HF3ufon49WsqXpSKF9JTu7pjvDyk7Kzc
 7mLswFUMaeZH/z2WVt6wR43pfDqq4RsLmcFxJgjX0q2/NicvbAqFLhqfAhsmaxJnxIlWJ5YMb
 2nufe032d5DP+2toeFcWXL4QLN0+NYW2lNTNPwQ6uVTLlowvmv2RpbDhHRucK1F6iM6Et2SnT
 ws/w3HOSv7SrMSJgf
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
Cc: Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The general trend is to have devicetree bindings in YAML format, to
allow automatic validation of bindings and devicetrees.

Convert the NPCM SoC family's binding to YAML before it accumulates more
entries.

The nuvoton,npcm750-evb compatible string is introduced to keep the
structure of the binding a little simpler.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Rob Herring <robh@kernel.org>
=2D--

v4:
- After some discussion with Rob and Tomer, I reverted the patch back to v=
2.
- Applied Rob's R-b

v3:
- https://lore.kernel.org/lkml/20210313175321.2515675-1-j.neuschaefer@gmx.=
net/
- Removed board-specific compatible string for evaluation board.

v2:
- Fix indentation to satisfy yamllint
- Fix $schema line

v1:
- https://lore.kernel.org/lkml/20210108224008.705687-1-j.neuschaefer@gmx.n=
et/
=2D--
 .../devicetree/bindings/arm/npcm/npcm.txt     |  6 -----
 .../devicetree/bindings/arm/npcm/npcm.yaml    | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.txt b/Documen=
tation/devicetree/bindings/arm/npcm/npcm.txt
deleted file mode 100644
index 2d87d9ecea85b..0000000000000
=2D-- a/Documentation/devicetree/bindings/arm/npcm/npcm.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-NPCM Platforms Device Tree Bindings
=2D-----------------------------------
-NPCM750 SoC
-Required root node properties:
-	- compatible =3D "nuvoton,npcm750";
-
diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml b/Docume=
ntation/devicetree/bindings/arm/npcm/npcm.yaml
new file mode 100644
index 0000000000000..894aefb70652a
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/npcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NPCM Platforms Device Tree Bindings
+
+maintainers:
+  - Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: NPCM750 based boards
+        items:
+          - enum:
+              - nuvoton,npcm750-evb         # NPCM750 evaluation board
+          - const: nuvoton,npcm750
+
+additionalProperties: true
=2D-
2.30.2

