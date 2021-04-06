Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13C355358
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5y505H2z3byg
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Xg/9ts60;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Xg/9ts60; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5wL6g01z30DW
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711038;
 bh=fthXQXzWvCMySNmq6wm38LQ0LqGN8oEvRSStBerzpuU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Xg/9ts60YSdd3/C6in+KG15rIxD4RevfSm7iAB+WGopCwxYxMZiXl2IK1QKl6k5C5
 yv77tCYEnAa/kCNd5KLxQCOidFJcYid9BL6Q+1DIMI4H/Rj994JcnduqGnH+E7DKSX
 8V1W10IJn/+YflUWxZOfI6oM4q1Szrfk/sea5Hws=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1m5ZBs3tFp-00gKMF; Tue, 06
 Apr 2021 14:10:38 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 04/10] dt-bindings: watchdog: npcm: Add nuvoton, wpcm450-wdt
Date: Tue,  6 Apr 2021 14:09:15 +0200
Message-Id: <20210406120921.2484986-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yIfwVUR13YRMBQna2k6oVWyExk6FvAxtgtrGA4cgaIZWJEAyBsI
 0UqJFDwJUzYg1OvkIDG0+uOrS1WoglGzfKeTZEf4fuEXfRxNezopYkZxk/5qo9B6GYRzJyk
 To7zZlSI2G6+kdkXEF7jIXxeN5jJpw0AI4KjQaHmooLPBbY/hVMeiLt8DKmb0fXZh9P1q0D
 D2RJZwP5tPENqwcDztg2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K6urnD8rZBc=:mc+8NA74aIxaTrKe389mGS
 wdioQ6Z6T/vZ07iTlnFwrTrxZkqIHt/akxC22dzsbh5LVgaa3l0eACbCnGoGiVvUq0nnbCNY4
 OAETS0BMrMdxd7K2FcGJKoGAprFI/QRuPFqtdxpuQ6PKCU83jfDL6NWHBF0f3ly1V8Uz7DFAs
 5tNPlq/reQTqn0MIkHZsw1EsXeVzV4VIZohB2qfqg5pod96Ksl3vEH43+W9ZjvxQvwoNi4tlX
 U+saA1H5fzScXroD891bDDk+o8wLIaFTbcPMAHBulwXHAqg38Fi1N3dO7HEkNY7SHv9uXLmOJ
 XIWfpp+cbiysY0R36kft+xDJtpAEmp/8neH2j3NzGr2F2y7Q8Ap6G9VP0YZi8GUkFIKt/AQix
 YJ52WfKtDWHWORUU7qENYT2Yz9bTau8y8e6zOz6CIS/jH1yth73nPzBc06jH4dSVGQHToUvQT
 gFMsCFVzuvbkQd1+PmmGEda4ciheKtizSTzWDVe+IvBkna0q0x9x6jXwAjO5Vknio/kk57wOL
 +F42aC4juHreCl2kuBSwujUzC5sCE1zjkNjbE89d9D+4cyl+pAXb8mNVzuUtQRRDPXLkanmha
 HzPe1e0OQund+QAyIl/H+oKZh8mICimYtSDkx7vh1uoEZ3VGhb6nRJH8TxO5yD+O9qlthNRJY
 jvO642QpTzveTkh5fngje6e5Q//dlhcYJY4dZi0HwE9X+P3YZbOJmHl7segvt0Fz5q90lzpaJ
 VkGWUI6y2d/e7KrcDc2Xwt4ANyt+zrpdSEkSW7HgnFsMLXKWgseZAJuiuiLS6OW4tOiVi+mxm
 HLBL6QdvTI2j5NF7oniKqfCW+T8ghm9Rm2KV05yQvVcqRKBw9qVjJ86zOHzt4DBeoVH6a5lnm
 qWNpsChrD18TUx+aJuT6dhunxPDOKabhxjpBdOKWp4xsZ+WFO/Fx22vI63RsCCfwoEHvpZvy1
 vkvjkmglBmVBcYefGDHNM9YsPnDK8uKfUCLvX3HaQuP0ExZ47FbFqb5vCjhJ9dK/6gXHEUO0E
 XtTIXUCeHVtsU+XFPkCp6FzxhDnLg/5oeElZwuc9Ihv3IN3+W1Q/9AVaFroAaKLGJ0B15t1hQ
 U1qiL7PTdES7/Cgle7QCWeYtrkF+ukkBirdQUhC+sGSMGYz5KE6Rybb1Dn6va/Ef3RXFLmgc0
 3n2FMuXXZotJPhtojWEcyYCSgJ5b+OIE51iNcZraosYxUilxQZNAaOXRykJiGHD/KbRhIZkrW
 3C8fliv3l88cHwtk5
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
 Rob Herring <robh@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for the WPCM450 SoC, which has the same watchdog
timer.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
=2D--

v2:
- Added Rob's ACK
=2D--
 .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.t=
xt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933b..9059f54dc023d 100644
=2D-- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -5,7 +5,8 @@ The watchdog supports a pre-timeout interrupt that fires 1=
0ms before the
 expiry.

 Required properties:
=2D- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg).
+- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
+                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon).
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt with flags for
                     falling edge.
=2D-
2.30.2

