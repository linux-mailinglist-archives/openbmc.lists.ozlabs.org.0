Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94380342EDB
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:20:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pwT4RGVz302N
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:20:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=g3OXfFxr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=g3OXfFxr; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pvm5tq0z2ysp
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:20:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264379;
 bh=TU6WBAPzVDO7B00swZvzPrRfFyWpLBe23Iol3zeiJoA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g3OXfFxr6Xow5CZNl88mopUYU5Diqe0zCqCjZlXb5mnmUvvSJ5ln3YsxrXUaakdoP
 lZs4De0U4Bwacb4vxvuxtDx1ZultLJ0TNkh9frnTHXwPSUf8goUcFwPQHIDim4XruQ
 5uqA7CY5AihreseWZFJ6peBqC18vNZcR9jQ5hNhs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1lJnm91ygA-008Fum; Sat, 20
 Mar 2021 19:19:39 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 06/14] dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
Date: Sat, 20 Mar 2021 19:16:02 +0100
Message-Id: <20210320181610.680870-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MRosn5bF+g2SROwPwzbUHCsmCbOlyjOQUv2THarZOxmQaAQQD2k
 ncOXTCTNLO+wo+uPNy3hLdjHN55PtLYzCJmQ5ocSo/HSaqr4GtNrkEpr3kTSJnbrANeygaB
 tNeGmhoYB0mWXfQacs1TyMqSuHlO2J09Z0c/QPBvgC3CKoAmbUmyJ4e9CDCouRQ/Z7U0y/f
 394jjgpg25611JSlFjsTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E91Xlxs4Jbk=:6CjXgrMerJph80qMnjXQQI
 Q7zLVho92ScyYf4apBUipa4iEEnZl+paOl3U54UTG+cEHBR9CzrFJKUwTHc3tx9ZHcMA+AZHt
 3jgoZiVhRuvAPMtBligZdne3FoFme9lwwt1psL1PC9RS1iz1okZQPNKjIoY8Y56o8dHvyLU7A
 dUXD6hUgfzl9dEiF1VCxtgatyE3dYrneRgHxd17yg6rCRh7J81P+Vl7jDcgHpNHTNAay+JqL2
 uOH/vsh9WbUPQuueguhOsh2D9CnIRtljaoMjS0ZZLznaF6MGtPE0fZzMGHdSZSr46pST0V4P5
 q8juzrYYVa5JAAqnYpdeYzRurCfBHksa6Q6fsaTU/g70Gxeue7WAgwpykAIP0YIr1+6+fOGB5
 p3aidSRlOCsr67ckYK5oKnzQ2dl7C3zSO/mI7p5eeTD+vjVhKd0+ggm5s/yTr7KIUk0rgz9jb
 K3IXDNTGaTw9GYc5VsnV1mOjpZxKR5cLf+NF21s+VEPtjwxooGQwydhSN8FE7ijUtWMMCtefD
 CVjaC75v9x+v3zdLD9b4N4aWREV0mTYEvXQ+rrRti8VS1Fyqv0NPaMMHwKbJps8WZseVmwPHR
 PwuFiEVGxcs+yrKbCGCEFfHgI63146kIz3blIN6ZlTQ+J0t3FHEG4dJhKL0JLaWG6bIYOPHHs
 tikGQYevsJWZiXOeIs7knsKzPl+NYIshzYcSKkgqNRBr9kkiISEW3gZwba+Ve5VHy9KiaSDTe
 UsHkWx8nEvCBUSrDBlf+I80YvCb7kmH2i2XRdURnnrNvRE8LJl6G+9+CRvJSxIqvS+DO4ejAD
 1znD8lvE+ziydkZvojNTfm8fh/iASFyAGBcsnFyxKIQEMe2WSKufKEygL7TZpDCbzED4/G2Hx
 W0+o0MOWwN26l0wJxBWw==
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for the WPCM450 SoC, which has the same watchdog
timer.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.t=
xt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933b..9059f54dc023d 100644
=2D-- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -5,7 +5,8 @@ The watchdog supports a pre-timeout interrupt that fires 1=
0ms before the
 expiry.

 Required properties:
=2D- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg).
+- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
+                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon).
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt with flags for
                     falling edge.
=2D-
2.30.2

