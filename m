Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D771B94A519
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:09:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=axJF8ehb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5Vs5d4Sz3dF9
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:09:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=axJF8ehb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5Nx40Msz3d2S
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:04:01 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-70b2421471aso1085101a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025039; x=1723629839; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W94oTh1WrpjtYbDe0PsjN6io4lhC/2PtOkavVHNKo6A=;
        b=axJF8ehbyIrfoYo54qRd/2Guu4DHZF+K6xXzOZuxapo7uIKKVB1z8VHcr6lD+9PXt0
         X932iWdpdaDlFCwgPnUvfSkiXsVaP73mbiKiHaqGvM8+q2ubmlunD7PC3MqYrapl7fVN
         dSXRShMrAl3iOUVSm8LM7bqPjoShWnKSCcE6Z3C9hWIMBzaK1SuaEB1X560AiieqX2uC
         OqTu8Qlw30KdfxhdDCE/3O+xqhnPZDuVKGaNw2ZDIp0EUD0bI1CTBh0zcgz1wCQSlxAL
         IeoqDuAYOhSNi3aK6T905uZ8suRRmcDRk7w0ompn8mqscR31e3+LGtyym0BN3ruF032H
         VQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025039; x=1723629839;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W94oTh1WrpjtYbDe0PsjN6io4lhC/2PtOkavVHNKo6A=;
        b=clMTOu+Ty0cvEAXztd/hynG+g19x41aDTMJRx1Q48LDrQTqbrmvg0KN8BDwgEYCFFO
         BMAT13sjI0zCtrmGtmeXnBxg1uZlZvw0MHbbRU5zP1E1cXM/fc3Xa1pOMv+5AyciGyt7
         +1ePYYrT/vzp+Kj/8n5WiS6pALDY+KKedY9454SPiryjwlilXexko5MbFDwIrFqY1YK7
         5KlDyWedXUoWd7q6XG2bwEAYHq8kT3KZB/2MhbWq03FUuC2DkFeVPEO11JJ4QgK+2Doo
         nvdjcAHZsUvryUhMOe1wJSMTT2eMn5Ev5yzVoWHQwlBRD+sfWbX8YzhyOe+/1SBicIdQ
         P6AA==
X-Forwarded-Encrypted: i=1; AJvYcCU4UWjiW7GZNBQfEQI0ZW+G2nY6k/0O+sM0YktFn1+5Qily8lIpeIkdY4WAwNl7CYJAQVOUwD3DOzyMbTj3gUYIgc+tDYe/YCY=
X-Gm-Message-State: AOJu0Ywu8NPVHabsHqKTktRkBNk9667UBkC4srlmKvDzgy6eymNO+kXw
	Rlq5q4nVY0rhcILGKs3I8GEL1VIJkkC+YVGhOR0kll7WlHlqWx0=
X-Google-Smtp-Source: AGHT+IEtErHrkaTLB2321lpC9Qnp5UW5M58gOw9LihcCHDK4055uDANBVYx2t8DdEPxzwS/tqCkoxw==
X-Received: by 2002:a17:90b:4c05:b0:2c8:85c:750b with SMTP id 98e67ed59e1d1-2cff952f21emr16992766a91.34.1723025038868;
        Wed, 07 Aug 2024 03:03:58 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3aee9acsm1116910a91.26.2024.08.07.03.03.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:58 -0700 (PDT)
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
Subject: [PATCH v1 6/7] i2c-npcm7xx.c: Enable slave in eob interrupt
Date: Wed,  7 Aug 2024 18:02:43 +0800
Message-Id: <20240807100244.16872-7-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1537fb7baa8c..1af6a927b9c1 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1779,6 +1779,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1

