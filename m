Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9818B9955
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 12:46:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=UikdJYio;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVVwF2bKQz3cXv
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 20:46:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=UikdJYio;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVVnw4Gz7z3cW3
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 20:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714646412; x=1715251212; i=j.neuschaefer@gmx.net;
	bh=z1H4srJHNcb5BIAMp3q2n7Fh/jbh0k/UyMAjnW8Y9nc=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UikdJYioSQF8uPPg53dS8rTEKkmNuE1LibEAWBDnpFb0IMJEZn020rprsjCQ4OAe
	 xGuX96nDaIrPBAzxo4fS/4+WUITs7sYRVHqO85mJeczjJsgOzYDf8LlIly/22jh6b
	 iNaADUyUS47rYvpp0kSoEaRky3cftgCfcdHQatLK6PxWJs2gGJLQe1ShhgMaASQVQ
	 CTUjV+vnlibAt9AmpDkYF3hF7Y8UgivasVjwV8Ta5M281Ofm+rb2rPdmBoDPnpmZ6
	 5jOLhvTofMxsAhzZ3iZTq+qbFF78k4XCr9WfX7Xbsb3FMwU1RkrxwZWN+ORlCY7qM
	 5FZT9mJ0oG7Do4nnHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.78]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1sNm870YD5-00ncTL; Thu, 02
 May 2024 12:40:12 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Thu, 02 May 2024 12:40:04 +0200
Subject: [PATCH v12 5/6] ARM: dts: wpcm450: Remove clock-output-names from
 reference clock node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240502-wpcm-clk-v12-5-1d065d58df07@gmx.net>
References: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
In-Reply-To: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714646407; l=1382;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=gdIaqrhURYiTo/eMHHjfcL4TfUOiwQNCqwm1DTjUKA4=;
 b=OP6jhR/C4oActZcDuSaLndojZtPMU9nA9yO2ZP246uduoCxMjJs+i/3eD11t3zb4gc0vzZn7N
 Y0jx39i0l5aAIuFbcqwB4uD2ouhSsYpLd/Zac913joFMyEYhStCl5ix
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:omJQWa2Zw/JDFvnJS03bMn41/4c06GZlk1ALxo7nu80AxMaIIxU
 E7mQs5VQjbnR7yJBxJNDTcBC3VMmXgzexq5Ora5rS9qHLkyVsRolJxLHYBcjjZ+Vu7EzECI
 7KSus8nHHJJppPwSanQF/SstH08zXy8FE2u90TBdkOND6SwxaPwhTY/nkUUTTGYQKDGdiJr
 PgHXNDJLwEJDcW3AjPC7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lznP2l3Hivk=;93JLoiaSYioywxUVJEbcH+Pg5Mm
 oT8Ff2Z1eiKx5hKpTr5so5sSBVkv7tNhku1GqOd/mjVGRvGdFvLz77B4uiRTODGyWCYbNVQeu
 hqs9ArUZofqWQqPlYlJjTi6KQqAFJt1rg1B01Q7jCHCJTVORYMRK8YljxE+zobt/4hRvYuQNK
 XAhaLoOQrUWdgUPtx4TsK9F7UfNYA8Pj64b5Axf27VNmwIun6K/Pzzvj/KzHSgJYevvC1sHle
 Ola8/l55l1WDFMAPZJKhQXm21wSF5StT1fnn15VmCaSrlhE95jc+aDVsD5tMrnqxST3AKlzE8
 tM4MURbv2xdE1WIDu85P5aiyK4apatTgcNzd9iLZMQ+wJmv3joTsL38Oyr0hAxyIa2CkyQRes
 7KgatOLCc0AgsQ6SHXL5dxgIpTmiKu3T8fPXQZPWf064le93MbJgHNn9fnYGomWQhueopLQGs
 cSOiFATSCSt3ZGyInuSRZdvWSdEXGv98C6WFuF5h59mKNGqmhn8sXBMXuJNmXHkbvP12ex3/r
 pjb5ig5PRpNPfKQ8u8q7XI9GR+XCE8KcnCWlSdLfHQKG1kdx0sIR7i/ShT9d5WnGQf1+TCKV+
 BVqTmJRgTc1sLqZ1UImyR/HsBRMYME2UPQnDlGIwQW5EIDxduiWydhurmV3dC/1vnzpcQBgnn
 n+6gNX8YPacdV+lAIF2dXo/T+6n8AySITA+SEVuFxCryId4aRx+xsx4HUBm8gz/zqGnpT4I6T
 zQ6Q4D+k6KApbSoxUgI0J1hA2WT/oUAS4S9pvfgRcH0nWRp6M1JUSKNAG0Ag6Q70nLlJcuHSO
 QAGOFCRW+dOvEe27Le1dh4WTZuvVn3bTZFPvpV2PsmVbk=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A previous version of the as-yet unmerged clk-wpcm450 driver[1] used the
output name, but in the current iteration it doesn't rely on it anymore.
Thus it can be removed from the devicetree.

Preserve the "reference" naming aspect in the node name instead.

[1]: Added in "clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller dr=
iver"

Fixes: 362e8be2ec04a6 ("ARM: dts: wpcm450: Add clock controller node")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v12:
- rename node to clock-ref, because it isn't necessarily 48MHz, just by
  board design recommendation

v11:
- Specify since when clock-output-names is unnecessary

v10:
- no changes

v9:
- New patch
=2D--
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi b/arch/arm/boo=
t/dts/nuvoton/nuvoton-wpcm450.dtsi
index 6e1f0f164cb4f5..ff153858801ccf 100644
=2D-- a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
@@ -37,10 +37,9 @@ clk24m: clock-24mhz {
 		#clock-cells =3D <0>;
 	};

-	refclk: clock-48mhz {
+	refclk: clock-ref {
 		/* 48 MHz reference oscillator */
 		compatible =3D "fixed-clock";
-		clock-output-names =3D "ref";
 		clock-frequency =3D <48000000>;
 		#clock-cells =3D <0>;
 	};

=2D-
2.43.0

