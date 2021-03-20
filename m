Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB54342EEB
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:22:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pz06XMCz2yxm
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=eQoWR6cy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=eQoWR6cy; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pyn6BDBz2xZQ
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:22:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264551;
 bh=1O/ew4Z4rxeAUaKUpYSfsO40Ipv124z79UuznpfHSzk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eQoWR6cyq6zfzzQ5NaHjh3mXZ0ss+nqPxh8zyeJR13opep9Qpfqe9YaUUkH7vGemW
 1Kol2Sad/CoKPvFdX5Q1Gdu1OPlaXvZoSiEb58fjD7tL3A1bQBHF39BvzOACSlLiL3
 t6sc8jOl0DHqyG72fdTncwF/zbGjZrucY9oI28jw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1ltxb025Er-00hQck; Sat, 20
 Mar 2021 19:22:31 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 10/14] clocksource/drivers/npcm: Add support for WPCM450
Date: Sat, 20 Mar 2021 19:16:06 +0100
Message-Id: <20210320181610.680870-11-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XpA6ikqNDLJWMSu0qLNW2wUOvWcUMiuFmNge7XELMS+T2UsZuRa
 9wYWZXr6Yi+308bWTjvcRc+ktCVc65B7yrmBRhpCWIDZSZWjiSk8uzuWqCZnifm4spcQbLv
 DbieMTBEpew5A1LXYx9mN9TQ+4Iy1vFxmpbt6qBExy82KRT1+uI8rmNnQ2Mr+SBxb5GTTZQ
 cIM7VmhCb3XFbMnZZgK7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5CYSGdtZIRY=:IRc000wkeLVeEwnPcyO6CF
 k6ZF0K7scp1NRCw4ynVo26KbPNswF5t4wCwon8qX8/M7YVreO2pwLnHCpT2HkMaKmqWEjpr0c
 w+HEPAqQY2ylw07Kl9byVx7Rw9QH0yfWi7CyZJFpOETavk4OpeQ0hHvWYv1jv6Ii9n6KaxMCs
 TATiDPvrKRtldCs5msOoMup6O7EABp77BwpYP26HNLyUc0cLNO+cKKYuiqiDCpHnZ6M0iguNC
 qymtrVK8ukplNopT5ddwZSFG73LxBpY86/mTpcxgh8HIG0HWQPpEDdPmFhHTT4GVy6qaFdmsv
 bfMSarSHheCXOxOs+IRj+nx/Oact8jo4t8wM4KNEAyFN7Qx3TLW2ziAxgMYPW5FHDkXAy4ql4
 7GUtZ8ytMgp6I6jO3liNA5xN5GVif1qYqY0koQ2Jpse3HiR88mY5azIZABwZSYWXAg49aLcdk
 ZDL+19b55xR+DXGMVLDwA6qfUyXOhctXIkc6NM5/P2d7DJGbTigqvCuFz7CxcjJN5xGPFfAWx
 INJjD+oQB/72rT/Xzub1khHrs9vAiF1kPCHntHK6OOIRklDT2NNrxUKkM/kZ6P7bTTAgp+eZB
 Okuh/Em/HOYy/oriNyqOTTpWhH+S+rRDfdxgQ5cG4Y38XgoJzPCXlbmpEhmhAcpxjn0wl4c7M
 lgNT59jJAwgCnwRcCMI1YvVqSuXxUyMP5f8eJzdW28hBVRQyA8zjhAsWkroDIgM+tp16Q81aR
 ayC0Pkj75siVlgxGbVcFdQAbKvo4c8iYTET4+8uCyXktv5m2S73ccCP2Tvs7zCBrBZUdVv7CM
 T5LWxiH7BQrCFjC9nmiQkR3U8xd3yP8yVL2OD97uiKtaFWTvhLqEYAkjO00i8JCWJkdCD3pAf
 JgqRb9gcB/w3XPkrhq/2vyZPPOXG8YQoI1NtcAcb4s0vIN2J7cjIRAlWUKvlSEdddIC0eA4xW
 qy6/wTl12Fg5q+x/m8CXG5SMyzCJQFNR/G5hTwV3C7QtPA1eG2TPteAkxGii3DvJuVIE3wDjR
 fctDKGXgGNjmeqLe9lQvg6BjkbaWE1H2zw/2nq4j8g0eOY9aY2xhi3//eRvXjcCnIi1DTD9y1
 Md7vpDxwgbMVSFfSppQTIx35noEXjFtoJ4x9U8N6zE3haZnd/q8/n6ePvuyLXdQZuB/aY8U1m
 hlOZ0EAzdVmnwXGYU9iQnRtu4UdVwM2wSCvmqPadCiMFpAWcDU5klIOs9CRkjz2X3qkZiYAJe
 wQV9jNn3FPqdz831u
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for WPCM450, which has essentially the same
timer controller.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/clocksource/timer-npcm7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/tim=
er-npcm7xx.c
index 9780ffd8010e6..a00520cbb660a 100644
=2D-- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -208,5 +208,6 @@ static int __init npcm7xx_timer_init(struct device_nod=
e *np)
 	return 0;
 }

+TIMER_OF_DECLARE(wpcm450, "nuvoton,wpcm450-timer", npcm7xx_timer_init);
 TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);

=2D-
2.30.2

