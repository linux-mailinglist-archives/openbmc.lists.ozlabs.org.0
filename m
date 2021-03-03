Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 140EC32B90F
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 17:04:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrJjY0l3Jz3clt
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 03:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=jLo9wGIf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=jLo9wGIf; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrJj859ylz3cWl
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 03:04:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614787217;
 bh=vXITFOlRrrM/ot0qtV+OpIUql+KKoRQFHgp+WqwkmIo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jLo9wGIfMHHRt3TIIZgJ7KrKDq9WAQef2SQgVZb13guZWzpbc7aAVUoGAl0p6Ldzr
 NFiFJ6iRTXZ2RQbBQ69r3Y7kn9I4b5UfrirX9hoiUs4Dq3SnoITg52IIlA9XiEKlCm
 KlR+5tuPzUeELPCDStDuCo9ad3My4HAFQr+RJQTM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXuB-1lHmzV10Qx-00Z2rQ; Wed, 03
 Mar 2021 16:47:30 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 RESEND 1/2] dt-bindings: arm: Convert nuvoton,
 npcm750 binding to YAML
Date: Wed,  3 Mar 2021 16:46:19 +0100
Message-Id: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fr11v6FXMj6GgupdvATGzBwe2UvTw/AWyN+FGMgj9PZ1eqObakU
 D0WHCsYt0rm20m4CKLwKghThQvSFc6ODgoeu5a4j90QWuA3KJ/SpOOxYn4Si8t+Fhk534xn
 WVO9EZJaQuoRsWLXXF46+HsXmZEq8jbL4v2cDm4o1LTs+DdcO8GBF3DMzKPyztPeC/42lz/
 1KITjqS36WTJDICbwberA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vwI64QZ96C4=:cqBv6/3bFvtF3342P35nyg
 Ch+5YnMVq4GE/mE9i8VprKtVoUkWRQmd4+Gr2jBJ8DlbpLSDtw9ArumsAgjTNV8LM3RGFvpID
 69do/8IkG8m4STXhv1sWmkxxgIvS1cRitnO4Tg4h68eThCd90ys/JxyA9VeuwwZILVmLYXC7M
 ZvvGw7xAuk7w8TL/mfN+a+akwU+1eCYqFWya7fVOC8awFzqjae3lO38NQucM53ntKIZfS9zUf
 xPtYhmeayadzCRyhkxX/gZZQQruHwi3iM641EvWlVYBYZCsWRadG/veSO3LxpkUyr63drlvcM
 XJBhAeX/9w8EdyR1TfcdkVOFazCnD1YB70h2IXuPVQIwHhHgPa2Qw3VsxX3NfLevdlqBM1rDv
 c1amyvZOkcKXun1mGzxbXoYTwcY6acisy6rwN80eKXkFOH7oVGxtgBzv8qJv87cgN/MVuhF3e
 gmaCdvTyKU1Je/AM9AwEHaEt7wYkrAfPqNOAbzngR7zZyeI4jiqjdEY2Dn3jmdUOglxUhlpnL
 SEzy77B+O/xCm3+6LLCJteYAVi7XOFz+Eu+2kZl8Bru/oG8mDFTOuRilSBBSvxLzjyiPWkwYr
 572GmJvgSfPHfnc6ZiE/INFn2ll71g8FoR5VzeAV0tsI9yFnoOpGd5xQ/IXPbLHJEC9xNOYcA
 G0jE1NuhjuRzYlYwAHe7qV7zHgqgWhxR9H5ClPcaf34JApZp/2QwJ9qrSLDzm7dD6wHq9/s1B
 kBtSa/QFRHWSZX677yEq/bJpyIcEE8r70WYzVxIJVDUQ4II2aEOag1xShZ0ajpMydKiIhoLj4
 K65jLrDvF8YpWKiA8t/R9YtXtBQFLN/34qSqswPQ+lS6fCCE74uZ9GKniKvAYprOHDdI29oxT
 GG0+jpDlV3+jPMefFefg==
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

If someone else wants to be listed as the maintainer, please let me
know.


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
2.29.2

