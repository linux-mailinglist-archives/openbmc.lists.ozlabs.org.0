Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014F9F7801
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 10:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDPr34XxBz3fV2
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 20:09:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734599357;
	cv=none; b=R6hf9RCdh+hGxn2gAo7mfqr8+3ZfF7pJfVx1lM8323BY9IVvIaCziH4wh4af/YlEf+avY9S/ql4xwk0WlAKYJgVlDp0u51ROL2cT/3X3x8lUxvkOsX580nSFmuTPeSc6TbBPP/EjOyZrgqr8UbOBxwbp/6xn8wvp0Ib9offb88F9yvBX8uVm52Pmw9cgKuSuYaiT9TgV1+ry9nVBk01vSBmXWIyQLRvgSg9V7Zd3Ybfc1aw3dotSgMADj7Qhn2mwnK77UJTd3bl2lyCkamC0MZglv3NFafKNDRIcjNtLH40MVRKujUpKFJ3bbVZ0omYnKPHn7uSljHGSy21u9Xtiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734599357; c=relaxed/relaxed;
	bh=piYN//2t/Q3gekIk2iV6YPjUEpOk8bMx3T+8iGXFsUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=J6bEPIegeNojgGK9rYVqifgwUPE0tiN2xx313YO9xAqmhUrre3/OnOGOkLnEvfugLNuwEOLZFupWLm7vJISh61upbSFBedkiOR5jwdTZ2PjbgATUR4bFXNuIfPJmhfODe32ibZ07/arnv3LRngUw2GuHiY8rRDMuFIE+Wfxvak5q2vCU051AHK+I3WHzSqqRu3BxlMmsCiLzfRNV++uvQTe5f0LokWcJcgQk1RCbT0i7DDuAOCm2Sv74hjhmqKny6YliDQrqGhO5lEVZF68NJaDqbbU35OklzoDJ2Rc7y637QLCyWOM4d3a7mZ2Mb5W9twC+fwfOuWNAuUx0SxkkNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FT+0B9Y3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FT+0B9Y3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDPqv3bkfz3c5h
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 20:09:14 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-801986033f9so284236a12.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599352; x=1735204152; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piYN//2t/Q3gekIk2iV6YPjUEpOk8bMx3T+8iGXFsUI=;
        b=FT+0B9Y36IyGUad6sm07nKLHucmClAOyF892EAwMMtnWVaaQHOkrW/aSnGmsQtIi/n
         rjZ/iDeQsu3p/QpHuChPh2HMv7U0KKqjx8Fg3/tqHYPzowKYbnIMHYOp9tPPXdy47wxT
         0XqMJLJWPfdi91jtlBPYqUXaN7Eyhm5iiRrm1ZSKbTQKakYxZO4KWPcX7Aeue68iBq/q
         FY//bHVLpWVEd/wsTYbhb6utddiucMbNLC6Hy3LNB3u6DyfIuaKDvMm2szpPtO7snrTE
         QPg3bGTzukpprOIadM4QVDZoDCULW8ZCu3kI2lhHcqc2y8sPjhoLc8wHppM2isoOIUOm
         LRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599352; x=1735204152;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piYN//2t/Q3gekIk2iV6YPjUEpOk8bMx3T+8iGXFsUI=;
        b=IHPZ8qvlqGDYuefCCaoNu5Kyw+CIiOJ6YfJuugr3HDNSZ3i137OYO4rWI1rEpwyOHT
         4NTIct974x+x5kuBLup8mHAS0i8GpNIDGSNS0XOwfVzcgJHN3oPrC3IaSF8GdRtRH/bo
         yt1xzDTrxBfv9eF9F2641N8f64Ya0Njc7dggr7cZxmO+arj7/AT6W0yr5tAWHMEejak+
         /gGwuCdFqpolLQnKEMcDxT6JN2hfiuQVbCn7uzcMhfmDxScz4TcEKAn3edN5lfwS55Ng
         yRf9p0yOFeqxtpSmRTb7P4LuCc8cnowrqRSu1DfvC01SLNspv0/Y31Hp/uEg0X2zmEVt
         Hzqw==
X-Gm-Message-State: AOJu0Yw3qZkL7xgMYmuNw1BcIt1VgELdUnbbSXj2RSjN1j4CWHlIa0sb
	VFSJIKeB97Zj4XCtoRB9b5qjkBfSXCsRXDL1jAmnxq/YUcbykGM=
X-Gm-Gg: ASbGncscVXrVUXmPKSB7TY30aSGUY52NOXdDaRFW1QryYT3vLi+IVT08Iobm1cDOD9b
	/kEIO80JnR9RlBdIW+mA4kcA2Fo+Gs08KcyjsJgc+q4ajT0nrhoofaYsQpn9T4nK7++LUsxUCu8
	oxTIUF05ltk7P2tIPXcc2t0HFVmf9fxM482M44QpU5De6/cRVf4sNdiXHacDYHK8akZpBvbcTbQ
	1U7aC+UT8FnZRDcksp2Dsq5fxZF7A3Mz67wKkhAIhkVCsPvgXiZ8xMZLIQ2pGBkc+F/19m1ZPRp
	nmgE45tTy+v/MYWvVaRczvbGEu9Y1+ixtTR4KQxK8oIsIEvE
X-Google-Smtp-Source: AGHT+IHTqzdBHtaXdUfJQLh5OtQUwGieCVyrC3tJXdDiWFRu/A8iaXaQpl+DwoVlL2pK77Rw42fZNw==
X-Received: by 2002:a17:90b:2f03:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-2f2e91f0dc9mr10901708a91.12.1734599351937;
        Thu, 19 Dec 2024 01:09:11 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477e8222sm956016a91.23.2024.12.19.01.09.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:11 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v8 2/4] i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
Date: Thu, 19 Dec 2024 17:08:57 +0800
Message-Id: <20241219090859.18722-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..760608fdd075 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2035,7 +2035,7 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 }
 
 static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
-				       u8 slave_addr, u16 nwrite, u16 nread,
+				       u16 nwrite, u16 nread,
 				       u8 *write_data, u8 *read_data,
 				       bool use_PEC, bool use_read_block)
 {
@@ -2043,7 +2043,6 @@ static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
 		bus->cmd_err = -EBUSY;
 		return false;
 	}
-	bus->dest_addr = slave_addr << 1;
 	bus->wr_buf = write_data;
 	bus->wr_size = nwrite;
 	bus->wr_ind = 0;
@@ -2086,7 +2085,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	unsigned long time_left, flags;
 	u16 nwrite, nread;
 	u8 *write_data, *read_data;
-	u8 slave_addr;
 	unsigned long timeout;
 	bool read_block = false;
 	bool read_PEC = false;
@@ -2099,7 +2097,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	msg0 = &msgs[0];
-	slave_addr = msg0->addr;
 	if (msg0->flags & I2C_M_RD) { /* read */
 		nwrite = 0;
 		write_data = NULL;
@@ -2155,6 +2152,21 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Store the address early in a global position to ensure it is
+	 * accessible for a potential call to i2c_recover_bus().
+	 *
+	 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+	 * from the bus->dest_addr for the i2c_recover_bus() call later.
+	 *
+	 * The i2c_recover_bus() uses the address in a write direction to recover
+	 * the i2c bus if some error condition occurs.
+	 *
+	 * Remove the I2C_M_RD flag from the address since npcm_i2c_master_start_xmit()
+	 * handles the read/write operation internally.
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0) & ~I2C_M_RD;
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2172,7 +2184,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
@@ -2182,7 +2193,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	npcm_i2c_int_enable(bus, true);
 
-	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+	if (npcm_i2c_master_start_xmit(bus, nwrite, nread,
 				       write_data, read_data, read_PEC,
 				       read_block)) {
 		/*
-- 
2.34.1

