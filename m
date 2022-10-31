Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79A61408D
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 23:17:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1SDy14pBz2xl0
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 09:17:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=E9iMdtBw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=E9iMdtBw;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1SDH5WjJz2xks
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 09:16:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667254559; bh=k0wntXovT8y+3q2bW9xnG8ebvi9av0hnSUtJFwuAgWY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=E9iMdtBwLys9gdh+TVM/sArwhbKe1ZXb6z7AFA5BJvrnDxUZ02B1Rt8lhIQRSkPXj
	 5y8c44dS8g2qo5bg89Uk3Xo/hHHI/2euzTXt2CPBX2gXKOJFuoJ/4JyIZck05Mlg+q
	 sw1707yWHnKTYH5DEjsyZBWGnROtv4evBqVn/BLN1CUhfCxRwkDbVHiQUcJCG4IpS3
	 E6mXn5mZsPGSOMUTGoNAJ+Zz49tau0G9vqolwwYNSYwSFew9gIGTkc3OEOeegbDOkF
	 IZva3xaNySN2uzkmywdUU5G+bxuV9VrAl5ByBJwmbYuq6p4peVkU3UQMB49EitKA6l
	 OagHTng6veuHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.189.154]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1oeJDM2Tax-00O2bT; Mon, 31
 Oct 2022 23:15:59 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3] ARM: dts: nuvoton,npcm7xx: Remove bogus unit addresses from fixed-partition nodes
Date: Mon, 31 Oct 2022 23:15:52 +0100
Message-Id: <20221031221553.163273-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lmzzG6ZGyQK+o9pIW2y06e7z7FNSxi4+h6BURLcimbjJjsCt3Qt
 LsklkNkr4QVQGtN8HjraIeCu/ySvKIDrhJ3HVPw9g+eL6aQ2hm2Bi9KpnH97J8ZXN3I86wo
 9MA0uc6UnA8Xjnl6PbQGOb5O0Q5cTyPqOIm+YCZrnMKTRs+aYp3C/WZ0+tQIohSqptwk+26
 Fb/o2/kPHKBWQBmqnbWDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VeRaH5dMNV0=;3rSdmktspJtF1pJNNiSt7EC0bKi
 p7rG+xYa6hA6r4tqqa8iwEHebopjdJqo5dOIw8FbR7/Cqkx6EbCNLc1cIuiU1qtoLAgs19XGs
 G5tbYk7X8RMFYaB70n+w9RVRuSHznPbwLrftiSOZoe/S3NspdEAL9YUw8qI7Jx9MsX5UfaCIP
 mnVcSlOkOfO98u3V+1S9k7r7bqdyfM/8vR88calShlhy4Ez6LGKc1Egp1BBpBPYyBbXGuy0O5
 kK9aHWHjYeyezOC4gslsAfq/ep4q6nGqThJoWswYhE+/wRyPwK3yImvLRNG0bSB9nZhIFWJ7P
 NwMqmXlW5rA3ykHpbF4vKkb7GG6uFqcN7lJvvozRmo5H5uvpZ3vDtQy4CUE7x9Gi2IsTVfv6H
 L9kakK2aZZT3rxA9YUjxVUlAAYG1nQkMdyd1Ixk80hL3VPhF7roym8KoohDwHsRF6PRh271DB
 lRBvUhnMKC40y3a9FZpDSHUnvWWm+1a70TdN6kL/zLMmeQmxG6qj0DqnmL7iCvDDjwSk8l1RV
 9PsxaGrCZh6ciZqZ7weKXCZswGuJLNAp7RXuaybpvDNf3gMglwke51vEYmN3rJxJLV0ypSc+G
 3l5Ju4dobMpTrii+4rwOHpJXMWlaqrxfKE92JmBwYcnbstvCkNVequVWWXsgLH5xwD+GXhn5y
 lz1fWTiGprlozpo/C3Xe+PSy53Vm7WeU1PF44K6BC7i2K3aFdfehvOaH86g+SLZ9pXKP/O7Ta
 Nz19GzTuTNnuAeN/jKZpTKUwDrC8+rNr1kMij7Z7gfPJCP3o/ybbNQccSYtUJr+uRE9itkLHs
 tQF4YNQ/zHFfGkKfBXagEB1NGiCxlJK4n0jJH+RrY3ifVk4ofIEdXPUZNOuUWMG9PsTUXCYOb
 L14KCOwIAVkKLpk3yb2ty5VXUHYq8XezVgWwmWwTMSWS0x/qvG882GVgsev+q2w89lq8gJEn3
 ddw9SceHGdFS7jJ2HRnN2uY2EcQ=
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
Cc: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>, Vivekanand Veeracholan <vveerach@google.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>, George Hung <ghung.quanta@gmail.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lancelot Kao <lancelot.kao@fii-usa.com>, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The unit addresses do not correspond to the nodes' reg properties,
because they don't have any.

Fixes: e42b650f828d ("ARM: dts: nuvoton: Add new device nodes to NPCM750 E=
VB")
Fixes: ee33e2fb3d70 ("ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree")
Fixes: 59f5abe09f0a ("ARM: dts: nuvoton: Add Quanta GSJ BMC")
Fixes: 14579c76f5ca ("ARM: dts: nuvoton: Add Fii Kudo system")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--

v3:
- rebased on 6.1-rc1

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
index d10669fcd527d..9e9eba8bad5e4 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -366,7 +366,7 @@ flash@0 {
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
index 491606c4f044d..2a394cc15284c 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -142,7 +142,7 @@ flash@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dt=
s/nuvoton-npcm730-kudo.dts
index a0c2d76526258..f7b38bee039bc 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -388,7 +388,7 @@ flash@0 {
 		spi-max-frequency =3D <5000000>;
 		spi-rx-bus-width =3D <2>;
 		label =3D "bmc";
-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -422,7 +422,7 @@ flash@1 {
 		reg =3D <1>;
 		spi-max-frequency =3D <5000000>;
 		spi-rx-bus-width =3D <2>;
-		partitions@88000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -447,7 +447,7 @@ flash@0 {
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
index 3dad32834e5ea..f53d45fa1de87 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -74,7 +74,7 @@ flash@0 {
 		spi-rx-bus-width =3D <2>;
 		reg =3D <0>;
 		spi-max-frequency =3D <5000000>;
-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -135,7 +135,7 @@ flash@0 {
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
index 132e702281fc5..87359ab05db3e 100644
=2D-- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
@@ -107,7 +107,7 @@ flash@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@80000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -146,7 +146,7 @@ flash@1 {
 		reg =3D <1>;
 		npcm,fiu-rx-bus-width =3D <2>;

-		partitions@88000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
@@ -173,7 +173,7 @@ flash@0 {
 		reg =3D <0>;
 		spi-rx-bus-width =3D <2>;

-		partitions@A0000000 {
+		partitions {
 			compatible =3D "fixed-partitions";
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
=2D-
2.35.1

