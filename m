Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA206671B
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:37:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNWz0NFKzDqWc
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:37:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qH+u/Xp1"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVm4qX5zDqb9
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:31 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id z75so4077227pgz.5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXRLs9zvkZRmTv9VRh60BS76TmpoZ75DaRM9D+F+8mg=;
 b=qH+u/Xp1wpY9+0fcnFWPEVGMeD9oNtvwDIlbmiS1v5e6ll6QC8JBHd973kRfLgJl50
 VjDI0ohJRuXwKCXz54uNJvo05X+vGfnqN2pq1FsLzSxg8xznUUTQrpSNZBY+7m4JhX/R
 Fa4ZQxdx2FTogXHpP/faxrrN2j1PH1MNU/zGwek2oxoyE0OzNZ+ID+XsT93wqcJcI60h
 3TSbNzmgZMuwwMUhQBdVIK5ejzF/U7r2eUYimmiDdFUOQLpicw8J/hmJ4yYG/VdsWomT
 6KOw+FNH38RLvjK8Xxl7sptUiJe5YZzRsEf8ZyXJdY9xB/eDECVxs2jkDTEho7SndiX7
 /Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXRLs9zvkZRmTv9VRh60BS76TmpoZ75DaRM9D+F+8mg=;
 b=MvidiYuu3NRKDR5DPY5MbTLiX8mcbJFT+usV1A1SIftvKGcGOssyf3bQBIeMEwhhxi
 9Etqi8owAGLX4eVPuKqVFoLdYbOsW1VfS0s8Ch0zttO9A9k0XBqGHVxwU45xGraxveLm
 seaxBcBqrhR3nHBPIYkJNJ2TvKZQas09jpFuSPwqhxeKW5Eb9RI6F9qnzGBrWSvncFB1
 qdC5aeJj6CYtvcHfJIz5fAFeFZb++Ky3VrJ61U1LabVCAniTfKUfMoEJLmBY72KFDi92
 KKoxZKGUS7Y61ytFwxnWaHyJ2zMSsXhFr/tfc8gz0QpVqoAKdQRkATeyl/F6bBn+XXty
 lmPQ==
X-Gm-Message-State: APjAAAV0fyikAYkdCB3GAqQ/hW4AQaG0YD08pMmE5rWZi5iJ0eru0ofZ
 pf289N/XVdAbf9HnYNmmUYI=
X-Google-Smtp-Source: APXvYqxkFVrEtnS3Yna7EG43f6a75hG072LO4iIIheLtGEsagrQpWCQ3GffzEVVuhFpULy4ObMM7ag==
X-Received: by 2002:a17:90a:c596:: with SMTP id
 l22mr9832897pjt.46.1562913388086; 
 Thu, 11 Jul 2019 23:36:28 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:27 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: 
Date: Fri, 12 Jul 2019 14:35:06 +0800
Message-Id: <20190712063511.96268-1-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

this patch setup minmial setting for match upstream kernel

From: Samuel Jiang <Samuel.Jiang@quantatw.com>
Date: Mon, 24 Jun 2019 18:16:18 +0800
Subject: [PATCH dev-5.2 v2 1/7] ARM: dts: nuvoton: Add Nuvoton RunBMC
 DeviceTree

Initial Nuvoton RunBMC Module which use NPCM750 SoC.

Including features:
1. memoory
2. serial port
3. watchdog

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
new file mode 100644
index 000000000000..831a73e5a88e
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
+// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 RunBMC Module";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	ahb {
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+		};
+	};
+};
--
2.20.1

