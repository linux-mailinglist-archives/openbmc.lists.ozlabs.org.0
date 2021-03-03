Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0E32B90E
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 17:04:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrJj84Gmkz3cKp
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 03:04:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=T06HiFZI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=T06HiFZI; 
 dkim-atps=neutral
X-Greylist: delayed 717 seconds by postgrey-1.36 at boromir;
 Thu, 04 Mar 2021 03:04:14 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrJht0kV4z3cK8
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 03:04:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614787180;
 bh=6Klx+LARlH5Cs/YxTUDW1nPNa3j7+K+6thHFi7p4CDc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=T06HiFZI/FcTB7EbCAlsJTWt97LobgNrF7WFrCQVgqE+HbKhdChIQdbWSWp0PFU1b
 CpmcSP7GX1iwTPU39ZhmqMJPrr09bsfGTr2JDh8buc8H8Y/YYcb2t33lp7TmsEcdTw
 zEKu68qmcPPmooLIMNs8RrByfRSrnrmk19kAPo9U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCOK-1lTewi04sm-00NAoC; Wed, 03
 Mar 2021 16:47:32 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 RESEND 2/2] ARM: dts: Add board-specific compatible string
 to npcm750-evb devicetree
Date: Wed,  3 Mar 2021 16:46:20 +0100
Message-Id: <20210303154622.3018839-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
References: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oZazP4cwJZAwbnbneWa1/KK2gj3wzLE2XLsYWmGXk3CjSRbfvMF
 48WVhwdzIpwnyXALsuw6Kf0JtAzusEePLg3qpNFm8NuhG6ZAaKCWpGgQeRcfPS9A9ufIKMa
 N2k76/1dfqa7IHeZxlS2kcPkGBSH7W5lbWUuD4jItsf1CdwCdLaEuh3umHfAargzddIfRxR
 APd80CkmU+7Pdu2nEaUBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OcJFblGDn5k=:ZEtyGXGoaflX5j6CeeYZZt
 NoUKV6tRFSssaRU8n6Ig0TCPyodtle7u53YHLCb5Cf8Ve7A679gMsnoAZa2pjIzZ1xQx4pWbd
 U1oZJlZr1MrgRkKjgiH5cvb9tPNrOAEivUpE3dpGwrHr4KeKxFjsceRPGMIdUj1jKmD6HvpYo
 seMd2CfdshQV7YDewqR0eBEH57LvQDQRwbKlr9QhZtIyH4uHhFyIQXpO/ynH5CeK8m2ko6VcA
 la87cRaFjsN6W8AzsyKoJ9CJivW4PkuaOhGqjKcoRGg26N5Q1YpyxD4LEoa8oOT9B2Emf67bZ
 8K20yM8lOcXq0GgQbLbeT6rDRJrfczpchgiPhZC3V0L9nfEeSl0d1mNseAF7xrbRPiztOpxg1
 Ir2etf9nC063ozIH5pffxjU5W98iudK4vOAznSV4P0AVqzonYHuxn1+4Kzt0vWVIdTG6io3Sk
 7iezNpqZpipDXep3XR0qIZI1BrTAFSDAsVDwQRZA/TaI9nPxm2i0TzUTYCuaLy87Qs9Fp6UW8
 va+mpcIgqqdUR1jYSFA49LjunijhFocfn1VT/68PYAx+WjI0c8FjeanpfuqvN8Tjqvmou+u8G
 HkQ8ij7EOOxxmmHNMsZFijYdCDMY1s6mu0EczVJ/Gy9CqqWKGpPBO6X4J78Zv6bA/eG0BJrAo
 m1V4jc9K+8r31092ycx7/rOUB/LpjvR/8OtqbONt9x4HTwJOdndyC+Nt1k9Davfs2/OBU2Ufg
 FeYqMGjTob7fNEFlkVeDFH/FlyQ/SmUizHQihj66RWe0C50r9+vUiWuJHJnME6vjLZM/k+pwF
 pjKcmRT66kCvsKNs5MwvDRnXFPFK4ul6g8cl2RuCtxnUON0vPot8dCVMRMPdHLefFDUMkZhoC
 mBQJRWNy2qI/4HLA19lg==
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
 Patrick Venture <venture@google.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

According to the revised binding, the devicetree needs a board-specific
compatible string.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- no changes
=2D--
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts=
/nuvoton-npcm750-evb.dts
index 9f13d08f5804e..dea3dbc4a6a52 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -9,7 +9,7 @@

 / {
 	model =3D "Nuvoton npcm750 Development Board (Device Tree)";
-	compatible =3D "nuvoton,npcm750";
+	compatible =3D "nuvoton,npcm750-evb", "nuvoton,npcm750";

 	aliases {
 		ethernet2 =3D &gmac0;
=2D-
2.29.2

