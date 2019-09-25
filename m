Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12590BE1B7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:52:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46djHm5B61zDqXN
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:52:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="c84El+61"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IhtErmMv"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtz6X1VzDqkj
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C30B24E4;
 Wed, 25 Sep 2019 11:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HRs8+Drky/wML
 PBWMOY2iD1lfUMpX4sV0TrXZyTmoQQ=; b=c84El+61IKPxb61VzCYLJ4aa3ogkJ
 wXDRrtL3+mBad5mJQMLnCVCUAtKHXQB5K+7Gb+TwuuhckqbWHrEVjVlmAJOTvICF
 9jSgE9zGhTMjTP9qu4KMLENRVGDn8kWofaUKPwSc+kTyVnGBG7yVE6YwEn9vX7SL
 STrVOChL3TOc7PrKaNuKI69uDB211VGCb4xUXPpb+TRlbNmGm8eNykvba9I43PRH
 WlanJBY2OdBazzs58/Str3dqKY2RZUIET6p2FLgensL41qIbtD2sDENKWgr9Od8q
 VnRoWwj8THSsYd8EBOcNrRngR4SFp/g+TOqXFxF4QKpdovVmBkS02/yDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HRs8+Drky/wMLPBWMOY2iD1lfUMpX4sV0TrXZyTmoQQ=; b=IhtErmMv
 CSWPfNU4EZ5JeZSR9SAPCnPO7Dy7VejYnAwPz0Nwx6QwZrs47Z51YM2wPPLwSfER
 t7TZarLRpXzMXdv3O7nwgmBiuZk+u1LeHIIPUsA4HKyy4fWr9uJfcFYXx6aNXkH8
 diFZP9MjpqcBkP5OlAGFyG3TzgeVS32FH/WZEfQiQDkj+Vvt3rAZq7g/I/VN9+HV
 HTcX4yilAyOgTA+IJuT5u7YStDG7O5BZYa1OR5QNxBE0ouzgh0RxAZYt881+c1I1
 ltJDaryJIEA/9ng+rHu3GtYm0J38BNr4kHMMce4uzZQkecW1QxUraEqJLZm3BFNA
 xFix+VQjZ0DICA==
X-ME-Sender: <xms:CYmLXbDApz87OrjQcIZZWm4WaXPeiCGjPesiB0Ma7ga_JE834pqh7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepie
X-ME-Proxy: <xmx:CYmLXV5kHNyEOqsm0adzLfSP5NbsLrmsDmiZkX70LVP-j00Vj1p43Q>
 <xmx:CYmLXUdtmXfbdAuy1knSGpH74Vw8ZUw9kX30Z2FxNSEJS3WPuhvy4w>
 <xmx:CYmLXbvnf1qfeSzgWUc3LoZi61M4z2ssW4F6bKfM2WJLzm5QNp26ww>
 <xmx:CYmLXQIn8RTCdjKVRqnh5KiO0N-l1_gyHXMV0PaqiBDd1dfqOjqBFg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82DFBD60057;
 Wed, 25 Sep 2019 11:34:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 8/8] ARM: dts: aspeed: Add RCLK to MAC clocks
 for RMII interfaces
Date: Thu, 26 Sep 2019 01:04:39 +0930
Message-Id: <20190925153439.27475-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190925153439.27475-1-andrew@aj.id.au>
References: <20190925153439.27475-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We need to ungate RCLK on AST2500- and AST2600-based platforms for RMII
to function. RMII interfaces are commonly used for NCSI.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts | 3 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts      | 3 +++
 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts           | 3 +++
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts         | 3 +++
 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts         | 3 +++
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts           | 3 +++
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts            | 3 +++
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts         | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts             | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts              | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts             | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts               | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts              | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts               | 3 +++
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts        | 6 ++++++
 16 files changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
index 521afbea2c5b..f82dba54aa77 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
@@ -92,6 +92,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii2_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC2RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index 682f729ea25e..0f30919fde3d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -126,6 +126,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
index 4e09a9cf32b7..32f7ef9db0a1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
@@ -90,6 +90,9 @@
 	no-hw-checksum;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 2339913b2171..e65207b938f8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -273,6 +273,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
index 2337ee23f5c4..58a746b72d98 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts
@@ -77,6 +77,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
index 22dade6393d0..ae571129b6ec 100644
--- a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
@@ -69,6 +69,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
index d3695a32e8e0..d966616fb34a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
@@ -133,6 +133,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
index 118eb8bbbf1b..8193fadeaec1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
@@ -139,6 +139,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
index de95112e2a04..89dedaa920c5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -178,6 +178,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index e55cc454b17f..52e88b09c08b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -449,6 +449,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index bb513f245a5e..a2eef507ffbb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -162,6 +162,9 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index f67fef1ac5e1..f6197c70c231 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -322,6 +322,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
 	use-ncsi;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 408af001c06c..854b0a532a01 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -28,6 +28,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 7b8c997b59d9..c677b7f0fee3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -295,6 +295,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 3c514dfc7fee..51e749b33fd3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -189,6 +189,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 33d704541de6..7cac89c7aca6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -80,12 +80,18 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default
 		     &pinctrl_mdio1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
 };
 
 &mac1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii2_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC2RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
-- 
2.20.1

