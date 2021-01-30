Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E03096C2
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 17:35:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSfvB31WJzDrdK
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 03:35:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=a8vBXzNf; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSftG3MBqzDrcY
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 03:34:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612024214;
 bh=bkD8tcc6TQ6B0xOy5hnrRvxDcXEQXOxiPgjHK8m2mBk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=a8vBXzNfo2PP6rM6eOKgCGpCIsXDpQfJsbNQj+P4NkQ/ap3dsu5SKBwMdywPPG54g
 PypJoIYzkVMkoAMFCFBfkJ62ePB/c+7zfvy6PfqK/1H2BOhoJWx4pFxqMKNUN93jU0
 8esglea/ZnEn+gHKQ95SjCzQwX/0DHIYpZITYArw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXpQ-1lWOFa1qls-00QOqV; Sat, 30
 Jan 2021 17:30:14 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: npcm7xx: Fix alignment of table header
 comment
Date: Sat, 30 Jan 2021 17:29:54 +0100
Message-Id: <20210130162954.918803-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ar8P1SrjiMzeBjeLD2FlFDJqNHYVchuE9yDVDvh6Zy+QsFQjozw
 H8WZrSyR2d4RhWcry1Hl/jPs07imTmkTfLjXops3a1WHxJq9o91OASaVEU31u55ne6/FIGU
 dkLl6eYclyUr0f2OBZIpVBXZxMQ5hhtAm4Oor2X7V/K0dGiijU8XSzR7fXP5ApSBR0qUQBC
 QgZnjvEE+V09rjdZh7AVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pTsdGVJlviA=:obU7BIlFdWTWwNuo2gu8wj
 2Dro73Di6QWR85bWhqTp6XvyAI9Xq7fZsygKPlk7c2nCGGLn0KN4hzwnxuL0OQQHpQDsJLUg4
 Lz0Rup/WZa/G9hG45r2bgnOLN45aiQP1wm989Ma+hxz7Ne8hnZUxIRWrvG1fMYP+vJEC2mIC9
 6e7mcrSZkRjk+l8i9A6TPM7S4/HZE4VCEDArw7qj1sugrNCSxWkRuUss+zE8GZDZnkb+IaYzM
 kN+JlqPdxBWm6hw3VgJytMjf3SRrbvKs84V/SdVj4Gh0a4B+1FVocnNRG1u6mX6F06TyjNwbF
 c0XeXLoYTLA5DehefPovVHfbw3HkSslAZ7F7EfT+c4uRSGimewiCCXalzWTno3J3tGW+Lt7oB
 KeIbujPfLQKqNazX8OMQLf59TWpLrOAE9F3/5lCSKoEWVRt5S2POw6eqlVkvaMSgFlY+u6Qde
 Eq6gLhb0tKLVOYntFz+4e0ybMq/pI8QdXB1g9OQWWaNZuCKgjW/hkhEjARjIx4CFaSvmuZWTr
 o6xPPSVSSX4L80nuuvHAmw9mTY0tjM27tlT6QN2O19ZmK7OOLEfGLhpCRHF+fo//Dk5XjW/tD
 zY6bAb1wB8W1pIsZ6CCNEVbEn4+NIWfPovFLKNMq8SoM3Lgzgypohh165KJEN73BxqkZCkSUP
 l9HqDRfT4fsOdEreS3f9kDjqJTPlD9xB1X6g+Cj+K1iiPYXyBrNfbVvY2uagwiQd4ugFF41gM
 5ARlT/5RR4UP0VdKyeg5B8pA7V7JHzIraEtoU3TThPey4SJtHBFKQSHxYF1G6SkRDKZw/VrWs
 i6epDvMFfrNB0vcUYjYVO5r4JpIvT081Qx2mBhskcp11dX5P7qNzMm7nCXwjnaeMIBiS5CD5I
 RvuWtKqEO5FyEOgAMF/A==
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

Make it so that each column label is in the column that it is supposed
to refer to.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index 6de31b5ee358c..2535ca720668e 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -923,7 +923,7 @@ struct npcm7xx_pincfg {
 };

 static const struct npcm7xx_pincfg pincfg[] =3D {
-	/*	PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3	    FLAGS */
+	/*		PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3	    FLAGS */
 	NPCM7XX_PINCFG(0,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  0),
 	NPCM7XX_PINCFG(1,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
 	NPCM7XX_PINCFG(2,	 iox1, MFSEL1, 30,	  none, NONE, 0,	none, NONE, 0,	   =
  DS(8, 12)),
=2D-
2.29.2

