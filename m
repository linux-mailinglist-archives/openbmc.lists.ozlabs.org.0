Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3974342EC7
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2prQ4y1Pz2yyn
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=BxJ7G5YA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=BxJ7G5YA; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pr60DWgz3000
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:16:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264191;
 bh=dwWjNrSn2iknh3uCrtCouI9eamjWocbr/PwFK6GJxAU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BxJ7G5YAaP9mUfbB9Adur8HaSaZvH2YL4WB+tCK49vS/yvR3hR/LD0Npp3GgtMT75
 XfpDmfSSu1SUMzLx3xXrSLbxKKlIOKkjKThwab/fgcZLRYC57tCUDfZ8w5wLcnQpBd
 k53gUOgmV1uSpwntAg09e95RWUgda1vRXRG8NzY4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1ljYL61vL1-0153w8; Sat, 20
 Mar 2021 19:16:31 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 01/14] dt-bindings: vendor-prefixes: Add Supermicro
Date: Sat, 20 Mar 2021 19:15:57 +0100
Message-Id: <20210320181610.680870-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g4q4NUCgwIJUrBM/v93UtTqSQSAKvdpuwseu0fMuzzEL2MxSRWq
 5L/cwr6EC4T09vK8oSCUd1jjaYGt0MqUDK3/xB1wjgsGR+71q8x5Mb7TTnunbJ7TpfSrt1L
 ma6EPL1NzjfX7sVyIfzZWttEFifrehag4H6i7y1rbaJ4pRsbP0QJeghjTMR7r+u71i4zrIH
 82lf5Fg7S0An9XrMlgfUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m6xcw6g5Vhc=:f/uQnLwPuyUr/FZJRu53UM
 yar3xpHibLNDJach1OIfFzvPcNMKKYg8gMB8DyXbWsyppBFStFIf06YiLwRbYkwPBOuaU+vcb
 7p3Bb4/+Gp2Hfpx7uuGYoEVslFUoVbXg3LNMddWc67JkEF1UPP+2Mz8spsM6Q138SCuUmzFW3
 0fnXaln6vj9jSWFjsR4nvGmBCu5jEBQ25CNelJgi7bBDShtD0rAumbAI5CqZcxOR082Oxofmf
 NYF0rgdZsly2n1H10isNcCNW49ALf5Xewn9XFLCNkbK91p0K13gLzto3nZOW36Ke6xnKJfma7
 tfK8RUqPtLaJgIwGzBMXHD8W4fQJX/pTDutsHbE8iKJsVmKfA733z6BKd+akbInDVBaqlfYW+
 1Qxs920Pb7cLo2EYmRbcDaSTnPXnvwn4EAgDh+F3qLY2yD3cnRnxSKSFuv+TfW9k6zA1mP46Q
 FkOEuzc1hRJqUSE6SP9d5WMaamZQsVHuZBMnGX2RWWvDiLPviVOkpGTkM362Vqpg2MNqpVWNA
 DpYcWCvmE9EOma0mTmuS3IinJVJhpHCNQhIk37PghpHJdX3FWtZUCbvYw7HC6JXANXzxRdGUc
 M1rtFZOwaOOUNZSVoDaY/mBOZHZ5uH8mkA/Dr1AvQB/I3i+Zet8J+JPIC1D0IqvGUJd9PyvTo
 kpsixmlJ83+UKR+OYfn/qQ7GXqDYDFGMjO/ivcMQuChfOu9KKIRgVopq9K68wfNgzmKXK45++
 ezk0BOe0t4jRHeeAN0Ah4L6IgdqWe5lT1XSZY3PlSxWMMFUQDvzk+yBQL3BYUMdVIfg2qzdiN
 fZi2PhdEmdC7WKufkKAijKfqPvvbltNRc3eOIFAnY7FljMfF/2CanEZrfoWRf7q4PsUIqlDG0
 dF4UMQWoxVo04RfsQX8uitT3i0LYID0RhWTANQDoH0xE/sAfE8ufKRpiO9rtdQ5eashcS7QMZ
 6jS6IXRALRUVzmwY6hjGCAoTP/+CQlVIfEonOPdSKe2lnPdAfejgFTjgJXBGfn0mG7CYkQPJF
 yHa3vGmkXI5gIixVPnxwh3dXeZvwRhKGeYWxyYXTCxyQEvl5rhW3HlnzqsFZ2ktlv+2S/vgMX
 O+ha3j7IWc7kfqDOk6iQzhzW1AhF4udXGvPgR0uXqBTTAYRBceHUcLFHc77UHFAIIxEnTfa94
 PSd3QPMzolj+4xt4E+lduPrXzd7hxnzvALW/PKBzh15ueF95qISG1Gg0hVoGaUpwx0BxyIWcf
 6F0qDtMt+ZlXzzJDU
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 allen <allen.chen@ite.com.tw>, Max Merchel <Max.Merchel@tq-group.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Super Micro Computer, Inc. (https://www.supermicro.com/en/), commonly
known as Supermicro, is a manufacturer of server hardware.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docu=
mentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424d..ec6d6ccfbbb3b 100644
=2D-- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1085,6 +1085,8 @@ patternProperties:
     description: Shenzhen Sunchip Technology Co., Ltd
   "^SUNW,.*":
     description: Sun Microsystems, Inc
+  "^supermicro,.*":
+    description: Super Micro Computer, Inc.
   "^silvaco,.*":
     description: Silvaco, Inc.
   "^swir,.*":
=2D-
2.30.2

