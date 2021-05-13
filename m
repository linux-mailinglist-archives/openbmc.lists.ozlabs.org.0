Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925C37FB50
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 18:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgxb954Nrz307B
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 02:15:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=DYTOQPcD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=DYTOQPcD; 
 dkim-atps=neutral
X-Greylist: delayed 312 seconds by postgrey-1.36 at boromir;
 Fri, 14 May 2021 02:15:18 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgxZt4Znnz2xYk
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 02:15:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620922514;
 bh=yHZOanl+7lAyfwZ0IKQ6jvxuiFtoltCg8sl+03ShmH8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DYTOQPcDlWoy/HELDMmV2sXN2YdsKIPtSD37Wzu4YKGYT4mrCRcjAjsFZQF+f1CCf
 Wc8qwqf8K3LR1Zx6prlORFtYd1neh60omR8VKhXNq6nj3L9ON67FTX8RXgUjDC0V1m
 dpbGY1fTE+HxJ+Ewgx3OfDwfo+WsVOflw7eIr9gQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MirjS-1l2g1U0sFQ-00eqXh; Thu, 13
 May 2021 18:09:52 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: npcm: Align a few entries in the pin function table
Date: Thu, 13 May 2021 18:09:47 +0200
Message-Id: <20210513160947.1716185-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4D7VmaLIN+x85KYn/jYiQDttmjIIFuuEsO2Z9vGGTBF4nN3Pbyy
 jU2CGRW7MY+T05JPVnU5O6qUQyKcwTpeX02qZOnpddMw4sHu3ENMXIv0sh4Eo5r7icFf980
 EhANrto7NeDtge2KIaIe/BEy9Rjciet6NG3T3UHmmeJNRHVbiDf31W5YIk6jY18ejr9kR5/
 cqUHc5RnuRndhF29Fd39g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uqn2+sKRnss=:YToTK3+LRK3AIF+R4M13oW
 QctrXHZ5j66570shSE4MUAAw65Ivrz570DzegfIbs9Bn9AbBz3Bu1rpLNrZ7KSTWAQ0ePPJta
 Ifd4uR5jqwGIGGIKklEcEssAsXTbX8vh2jzlvDLIN0RIBEKsB7iRrrViDl+N9DnIghIYtk8nR
 +VRXb1zWQm+LYdbHyytAOSUuIFn/oefXMpibr5oAG3nl8wxHWewe0sLRLwnZx5PGlFqaubxFI
 TdDfWJZcerYtKLifaGjuRx6Ov2uZYHN5bBZB3s5Ob28pB/cPwctpjZcd8f/EMhxPXMifpVzb+
 zxQ5Sldn7zNgMe9Iq9hKTiRSSqkcoGRrNXjWe/2SfxceSmc6U6grMYNQ1FNQBTXGIOR7hY3N7
 Y8aO/ueIY8CbJTF5mEWWkDNVqW5k1OTws4MkTxMPgLnV/d7O7bS8wwuzbFwT9uaA8HKWtwmu/
 1nzlhCoHZp/S/pMSubXuvVi/pgCVZJxSW2SpFT2CPbs+5ePsQfocQWd1yK0hoQm4t1rkcS4yi
 8HwUgOxpokOxDvMwfPPFREcWbdu0FCQ22IhKFWGAenfhoZRid5Y50lF0b6bfTPN/rRHXfzCs/
 KyQ+3ckys7Y2sma9fHf1gM5IehmLB0rsDG9b12jbHYx/KvgboLqcpow0rRCRv9URfhf1sUjSe
 lWi7/p3CFtmJ8+JkpUkVrXdAoLekAB5+pGg0LEMMgrEiBcz02bWEK8C8JVXxbz5gSxws7ntUo
 6bKzZo3Ov29uNnCbFFq9GGzhb989xtCcec4fhQz+IDoDCes53KxnbDekLOkOKpnbjhS6v6w0U
 2zXx/uI4R2CtKtfNX9rBd+dikx2sBrG8PR/uxCM6k5ysHsfdXmjreEH41HplLN+myhdU6dL+l
 sJ5WUCJ6+ixh5fifhp+Uplx/kdLpMaYuvwhwYClp7pkpwMzS+Xd1edc6ffEuKC1r/n7BssyFI
 gmwU9AqGPWt3+AhRcaIwTbzeV/0ZTxvRRBqMN9BxGApvC5ilh9qH2T4PaBb7zG2nfhJaR5wIF
 ornvLtlltX8evNsi3QbuiGu6qK30u/9RXOzgOGPIkrB2ez/YFp0PBVmJ0ytZ1375ql7J0jUxj
 fAMpG63T+MBTOcHX7u58n6YroMg9epDXtbDs/7vg1qHSaI7rscIoMMQCbaW4us0FIAPXt8tBe
 8vCFWyibyfOqrJ5GAWlVtIjTzdbq1ODs2geYnYMORtKKVpJuNzhiaOjP9Heyluy5MRIFFdUWT
 d7qPg6906AS3LQv2V
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
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The entries for GPIO 33 and 34 are not properly aligned. Fix the
alignment.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index 2535ca720668e..bb1ea47ec4c60 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -958,8 +958,8 @@ static const struct npcm7xx_pincfg pincfg[] =3D {
 	NPCM7XX_PINCFG(31,	 smb3, MFSEL1, 0,	  none, NONE, 0,	none, NONE, 0,	   =
  0),

 	NPCM7XX_PINCFG(32,    spi0cs1, MFSEL1, 3,	  none, NONE, 0,	none, NONE, 0=
,	     0),
-	NPCM7XX_PINCFG(33,   none, NONE, 0,     none, NONE, 0,	none, NONE, 0,	  =
   SLEW),
-	NPCM7XX_PINCFG(34,   none, NONE, 0,     none, NONE, 0,	none, NONE, 0,	  =
   SLEW),
+	NPCM7XX_PINCFG(33,	 none, NONE, 0,           none, NONE, 0,	none, NONE, =
0,	     SLEW),
+	NPCM7XX_PINCFG(34,	 none, NONE, 0,           none, NONE, 0,	none, NONE, =
0,	     SLEW),
 	NPCM7XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
 	NPCM7XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	  none, NONE, 0,	none, NONE, 0,=
	     SLEW),
=2D-
2.30.2

