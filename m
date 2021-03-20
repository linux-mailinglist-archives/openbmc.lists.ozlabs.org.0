Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DC342EE7
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:22:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2py35hz4z3bp0
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:22:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=D3SZF0mB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=D3SZF0mB; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pxG00Rjz302n
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:21:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264470;
 bh=uKwq/ZWDVqYL2xvnk2WZ9EQekhtr43ZTu3KEC9aZAQk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D3SZF0mB3S13G62qaCtK9tfFxGNyX63hop/1czFvGZEE4QVevh3xHX5X2sU7ZObWi
 2YYcf6a3QN4MWkN2egxKwAWlD/Dssk2GBTmGDZbl7ZmoH0t8DID/fZGnEsQwlujjRe
 leKqu59iFe06SsbLqVJd/VqSRhvpCTXRuML482Qw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRVb-1lCPq10CHj-00Xps7; Sat, 20
 Mar 2021 19:21:10 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 09/14] serial: 8250_of: Add nuvoton,wpcm450-uart
Date: Sat, 20 Mar 2021 19:16:05 +0100
Message-Id: <20210320181610.680870-10-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cgo7o8Nr2P1eIRB7W5Uc96exsQk2AguXiMm5fb94gF2qZr8LnSd
 ENKJKc5F1B0Zj+JVTuHlNBShSL4vR2gfI7gruifc4Kop8pcpat5/8EnvC0jjVWOPE9Rr2x9
 mWstJXs1+K44MfSf1tFPoTGwAzjdRRlmPkWoqfsV6rUkbu98F2vuLCd8yAFv7r0XkpjNlWM
 2Hnmmq/6cmwafYHE3sYgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ya60QC51KBc=:TY8QaGy1ekRqChFJcUmecL
 fxkiS7xINk/CSq6N3I8ThUFN9hpU72mrP7TL6oPMDBVQp4z5rQnMzlTFKQl5FHEEAPc7CXxWX
 cMnd783VpwLs6jIB9gSMLjfadjA1UlCdVLK1p0F69OPbG/fRom/LWSicucD2aaVcQR9tDmtum
 yYml44ujjdCFjjl4xTDBSdArgFPpmxubdMyG5BROnjjxb+C0ewXK7CH/8Dkw28yiWf0GW2JDa
 10Wbzx+yZZV0XmccJ9ilvQS5U1ljsHLTisX/5ZwKBvY+aBotyAcTPD7WXOjrBHDkrCXOMqpOC
 GPNd87QYVtt144L6Vbe2aF0gvPrH7+YDN410yhn8iyb541EaP5/baANpMlfwQmT/tZzbzjms0
 bV+bsmtUE/gXxcrv/p2nHcrM92q6UvN/hsLajydlnnlu2BwhG4cSLW4l5EuGbgYgjv7dLGeFb
 qjRj390hlMzLdb3bEE/JGhU2cATQc8m/SkGU21oPxeYB46Fj7UCn7fsnYKEXsCXuFrkncmWpy
 /DlyQ26ELJtMk+HahHkzoGPtaDy54GzvIwJOctlUBT1lWcJ+8HFidG4LDUySPgE5R1LkYrL28
 rCMmcol3h60wGBLwnDYdAwWnQpjOZvZLTSs+GkqBaT+EHc7duBICJVK9+xRemZBh9NH37FfZW
 O+dlFevZQ/z7GqcedB3cO+als5v9V4cW5GvoUE6HCurK+7Owoe2y2oeVq39lMzpyqvV5ySeBL
 CM97mCOxv7GZSlf7j+SHJxqw6nvgj3vGrFxkww2/fZPoSKmB8fO40fJQZcXss0W62tQMhahe8
 K75ZcrT7fYakJH5y8e2NNNSyqDvVJDqL2t4RcsvRd43EoDXNoPvdw8auxZVllOoeQSwekUNN5
 pDl3KIeORY9a+omF4ptw==
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for the UART inside the Nuvoton WPCM450 SoC.
It works the same as the UART in NPCM750.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/tty/serial/8250/8250_of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8=
250_of.c
index 65e9045dafe6d..0b077b45d6a94 100644
=2D-- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -318,6 +318,7 @@ static const struct of_device_id of_platform_serial_ta=
ble[] =3D {
 	{ .compatible =3D "mrvl,mmp-uart",
 		.data =3D (void *)PORT_XSCALE, },
 	{ .compatible =3D "ti,da830-uart", .data =3D (void *)PORT_DA830, },
+	{ .compatible =3D "nuvoton,wpcm450-uart", .data =3D (void *)PORT_NPCM, }=
,
 	{ .compatible =3D "nuvoton,npcm750-uart", .data =3D (void *)PORT_NPCM, }=
,
 	{ /* end of list */ },
 };
=2D-
2.30.2

