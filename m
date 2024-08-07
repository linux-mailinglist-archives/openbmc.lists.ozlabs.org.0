Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A8394A4F4
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:04:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKaLrUTp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5Pk25hXz3d8R
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:04:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKaLrUTp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5NP5NZ0z3cXy
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:03:33 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc587361b6so14439805ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025011; x=1723629811; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CC5pNBBwbHzuFRI5vRop3kEGSaPPEJAGbytrwhnEs/A=;
        b=hKaLrUTpWT72eMPod8aZ8lQ7sIjoLTmLHMSQ+N56/m8dLW6ZJgbQJPA5Y5jNMHR/Ja
         rFLP80ZvSoV8nVrK0EbLfy4X1he0Tx6GHwiZSxTnZ3EjQI6KU3kDuTgw9tftWR2MSOlK
         CaxFA/WrhiSsrTwJ/ltmz/uZysKyzqontQjthx47JsfaNL3W+sar7MKOwPw06891HNjd
         zshcMaoDkHY7ifyQmMJTSq2y4diIPT612OujD29f23Dg+zVPzjnhVsy1bSWtMYI/3NrN
         rpNHkG7b67YpPp7RxqAiDfyCFyic0y98HeYl1eHdd3RFoIIgUq1DVt6+VpoDKgulo/dR
         9iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025011; x=1723629811;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CC5pNBBwbHzuFRI5vRop3kEGSaPPEJAGbytrwhnEs/A=;
        b=osKgutosNdP5eD7bNLF7slMXiEj+S1zmFzJuA1UYsqkV5vjO/PtbYUyfmfrhUzgY+S
         nJVGuBD8VGBrJnHxWZa1ZGwzhGGlP5m/fLWTqc758s+viMdS+t41l63SX45a7+E38ZCU
         EtDrIXmH6Fkd/jRriN1MFh+JcuJJnme8XbxCsY26lsaBj0mc9mLcYoi4Wb2+srhUarY5
         q+SC3OAYsJ2E31P6KlFrPbIPuzpGXLScu5bza+dIQL8f7ZGvN28/ywjkFcDnR57ttt6c
         fG4zuiDRun6mInsbHD8+A002h0QsA2/f922texMoqZGCO7VqAxJ8iNIYP2zUhTjy8apH
         9CsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbDnsVynQHGufzddBtUn1J7m0ILwucGNaL0dg8Mgmp5l1o4JAFplDjW+mSsJ5eiTwEuk9w+S2yf4jCAYd6Tc8nGImWYrsFkB8=
X-Gm-Message-State: AOJu0YzXlPCkbKrhHop9N2TpsgG2InndHoTAygUYmW1hdMwTCa+ovocj
	VZEXofKsoGWywX17bbXuqSp7bNTkGT2aSVmWZ0djWuLLjgd0Zes=
X-Google-Smtp-Source: AGHT+IGaljIfOINvp35rTl5T4iijxPSBPWtVHz2ZOvAehR7Vkfor0vpEheNeOShza8gm7JoO5jsENQ==
X-Received: by 2002:a17:902:ce10:b0:1fb:3b89:b11d with SMTP id d9443c01a7336-1ff57257f43mr185632175ad.4.1723025010560;
        Wed, 07 Aug 2024 03:03:30 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59059f6dsm102022675ad.132.2024.08.07.03.03.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:29 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Subject: [PATCH v1 1/7] i2c: npcm: correct the read/write operation procedure
Date: Wed,  7 Aug 2024 18:02:38 +0800
Message-Id: <20240807100244.16872-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

After checking the datasheet, the XMIT bit is valid when the i2c module
is acting in a slave role. Use the software status to control the i2c
transaction flow instead when the i2c module is acting in a master role.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..c8503acdaff8 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1626,13 +1626,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1

