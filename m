Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65F502C1B
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 16:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfzfF2KZ4z3bYb
	for <lists+openbmc@lfdr.de>; Sat, 16 Apr 2022 00:45:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=X43BrQnS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=X43BrQnS; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfzds3GFsz2xDN
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2022 00:45:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650033923;
 bh=U7dqB8UZdHHYcktusZM81tIBeUrwtsptS8hwCJ84BSQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=X43BrQnSncztZRJImZpjxVHAH4tdWwC1mg3TK029fQVe5t3Vsm9FjvLrhx1LEseRl
 QXPfB7Jer8/hIawzsUUqBVtQ7yDc93uB5N4pUNDpvz8lrsR0rGA9KuxxhOZ3zAfjFN
 UHgXT6/cKRSYVcOMTG+oxIkxyh6zXU1S5UAzb7mQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVNAr-1nY3652vVH-00SPdx; Fri, 15
 Apr 2022 16:45:22 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: wpcm450: Enable watchdog by default
Date: Fri, 15 Apr 2022 16:45:18 +0200
Message-Id: <20220415144518.800035-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqVTFanuaMJnC1Z6w6sDj9tgxzWu5GijeIxMguqHBnYYhkokfWw
 13tsuJUSsMhUZHv9NqBNLVpb4mWXfv/4FM0Slnurg0XLe0f+cd1Ijr/BA6uqo8niJv/WkSS
 vvNGpE45FSMC8RJxIIifsvhtGOjXKJIypse3Zi8A4X4OfD0OkX+UipgN1ReTx2U/ULSbWjK
 33I7CLc4644inmVlcDM3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k0u6G8bhtF8=:gQf5rUo2ESTDBT5j/PSKzU
 ZDyzaomijA0GaJAK8H9BD/W7hd9L5qQHMABuFYjd9yfPED4sXdF2zWGKKfK40pc0/s1nQcl7V
 OWtWhWa3Hjj4D+hAX5yD/Gn78cO+m43TxQ5mwEmLiyv6//mlcgpqkvXZOwcWFcKmfO8f0EGsL
 FoHmeFcOsgcIS7mc5/n3DBE6Yl1qdsJfTZYoA/gBa8u0qmmZo2iQ6LB4eH4FnB8REIx14QADY
 LFVDxGFUk5LGHMKbMgkAnqqCw/jFs2yY4JsV8anpp2ygRnJna2aix3pNBoz2Gv43JEmwo2wtR
 ikrc/pnOn69utRlcOmTCrOPcZ97+I1rxWDWdUOnWAH3klnvdsdjKkEgLjWynb2AvHE8GZ4AtS
 UldfvYt2fXdLVXz+H+iOaEGuX1wT1WXNWRYAenpnfsYHVCKFckPsFLGlJTylkKkHJ2yo09G1t
 9Si+98H3s6d0SvYevTylcyrl8tjGsBgruDdv0ssvyWqM9EXMdOw4gnEy6ITO2MS9tq2gWPles
 LvoS3jKlqNJ775sCcTOtSJoxt7g23sCnSl5DibHJPvfaufNgEA4vMrYdVFq5Og3dofheMusep
 egV5jnJ6gxe4ZG2kOOzWlUZ+vPLa7sZbQvgQlitj1mTWdVldmdCWr126OCdrfXVL2b2ipBZUN
 PTNvG3YZHVsx0qvN5qR0hZF/svIvtNvrwSYxPZ/B7R620gFLQtZP4LyzlBtXwf0O1SYOdscy6
 MEm53gzskZdy6oRVcnd63SVjqJgTkC6yZlSDY65vyznx7Rx6Z9pSB1cyOov8OuFg0ydhqw2bl
 pw0KtSs8FP/rkSx7S4NmNd2aN1SzZdoTcvyz1+QHp1mIsdH+qdE3RGTG5ttojm9TsjQbLkkoy
 kCiZoXJul+9fAjctV4oHCGR0vagTTQr8vntt5B0DQbadpASq+Dgr3RkP3/rYXFV2PJLSiUYWO
 qxgIsPC9YdGTxUj/MahYG1Ke2qkIR9Frc0kUCh3/LpZRT2uI7gKAyLF/9ziZUAnqGuNe+nB8O
 4bkns7XGwhAaVJc73tfO2RRWSzxPfIS9sF83+wmdX0Bvisgu3uotsqFf6fnlcc/xNURD2J63e
 3r1iclEMSgGxec=
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The watchdog timer is always usable, regardless of board design, so
there is no point in marking the watchdog device as disabled-by-default
in nuvoton-wpcm450.dtsi.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--

v2:
- add Reviewed-by tag

v1:
- https://lore.kernel.org/lkml/20220128221054.2002911-1-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 4 ----
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi                      | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 3ee61251a16d0..1ae7ae4804275 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -77,7 +77,3 @@ &serial1 {
 	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
 	status =3D "okay";
 };
-
-&watchdog0 {
-	status =3D "okay";
-};
diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 57943bf5aa4a9..1c63ab14c4383 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -83,7 +83,6 @@ watchdog0: watchdog@b800101c {
 			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb800101c 0x4>;
 			clocks =3D <&clk24m>;
-			status =3D "disabled";
 		};

 		aic: interrupt-controller@b8002000 {
=2D-
2.35.1

