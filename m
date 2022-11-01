Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556E6147B9
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 11:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1mVs1bHYz3cFv
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 21:30:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=kxfAziLx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=kxfAziLx;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1mVJ0BVnz3bhn
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 21:29:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667298568; bh=llVHE5GLaohYprJdz/Wwa2hAREpdRRrX0D42e625sXg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=kxfAziLxH9jY+uvFYguQT8bTyevy1B7N/nvWp1213fySxSnfWXaAScGRAVmhQiRUs
	 4UFflRdhWz1veWantwUenFxZIe0QiysD9M2It6HzTCTENR/d+EayeuGJcdu1qnDkNQ
	 fwAnlF2DqtSjVUP18hiko72NIOtSwneCq9ZXDqYULOLYpwl1l9EgtDXpA1QsYfu2tC
	 WfXGpRtW2QLIHFyPrheBi9Q/a+l8sC1wpKTQbmMXZpn9X8QSSKBFTy+Gf3v09+9PXP
	 ldnYl+34DL2ryW2DchPgzve42nb8l8PxoVXbut3U+BHdPDEa7FE9ZZggHzOprIJYL+
	 VeOFfhWGJZQHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1ov1SN2twx-005MKc; Tue, 01
 Nov 2022 11:29:28 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] ARM: dts: nuvoton,wpcm450-supermicro-x9sci-ln4f: Add GPIO line names
Date: Tue,  1 Nov 2022 11:29:16 +0100
Message-Id: <20221101102916.440526-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PUE/KizgL9d9cQnhr7IpsrDX/mCGPfE/BdLnY3pG7aED8M8rCbT
 JL0ZTn3+gSbB9ypsqvR75mGyfq3XpfN1GU/JMK1fTMDHAIKKbk0/gq9YNObUsk2odPOT2tx
 IpssYqTkBxVO+4yggXqrFLZK03nQzRf5YV0Xcusg/SheiaBQe/OxvQKn+dC36i4KR25K6j4
 Itre+bb4C3f0rQ77qNbUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/Tv77Y5Rs5k=;Dn3sWwI3bi+sanQVb4PzkD0REVH
 D6Pdg4T2BtnfJeFg3JxXLmV7aVQsHCN5OjBdh9R9oNmrQrkn/NEEhQzTmefuirc9SyD62HuuS
 6nlcz0AlIB+T4GjnJmcG32lklfBUw0cZSVr/oLptkk+9NtNACH08G85aBdFceSx5ns7KkJ4FN
 l02DPmrNFMeCiI9TjPKo3Q2vjjE+LuH0+GVXkF3KFN6mJjk6DYNSXze4VNRSgmJY3fGz4pGSU
 Do5kOBRb1zj3gkflXaJJbjAWapClDzdOxEBLzm5oyN1CgpWUnpJSMieJxFDrFp5RiTeeDjUy1
 owybtIcmDEfivAatf2DbkCy3la/aJEwrithKcTHsUOhsEdVs1cpsHAMGaBqAar7A5gfQ+WpXg
 Ej3Jmjb/2nWFOxzhKXEmf6g0iDmvMXJ+zrR9Mnl7lT6KFXU26baAx0Fxf/bsnNob9q0Hq9RHO
 GlAGnJ9jeMtYvUFEFT/4IElv23Fgp4BJPkrOzWbLxQ4fCgdidAickI2vweDjJKxHTOyU3hjYi
 /FNg4G1eZnZVhOxTDI+CWHemAduglmvzQg18doaQXbBldt/HPbSzdmvPcjZKkFUNUo8g5MFPF
 7WeWPnDIc31nhAb+ZEEPeT+Rax14MJ2EdRuDXUL2SgKQoPocgrQSZpqS8hoohsBnlfrcNBJxJ
 hAKmLWQ/GwmW83JghPmOhV9ckb6ysWNplobbFPmAmGlgj4UHn5mNqNUd/eiaixBENmWomUnhA
 BTALrNKrPlUymFFuCuo/kGs8D9XrV6G+QYsdfIrwV/+Qoiq3z68FhDpB2OBjTUr+YCsTm40S/
 vkjH4Eqpl5jb19hzEEuh3RgrXJ56oGjlHg93j7u7V1GTD5w1Am7dszRy09qfZ+vCfuysraWWL
 mwThlmjBUyEjP4qrCbg7VzfsX+vsPlKAd9gfLfuBkqxexRk4jyXaz1U6fSzMy6JkMHWiZHI2T
 G+AthDT6mAmKXF/9GMCFxDdUh6I=
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

To make gpioinfo output more useful and enable gpiofind usage, add line
names for GPIOs where the function is known.

This patch follows the naming convention defined for OpenBMC, as much as
possible:

  https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-nam=
ing.md

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 26fed97f8ff4a..d4472ffdac928 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -58,6 +58,24 @@ heartbeat {
 	};
 };

+&gpio0 {
+	gpio-line-names =3D
+		/* 0 */ "", "host-reset-control-n", "", "", "", "", "", "",
+		/* 8 */ "", "", "", "", "power-chassis-control-n", "", "uid-button", ""=
;
+};
+
+&gpio1 {
+	gpio-line-names =3D
+		/* 0 */ "", "", "", "", "led-heartbeat", "", "", "led-uid",
+		/* 8 */ "", "", "", "", "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =3D
+		/* 0 */ "", "", "", "", "", "", "", "",
+		/* 8 */ "", "", "", "", "", "", "", "power-chassis-good";
+};
+
 &pinctrl {
 	key_pins: mux-keys {
 		groups =3D "gspi", "sspi";
=2D-
2.35.1

