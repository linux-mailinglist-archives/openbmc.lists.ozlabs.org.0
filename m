Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD04A8563
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 14:39:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqKXR5kRpz3bV0
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 00:39:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=UKllb42H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=UKllb42H; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqKVl6vJ6z3bVd
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 00:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643895469;
 bh=dVQvtiYNG/u8hhm5TCAZWN7w6mEpUbXMDEqDpp+cwqg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UKllb42HDWqSNakMfLbztS19v9oklsxRbys12ZXdRMgpeOdZMdp6iCu8aHv7FmW9R
 USQDzGL8S3/qArAzTWOOVcVdLtWgQDehAp7KMkz8eBYLq7ZLvKpOiedSUGSqi6bzkK
 krsRX7KTUGDj3EhYdrwetMGuKF7BSxhdfzZrfauM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.41]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1nFLK81h1V-000JKe; Thu, 03
 Feb 2022 14:37:49 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] pinctrl: nuvoton: npcm7xx: Use %zd printk format for
 ARRAY_SIZE()
Date: Thu,  3 Feb 2022 14:37:35 +0100
Message-Id: <20220203133736.246397-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203133736.246397-1-j.neuschaefer@gmx.net>
References: <20220203133736.246397-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ev8C5HPXf5F6AdznlPPqrkzVikHuPo/BTwFbnffVoGyTgqugcla
 BVyWbg/Bqt5AKR++odH9Mp5MLch1YaVsslHO5M6BEf8GwxLUdGd8HNdgYgYR8YGbH2U0Cg4
 8E6Nav45wP44QMoZx/FNGz5vai+CSBnWKVCEtO7uFh9vivQPGs4wYYv3YrP6U2egXcKhdX/
 rgc8/oF9MZe6DbdkSFj9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uBWBzNVTT+A=:qrCus2zoEg9UlY3OiMdBCa
 gqMI9/NiDzH3zlGzHlcVVSSdjq8TvnjUQ3WPvWDquT2kwK0LH+HFNnrWinEeHidCIdNnbmT9/
 qStSrsudPj0waJxIb29QniXs8dPt0CVnbI8fpCVTY5iL3CmOODNbZbSSDA23Lm1EHzKoAbVai
 hyPZdsAM+AjgBq9ig2SGKGE2A4iV3kp6tvV2dcJ+GrD4dPTG+c8r9wArb9K1YTaOznBdHcupl
 3n3oGkc+1cQHzZobuIJP0EItI1QmJxfHAUTreh/LNuNcTUuk09QQC5CYD+aaFoE+lDbQmjzOm
 dF3cxWcIsJM2t/VIg/Gwob8iVmpB04+/apzYhHP/Y69/2YUmJsoAcfzYV/zt3PjsH80vk3ag7
 3NVuu9NXMUGUvOHzHlbj07SoTHByhkKuBG87//HFL9gTTwN3P9sAiv4eWngZCzIo54x+lHghv
 0v+o5EqxBet5Hx15JKRA7aCN7UQkK+MOWVfNzSb/gdUyCKFBt8Lsv3RZNTHAGjZkL1lQCkz8i
 BHckbCItyP1LLdcVKuGcRzFkzmFPxFFAVAVA0+9XOFnrl+vZyOX5/1ZYio6aQLtD48p74/Nl+
 IyuoYYrFNJFeIIfaK3d5m1nbcRyq6NrCOLEnnD0y4vZ0XuzUZZszZ5vbNIkuViPG1LYtcpCeP
 AhC4Bxoy2xliC0Mz2lnBqBDYLOkyTz24AvXaRCoAMYmFUoicK0yuDRQEyELt3Kzy3ZSGSQ3bI
 jqzJ1ObYU2Y9S/43D5sUxG6m+EdkA62QC2mSxL1/0DgHcp/F9djE4qhmS808YktwkCUL+nUQp
 2HSOQCalfQKSDstkToN/J2RCfhSF2hkSzyJSlBet3MTt9zfWbbUbqJX3r3PO1uRWYIZC8IbRH
 dNomKD4whHetZ7aOIF0fCGTmfceM69L9VT/bzrvil++hlptByXiaEV7DaxMqtE+r8pg0uaZj7
 9XYCHZ1h86VaNgLZk7g6lZE4EyR4cLqSWAf8xGbBYfGrfqrXK52aHiZ/36gSVaGnM4qEoXBVe
 nQncrTgZeeJgW+Zy0jE+VfQSQR6dzdE2eQgDGxBU4It6nOYE8eZBMy87ICLvdus9yeYehDebX
 AB/r5sEvT4u+k8=
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
Cc: Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When compile-testing on 64-bit architectures, GCC complains about the
mismatch of types between the %d format specifier and value returned by
ARRAY_LENGTH(). Use %zd, which is correct everywhere.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3b588e43ee5c7 ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
=2D--

v2:
- Add Fixes and R-b tags
=2D--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/n=
uvoton/pinctrl-npcm7xx.c
index 4d81908d6725d..705576e03e334 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1561,7 +1561,7 @@ static int npcm7xx_get_groups_count(struct pinctrl_d=
ev *pctldev)
 {
 	struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev);

-	dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
+	dev_dbg(npcm->dev, "group size: %zd\n", ARRAY_SIZE(npcm7xx_groups));
 	return ARRAY_SIZE(npcm7xx_groups);
 }

=2D-
2.34.1

