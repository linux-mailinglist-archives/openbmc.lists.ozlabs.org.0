Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46457542184
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHyMg1bfDz3bmr
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:42:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=oJayn1hQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.39; helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=oJayn1hQ;
	dkim-atps=neutral
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHyMC0MmPz2xn8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:42:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654670535; x=1686206535;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V7eSAiV8n4Sa/qlO+luFy0LiZ9VQzQVsu/dG6sZEv9w=;
  b=oJayn1hQVLkYUrUqNQO5K9gRRYy6XS/cEf30O+656c6XflTzwQQtf1mK
   skVbAEkAOGK7Xafd13y+E2EWdcZdm6JApa1UQVAWhiNjXI3SOX8KdjMu4
   eA1aChr+MJ1cIGoP7ABBGY1dPQa8vXw18qbN3m8zFwwJ/g4y8QOSmazw+
   M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jun 2022 23:42:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 23:42:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 7 Jun 2022 23:42:11 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 7 Jun 2022
 23:42:10 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
	<clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Aspeed: remove unnecessary i2c pinctrl
Date: Tue, 7 Jun 2022 23:41:43 -0700
Message-ID: <20220608064143.1234929-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove unnecessary i2c pinctrl from machine dts files to make them use
default setting in ast2600.dtsi.

Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 arch/arm/dts/ast2600-bletchley.dts | 15 ---------------
 arch/arm/dts/ast2600-evb.dts       | 15 ---------------
 arch/arm/dts/ast2600-intel.dts     | 15 ---------------
 arch/arm/dts/ast2600-ncsi.dts      | 15 ---------------
 arch/arm/dts/ast2600-pfr.dts       | 15 ---------------
 arch/arm/dts/ast2600-s6q.dts       | 26 --------------------------
 arch/arm/dts/ast2600-slt.dts       | 15 ---------------
 arch/arm/dts/ast2600a0-evb.dts     | 15 ---------------
 arch/arm/dts/ast2600a1-evb.dts     | 15 ---------------
 9 files changed, 146 deletions(-)

diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
index 57ca845b94a7..8067863de880 100644
--- a/arch/arm/dts/ast2600-bletchley.dts
+++ b/arch/arm/dts/ast2600-bletchley.dts
@@ -170,37 +170,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 &scu {
diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
index 515afa83af69..ad0bd4671917 100644
--- a/arch/arm/dts/ast2600-evb.dts
+++ b/arch/arm/dts/ast2600-evb.dts
@@ -243,37 +243,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 &pcie_phy1 {
diff --git a/arch/arm/dts/ast2600-intel.dts b/arch/arm/dts/ast2600-intel.dts
index 19d19f6ef52a..4b5a90b09223 100644
--- a/arch/arm/dts/ast2600-intel.dts
+++ b/arch/arm/dts/ast2600-intel.dts
@@ -244,37 +244,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 #if 0
diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
index dbe888a945e3..20ef7d7b9fb5 100644
--- a/arch/arm/dts/ast2600-ncsi.dts
+++ b/arch/arm/dts/ast2600-ncsi.dts
@@ -245,37 +245,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 #if 0
diff --git a/arch/arm/dts/ast2600-pfr.dts b/arch/arm/dts/ast2600-pfr.dts
index 8596207f5463..16bb84997a63 100644
--- a/arch/arm/dts/ast2600-pfr.dts
+++ b/arch/arm/dts/ast2600-pfr.dts
@@ -247,37 +247,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 
diff --git a/arch/arm/dts/ast2600-s6q.dts b/arch/arm/dts/ast2600-s6q.dts
index 52b620d3b4fe..59fec60936dd 100644
--- a/arch/arm/dts/ast2600-s6q.dts
+++ b/arch/arm/dts/ast2600-s6q.dts
@@ -118,80 +118,54 @@
 
 &i2c0 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1_default>;
 };
 
 &i2c1 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c2_default>;
 };
 
 &i2c2 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c3_default>;
 };
 
 &i2c3 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c4_default>;
 };
 
 &i2c4 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 &i2c9 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c10_default>;
 };
 
 &i2c11 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c12_default>;
 };
 
 &i2c14 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c15_default>;
 };
 
 &i2c15 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c16_default>;
 };
 
 &display_port {
diff --git a/arch/arm/dts/ast2600-slt.dts b/arch/arm/dts/ast2600-slt.dts
index 93c5d86ce379..9935b9c9a597 100644
--- a/arch/arm/dts/ast2600-slt.dts
+++ b/arch/arm/dts/ast2600-slt.dts
@@ -241,37 +241,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 
diff --git a/arch/arm/dts/ast2600a0-evb.dts b/arch/arm/dts/ast2600a0-evb.dts
index 859808a10d7a..0ef856644c95 100644
--- a/arch/arm/dts/ast2600a0-evb.dts
+++ b/arch/arm/dts/ast2600a0-evb.dts
@@ -230,37 +230,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 
diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index a5576a004f2d..61e24ecd7c38 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -243,37 +243,22 @@
 
 &i2c4 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
 };
 
 &i2c5 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
 };
 
 &i2c6 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
 };
 
 &i2c7 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
 };
 
 &i2c8 {
 	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
 };
 
 
-- 
2.25.1

