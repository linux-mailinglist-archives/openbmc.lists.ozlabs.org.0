Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D572355337
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5vb3Kclz30Jp
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:10:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=VOWC7Der;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=VOWC7Der; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5vD1RKhz30FK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:10:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617710991;
 bh=KpTYS8atLjrE/4GNwFDukd12JiHZ0ZOeahsrryBdGeY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VOWC7DerThJgvFhCt8RxD7pp5S6I4aIKd0D002IqRdT4/YJnWBLx/OS0DIILJwhJ1
 /RqgxYfGx9bB8VS8MVIsagBTqc7ImG22nlpy0RH76dsFjBaTEwsOqyS1NxpV6c3M08
 Vd4pQ/hrt7XOQGcchoCcv1CDZpwRJZLsIk5AIB4c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1lqNif2hHO-00vvIO; Tue, 06
 Apr 2021 14:09:51 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 01/10] dt-bindings: vendor-prefixes: Add Supermicro
Date: Tue,  6 Apr 2021 14:09:12 +0200
Message-Id: <20210406120921.2484986-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xocqc0oP8O7AxwukI4bLefxqkCMRGb4FL/sgNQpEhAp+uph5fYI
 D6omEO3rn00+UPuneJf+sgpzGp8ZJSiwKPQrw3DuXxVwuv81/GMazUlxn+xeKenXBN2UdXH
 l5PRwyQthYBA9eNRv2W0rp94r3Mim23DUvkwlnlmRdy7B7kLtwsCytIFJGDOTPIrHqxv9gp
 Nj6ojZVbcAqVxU2v1FL5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JBmt0AXMpgA=:YRX6SCRLEUtZR2eUPydmdp
 SGn+s9gkZtj3wuJaNR5weqUqEMO7Ku5FHoXdqaPbBFK4pwN6rl9ZjtUQMfmM/qK/U9mY42+F7
 89SNFwsDpPjzLSpfoAAySB/kQONKChL6enlzTqzidrXUvB5iLbG/wo6FP4QrHkTMWb97HeVbx
 eovEzVlGhwc9ID9s0lrfwXHLNlYPFdekcIcGOnxC79GE8DFrek0Z9NfGUipXm8jWcDxmQm+3i
 RbTpC7LkRdYQ2WHRd8Zqh9sTjWYqvnNY7t0n97ud68gcpyj5kIOifDRB7m2uvdBg1+XaVV3p2
 l/5KXg7IMpEKB5I5CyY7YaOMHe8ir+6FkvMl/Ezh8dDLcywwdkb+LluoGfvs/wfXS7hdJrgrn
 bh36JOspR3wt2B8x1clKNWJ273Q+3dP0+JodNXhdJw0diml7OpYj+Dur1Jmq8gX17Hl8tBjii
 NvhpthVU2wN+37XSTsOo7snIixLfPRZN+jkGR/ekRScftq9v7N5D5AfWrAWOwyKZcak0vrzU+
 ZRw6K0SBm7zdedYGyNSu9SmXtsnNuGFPCIf+swfG1Uf2XEmBa8PFdGiEEPYe8HUM4z4avDxMm
 IqxMReaBi1aRxaAORAtyx+Z7boHHxAB8YSc+mv6J9fJAHO8diVkuj8StkNRRQqkrgTvzlPNYQ
 mysV0kyEIKGgNG+Vr6xIu+syc/RPTpIXkkVLbP73rkShjtwfcw2aVJ2ynJTYz97x67B1INp5E
 m99kt0D2NC0+5ujAFwCp33410qBUZV65fVzZJU4VGxZU/ebnUtzRXnkMjI3CfEKjx6RYyczqk
 KTnajlMjeHaLl+MEGIsgR97eVh+bvTkOqpH79srqe6PaYSWoLGq8dcfgLxp6IaKFrzc4n+b2m
 3zPqHT4/rqNPqXmQVIL/YXFUzYs1DUbKtqnmVpXlIw7HMebH+HuHwtU4qrPSklLwBZeMWSWkY
 qfQhwfFrNtNcIWbjanVpyp2Dnof/FJq2KIw6Aef9yeIXIzVjA4TQKtNg4vn6CeZBMfLYm6QbJ
 NaB6ZjCbnMrpr+yPjurh4ivOaotgza5Q1zmN5D8lcXns/XRk1lNkQrcQGPc+pjgU7qV75kHcu
 F1pcjdaFgHeS44XItSUmnjbK6seIz1MAXIGhWXt6Q40pJUSZR4ASAtrRxRh/FbS2bSohQqtwh
 cTAfdSh1B7pwt+z6bZhJZ5jm23bBD3F2mDd58N/F3/tiSEA5JSX8fErZCKri0yUdSYjQ67ji+
 er17GmZHybhb5Zbgu
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
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Oleksij Rempel <linux@rempel-privat.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Super Micro Computer, Inc. (https://www.supermicro.com/en/), commonly
known as Supermicro, is a manufacturer of server hardware.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
=2D--

v2:
- Added Rob's ACK
=2D--
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docu=
mentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424d..ec6d6ccfbbb3b 100644
=2D-- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1085,6 +1085,8 @@ patternProperties:
     description: Shenzhen Sunchip Technology Co., Ltd
   "^SUNW,.*":
     description: Sun Microsystems, Inc
+  "^supermicro,.*":
+    description: Super Micro Computer, Inc.
   "^silvaco,.*":
     description: Silvaco, Inc.
   "^swir,.*":
=2D-
2.30.2

