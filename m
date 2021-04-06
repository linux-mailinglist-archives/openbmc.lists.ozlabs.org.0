Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD1355342
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5w262qcz3br4
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=QftaEuF7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=QftaEuF7; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5vg2RChz3bpt
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:10:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711022;
 bh=OfN24IwxxARsGfWQJbdfi7ZRHscsB6YDPNa6NgX+9x0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QftaEuF7KNEQLsVUaivUvRS+S2J5KL4GBIklNKHRKS0yK761zlIqccAMMtjijAST9
 x1MnoNF+7B7Pz62HX0/x9Zi7tuJESdVxvGfZYOWqgZEpaYEVQYeiI9GsAskj1JyskQ
 PAmo7DGy6fOrXtbb68Qd47yFaZJixOE3qjTrxSKQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBlxW-1lHfhi21Pg-00CA7T; Tue, 06
 Apr 2021 14:10:22 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 02/10] dt-bindings: arm: npcm: Add nuvoton,
 wpcm450 compatible string
Date: Tue,  6 Apr 2021 14:09:13 +0200
Message-Id: <20210406120921.2484986-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3i3tqHvtVBg3rg5Rc8lXpQLYNYHJptTlPSoxI6UjwlejQdqEtYJ
 4umszCzzU6McbbYFuhSR8XlUa1e6jyEAO8wJhcerP+pLklSMXcpZYCfC7JIqcIpZHZh01Ku
 Vbb/GYyrymKQ9rJ4W8v887vT0X7FC31pL0pIij1mI6EiY5Z5G0FZeUwJKrP1Ffzk92F0udB
 rUQWgppEEzYgdSdNWs/zg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XCort7w0/+M=:aJ/nnbDPyvhnGdcYpgh+Ld
 rjHdHavsR6ss15tj8D5BsQQypx9hO+BNLHRFIeUsrF3Gj+07C3wpoqjrvMzTBZMQW7kT3abw2
 IrgeHVQlnFgClABitxjk4HgLr6WZML8pzA+RgNor15ddPXfmbaC2dVg9601F7cqYNtDblMewW
 1jKQlaRvJXKBq1OTu9sIZWw38PZZHXMlVwLJ3xRjpjXkppGPNuATf+PDJycArRZP7k35GTaMc
 fYuQFsrYC8suUw+GU21Iuzk6svNLH/HrHaM1ZeK07gJcYlcc+be2qNncRZr9J2RTfUpsDvcro
 HmGwMDMrhGkQvYYMeMwdj/Fx0AChP+QCRXBKaPlgkx4C+AoGf3+iNDD4kmp4g/+zh+w6XihBP
 CR6Ku9+nJzj+cZw4soctAIDf7e2OgxU2k5trfUTLlJp1ZTfc9/Ez0MeerWdzBlIN+zsCAempS
 gu2Y3Y180W2GZR5S7Gjz2tqvlsTdg9geMhSIoIxepUwQBsTYbqA2R8RpGX9LHaMAFhvCpXvYd
 ths63bC/4kC0PiyFbfewDa56Lpr2niVResH7Dpxmf4PeUBVnocyUyUpS/l0BZoijOUVzPsAXi
 q7Ko6rG4JBQaFLbZpxcVGG419FKqfnGQpMSObj1PgKCgHzTgW4b+5t/HxiiD6W1gsaS0HG6YP
 Cx7BWjoyTkHWAef69+wHHhRhZCMm4IozNYLy0dAqkVC8QPJoSFbvUcdgpQp6vQjBBNJl/iZ9R
 FxCbWyF0C9dgs735TE1rP8HYYHQcTS5wRXdSFyIKXJqCsOcmvKUJfBLdgIJi+D8K47USDVxtl
 4nMzQ50giGdvjogjlIowNgQO4T+gO1OWRb2EE9KuLgyC3tqUe+jdJ4XBF8ER3VB1xpi4rSbD4
 N8YGLd+C844ACH5o0wEFp2B3Xk0lWgprCUg+RbLVztfxMm/ltzilZsmtiP+lNewOJaUv6JGc3
 Bqj89L2MH9c+XydYOtbuSgYawX+Nbn9rdQ4PkEC6OwS6FoDrVw5oKvLZ1l05PuokDvBkraVZ+
 0EdKytydRP5rg0KRRCz6Rih65ReaaXUQ8RjoJmbfOy109ClJlGz/9cmCMZxKVvd15EOXb5Zd/
 Zv0xLFDaBuu1Jj2ZcegjohGvhGUYH7mWtHq6iFUpf5ihHbTmDOCXN8wE+vas6tVBLFAc1P468
 ytbsTrbzfyiVYXu7RT0tqRmlIUdimqxLp76zwP6bXkqfQduGHZTEkFDho8qc52kTZ+bpeGUii
 nLAAhzXBfTUJNaJmf
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
 Rob Herring <robh@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 is an older BMC SoC in the Nuvoton NPCM family, originally
marketed as Winbond WPCM450.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
=2D--

This patch requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to =
YAML"
(https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.ne=
t/)

v2:
- Added Rob's ACK
=2D--
 Documentation/devicetree/bindings/arm/npcm/npcm.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml b/Docume=
ntation/devicetree/bindings/arm/npcm/npcm.yaml
index 894aefb70652a..95e51378089c9 100644
=2D-- a/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
+++ b/Documentation/devicetree/bindings/arm/npcm/npcm.yaml
@@ -14,6 +14,12 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: WPCM450 based boards
+        items:
+          - enum:
+              - supermicro,x9sci-ln4f-bmc   # Supermicro X9SCI-LN4F serve=
r's BMC
+          - const: nuvoton,wpcm450
+
       - description: NPCM750 based boards
         items:
           - enum:
=2D-
2.30.2

