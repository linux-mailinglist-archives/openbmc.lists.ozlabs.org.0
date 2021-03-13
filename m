Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00A339FA6
	for <lists+openbmc@lfdr.de>; Sat, 13 Mar 2021 18:54:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DyVfw5vTjz3cX4
	for <lists+openbmc@lfdr.de>; Sun, 14 Mar 2021 04:54:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=ABpYJWgk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ABpYJWgk; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DyVfg3Bm7z30Nx
 for <openbmc@lists.ozlabs.org>; Sun, 14 Mar 2021 04:53:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1615658012;
 bh=rPjOZivutM7ahGyVWHlvhc8+PQSNNyb2U5RIaFJFD+k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ABpYJWgkH6r6itLhACPB/qVGYIWMzoxD/GzCKPk36AcgFgsTj5kRGlOI1ojU70PSs
 emSSpZUBu2TTR6g72ahUTWCqSMpdUlX2mm2SDn5o8hotfrKmez1Q8TweWpdV/XzKay
 BTKUpozw0JqlJBfV4o5qVJDGehYCA1x8HGMDIgC0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1lYHbo1Jj6-00DHEx; Sat, 13
 Mar 2021 18:53:32 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: arm: Convert nuvoton,npcm750 binding to YAML
Date: Sat, 13 Mar 2021 18:53:20 +0100
Message-Id: <20210313175321.2515675-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YdgVKbC+uUFqsQ4VX7wi1nGPYir69EyeuaQ6msT1UYLjj9qKCTK
 Fwav/8WA1ILbpzevkIxu9AwKMyGZIJiB2TWKOYlrSF70VIrC0V5fyaE6k99gRV0NORr8wg2
 ssbHuv4vymjrGlWchvj2LvbLYK5e1mrEgrDTSZxEzDNPq/ibqV6NWTFyjaz0iBxP/L2F2+B
 z2zpFPMwx+z++OqCg9mUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GdCqp6B9Iz8=:FZCD7bzr46fFwmS6yIDdEr
 YJcHuTzfylef+APiHJk1USHhg2Nm+JgSQ8Vnck4CM0yeSEwDc2jMOFagqlDEP6QK+3w2GrYu9
 vtsqOGBtJoFunqbo7oMfcb1kqSaF1rRvwLpQchWk26CkBwDdRHOxUh1N6OOqYkpJVLjqDFvUJ
 xyGXbojGD5XsMr6Lt0V3A+peJ++FSgjsPrcRsm2+jRG3FsHAnsgxtaSzE10RWmIscBqKphhaT
 O6Dbpx/cUr8iuqHQP6sw0mm9jWIxC8SA4+2wNMnqnUxqWWiWd1LUdBtNxzZ48tbaJpkwHxTyc
 dLEwkIlwKPvQ/zJMiQsyPD8vdTuvUWysc+kMQEfpFOj7CgdQOsfMMFcnPpzaV+dClS7bg3JXG
 FqhsfYRNCh+DcLttvr/FrUPAWKeWKTGALDmP+pdZsOdg+89iLI2qG5R3F9DLnUhqSDgYGb7ME
 HFtnjXhBevBAMdiQdp7E1r42d00wt4mLPGEL5gN3PcUVS2jRo0W8nW4q1QBb1jZzW2GvL05Cw
 cZNyDcPegJbEWVGtITC81SZ3vIQ01Tgd7F8c9186lxrY9vBjwjNVBG6FhIvNTP/NNLrE/43rH
 8IR1kSeaMZjWP7EhUZba764hxO1gjDhAd8efcOR0Z41Zau7EdeJXKiuod/+vNPVFFGhwpixro
 O4EgEgrqCi8x9AlBCD/onkHVHkIUXlHYIQRoUEjmj1zCfNMiZKqIYPsJ+1nz18xHKqHBtJ/hq
 JdcirVw/CzH++o+u04UEh8FRD0ixXhWbXJE7Op48T+px9mM3orI1s7jTuhdhDmCy0EKQsh4Md
 aOqUiDndG0sYUyjgqwCGA4+7wo3VD0MNCakBkked3dg5cueJGe+a/U4QEwWmALSAsUDQ3OJN8
 hvbSarBDkEQuvOxranbg==
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
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The general trend is to have devicetree bindings in YAML format, to
allow automatic validation of bindings and devicetrees.

Convert the NPCM SoC family's binding to YAML before it accumulates more
entries.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

If someone else wants to be listed as the maintainer, please let me
know.


v3:
- In this version, I removed the nuvoton,npcm750-evb compatible string
  again. I had previously introduced it to simplify the binding a little
  bit, but Tomer Maimon suggested to keep /compatible of
  nuvoton-npcm750-evb.dts as-is (i.e. only use "nuvoton,npcm750", no
  board-specific string).
  Because of this change, I am not including Rob Herring's R-b tag.

v2:
- https://lore.kernel.org/lkml/20210116010907.3475405-1-j.neuschaefer@gmx.=
net/
  https://lore.kernel.org/lkml/20210303154622.3018839-1-j.neuschaefer@gmx.=
net/
- Fix indentation to satisfy yamllint
- Fix $schema line
=2D--
 .../devicetree/bindings/arm/npcm/npcm.txt     |  6 ------
 .../devicetree/bindings/arm/npcm/npcm.yaml    | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)
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
index 0000000000000..8cca0396a5d59
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
@@ -0,0 +1,20 @@
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
+      - description: NPCM750 development board
+        const: nuvoton,npcm750
+
+additionalProperties: true
=2D-
2.30.1

