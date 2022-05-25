Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2A5335C7
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 05:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Ggl5Dnnz3bXY
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 13:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jKuli6//;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jKuli6//; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7GdN2plmz3bkw
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 13:24:24 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id n10so18517695pjh.5
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 20:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0rffUNaGY9JVFcRgt64Xz6CcZdQ3YWgSvvOXYBNVtz8=;
 b=jKuli6//St0+LziZumcEVU9gK0gJSh/AzpWH/KvZOrjGADjGd6q9QqwOD441webjpK
 gilAjG+LuVOpD5IOFK/83ezJe7pJ1xqeoRB4UvizS6FSRJdbXVn2SzPhhAsakxycJwyn
 7GpFGlNuuN9u8cwWO24d/KKSp0P81EbToYQUryYUC6uqU2aEmdYMj935T+wh9nVI7KZm
 phcqaebLfwXYhPlJYL2KvrRvV/iV6MH4KGFT7f2eaDjIIdP/B4tUYjWXq9CoX2quPY3w
 CTPyYOnMOliR0s4mXNMyyGCBhUjg/CB3CecF3CxL995slIZGw57pNDs5Qnw+edU1DIPT
 j8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0rffUNaGY9JVFcRgt64Xz6CcZdQ3YWgSvvOXYBNVtz8=;
 b=NYy/rZCcGxYdXO4H3AWjMR0B4FVUlHznC/zzza2unYtzwBy3NdhL3GTesqSviwU6xU
 zKReOlMvy06gQFMC+tObQcVwFAyZV7bq4BFG3vJKqil0ffUCGhWaRSIqBBQEY5swaWR6
 i/vafR1kp8wWmItPh1LzAkpp5sIGkbpB5kcm1QbyB6RrNLp+LUFAuqK71A6LrLE+Df74
 FP7mk44z0pcKxXnzkmiv0eE2XdyG0XfjsDcbsH2+a3EbCqoTrnZllCNB+mhLVVmUe4Ym
 hFQdKSI2ljd68BXMJDKWXMYgc1NZY7/mcFmobIP3RQd2Sy2LdNppwLTTfJlmtXfAASTj
 teLA==
X-Gm-Message-State: AOAM532FLZFBKnHlJU80GxbNI7Fqz3Fnnuxx6rB69TqsOVP7PByIdqdl
 q3Ils1IAkl2CV120VoqobQ==
X-Google-Smtp-Source: ABdhPJwAu5NH9jyXsBMmzbw6/e/vdCqMz64XE5Xk0CvUDXMx3MBbQxxY2jDtg1yuSX72ujd35ZM00Q==
X-Received: by 2002:a17:90a:8807:b0:1df:78c7:c215 with SMTP id
 s7-20020a17090a880700b001df78c7c215mr7941634pjn.234.1653449061947; 
 Tue, 24 May 2022 20:24:21 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 c21-20020a62e815000000b00518e3256022sm711553pfi.104.2022.05.24.20.24.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 May 2022 20:24:21 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
 sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v6 3/5] i2c: npcm: Correct slave role behavior
Date: Wed, 25 May 2022 11:23:39 +0800
Message-Id: <20220525032341.3182-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
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

Correct the slave transaction logic to be compatible with the generic
slave backend driver.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index b5cc83e51029..b4d218c6c8fb 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -915,11 +915,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
 		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
 			break;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		if (bus->state == I2C_SLAVE_MATCH) {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+			bus->state = I2C_OPER_STARTED;
+		} else {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+		}
 		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 	}
 	return I2C_HW_FIFO_SIZE - ret;
 }
@@ -967,7 +971,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
 	if (nwrite == 0)
 		return;
 
-	bus->state = I2C_OPER_STARTED;
 	bus->operation = I2C_WRITE_OPER;
 
 	/* get the next buffer */
-- 
2.17.1

