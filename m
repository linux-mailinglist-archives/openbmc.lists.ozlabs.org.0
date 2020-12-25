Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A72E2975
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 02:52:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D291R5qpSzDqMv
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 12:52:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fA9db9+5; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D290W5r6GzDqLt
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 12:51:36 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id m5so1947462pjv.5
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 17:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6AGNH4UIY+m7MmTftXnjADVirlPmaI5B+EFnjY0m24=;
 b=fA9db9+52TvIiwi15O7tKBLo+A/TwaCEdfxJhm9JQTwMfKfEQiASpJVxKixJu3t4ng
 pEu2lnRp8K4hXnFkOvHXqaqJqrrsqmPcP2r1p9/ltl+df+uJCeGwdfWOBknQopXltugS
 gbWcJQpUXMILBhNxa7DweKvc2bVggELSfR57/88nFAhMote64OCikGGHgkbvsfwR6MOL
 a4wI+3zHS9y7CRXy+u/mEUk78y10HkOtT3/gNyPW1r4J7ECwRzajVdkhRpWnGQFh6mlp
 pVwrbTX4Yk4e72zBB/lj8Io21q8pLbvRLIVqXEqhKoMh6NR39qj9KMppKY+xoYHbb4+/
 EgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6AGNH4UIY+m7MmTftXnjADVirlPmaI5B+EFnjY0m24=;
 b=ZHSjUnDp2xeoHjO/nup7YMH/g1G9onNkqZrzC5vpF5XWS8K+UsnPRGLWI+g76dKU0V
 fSTCxwNAFr/QZp2DuWdzgs0MK9mTEYTf3/s36u7Gq5W0tBeuyQaAa5+QVBuniFNNz4Bq
 3y3ooWin43vUnWPra9kwVq/DuQQBuszEye50K2t5eXNLr3PXOelN+ukCWOwJY6XAejmf
 oFJDDUwsvjXmZjutFNsTN4v6FSH0cMmmuiRHcWMnqAo6Rkpy7H6qEwj6pMPCXSKuprrE
 42pH1dbvHMwHP7ZtgNdj8qd/rNlOSiMYwL1S4gJ+qgmgzTj2OMHvSsLpsYByTkRYKrc9
 90Ag==
X-Gm-Message-State: AOAM530k/mUtxGLAp+cIcnD250krphellSyTF8cHEJ4sTEV02cV01F+t
 7kcbC14R9V2Jqd1qeKnesEI=
X-Google-Smtp-Source: ABdhPJzMb/Eda99uADaP7X454vT/gqE6Blqg+d76Gnpak42brLOJ3YJnEjq9icYGP80ZqNwtltbWnw==
X-Received: by 2002:a17:90a:5887:: with SMTP id
 j7mr6539584pji.79.1608861092500; 
 Thu, 24 Dec 2020 17:51:32 -0800 (PST)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id e10sm24518173pgu.42.2020.12.24.17.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 17:51:32 -0800 (PST)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] ARM: dts: aspeed: inspur-fp5280g2: Add GPIO line names
Date: Fri, 25 Dec 2020 09:51:26 +0800
Message-Id: <20201225015126.1416690-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 62a3ab4c1866..efe521538d70 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -204,6 +204,39 @@ iio-hwmon {
 
 };
 
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","front-psu","checkstop","cfam-reset","","","init-ok",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"ps0-presence","ps1-presence","","","front-memory","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","front-fan","","","",
+	/*I0-I7*/	"front-syshealth","front-syshot","mux-gpios","enable-gpios","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","power","trans-gpios","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","identify",
+	/*AA0-AA7*/	"clock-gpios","","data-gpios","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.25.1

