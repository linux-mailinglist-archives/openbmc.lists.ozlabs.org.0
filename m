Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D619488B41
	for <lists+openbmc@lfdr.de>; Sun,  9 Jan 2022 18:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX3xN29X3z30Mm
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 04:34:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=d/vN6wBy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=d/vN6wBy; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX3x01FFbz30JN
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 04:34:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641749656;
 bh=taSe74XlwBpmhJ0j1x0XEjHYq/VEdG+uKdcA54j4lbw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=d/vN6wByFgYgDyElXm5kbOfiTZXw9EHrwI6sXnL+3BFCh9JOpnNLanHBFdjxatqut
 edj338np8NaBDW+LyrvDoHHT0liFwsBBE+1rMPFnCrJd9q8BCrzuWvVuwW4sQ52cCV
 bAntztQItSXKsLyTKLvXiMHAnP+xR/rw+ui+7vmg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.222.244]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCpR-1mXpIV0mNr-00bIGq; Sun, 09
 Jan 2022 18:34:16 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/9] ARM: dts: wpcm450: Add global control registers (GCR)
 node
Date: Sun,  9 Jan 2022 18:29:54 +0100
Message-Id: <20220109173000.1242703-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dfQ9ODRg8JIeE1gnqr6ntlsmbtVZdw0XFEpZB9G7GcdZCGEfSZE
 VT1wKiFnkI1Mi+58kZMlAhToRhphJRY2YC+ZbuTLhNu3ag5DieMa2mimwEa8RxiNNgAftII
 yQ6fkuUK242PYWhUXmmqqSpNR1vjKu4KfJ5pOtfGGXnYrs0MbMos43dau91Y0JCeqj/XZtA
 DyXrsu3OJUWM/CBytmsCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1UqqEqcNczo=:n0BnMDnrdVuD3koEdsk1fP
 98UM1zsmal32BaD5HG0gNOXxbypsH6iGYYcY4Vxar319pKjJAaoRQ/c4QIum7QjUReegNYrSy
 6Ek4CC9WZoqXtMSloiCYi/PQVPbi6zZPbQecK28qjkF6xT0Zz3m5pJR5mW9Dz7fKJe/EqfRVc
 CctL3HcVOiXz5A2Xmo5K8wOT1vDR3x/Mif03KKnAKF/XTyxDPTDxP596Q2K7lLe8Tm4ZiAuLq
 U1vrCabwZuvLhN0TF0t7+qYS04/7v/ChEyhW/pb+qFcnK7FBBg2lAZqgsx4El3+tJ2D5PCSBI
 Da26Z+sh50+4RRe4bYK7i6dLrCqEVkODZG5HWqUpCoNpBDJyPPnrxCDDks7cjkR5sRm/Zf7A/
 xNnWPrLQn3j62TQS34TmG8/vimchb+udZ8StYq8n/qkqtK0BTuia15a4dzv/vfAFeJMtCSUOy
 1JhsZcDSrta1XuvTZQ8jdrbiQsvEW0KD5x4APfP3yQfyeJ+BKpaYjJOZd4Q8mUtKLPSPDTits
 kNGEV/UKRsGJG7s6r1chVYf8dzK6G1TlFqCsrof///NTQans4Z7ZCFFcq4Gg3dHI7ITEFo7PL
 P95J5VVw8m5eakTl7YXENO+fo9iWjwsEjV2kM5z2F2BkxfKQa/1bqXR9BY4xw1mVvrwMPjAEf
 0WkLbZ97Tbi/7J+WfVtV05YZwfudmEqSqeLcEh25cUIBMQP8FYEPNvni9SZoyxmcwcbyhfjjx
 FwNVT8tzxQU8cHR69Jgq0mNdeLSjnh9lQPkNAhXXHpv8EZ9YCbvJsubrFUhJl/vgeL86dEcx9
 B2MkwZXj61qAwmGi3nqySa6l87ANKDXScRtHZNhLTE0Wc/LMYAt4odbOJTx6aGUo/aznc2lg8
 P7Vd3sSgjy2BMdTkThTijW+WGZTjn0qz3OpLxr/lqrKZlTgRqxvn5GOQJHsG4qMp9MKI5kmym
 8VFRZXy2ijuXT5RoplF7cH6WwC/A01MI8+s57x+rNKdAB083qTGLrrBchz+6HTRgfR323WITH
 0aMl4pSNZrQjOhP4eftHb1yNnwZdW/jlBS0dI+VfLNTRcRfY4/TUcaMEjCuaO5Rmt6oaErGfG
 eUC8aEquhQz/LQ=
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

The Global Control Registers (GCR) are a block of registers in Nuvoton
SoCs that expose misc functionality such as chip model and version
information or pinmux settings.

This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
enabling pinctrl on this SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v3-v4:
- no changes

v2:
- Rename node to syscon@b0000000

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-4-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index d7cbeb1874840..a17ee70085dd0 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -33,6 +33,11 @@ soc {
 		interrupt-parent =3D <&aic>;
 		ranges;

+		gcr: syscon@b0000000 {
+			compatible =3D "nuvoton,wpcm450-gcr", "syscon", "simple-mfd";
+			reg =3D <0xb0000000 0x200>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.30.2

