Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5709342E6E
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 17:41:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2mjr5WkHz3004
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 03:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=ilrWU23s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ilrWU23s; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2mj93MCpz2y0N
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 03:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616258433;
 bh=L26U0dSxXV92Zaj3k91eaUjljjT8BQetpl9WjDf6874=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ilrWU23sAGX2IYU8loALRr+957bF+RDbf7CYTuaclrHh+I7yVOe4hZ1d9NYB7h5qN
 tn0xOrjCYwIpeq+nkjP5BARzmeSHcv4NBcKsgd3JkfZqqWU0o/MBNvb0FBXXexQ+sD
 QCZaD99+4wbcduEJJhknTxKruA0NDNxJ/ys61WAo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1ln7X30Wgu-010xBv; Sat, 20
 Mar 2021 17:40:33 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH v4 2/2] ARM: dts: Add board-specific compatible string to
 npcm750-evb devicetree
Date: Sat, 20 Mar 2021 17:40:22 +0100
Message-Id: <20210320164023.614059-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320164023.614059-1-j.neuschaefer@gmx.net>
References: <20210320164023.614059-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:21kWaxejy7e7NxgQlEvkLx2G+V4V5I4UsiWLRFMInkk9qykpfZO
 /48Yk+VR8pFFR2gz9lBCSPve/2ItAOhLMNs2l+FZnMgZsxZnh/GMpY2DQsmD8CGyZTNFjNL
 6f5T2mJOr0l1xaJjVauH80F/NIpOOwA9Tb2inzlM0QuEux5wd9/cakbXY3hSRpYm3rip0Gs
 p60bFx+vIlcf87JPH3uXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T7u96VjaVqQ=:yS9lxHNITsi5drK87khYQL
 LYCyFbqwpTJpBYEwJZG+/Qqg7Tn0Mg4DDqqBh95YDMOjARmo6t37ytswBuviKYCurmP7+wKMS
 Y7yLAp5a7YfTqcrv/C3qiF8L2e4nENz3ch3Af/Fy/paOBPFxlAtBXHWuGt/mbpWmpufSnIUes
 X11NApJlczPOpNPT466l0zalF1JT+SYkz3MJzMdnBwhY3a16vEJZ4SpM5HBrPPAtEbnmjhtIv
 gPv3i1HI/yufiBeMizSnkHjqITJ186bxNBFt4LskTTK1l0Mb151HYe+YefKztGiIa5LVAX1K8
 z/Nuu2iq+cy8lRwS1In675dRHyWV93Q/i75xI1OGVUKBWzoqPGk85eugA/9sno3h+C0/cuwcj
 i+lZ1sf9+tQi6tGs7rnmiP+iWNbvXBM79DyI2+eG7t7IWo7kr8DZV2z12RzxYMOv2QfwUfuZM
 qvDK68FSx0KAai0Bv5DOy4dFZyxaACcul9Er/6rGoQai9Jggi4db3/uonZK/ZzCPOwjaH6klj
 GmrKql4MTsi4wFxIMgwGXhcb6OgiUM9T/RyMHd7FmYIA9iJNYPLXIo1MmXp/gYsNyaQHdtF1H
 E22zAA7nTUTmDaOvBP+1ok/LdR45GLzWxY5yfdy7uZGpakHnzqECTfHIuprGE/AKPeoVJV4ZU
 quLxIMor634f8D8k31HL0m4ucv7+egqgDBhOh/Z3LyNKKnSg8DHY03LCjhBttri+2JVEplY1y
 ipnV2FrgdHtxgbEjzrGSN7UdLl4LcpsvL08W6wkmaRUYZ1pgAydjObIwCj0Q5eSvDahbLT4mX
 BuFZ36V9hYn27E5sAB+8EHlYnTEpWJypdgNcPf/zfQ72PRSSyUCGY8OUA7iVJFT+LEKWz/zPs
 6ownoy6/7j4evJTJCS3Q==
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

v4:
- the same as v2

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
2.30.2

