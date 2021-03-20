Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C0342EEE
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:23:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pzp6Rjlz302p
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:23:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=XQSlMn4k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XQSlMn4k; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2pzb2LcMz2xZ1
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:23:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264581;
 bh=uf3ILqEMg6eC6bi0iqi0XBLwUk3OVexnnKIhLAryQMA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XQSlMn4kuzlmWcAPBTKcY67lkjpiViE/Ywb6X1KT8TxnpV9XuonTO4BtTZPuZ08C0
 DmYKPBbWUKs7bwa+QvYXfwi//OZ015z43XzBnr30seZ9QLJJtWyVUPMvQlffs/LI3f
 6dZ8dzAAmTUxylYkPFhrm2trPGNWkjvM4daMcfJU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1m1u272fwU-00qSea; Sat, 20
 Mar 2021 19:23:01 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 11/14] watchdog: npcm: Add support for WPCM450
Date: Sat, 20 Mar 2021 19:16:07 +0100
Message-Id: <20210320181610.680870-12-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hw/P9HKeJHarfyFvwAmBp8Mam8myqgk157QR4E1NS3d3ZRPHh/H
 GhkO1M1vo508nDI32ImNoSNS5SgJG7FY5VClPhFxCoreYZsR45skbp9GBBKhwqmUmgfoBVz
 sTiI8OCeoc2hxN1a728DhCADntRQ1yiuWQFkO9r8IxSd8aip1o1jrHkFONA/RapF7wm3mh9
 IJE4J2F1rdAFZJiZeVeqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FCi6tQaXMAM=:BIBUuG1s1Ud/UwrbI4Ckdf
 ERwviKF/Jvwbji+f4UwucR3cyzS9dMrkOouY85V8VL/xhrGEO9Y8VJPv8nSbTcVZAZYp4qEmh
 6Ferpmpi+sbujwnFtr9kQka+keSw1umI7NdtOBt2BLLrVKfQ93dBAJgQt6+WnOiKNMWWe6JDR
 gUCLVtL4+VYFagSlKTcZNJXUxqw67S6QwoMqx7TsD53/btMq2htkZbXhhmnDj6l7+R/rH0KXf
 x81M8y0hanZSvsDjFTG2kO7Pla5GrhgV418CqGyOFKyHiYtmm5jgfty9G4KFmJnt7Cg1P7Rs6
 k/FdGlYo5d2gU01Wp50GBoHffmu4dbUQvcjQZD2YnE7cxas2MIKo5aiq2XNKCzQX6td5K0KiW
 x0M/ShfHSjaIOnLGI3ZvPiudrYYrKDgE5LEdKm4EyrI44PugKSkkixzZE3jIK7Ok6/Ov0L9HQ
 Q/DXCs0+Pi0KckmadADFxdQ4FmJXmKqQ+FrG17d9bHMF5AJYo6o1wzUIL3B2S1QuMvDDVoPjH
 YkMAyh2cK6f11MjGw6FFs6esx5IqgVSCJ2oiVfkk9iRaIUG9Q0hW9FdX89wpiCFEMTi2/YglQ
 xfmDWJouZGxoU7hTo6FX9PHIWh/a6Z4WEW3eXroncdbeCIhV8xswYop+HsLphvjcMtlLmi4yS
 Qnszh2ZYQ1+632JkNj4iSAZMkUzNfk4HEcfoMNkR4Xwf//498NRZNJUfLE6PogreSdEwWPnzK
 6qCWCX5Lom4zfF02aGkynRVDtpzcX1/nBt/0N4F8SlHUKcqh+ZQREUhoeBjVJjVlN+jdQNY1k
 9z7U6PbtnxBYmVuOxLDj33FCnEdjim8XlCjUyV1ANP8J5NZYbCbZ/699HjxCsI08HnuVVBHbk
 ajFhmJKwCbsgp3VzyMmA==
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Guenter Roeck <linux@roeck-us.net>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/watchdog/npcm_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 765577f11c8db..28a24caa2627c 100644
=2D-- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -229,6 +229,7 @@ static int npcm_wdt_probe(struct platform_device *pdev=
)

 #ifdef CONFIG_OF
 static const struct of_device_id npcm_wdt_match[] =3D {
+	{.compatible =3D "nuvoton,wpcm450-wdt"},
 	{.compatible =3D "nuvoton,npcm750-wdt"},
 	{},
 };
=2D-
2.30.2

