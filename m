Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236961DD91
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 20:05:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4Rlc0DzFz3dsm
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 06:05:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Ukqrb2I4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Ukqrb2I4;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4Rcp3wkSz2xfV
	for <openbmc@lists.ozlabs.org>; Sun,  6 Nov 2022 05:59:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667674765; bh=5lcj5iz3Izvi0n9n+T38OcP3BYJYODxFPQTR7ucDIiE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ukqrb2I4cNKZhLTaa0ZHbYr1o3BP0sP7HsJy53KHHe23tW60EztLdqwc1kLuGGNz6
	 LNmPU+gDxWqnn0qx6SQduszrDao4U9bW46nNWoVYM3HZIfWAeC3ggoO/Lq4XBtFbqm
	 Zb6y2Je8pnjDAt/0zE7f8PWOtV8Pngwe/+7qoiUC62QezjxVwoB7zTCHNJoS1mggA3
	 nXhA3zHKf4/h7asSjls2CnIu1ziNr2F1XEqAM1yOJ3ssTsgMdiSkILQm5tyIU99jfF
	 JcAZ+ZwfVYxji3q8iRdYbUOa4owcHC+Dzp5ZmtltxyLDn1iAQCb0wg9SzXZVCmUkoR
	 yfMJS8+2UT6AA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.44.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1pRZ563gnU-00ck71; Sat, 05
 Nov 2022 19:59:24 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 5/8] ARM: dts: wpcm450: Add FIU SPI controller node
Date: Sat,  5 Nov 2022 19:59:08 +0100
Message-Id: <20221105185911.1547847-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CRar9ivUzCsj49qmjSPQqicgToyrxgj4f3IEg3FyzRlYqRIlXZc
 QE5AaQx6SFWqlBCzK7A0KBDJ30lM8CbktVojH8nGNDcdJfmS6rhZH7j12pUg1+51Bt5FFih
 AjK2gVZf3bNcwypSPW42cjgG2y8ijYg4r2oF/veWkdBY2fp4pU9xS/Lirk4Cy/vc013eCiU
 NelRJOl++C9eX4U1HdNYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f8EehY0JCzw=;S7sM7wxvJNtt9sMfxlbJ8MIhnBr
 NGIBM5nXSeHgU+AKI4nURc1AXiBsVn9B4v/ss85+/5qG2IPQQ6vvHXYGFjUedCqR4sNqznOfD
 MdvO1PVYTs7VzPun0g7vPTb8WNONuVRD6u/XDlkNkReYrCU8BWqKSRPmldVHYIYjweCiJQa4B
 CKosZeYnyJYyZzqLJLQZbR1e3KPgvlPt5dfzVkg2yPSUTUl8kinEtLymrqq3PVIVq6m49A0iw
 kW2VkW3xi05qaH15sqelp3jC2VMS+Dm5vFAzsqJKnAI5d/PdPKoguDK/rkEq7MTyemrY7oxfR
 hDXCrOvLqn520qHuSG44jlmNOtwcQe+8LwB5eXdlWlCLiwUQ7LAWdcjv5hCP1dbLsjGuCV05x
 SuxJjak9JKnAhQoD4ouNlzgOmdzcu82vUpMe5SWaOjgbIRJt86amZQFcp4t6BLvyronbfP8Z+
 gn7H3MHVhtGL+W7feonATIvAhnyIgU9HlNQDRWSA9ON5haKP0HurSsKRZS9sy+nDtFRuvO7Qm
 XWl93jzhzF4uTspuG4s0Q5mfDNbBjg1DnaieJzm/hDHeehJ+GCcP1VRQOHNSDQYF/IQ6MS9ay
 E1IbMiqIgOLAhgbFlvIZ0y78GdqIUWPTDpfI6xJCy/mgQNn+/GiGHB1n8dua3PTa5Y1KsgndW
 xDCqzCAsGt0eJwRGN7nOe2Vf0w4I3soxJSG1peQzwGiWZG/dgiLED7OE3wxVEH1+ZRN14DPU6
 y/qeXDwh7UJ+iy7H5glm9iCKP7usQrw/P2588O9kGrBjcKc0i7Q0YqBiIl45Rp8cVxzVm0LxG
 jLd6ZuP8I815OyYNlkizaRieTzVujxi80Io8fXdozUw1CBOWLqh4nPI548TuWmM9Qdb/4BaJR
 6uzKRiKdEVBQEXkm5nYfU4M4H5St8kc5aCqFSzH5C0JdFNK7DOgL9Z/e0RRaEvIpUx6s+B917
 tm3mSbG9dGXS30EQYt/yFVm/fXk=
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SPI controller (FIU, Flash Interface Unit) to the WPCM450
devicetree, according to the newly defined binding, as well as the SHM
(shared memory interface) syscon.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

This patch depends on the series:

	[PATCH v5 0/6] Nuvoton WPCM450 clock and reset driver
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 439f9047ad651..299fcbba3089b 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -470,5 +470,21 @@ hg7_pins: mux-hg7 {
 				function =3D "hg7";
 			};
 		};
+
+		fiu: spi-controller@c8000000 {
+			compatible =3D "nuvoton,wpcm450-fiu";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0xc8000000 0x1000>, <0xc0000000 0x4000000>;
+			reg-names =3D "control", "memory";
+			clocks =3D <&clk WPCM450_CLK_FIU>;
+			status =3D "disabled";
+		};
+
+		shm: syscon@c8001000 {
+			compatible =3D "nuvoton,wpcm450-shm", "syscon";
+			reg =3D <0xc8001000 0x1000>;
+			reg-io-width =3D <1>;
+		};
 	};
 };
=2D-
2.35.1

