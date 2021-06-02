Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5A3988EF
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:05:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw75943D0z308T
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:05:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Vu/c0Q1j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Vu/c0Q1j; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw73v3Q9Nz308n
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:04:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622635441;
 bh=UF4oW0j3C0UfuvEjFkldudNhDCIgYlLwBeW1fCc59U8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Vu/c0Q1jEq9mvmdEVuB62V2tyhqqTqPiKlmAAqFoqUsVPcRgeb0COHeJf7Z/x7wlJ
 LkysuI2THlyzWOR/wxIZZkwtkjOkOvbaBGFiw2DzGTs2WlpbWkNhyaMxlDkLvGfhfn
 +/mXK2U2WOam9hcuyzG6Vu41ucq6915sbnqdv5Fo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmULx-1l6F0r39px-00iTnv; Wed, 02
 Jun 2021 14:04:00 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/8] MAINTAINERS: Match all of bindings/arm/npcm/ as part of
 NPCM architecture
Date: Wed,  2 Jun 2021 14:03:23 +0200
Message-Id: <20210602120329.2444672-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pj/CAwCpQfjiqJUIRfxtRexDjyawbqBoG1pzwcUmblWyiF1GJF8
 VOkUSCbeMuJ3GvXWqH+/U630vfzhMbRvktMv7XAbWeEFTCIdjw+z9+U4/seMg4zyx8j/Sdb
 ofHNkyR+Wx7ARPFOgix4UPL0vJzKKhCYBmGs+rI2bfAOeAsFnbZgb7GQ98l/ViUodx/rMnm
 BobamMkegklHiS3ZbSq/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m5wUD4NWZjU=:wJrbsrF1KVy38/aR2Yf5XW
 Bmpuw7Y9s3OJPT9BnLE/c08gZDRYLo60hnUPUwFrcPu6gdSwtfrsc8KtqMfAgF3hi0qaG4xQx
 gl9cRVcVGp8BtnZFaFmdHNpWAb0i+PA0Ix4HBM8qfnFUyyoo+wz1iPErSYP9XgubGBj8uX8qe
 OJIor/UQrccUrqpWw3GfgPRBj38oCrIvkRVsfhAQ0Oe96Zzw5hqOB6l9xpHVpRVCZsJysRotJ
 f1ZzEZcHmZraJweGkVpjVqfSOzGrOcQV+mFRGsXtGdQqyB/PaQZxzxceLp/g0mUAUVuxUA84a
 2FEFj1a9JRr1UMDzLhO32bONaaxolvPivbZrO8uwa2b/sPkXQUh6iZ8Nk6FPQFLg808Epm1+q
 rdXoqU/vln8wbz2/cDEn3AvpFWgJv81m6TGcGnnfwH94FZq4dDu4602aQQQo+S6u/40LQEWNY
 /w5nyNDdA9KzpI9UpiCWvJihGn8cODg3bP6bLBE4r+HAfU9MUaeJUlY+Vo3h8E4CsNfIzluMF
 FuUXmTs2ygZwlQ0/8Pi/kze9DyunXPN+KyV1+vM/LblDsv0eii8mYtNYD3QapWgALL8kVZoXP
 Xeggv5Z7wqd0OEY9MUv0G2cJZp1u0+Vo3JdR44bgqBToPwfcspkqEgVJfcNY9aOP0jcrKngeY
 53Lavzrh1o8yH3EyVkiJMebTfreED58WMm1ejA5x4Cfw2Ltm95Y17JPHlwRBNBL99j4pzTDLC
 5dA5btQWbw/txARQ5rsN/rWgyYPxhkdVkj5Upkp9d6AuNRndi2bz6eNjsnJJRSM6CFYJlXT/R
 m5+9WoHpy/VdREHx7bRIwZaesEpUbNz/hUNk4KPphll/exb5tDuH2WBnKA1Uaz7iWu2gaeRr4
 3QsqgVFktlTVzB0fuUifC2gvJ6NIBHpIGv2y3vxHhiVtHwg7a8ufFCawUOXrpskddhR11TbNL
 fAXh9WoGHkHvIQ3WcfNasgrLa+6OnNRXASZUP6LL21YszhZU35w34pERYP9tfrkOGxTd6dG/W
 /neDy5Dd1q2AGGSBoHM9PtrTu3oU7lNaKhJb3z7pNzHEerALsp6i9CgdSlTX89xXcNeQ2yuQi
 lMCRQMogNJlbHLzRh9pf9AVNiSW9rW8kj5TA6Nn2e4IYorQTyA4LchNuA==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

All files in Documentation/devicetree/bindings/arm/npcm/ belong to the
Nuvoton NPCM architecture, even when their names might not spell it out
explicitly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 79fb23f576218..288d6a1f2bb1f 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2220,6 +2220,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subsc=
ribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/arm/npcm/*
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
=2D-
2.30.2

