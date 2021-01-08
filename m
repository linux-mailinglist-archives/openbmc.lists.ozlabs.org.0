Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D57832EFB4A
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 23:43:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCJ5t0cz3zDr95
	for <lists+openbmc@lfdr.de>; Sat,  9 Jan 2021 09:42:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=UzFum2fG; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DCJ4s4NTWzDqRt
 for <openbmc@lists.ozlabs.org>; Sat,  9 Jan 2021 09:42:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610145621;
 bh=zoPbxKl7/h63Lb9FVRa59Ce+siBolFFjisZwdmEdKTM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UzFum2fGUDHoGZoFso450mnTY/alpDyBq3w47ne4HC8CI825F6TSqT5UwpNeRygUL
 1XJ7IjQ9m282trM0VDWCzPpRe/ik8jvUJ6QXJ5LHoFMgmSSrifCrZd2NDOvA32zApo
 yAuZc5i4+PwGsGF6vKcNfdktH+TM8oOi7S8ECqzQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1k9HTh0jKi-00okPe; Fri, 08
 Jan 2021 23:40:21 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: Add board-specific compatible string to
 npcm750-evb devicetree
Date: Fri,  8 Jan 2021 23:40:07 +0100
Message-Id: <20210108224008.705687-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108224008.705687-1-j.neuschaefer@gmx.net>
References: <20210108224008.705687-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BhfwAak8K6CjNf+mZXSVTbn7VQ7sg+KrjOvjneGvzbDUST8rpwy
 ICs1qJJHjO+5CopzxrfyT/AhGBBtjE8BTzm2GqBOt7Tvd6bgZ70Dx4nP6Wr+Epghln7fRI9
 nLTLyKpdakNxCyAC7OBkJyjROdkv5lq+HQZ56hjN04caCEUNAHVwiaBVCEz2ND783Aqgn0g
 vbS340YVp0ihxUpbhSpww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NoMWTY70s50=:lHz2McS2sj8PnBtG1DnL7r
 E13SqSfiCJ35zDFvTEd8sZG1Z1ruXBIz2LdJzVJEvHXGRt3njloPegEha1SncHuLfM5JC+rsk
 jdd0brladGXztdECekFtaTPUdl6uIcFPluVtvKhbEjuo2HpB5SggC9XVH3KB7U9wZk9Og7z0n
 uUln4oiT3pEQ0NIPJVXYTalMM4m3hb7CETQv+6Par1CxhYUfJb4VMEYL8evr/CTFtbKWKc9sD
 8E/PQyTGzV1cdTyra4oXn19b/t/dJEKmzifEIZkkJcqUIauZEhuAlwqA37A6ItaWWa/t6aaOD
 20PCQD39o/pZBnrOFrEHEAYP/d/NXxl4308n0Wm69KTKjxwPZsaJihiVzF02/9XrL08b14Xt8
 jgiKerij3tkx8404FWC1eMsjsOTX5y05PHejMAgyvkWVBG1qhsIo0jWvLlJuOECjUl7kPN2nr
 Z0kwFy4oyV836UjkvvRKLCpC8/cyj5hZpx5oPImIRje6AdvRifS67zpV4J27IvyFXEq9p54Tb
 /TjwB45Wzjhy1VlOCmyuwDRuvKs07rqDSmVoOIh33RZS72zIMFYh7Yw1FpnLSMphbHxhGi7dK
 lg6gF2FIpk96iAGP3jRkYjh4hD8pWx7dVK/KBp79Yvdu6ggnm1b1TQenXz5Ts37sMlQ1v1RXL
 NCeRssIcYg7CKmqApcS50h0eAZdbjXopeIqZftIDpr0ytTcZJyPbvlv2n9a721u0KaSnYZ9jv
 ZT5IHVggY1CuJmdt+E/tsdKflzbwoQioc2geFGA4j5TkBohhEx4BDDVz61jlR4eUnsTBb2NEy
 x01qLHei3zaDe9TFLhQFZb+8l1t/Yhh06qGwOpYvNbLIxL9kpcQUTgBy7C3BHyaqM0DBqyQuh
 K204ho3PGmagv2qq3y8w==
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

According to the revised binding, the devicetree needs a board-specific
compatible string.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
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

