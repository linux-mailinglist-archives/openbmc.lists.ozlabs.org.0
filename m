Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7D342ECE
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:19:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2ptm2Ywcz3000
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=VS7rz+qx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=VS7rz+qx; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2ptX3wcBz2y8P
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:19:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264324;
 bh=GVx8/K7yYDVoo050qqGQmQL+SjUfoXirB6WTv2qDFWM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VS7rz+qxpxxaaGFSkeWRkJ60QM5waU71v8JjMor5favGhDUMH2i1WFlmuXuqNSu1r
 L+wjkJiPpiYIOHLQEEpSB0STDpGWQaRE6ZwmHebf8Hu00ou5XRhAdv3aDZ07IAFymQ
 bvvNUpc/BKe6SVvvLrBC2Vp4z22lhix5kLUHRRH8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bk4-1lkN7C2PNO-01850Q; Sat, 20
 Mar 2021 19:18:44 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 02/14] dt-bindings: arm: npcm: Add nuvoton,
 wpcm450 compatible string
Date: Sat, 20 Mar 2021 19:15:58 +0100
Message-Id: <20210320181610.680870-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yedfqajxlN1FAoHANCYVteSz4SlckZkDE9Linr7spqQF8RAwH5s
 rX+UJz/8u4AJjdE0MENaEhWaseqSix065XTmHg+lCKnz7CfXmhU1cdyKDgweZjGjyLiEB3a
 UJ5wk1lfGHMFd/DLbPlHvlCHr8QhJ81UlOmOPNuH5LfQzrXOVAon663FgwidHsphdZ4DCBq
 Xm9Bfpu3aNh9yLA1Hh7AA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Bc6xy5JL9I=:6+4OIJfEgVHpodEDyIa5T8
 pvD4QBDUe13P963KH2nWuR2rOd0IpQjxKTthDnilQ1XB//3Jn9oqfJsYRkwMoWWAliuK2Sp9N
 twhvMlfz0EndyiojTP5Mx86Jtu4ju2wO+0Y06sPTR83/jcNSOJsDMJf7D6abwtN76fngbeVH+
 IAxtE4M/wRbDaq+bdr/sVeFQP/Qi6MpDGYUju3xm752dPNQXgKrrEOmGzhrEIyEL51YCwjaQl
 BMyfZNW52PjPSx+2HcUwvyYfPGozLrIc3JPSOoceiSoW6wNOKWSXBVQisvURbADWorfsV+jl3
 t9/cpbzNN0pUar5LgNXQLRSJXaGW/gDFsqci7z4rw0OJ5pp8bcCppRyx+4fr6IfLVSHSqbV0Y
 cLx6nzVQbMz2H/U1m2kMR3SkbWcQ3Fdv7uKFdGD2unGhaOHXIXz9KoQunQ11HP+/1U/pJ+6Ni
 DodRlGjhNNUGMfti3VlASrxI2Dmz8gcq+mBlsJ7WEFKH81rLhywTvYbQPXvYlg81xd23aaK/m
 m3Wq1WV/Yr7HvId9VM2WtMyoVHLhMewTS4dzjMFR0hExsETRmW/JwSfnBv5wpym61ZB+1mmQM
 VLFov/82kXbcFaSX3EydQZa8dsnksqHcPWxf/FBB127K/9ObcXNYGzQuhECWgq21Psr/es1h7
 588aJ4dUkK4tnC8wABMJDjobIlny4Y9Mr5LYgBSJ+GBHGHkvK9PYEa5HLE/c3uQf+tByVAGID
 sk6GdYkZkmDCqOsEsrQxuKUl8U05ismncr67HyNSsATeGlW90+pVpR8obJAR2lFrjfs9/t79J
 FBPOoIn4OG8mJTtvL2mfq8km6OlEtz6Hvb9fToWiWNBn76e+7fvQKiaNAtfUUC/ccCJXRNtEr
 IIKHn2wOmA5griHXg3VfPlhObp4/Bth8BOis9odyqdw46cB2VaMvE2L9CM3VRvV3O5Zn+OlyV
 hz6gEX4xpq+XYezm+BAOGi8X4RCiBBMjJvFVqO/D1wIm79A0OEKxltC5jw6ofeacSnhhv/pLy
 k88Uiq358KhfEXIYwtafWexNFlm2ODXyrbXIaJj3/egtBaFK2ZtUzrI5IqvgWQzjxNep4xr4H
 YtJgjAnJxyu+c0c4WdoJl4tas1uzu78RhndvYC23Yz7eTlek6ZHc03uOprEKoduwhHAcpRLD9
 VEXE3NCQk7trf1KtrNMMj3uQz8bejdLEAdolp9C2A6eJ/iCj+4ouynVFf+QRWaqaKnl1boIa1
 1v/5DDNEKcCV3f+sp
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
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 is an older BMC SoC in the Nuvoton NPCM family, originally
marketed as Winbond WPCM450.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

This patch requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to =
YAML"
(https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx.ne=
t/)
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

