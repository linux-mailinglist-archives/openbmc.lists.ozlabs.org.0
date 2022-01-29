Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A04A2E92
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 12:58:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmCXB5w6sz2xsc
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 22:58:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=J+bdDP03;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=J+bdDP03; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmCW74K15z30D5
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 22:57:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643457448;
 bh=ewvYQySFCzF168fjjuYlGn8OeaUfQloUxA7HvGdu05Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=J+bdDP03O9SgboDmecAL27LKq+CwUjdbMmK+ylTwebwPeWh6/FjpY0RtChNQpvzEj
 fu4BJBdZJZTXUl8q6socvhtllvVucjoL1IZA5QAC3/ncECYEilQ5x9QfNr00mwbLim
 X+Mh9XHicbx/rUgfm7RkCeYhugqvtm8qmAdRK8nI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1n4fXK3itt-0098iD; Sat, 29
 Jan 2022 12:57:27 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 2/9] MAINTAINERS: Match all of bindings/arm/npcm/ as part
 of NPCM architecture
Date: Sat, 29 Jan 2022 12:52:21 +0100
Message-Id: <20220129115228.2257310-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JzhKlkabmTXOMQees0DfcUXmMmWF4y+L6K0dK2dBN9AxVGHHXmu
 SifxIboqsxl9xytb+bh/Me1C+G2BQFK0FM518EAJtHZDhiCPUzllC50jVmmRLi3FpHfBVUI
 PsT5KkFKf8Mx0/7Oa8dqZfp9z96lq4dspgXpfxtVlvUlSKMrD3RiN/uV+2pG0eR+trE6f0h
 XMOxAO3IRALKoxxar/zqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZQVDiMeqhc8=:2v3K4Ph8RwF9x5pic9TJVa
 Y0Gj0r3Bq6wJ79gWmMvYjgOQV3LP6mGLW7RfDdhgObMB2FldrSXVZaqRjJIdmgQeuQBuTYqdT
 MDhtvKrGSi6P3xTBYZlG9WmOAIKILn7u56sIP5YF44odFMnyBqE7PlT0NGaQkki/SgfKnQrE/
 G5xHah/VN2IyUQvFEYIInr52hBsVVrMsJ5H9frmolUZZwvjNIuLlH/lh+6rHwfFz6R8ln3V1c
 i7QsJnQ+DGUjr9FuzGBmx6wtWsFVaN2Jm3LXv7kmwplZbxQmx+1bmIdccjPWpvDJi6YZjZHJM
 QTszIB7FwhaQ0+I+tn3AqsvCVWk28W6ifAqPPijjaDXDHNazTxcKDYp71WDOWMVB2cPkYd+9o
 bweq4jrX9CZ1e59bUXoZDD0LI9FpRUqnYdYS8Gg61ixjnC/r/aYoQ1+ZE2qMesdd/NaTUAf8D
 1Q2Pd0Ak8mUIFiZGj37XKYE47KhY+xKfQUQdgBG3u8h6eVPZBace9/h62CD8gPW23IBU1V3Cl
 9otOLTQfNqguBh/xHX3I8tMb07GNXPISdXUNLjy7BM38N/l2TMuUzuluwSI6P9580Vvc6kEEA
 hcLEmL9r0P4W82TKxqy6c9XoX6E2W3CV0yvdwOrSWztP415fX9hzLL4OS3X18cglKO0YjcEFU
 jQVRNTRDuVN24lh27a1EeCjJPOinS1GdG7rEdeNtis1g+drNXJ8qpbmYGblxvYMpXZvlHaDeZ
 ujQJ4bWRdUYwrZDNUBBibycevWAvg/FYulKaqKbxEc0IBOwZugsxlQTavv0DwdR8ILHpaq9M+
 wLa6yiF7nrGkm7wRtAFWh08zaJJAvC7fEwCo9YTyulHnRmnw5g9O+ZH8jFvoi3V25eAVDIanQ
 RaajvGco0zSZFtIyWUrS4nk83MCVg5qO+anNlxb/gF1tX0dF0EbwJWjtKTk/17UwzgNYN6GeN
 1DV9nFnND1QeSdHQ0Gy2vPRRtYL80kV8vlGZF4BJZh3ULe21tC+QEgHGGbv2GCI8Ip77s8pEM
 wnMZ1vrlEz4cF+6pydVt3lmHSaozeiQiU4X5LzpBrwwShQHFWefh2FLeHYx9t2PIvm81mKhxt
 tDAW4US73H+MsU=
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
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

All files in Documentation/devicetree/bindings/arm/npcm/ belong to the
Nuvoton NPCM architecture, even when their names might not spell it out
explicitly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2-v5:
- no changes

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-3-j.neuschaefer@gmx.=
net/
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c9143848..d84dde42e33d3 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2363,6 +2363,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subsc=
ribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/arm/npcm/*
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
=2D-
2.34.1

