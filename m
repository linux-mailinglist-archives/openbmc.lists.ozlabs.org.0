Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B28B831E
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 01:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AYvPCvZV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTcMS4ZfPz3chL
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 09:48:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AYvPCvZV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTVSV5p5Qz3cRD
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 05:22:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5BE461691;
	Tue, 30 Apr 2024 19:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148FAC2BBFC;
	Tue, 30 Apr 2024 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714504918;
	bh=9uH838bGBhtsxWjwYC5ZUO6ofF47IyznjlfHd2isjAQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=AYvPCvZVa5oChSnb7EODSOuLmauguENJCLdrz/Xhhs0mz0aSaS37EeP/txvzdNao2
	 lNDLsR8yZQugbmt2rgkB9yMXJZIYI0pPQ6+OtxeRu8iAfrO6HMBFxQqCHOmDIhQy1F
	 EGal4bJL5Zt0a8epkruq+P9YEhVJ1jlvi/OkDdiHIEvLbRXDTHgiQlCQPxr5V7YvCr
	 dru9YzwPcZXKguy+a0CXptr1yPW8KmFQ6lk4RsSVQGsD3Vy59vLqh+gKStWxMMAgTs
	 4EftAS4aON7u4xGm10KIxzqLctfkTbvhInKb9FYJ7+N2koEbh/NiEqdrwMT/eq9BRH
	 p/3Bj9CfwDYFQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Robert Richter <rric@kernel.org>,
	Chanho Min <chanho.min@lge.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
Date: Tue, 30 Apr 2024 14:18:54 -0500
Message-ID: <20240430191856.874600-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 May 2024 09:47:37 +1000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

'/memory' nodes always have a 'reg' property, and therefore should have
a unit-address with just plain hex (i.e. no commas). Fix all the arm64
'/memory' nodes.

It's possible that some bootloader depends on /memory (arm32 ATAG to DT
code does for example). If so, the memory node should be commented with
that requirement.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, please take this directly.

arm32 is much worse, but the platforms using ATAG to DT code can't be 
changed and I don't know which ones those are.

 arch/arm64/boot/dts/actions/s700-cubieboard7.dts       | 2 +-
 arch/arm64/boot/dts/apm/apm-merlin.dts                 | 2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts                | 2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts    | 2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts    | 2 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts           | 2 +-
 arch/arm64/boot/dts/lg/lg1312-ref.dts                  | 2 +-
 arch/arm64/boot/dts/lg/lg1313-ref.dts                  | 2 +-
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts    | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts          | 2 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi             | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts            | 2 +-
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts              | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
index 63e375cd9eb4..bd54b5165129 100644
--- a/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
+++ b/arch/arm64/boot/dts/actions/s700-cubieboard7.dts
@@ -24,7 +24,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
-	memory@1,e0000000 {
+	memory@1e0000000 {
 		device_type = "memory";
 		reg = <0x1 0xe0000000 0x0 0x0>;
 	};
diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
index 2e8069002ec1..6e05cf1a3df6 100644
--- a/arch/arm64/boot/dts/apm/apm-merlin.dts
+++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
@@ -15,7 +15,7 @@ / {
 
 	chosen { };
 
-	memory {
+	memory@100000000 {
 		device_type = "memory";
 		reg = < 0x1 0x00000000 0x0 0x80000000 >;
 	};
diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
index 033e10e12b18..e7644cddf06f 100644
--- a/arch/arm64/boot/dts/apm/apm-mustang.dts
+++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
@@ -15,7 +15,7 @@ / {
 
 	chosen { };
 
-	memory {
+	memory@100000000 {
 		device_type = "memory";
 		reg = < 0x1 0x00000000 0x0 0x80000000 >; /* Updated by bootloader */
 	};
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index dec5a110f1e8..f43cfe66b6af 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -50,7 +50,7 @@ chosen {
 		bootargs = "earlycon=uart8250,mmio32,0x66130000";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0x00000000 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
index 1d314f17bbdd..c50df1d02797 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
@@ -47,7 +47,7 @@ chosen {
 		bootargs = "earlycon=uart8250,mmio32,0x66130000";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0x00000001 0x00000000>;
 	};
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
index d005e1e79c3d..89fc4107a0c4 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
@@ -14,7 +14,7 @@ / {
 	model = "Cavium ThunderX2 CN99XX";
 	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
 		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
diff --git a/arch/arm64/boot/dts/lg/lg1312-ref.dts b/arch/arm64/boot/dts/lg/lg1312-ref.dts
index 260a2c5b19e5..cdd10f138098 100644
--- a/arch/arm64/boot/dts/lg/lg1312-ref.dts
+++ b/arch/arm64/boot/dts/lg/lg1312-ref.dts
@@ -22,7 +22,7 @@ aliases {
 		serial2 = &uart2;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x00000000 0x20000000>;
 	};
diff --git a/arch/arm64/boot/dts/lg/lg1313-ref.dts b/arch/arm64/boot/dts/lg/lg1313-ref.dts
index e89ae853788a..6ace977ff4cf 100644
--- a/arch/arm64/boot/dts/lg/lg1313-ref.dts
+++ b/arch/arm64/boot/dts/lg/lg1313-ref.dts
@@ -22,7 +22,7 @@ aliases {
 		serial2 = &uart2;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x00000000 0x20000000>;
 	};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index a5ab2bc0f835..eeceb5b292a8 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -16,7 +16,7 @@ chosen {
 		stdout-path = &serial0;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 9ebb7369256e..2e5b6b2c1f56 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,7 +25,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 1b8379ba87f9..34e2f80514a3 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -16,7 +16,7 @@ chosen {
 		stdout-path = "serial0";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0x20000000>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
index b48b98c13705..e5c0dbf794ae 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
@@ -17,7 +17,7 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
index dcee2e28916f..23ae2d9de382 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
index b16b7ca02379..7f14206d53c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 6b95fd94cee3..5724cac87e53 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -24,7 +24,7 @@ aliases {
 		spi0 = &adi_bus;
 	};
 
-	memory{
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x60000000>,
 		      <0x1 0x80000000 0 0x60000000>;
-- 
2.43.0

