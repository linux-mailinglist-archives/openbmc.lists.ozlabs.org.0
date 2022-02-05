Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD74AA86E
	for <lists+openbmc@lfdr.de>; Sat,  5 Feb 2022 12:46:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JrVx05j4vz3bV7
	for <lists+openbmc@lfdr.de>; Sat,  5 Feb 2022 22:46:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=DkSfWrJE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=DkSfWrJE; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JrVwW6KQ5z2xtb
 for <openbmc@lists.ozlabs.org>; Sat,  5 Feb 2022 22:46:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644061541;
 bh=Zyg9SWV3G/sFxb6rVSWQx6KI1Y7etzXsTPyKjbLyugQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DkSfWrJEUa8oI9u5IJ16sdIA8FQawZ3bYrEhfgdZr7vhlmCnqu95+uSeWFg5vDGeB
 EKPg8tk998HsaD0Td0XD1o38CCUMfNyHEg4L4qskUH6Nh2WMEtaiZtEf1EvsRPWWz/
 TfMkXJOgsKg4YWysnaxXaGwOG7lKD2H30vCAoSYk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1mOlRw0SxB-00sOtl; Sat, 05
 Feb 2022 12:45:41 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: nuvoton,
 npcm7xx: Remove bogus unit addresses from fixed-partition nodes
Date: Sat,  5 Feb 2022 12:45:30 +0100
Message-Id: <20220205114530.1249426-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bYweFNmkYcMcucQF0kG7tpxIpI0SZWH6J0Cfzx4JyiyiJVPrccx
 s5wZ6bNFkZFO5y0KaxXVK2vXDLOWepYZEFR3IcIpMnUApmZqOR66nKcatTnsvaLyqTge1qj
 zsevP330Tcd2m9sJAk+Vurue2/4KwhBBpIpr5Gkl5+EE2RhCKr3bA3zSf+iixgr3jqYmg5P
 iJVT5GROkswES6nJMLlhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KW0C62euCMc=:F/RA8STLez4w2dpD8hssON
 A/YxFuzUdtSc/KYzdX2qS/Sxxgwqi9h3tON0HJZs5NvXwwyK09UgWzS4O/4QJ0chVSG2Wop5p
 2WeSridCBItnm/WuxCSfqNE8hjxcybWWs5nX0+NocawPzMQ20wL5zOsZc4ERLCwuBguVMvghs
 Bfc0WdWS0aK5h87ZffuimeAMsOOegZobw8XZD6J6KTey+0F+mY6sU1tou2XbUhyqAmBHr8cY6
 pjvXydiSLqQiFBDY5JjwbOBM6Tj+CxuQMdH6KQ4zwE6SR/mEny3qJ6x3lhGUPQ44oSFjV3It1
 Tu0GEsv30XnLn68DrO4Qkla+wtsZxDcyhgLx8athgnjC5vuyBIMkmO3jQ0tqmpFSJaGgUw1h9
 QvX32eBeTgbGVWDq9geXai5sxHo5VBeXSFfipAREnxZ7cPuLJD8e8u8a6lhiPfzBi/vlagQKE
 RTKI/YSRKQvQty4oQcFexnDY5a+zabGQEC0Kx0ZTQbLX4/eFFYtqg3S5Ru4S/0d87ZiuRK9En
 SEMYFVGXhiijAPiGNiyr6sQDLEEVlrPevw/6pPRDEWpj4YN78bYelFqF/j0D97m7kTJ3+rwp7
 4PT5DdcuwTDlQEglMDx6Nwwb7WuJV6O8K2TX9pTGhNVOflw4PVKcIHkRR3WlEXll2N/ktJE5F
 WmVFgItaMI29Ib+p68gfmYWiseEHY1h0s7eESPWwJVuqYW7i57rQNjfLPo7EaaPNcoZFF8GEO
 Nc44oid35q7stOlD7/9An4HW2ozHw0HUgJ32uHlqw3fJjRsbiHedplcfbTuF58WRDmH2vWJaW
 42a8z8TCV6LFxNeQzmI586g+iJVvCoWBMTwTifNR1ugo1tVH9OV6EDt/NcQMA/XKMbvWlkeK1
 D8+PpsjBis4F/lK0RVoK3p9N+VhG40q1uah6fHloe9onAGO8q4BJVqvQzbEpL8sMytYH2HD+Q
 NguWgfxpWAUdnO0P50yxidOelgmiVJM9nA/BVjsPQEgXtSXoi98sWzNkxeMxYoFLtYJAeWWph
 Uy93LgfITfs3kkJlC232p0Gs1Y7Mt2FSJw34Or+4PmMk5WxRvKNvHNXAOWtKei3eRPXMnByGU
 owWOSaMPZYzqIg=
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
Cc: devicetree@vger.kernel.org,
 Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 George Hung <ghung.quanta@gmail.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Lancelot Kao <lancelot.kao@fii-usa.com>, linux-kernel@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The unit addresses do not correspond to the nodes' reg properties,
because they don't have any.

Fixes: e42b650f828d2 ("ARM: dts: nuvoton: Add new device nodes to NPCM750 =
EVB")
Fixes: ee33e2fb3d702 ("ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree")
Fixes: 59f5abe09f0a7 ("ARM: dts: nuvoton: Add Quanta GSJ BMC")
Fixes: 14579c76f5ca3 ("ARM: dts: nuvoton: Add Fii Kudo system")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>

=2D--

v2:
- Add R-b tag
- Add Fixes tags
=2D--
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts            | 2 +-
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts            | 2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts           | 6 +++---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts            | 4 ++--
 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts=
/nuvoton-npcm730-gbs.dts
index eb6eb21cb2a44..33c8d5b3d679a 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -366,7 +366,7 @@ spi-nor@0 {
 		spi-max-frequency =3D <20000000>;
 		spi-rx-bus-width =3D <2>;
 		label =3D "bmc";
-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts=
/nuvoton-npcm730-gsj.dts
index d4ff49939a3d9..bbe18618f5c56 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -142,7 +142,7 @@ spi-nor@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dt=
s/nuvoton-npcm730-kudo.dts
index 82a104b2a65f1..8e3425cb8e8b9 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -388,7 +388,7 @@ spi-nor@0 {
 		spi-max-frequency =3D <5000000>;
 		spi-rx-bus-width =3D <2>;
 		label =3D "bmc";
-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -422,7 +422,7 @@ spi-nor@1 {
 		reg =3D <1>;
 		spi-max-frequency =3D <5000000>;
 		spi-rx-bus-width =3D <2>;
-		partitions@88000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -447,7 +447,7 @@ spi-nor@0 {
 		reg =3D <0>;
 		spi-max-frequency =3D <5000000>;
 		spi-rx-bus-width =3D <2>;
-		partitions@A0000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts=
/nuvoton-npcm750-evb.dts
index 0334641f88292..cf274c926711a 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -74,7 +74,7 @@ spi-nor@0 {
 		spi-rx-bus-width =3D <2>;
 		reg =3D <0>;
 		spi-max-frequency =3D <5000000>;
-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -135,7 +135,7 @@ spi-nor@0 {
 		spi-rx-bus-width =3D <2>;
 		reg =3D <0>;
 		spi-max-frequency =3D <5000000>;
-		partitions@A0000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/a=
rm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
index 767e0ac0df7c5..7fe7efee28acb 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
@@ -107,7 +107,7 @@ spi-nor@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -146,7 +146,7 @@ spi-nor@1 {
 		reg =3D <1>;
 		npcm,fiu-rx-bus-width =3D <2>;

-		partitions@88000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -173,7 +173,7 @@ spi-nor@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@A0000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
=2D-
2.34.1

