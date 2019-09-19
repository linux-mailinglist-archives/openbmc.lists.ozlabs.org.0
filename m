Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C808EB7E4D
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:37:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1F332w2zF55T
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:37:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0x46lgRzDrPn
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:23:36 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v2 linux dev-5.3 3/4] ARM: dts: aspeed-g6: Add lpc devices
Date: Thu, 19 Sep 2019 11:23:39 -0400
Message-Id: <20190919152340.23133-9-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Assume everything is the same as G5, except the interrupt is updated.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 91 ++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-=
g6.dtsi
index 72038c16f541..b4991cbe1f36 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -249,6 +249,97 @@
 				status =3D "disabled";
 			};
=20
+			lpc: lpc@1e789000 {
+				compatible =3D "aspeed,ast2600-lpc", "simple-mfd";
+				reg =3D <0x1e789000 0x1000>;
+
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				ranges =3D <0x0 0x1e789000 0x1000>;
+
+				lpc_bmc: lpc-bmc@0 {
+					compatible =3D "aspeed,ast2600-lpc-bmc", "simple-mfd", "syscon";
+					reg =3D <0x0 0x80>;
+					reg-io-width =3D <4>;
+
+					#address-cells =3D <1>;
+					#size-cells =3D <1>;
+					ranges =3D <0x0 0x0 0x80>;
+
+					kcs1: kcs1@0 {
+						compatible =3D "aspeed,ast2600-kcs-bmc";
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						kcs_chan =3D <1>;
+						status =3D "disabled";
+					};
+					kcs2: kcs2@0 {
+						compatible =3D "aspeed,ast2600-kcs-bmc";
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						kcs_chan =3D <2>;
+						status =3D "disabled";
+					};
+					kcs3: kcs3@0 {
+						compatible =3D "aspeed,ast2600-kcs-bmc";
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						kcs_chan =3D <3>;
+						status =3D "disabled";
+					};
+				};
+
+				lpc_host: lpc-host@80 {
+					compatible =3D "aspeed,ast2600-lpc-host", "simple-mfd", "syscon";
+					reg =3D <0x80 0x1e0>;
+					reg-io-width =3D <4>;
+
+					#address-cells =3D <1>;
+					#size-cells =3D <1>;
+					ranges =3D <0x0 0x80 0x1e0>;
+
+					kcs4: kcs4@0 {
+						compatible =3D "aspeed,ast2600-kcs-bmc";
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						kcs_chan =3D <4>;
+						status =3D "disabled";
+					};
+
+					lpc_ctrl: lpc-ctrl@0 {
+						compatible =3D "aspeed,ast2600-lpc-ctrl";
+						reg =3D <0x0 0x80>;
+						clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
+						status =3D "disabled";
+					};
+
+					lpc_snoop: lpc-snoop@0 {
+						compatible =3D "aspeed,ast2600-lpc-snoop";
+						reg =3D <0x0 0x80>;
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						status =3D "disabled";
+					};
+
+					lhc: lhc@20 {
+						compatible =3D "aspeed,ast2600-lhc";
+						reg =3D <0x20 0x24 0x48 0x8>;
+					};
+
+					lpc_reset: reset-controller@18 {
+						compatible =3D "aspeed,ast2600-lpc-reset";
+						reg =3D <0x18 0x4>;
+						#reset-cells =3D <1>;
+					};
+
+					ibt: ibt@c0 {
+						compatible =3D "aspeed,ast2600-ibt-bmc";
+						reg =3D <0xc0 0x18>;
+						interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+						status =3D "disabled";
+					};
+
+					sio_regs: regs {
+						compatible =3D "aspeed,bmc-misc";
+					};
+				};
+			};
+
 			sdc: sdc@1e740000 {
 				compatible =3D "aspeed,ast2600-sd-controller";
 				reg =3D <0x1e740000 0x100>;
--=20
2.21.0
