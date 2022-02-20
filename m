Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A684BD4FC
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:13:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Sg5W9fz3bcy
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:13:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DrbOGJXW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DrbOGJXW; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1WpX3Gryz3bPH
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:08 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id y5so5727864pfe.4
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
 b=DrbOGJXWkMwEjYyrpb0z4riYVX2m3+wuBgJrfSafJ7eF7F8ZWrFVDFtuFb6Hl2NvK7
 UimSfxfbtpRxJP7gw/nXDeYRf4yxnuGsHgfgoZtwBn86K2e5fngQR4rxZo1sBJCmwF8b
 fNtV7d8cZbKwyJJPt76XLEO2EXTe2LP+5cfKB2gbfcrcT10haXkpuWLTmIkODLfHQ4Y1
 PoTidw5FUkydnwfeHtlQe1q7kWldSgyQbhEt4PgcC9HC2cHuaw0UW042eiI31qfJFzZT
 r31RIYEkiVI6gODot/NUcGb7reY8l5Oeg++LNtYX+7dHm0n8Uaw+PdV3z0AnCe9JIWs9
 bl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
 b=nsL2Xb2SmwfPr+vTdU4AQtIXw6gGJEHIBFhyB+5juucIoZe1NWRgrAH37cKQsbIFLd
 T6EHrXOslJHYlH8D1hjoVwD5GsJpd7E2qaIUZ4hbj+vdEpvaMKd7aP/k5Oo8YxRZKkJP
 hxDXs2L3whe0u8i/j4L77sTMAW/nZk27/JbpmkJ2+AX0wBk65gq/jtj3kRb1GFbfxLVi
 PCCKBUp5ql7T0EJwRp1c01ICCtfzR0+XDFokdfP3J1z0FMgREbmSmyyDPnXgtbnjYfZn
 AwaIkuMdlZyKVK07YfTEZLvXOLO3qUOcb2hnl78LyGmhQgBhfhaF8biqRB28IUhxhDRd
 DzGA==
X-Gm-Message-State: AOAM533T0qk4b+PYJnuBotM65mgVOmPc71Xkt7IxYzfU4CmgkikLBYr0
 KgTE/3igsWHj+rW7BCPWjA==
X-Google-Smtp-Source: ABdhPJzChfyBfF5Xt3f1no2uKiR9FXvmqVlTsLehWQUsat8JqGMJX18ebUvpe8/LATTgL0fu2BQgcQ==
X-Received: by 2002:a63:4b07:0:b0:373:e921:ca4e with SMTP id
 y7-20020a634b07000000b00373e921ca4emr6478129pga.58.1645329426824; 
 Sat, 19 Feb 2022 19:57:06 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id pf14sm3642564pjb.16.2022.02.19.19.57.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:06 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 03/11] i2c: npcm: Fix client address calculation
Date: Sun, 20 Feb 2022 11:53:13 +0800
Message-Id: <20220220035321.3870-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Fix i2c client address by left-shifting 1 bit before
applying it to the data register.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9..4c225e1a058f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2131,7 +2131,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
+	bus->dest_addr = slave_addr << 1;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.17.1

