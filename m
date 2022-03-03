Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C84CB919
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:34:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PQs3xl3z3byL
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:33:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AJBqM8KI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AJBqM8KI; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNX0pzpz3byP
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:31:55 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id c9so3925305pll.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
 b=AJBqM8KINeoSRfWd9e1yx+VHrQVOEYrRFBl3cJiRuwIUKEbKVendgOQ7Xy46sdKU3k
 glEwJj3KfpKi4Qm2qhlqxhpUjd5S5v/Dy1R3NBpp3YS0QBY6+cuKJcFcMgZaRQSkhs+B
 1fONo7ec+hBHBOMcreST8AMQeepSlkLBe5XAgpIGa62HQECMIDO8gzkwiDvDmlUGNOUU
 QZND0Vv/NyOhr/Rq3dQObQ0poDmRxzIXO+xzOyr4Mk0NS8QLXeCwhm+dZIcXgq8PJnLh
 kccjPPScsJCao6pDfscVLkAg2Mgk+b0VmqdnPVdO5vqApQrDdvuC0Yc+dvcs9zp2Ff6D
 8IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
 b=OvxF8Xuo1nrQIUF6/JmSQxqVtTXPj8yn1NY5mP9UIn5syhE9xlNN1enu4gBfPf9kyk
 TBRc4HcNral048x/zPXRgGD0qj2VIuLku0rwwNec1mR0oEFtgPjFJ6E5fbfLENHwyrF5
 nUcvJTFThgLyRm+fxpRTdu5Rjp8W4BMmT1o2TVHGpiR6HxNMBBd2WVfG/6197T8DWpc4
 Jhxp+FO6/Wv33sFxjJ6uZuAVzh+JgVfZi8NrZiml//V6R2cEfZPmqsBUFw0YbFk3nohb
 QY/7msXmhYRT7NqNlxxDIFRr6m3LlCYtWW4cl3AxIjZBQjuvBqeuNWd63DlIgUUjyqZS
 yFLA==
X-Gm-Message-State: AOAM533j6oE8N5qn4L85gH3IONiGFk++os8dmaRcM0wvFuPEbJuuzWqO
 Y7O8usBxHSaUcGixAN9NoQ==
X-Google-Smtp-Source: ABdhPJzZrSthr04PXHtErJjKuzAkidzKO32y5t0cJZbCPeiqz0iaSN6WVOgZ7Iqc0ZrnKM+EKsrtIA==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id
 y3-20020a170902d64300b001516f2ccfb4mr17463091plh.120.1646296314590; 
 Thu, 03 Mar 2022 00:31:54 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 ng11-20020a17090b1a8b00b001beefe9a1cbsm1488852pjb.31.2022.03.03.00.31.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:54 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
Date: Thu,  3 Mar 2022 16:31:33 +0800
Message-Id: <20220303083141.8742-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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

