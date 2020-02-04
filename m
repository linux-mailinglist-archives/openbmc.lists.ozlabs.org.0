Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D009B1521F6
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 22:31:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ByYn70KwzDqJq
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 08:31:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=taIfjvfU; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ByY46RSszDqJY
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 08:30:48 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id g64so18578645otb.13
 for <openbmc@lists.ozlabs.org>; Tue, 04 Feb 2020 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBXZaCs4PXdmOMR8DO5YU2Lw/xeKs3Ih8j3gM73LBF4=;
 b=taIfjvfUxZhVzSyZX0aF34hgH1s/I/sRpqAoGH3H+ai35Vy5Af8dLb/E/drJyALLuF
 NoYfzBG6BDuuUTy4sfn+3+S8E3coFPa0LSH1G9JYxGwoayDNP4945AGUxCmFMrMSIs47
 5CfHYYwLTFwGhZdhqNPABEQbV5MzwxGIbrnBX5BFq3/7yj3VN0g0zYRqKSjff5uHvl+1
 vVBb06WWRdscHBMRO+WNHfg6mpgDnk1+PPoUySPu7XDeg7g67wUYgciPptSjMEz5UAU2
 foMuVI/MdFGJ3lR0qBuoZ6wW624e3l3aRC3foMp5UpDZ19cumJFe5YTK/U+ZCw68uZe7
 MFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBXZaCs4PXdmOMR8DO5YU2Lw/xeKs3Ih8j3gM73LBF4=;
 b=CGe5K+9O7w3tvLlvI4GJFoIx8hvChoTbRc2qw9Wn0MCaJqYr+qt7tkglMWbpn/iPJ/
 lQYyraDbHdn9Mdag0pPWg7RDEPbLvDwPXspQz3kAbE5JrAvnvFokA2QBZreB4Qshzf/D
 IYzrWQJyMBVNIpIGRnGB2qrcCaiMvssfmyoYu31nSjMf6uiXP+3IaVaWRMfgHfaKtf9i
 u3U3M7y1+6GJMvtVjks9pQzs5fng39f+u333iz0AtQaUuStfwrlhi1gR1CSobRz2ILEQ
 oEPPOX2yhsWjgOrZBRoxPcXU6qzmxJyXiJcDtMHjFKfHUqWbli1lSDAnkTJskXCojpeq
 t4QA==
X-Gm-Message-State: APjAAAWOUCIUbbWf0A4Q5cDoaaixBfdfsiEx3V+AaIP09RKq9x+dRHjJ
 HtLDu81WkzfpwcZmOd68JOOTommFQPA=
X-Google-Smtp-Source: APXvYqw791Ko7yTe86TTqzvY33IUt0Qm6JSPUecNHp4gQOEKOR2zPD3CQK8LficGtMVWKinZnyUR3A==
X-Received: by 2002:a05:6830:158:: with SMTP id
 j24mr24247708otp.316.1580851845995; 
 Tue, 04 Feb 2020 13:30:45 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id z21sm8207163otq.1.2020.02.04.13.30.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Feb 2020 13:30:45 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.4] ARM: dts: aspeed: witherspoon: Add gpio line
 names
Date: Tue,  4 Feb 2020 15:30:37 -0600
Message-Id: <20200204213037.42100-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
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
Cc: Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Geissler <geissonator@yahoo.com>

Name the gpios so libgiod will work with them

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 515f0f208ee6..d3bbd4fc2539 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -193,6 +193,47 @@
 
 };
 
+&gpio {
+    status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","mux","",
+	/*B0-B7*/	"","","","","","air-water","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"enable","","","","","","","",
+	/*E0-E7*/	"data","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"ps1-presence","","rear-fault","rear-power","rear-id","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","ps0-presence",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","trans","","","power-button","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"clock","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
+	pin_gpio_a1 {
+		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "cfam-reset";
+	};
+
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.21.0 (Apple Git-122)

