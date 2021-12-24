Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89247F0F6
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 21:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLJ8G1dq6z3bWC
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 07:10:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LvHtgcYP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LvHtgcYP; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLJ7v165lz2yg3
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 07:10:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640376592;
 bh=liLv7QIBXLKYAVTWvdI4myjSyr9L3lgdMYo/PzqBnHA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LvHtgcYPZ/kuuDh+6607P7QCNpFFJE1psiS61HeIssgVFbl5x+XHwVChfoMh2Ok4k
 8p+WRmfJtXwnv/qrvXXS0+BXmaMrS6Q4EFVwXO6cOq6Bsi4lwI+kKFfK453Ikac/cq
 /byPZ5hv0IeO25o22Ej6dItk6JZgV+4aEQ70T0tE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMyZ-1mo0rR1XFp-00MJUF; Fri, 24
 Dec 2021 21:09:52 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/9] ARM: dts: wpcm450: Add global control registers (GCR)
 node
Date: Fri, 24 Dec 2021 21:09:29 +0100
Message-Id: <20211224200935.93817-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224200935.93817-1-j.neuschaefer@gmx.net>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JXkse3wBat6vYCqJoOkRNSA31x1LA6TGigtcNhJdmsSVn7u3X9y
 2aFeNbou98Nzxd5Er+lmrf+w8UNo24/YR7q9G8huZiPElYufY4WH2nGtPA8EeLOvX7wcifE
 gRelBKtFg51vLr24kDQZ+JqqiZZBA/9w6n7/dGcSIFIY/PJwRBIap0sqXlBI1Fz2vG1hLJb
 AQDZ2ir0wcc2veGx6uE3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WfJgalxONK8=:KD/Z823VjmWLNXXKrHcZOA
 FeQQHzlNN09YTIpEh//Rny7hgNYayGG8AEwmKrqtWT2hk/r9KHnkNynSKw7x/Dp19UpQG88PI
 nuSczbVaUOmAmcOOslf0ZNntyS9tvAJ5D11yJ4H7wUwWRC25mmq4e7pSQ0nwn2/CWnLtakR89
 mKUBE729ESLPfxauhmMZk+otMcEg3JuYRw/oJSxqiqF/vXXjV2dNc8GLOH8kkmUjK9KNpj2eX
 pS7KiHRT/jEUpKlZIkVD9kA3q4+7IrcNzRboB6gce43pquyGujt8oSa6IbC+qgldOF/Pi9ELx
 /HGa4gp0E8Zl19bHobTZzCsl04EKZzQtz1rCPa2NodQHXqrtoFmj6zHkZKxzRZUuAbXEW8Ip8
 iqD85uidrnpgOxqSuMxoTMAQQRBixlDVjNzAZnt/f+vk1RuDH/YX0T0ZDHyX92n1vkLe5FMr9
 /4+YtNdD8UkRLSVJIzv5ns0JI5UTbXTNLBXsI8tFEo/vhdqJnGUqNC1fw7071u+MNTBZZ5Zt3
 Ic3cKZGhqrf1XrkcKcp5JJNUlfwH+uhuk0FEpc5kpCfF3dZxd68Z6ibHpzbckviC1OuZcE7QQ
 /Gfz2t2A8dmSiGjjz/Wzq1I2LSGWMMuxOZgSvBlDmCTauBvsL2io0lfNwOh1KxM+s0lboXBeo
 un2YlzOUWMW84oJfVKHao+hC71DHRHKzVeGKb67KmTkHydiMa7C/O606QZit9DLcV7vvYW61J
 VQDx0SLSujPWZKajSP9IC6LLmqDds0/JQlKzdiou4+BlC02OfQaNXK6vB3kkLj9z2/6Srz7Ru
 2fmy9WQntwFpGy+4UTRIQqAKiB7xlwL1EvZAyS3gl6qaHEyDTa+n7BbHYAiLhUp58bJWLphqd
 Y8iiSGr5geTk5UEsmZ+bRRwRgwQOkxoSLJDK/CyHedBrnQ1HKmG4pm1BkKbtI16812gB/GKmP
 atrb9nLoR5dALckKAjWdlN2VBAC292LRPfajUYv4JzKnBkkf+jQXG9zj2qFz0w8Jr+geCDqDq
 aGm/DwMfYsUH8yBfaK1Dcho1oI82FqoR8DjuYik7x0RiulO5RZEfZ7o7Z/EusQzGLgvKXNIZZ
 mUSlS5Tsu5meLU=
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

The Global Control Registers (GCR) are a block of registers in Nuvoton
SoCs that expose misc functionality such as chip model and version
information or pinmux settings.

This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
enabling pinctrl on this SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v3:
- no changes

v2:
- Rename node to syscon@b0000000

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-4-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index d7cbeb1874840..a17ee70085dd0 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -33,6 +33,11 @@ soc {
 		interrupt-parent =3D <&aic>;
 		ranges;

+		gcr: syscon@b0000000 {
+			compatible =3D "nuvoton,wpcm450-gcr", "syscon", "simple-mfd";
+			reg =3D <0xb0000000 0x200>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.30.2

