Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D36140A9
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 23:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1SS46Vwxz3c9y
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 09:26:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=eVIy/PWp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=eVIy/PWp;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1SRW4zqfz2xks
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 09:26:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667255162; bh=r6pwDIsndUPkTAtntN5/yYnVsGNdoeotVVNZZIywG0M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=eVIy/PWpgRCyI5llVCSt2bjm0Nau/IJEGXdGafTTAW4kToqCdg/6ap3iZKmtIX8vD
	 evCc5KbascYUk+22i/FZmCqFUigWeU97DWmTgcHCnoXf3MuTdZGa6J92kppIHLt/Bu
	 SZGTvbAVrIJzA5xQFMS9ABQ+fh2Ii/dgJf5rQw/H8bc0OLqn0P++UjTWUt2a25YuZA
	 pOODCby/+LIxIRjkkXXeZrZ84+wMAbX+48TB/sUI5UBVpTuZV645aEd7Z9OfMi8IKY
	 c+/h0IUb4ZlsjRrIu2zv6FffuY4A8lXZ2g4pjjE/CCGizEVFWKpzZj+om+4+VIGDcA
	 IqD8FU4Ehu9Xw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.189.154]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQEn-1pMXrJ1Nl1-00oSp5; Mon, 31
 Oct 2022 23:26:02 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] dt-bindings: spi: nuvoton,npcm-fiu: Change spi-nor@0 name to flash@0
Date: Mon, 31 Oct 2022 23:25:59 +0100
Message-Id: <20221031222559.199509-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2AF0SEBGIS3MpghBjrc7s5FUflRhnSWDb6LHrmFtpHwH1jh8/kt
 EgJlnTfBe3CoIWw08mO5+y7+cPsdF2T0JVHETUuennmkAgqCZhz/FSijZq5SveJ0pC4XzZW
 nHjUqkCqSgtVn0snGkXHzbN/0KQ6HYnsJGV3LlxgyxzYbsR5Sj+IQETSf9v/I//IgikJwAx
 MjVPS9+Ks43HqOPhBIceA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Zu6cMD1Wpw=;cgUPTGQSfxNvJkNm3vAlX2cXq06
 K5YCbWQx/UHX+VEuB7NgH0i5ahdktnY20YDHjkkpjuPlBa1+KQ7CcZvckcpEoUqo+pVUhURB3
 VZBgMJ1+0K2eUyGxwDuKN+fg2RemCtbiB2REgkJPtv2MJ2jJYpUJ6wdCOah2EYNvT8+O1Y+Su
 dRnosBW3Kbv4qcA6emvfGtGqHOrqcldY2t7r8C3bTSI+dThY7AGai/viii0agw0GqxbOzYls4
 IU/uREmDOH7tRPjVDAL3qjUYV3x05QbcOL8dSy7FfMyb8BxV0pffZ7IwRFAFBkB2D8qmTBCeg
 LOr61A7r4bcks0cYtf6xM7WfgHVxh1Unwus9L2LjfVvejG18+Kdz0J3qx+ji0AgEcbFjwxHBy
 pWHjDc/ALYOH6lMPJltneEWPfi9xOPx8uDkWwRm9vbwCVZGFaIFyjtcVb4ybrFg6osaYHdQd5
 vYUL/usBC1c7hAUw56cA2w/e+G/FSijFt6ei6gQlsQxfXbwF+WzmFCAgHbE8xLv4SYhNXyq93
 qDeGuVK/uiX93DWMADRG0x8fveVGTmSlaASKApwuJKDVFTxm/FXFl/DpAJkxQFtMyCvGfMnjZ
 PLmjaG7Akv/F53T8r0vQ6OP2kkVAw2lkTuajrMuq8eMTiiueW3zq/7ShdZXWi3BOjfQXlAwp9
 sT8AzbF+FyQjF1Oa+FYoQZnwqnbdXF76u2dVVbatMK37+SAVFPvKNAfQRJTAbJNsGv30jhMCB
 ubWer+aGr4kOBGmacE8Zwfg4Nhwe/3zesfUL9xAGDUuetePchgyCOguMWHo1DVgJ8Q3Wm6XPj
 H+LWacaz679SZ1oMWmE5v2jVnTwj9xLGLxTVau9wSmObTmcn2W1n4rI2jXQrgQaGMGx7uPSR1
 fyybMhJt2w5MPSBDWYBeZWPnwYdPiFWwZrKWPKooV1+l/KRXSc7Wf80ifRFmpbvoxbwpWmPUp
 p1SANsoEj5cLwAVPqynGbk5Xq7g=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The node name for flash memories has been standardized to "flash@...".
Fix the example in nuvoton,npcm-fiu.txt accordingly.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/=
Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
index c63ce4cc0a80f..fb38e96d395fb 100644
=2D-- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
@@ -51,7 +51,7 @@ fiu3: spi@c00000000 {
 	clocks =3D <&clk NPCM7XX_CLK_AHB>;
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&spi3_pins>;
-	spi-nor@0 {
+	flash@0 {
 			...
 	};
 };
=2D-
2.35.1

