Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9114A2D68
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 10:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jm8HR20MRz3bW9
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 20:32:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=GODZTR03;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=GODZTR03; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jm8Gx3Npyz303n
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 20:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643448699;
 bh=D7rgkhQ57nbk53MLqwVeodUVHa6zUEeKtJ5R3AU99Ms=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GODZTR03kAqA1EQvaWgGzO5mpwJpE2bzAP1UmexkBVOk7SxcNNLBziEbRr+oqmsf/
 GDqbj85vHxd58r1eIzC/SKTyPWnABc5U0Bd3WOWGstYixqUE3+kLvw2muPtFcW6yOE
 8OjASb/B6n3mD6DpwhNc2pwgtPCkwAfb7s0Y2+cc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6m4-1mX0rf0FQa-00lU4c; Sat, 29
 Jan 2022 10:31:39 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: nuvoton,
 npcm7xx: remove bogus unit addresses from fixed-partition nodes
Date: Sat, 29 Jan 2022 10:29:56 +0100
Message-Id: <20220129092957.2189769-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LkNGm0idUbl+qi69GkTuh98bAQ1fCO3fAj1Oi4R4OxcDtIVWBSn
 HSielVDyKOsbvIWKemrpwF15/S2D0/evvKWXZWDXLTzBs38uinRBEjsVompQ+aW4iBx/Abx
 neuO9nRtJWmaG2dFMnzqxc5LquketEE5BIGxu9NDo3Q2VCuePizgXghCZRIjkLylVOHZPyI
 IE9FJGczWzevtKy6Sk+SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1DelM3YvDQw=:4eDFFnnBYNfHlQVoVZkQzD
 v0WZYylljURUdWR/ibjKeH0YflwanU8LzCXhvdndyN5oBS0QccUA4zO5j8cpAAkPZj8Jo6pz/
 KFnN2zJnJFMz/T73zfE7NRZdvdYAXBXtW5bsC/p4D6WD5dSMmjhLbshoNKIiH8bAoGbf43oZr
 KwvyNtu19S/1WO0QCxkVFgpIfcGMIicIQ5l9b/wu/620618YKoJCgf/Le+tYinCoz/P11o/QQ
 U1upvGxIyaD7BKbGlxB/v1B/Nhq6Q3nQa20oWCfyv/mCGu3aaVDDeZ2UsYw8VJOqgC4chDi1i
 y36lYE/fGyPbtIwut2EsHGwIKjMoaMC2o66quQ9gEpSHdrjLLaDrvdZoQ2Lz0OHslIauKeNwK
 7d3QXKlPYxxrnIqyhFLUgJ+5ZtguyrviiALzT+SqxiAhKJCSgHo65MT0cbNn3pT0tMRuEB8HG
 E2xsiPUEq81cEh+cVCSzJnla8N4tzcHnABWKCHZd6mRbpL1r4glsKwJO7VWBeIG+A02Q+8qR3
 IlBxN7MzhAeoPj5QuG036p7OHCasicTajv9niqpuLVggj9lxxzIh0YzqHtsaVXRMdgLo/72Tz
 9UfpzgO4Ug8vAoOCiDneMwKOl3p0IJkEBAVVOdNjwgD1XnXnnyVMxR9VLnY6zd/pQXgEcIcnE
 X0apjVQriN+C+3ZN4fMzYuWxaMPMlRfFfq+FOzXcruhAtkZlp9nihx/17PmWqidXxGqOLp766
 DuK2H/ytNdwOyVZL3JJ7pbI984lyZQ8UURoSmZE6Bz2aY02fn3nNPzMSvB+y2fUrdGSxuN9ih
 H28dsqBO8gZb9BuhLcsmPxf/7P0/fNdFlgfpy6ylJi/mN8Pj/hC3dEvm0NIUV+7QKTalde2tr
 4TyRE9CsVnElsUjR2MIPdrSfmDQhGM9XaxCYC6DFoEkqioraG/3F+KhkpW/WuxjekSVR3DCjt
 7INpANxG4ycHxbg+Q1gbZiVH0duHQU4yQkfZc1r5WyzbjjB5ZoFk/i6q/ZvHTUI260zgSQlqV
 Jq7/t25NFU1TGKovtxJwbodZv4IlfnBJTDIdHMVhj/2WEZRK8CO0cbx+sR6j/yWSuYcKgi43q
 XYuKvkS3ExWeR0=
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The unit addresses do not correspond to the nodes' reg properties,
because they don't have any.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
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

