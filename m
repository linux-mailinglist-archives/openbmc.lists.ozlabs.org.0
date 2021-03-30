Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6934F458
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F947K23k6z2yQl
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256 header.s=security header.b=d7hr2Bc0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp04.wistron.com;
 envelope-from=nichole_wang@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256
 header.s=security header.b=d7hr2Bc0; dkim-atps=neutral
X-Greylist: delayed 496 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 13:17:34 AEDT
Received: from segapp04.wistron.com (segapp02.wistron.com [103.200.3.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Y4Z0vZ2z2yQv;
 Tue, 30 Mar 2021 13:17:33 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unknown [10.37.38.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by segapp04.wistron.com (MTA) with ESMTPS id 4F8Xtx1NKyzJvXF;
 Tue, 30 Mar 2021 10:09:13 +0800 (CST)
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP02.whq.wistron
 (10.37.38.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 30 Mar
 2021 10:09:09 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP03.whq.wistron
 (10.37.38.26) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 30 Mar 2021 10:09:09 +0800
From: Nichole Wang <Nichole_Wang@wistron.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH linux dev-5.2 v1] ARM-dts-aspeed-Add-Mihawk-GPIO-Line-Names
Date: Tue, 30 Mar 2021 10:08:08 +0800
Message-ID: <20210330020808.830-1-Nichole_Wang@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A209195456C77E93CE25DE9BA20A1C537DD5B25BCA20237EE8026C67F0341C2F2000:8
X-OriginalId: qf12UA9Der031919
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wistron.com; s=security;
 t=1617070155; bh=38Y/0UBHQhwzvJ5L4Ckmi8SW3WvoC9p+4R2IDtp/IWY=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=d7hr2Bc0wqsVlSQYUnDwK0NWbCEVhG6c/O/v/rOgDubRJsxnkSHW82T22/ZKQ3KYA
 w+S1HpwnHBoMX5f/Ea87y8cQt8UO+J/wqPXWG7DM9PDlVoRfHDjvH1m6/m1jCm3Kty
 umcjngndqNDsMyA6Tn9Tt4f0UEVd/j5Pxl6g1nnk=
X-Mailman-Approved-At: Wed, 31 Mar 2021 09:36:07 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ben_Pai@wistron.com, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Nichole Wang <Nichole_Wang@wistron.com>, Rob Herring <robh+dt@kernel.org>,
 small84206@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Nichole Wang <Nichole_Wang@wistron.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index 577c211..15c1f0a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -383,6 +383,39 @@
 	};
 };
 
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","","","",
+	/*E0-E7*/	"","","","","","fsi-mux","fsi-clock","fsi-data",
+	/*F0-F7*/	"","id-button","","","","","air-water","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","fsi-trans","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"presence-ps1","","presence-ps0","","","","","",
+	/*AA0-AA7*/	"led-front-fault","power-button","led-front-id","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
-- 
2.7.4


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------

