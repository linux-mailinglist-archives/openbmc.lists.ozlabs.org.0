Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F313C98B460
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp2b2SYvz3fmm
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:29:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764193;
	cv=none; b=TsCi+gSObBQtw+jXZ9YRnokNWq/Ma8Mc9WPmIqas4Th6FWdI1t5bmE62KSMEJfioAD1vOSq9vEnb66hJgeWZbhMqEbL6BOev1pDbP2fZliHP+0C7dF+31Ph+vakjNO2g8rEODq70ECRHbdPjYnQoL1exnHrAkCIw/bfxmr7qMpVRnjtqs5FpC4JaIun7+MZBHU7NhFJms+Gn93m0xraNRPa+dVbK/EusV5ov0Bhf8RerqGcC29bewKhJlQLu0S69mpsPsMqgP6YfypdPXnUDtQau4nvQJWq5K9CJR9RTd4UEDtiiWvFPgObjOQHP2RHAE3+qCwgwCWneQphzTMMIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764193; c=relaxed/relaxed;
	bh=sVINhRisx7tHA2uWGJZ1rYfyR16go1Qbe2bSN3dCkJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dINzPNQsXBTZsGPYgbfeRwlf5SBHEC/kwlRREWh3AFsmGz7mgn3jecjuZVLJQ5XkMFQQTcRd+a9OTAB63bwgvJaAKMwxlKecE/kPHCDE4L5T0DVPIFF3aN8fmdSk0g2qFomBBIuf8jjhUDgSfRRxTL0OI0X+yaSe4/nLuJWZoVUTMlw3BKND0x20xwOs7Z/Np0OvspO97EBSzHqZRf7qp0AHku3hVsK+rcZIWCQgZ1Wzq2FjpG/Set7UPntx19OI5+7Ey5pYC/enNjAXV0iEnRKLdg6s3xmISSDJuIn+ppnDE6bRebuKNEJN9GWpuFGI2hMEezb9NXlWHy0n/2imwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QF0nhXbO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QF0nhXbO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp2T06L3z3d26
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:52 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20b49ee353cso34928195ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764190; x=1728368990; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sVINhRisx7tHA2uWGJZ1rYfyR16go1Qbe2bSN3dCkJs=;
        b=QF0nhXbORmEKY58/FBHuRfY+EhCht4hsUBFQ+oX0NwvbMvcpd7HCGJw8qlErbvMeoq
         h/QnQ6HLyQtMnWeQqV1x7oRK3U6nCl6qGMuO5XgQCgTBysEb+HgucokqBVPbnGsD52o2
         AZ+DufJbEbFyidAePcU7M+ioV1X0vynCQMpjZFPXscByujpOBYuQ/mHr7BOWfGGDz9cn
         Et6bfEzprYMnGyXlZF2aoXzA5Lf4/WSL6KqkcLfE8BLKtNuvARdcHIk0JVq0A4eYOJbL
         GYn8govYgjFjh3rmBU89fifPNFDD22IPizfe0o4AROXyku1KpqMux4DO6p/kjXBCO92D
         xiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764190; x=1728368990;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVINhRisx7tHA2uWGJZ1rYfyR16go1Qbe2bSN3dCkJs=;
        b=wKEVhH4zX6f0iLXpMTL9grQEGOdE1XELcxhi2VPVqGw7rpfCI1QFNp6E33zKjoBBT1
         mqhJvuxFWJEjIE6T1GpNemOUzLkQiqgEprt+su9m2t4hwsZPE5dkjyRHO8Pm9lKrOEO+
         bf/LJ0P/2tyIaUa2PpGrLFDFmE40GlqEw3X1gAvIObn3KlDP/wwHv1Q0ZSC6pTvjVqef
         2FP+TFAIFYCg/ByLUUaSlUh2j0hb/9WDU1zc+cVhBlS3RzxsJh9deRupI6RgnOYVtSud
         H22UltfiYHm2qomQk9DccIEWLR/rLvulTqF/QRwU6WZ12OkKT4dPwDB2brlQWm/7IAHm
         0x/w==
X-Gm-Message-State: AOJu0YwolcQbdYIyVWno9cPC4+l5OVx1lKLyr+mogB363Ucd8KIsooQf
	wRmD1P+LNqCDPxNeWaEvC0Uac0KoIKYNMm30LUkbpKuWubLRO6A=
X-Google-Smtp-Source: AGHT+IGCkLE3x8E2oi3I+0hAAwg49dV46n8uUHwJq3wdp083muDYwMdqM2bQc6gqMV0beAmdPRwTBA==
X-Received: by 2002:a17:903:2305:b0:20b:84cc:5937 with SMTP id d9443c01a7336-20b84cc5f89mr89980095ad.31.1727764190444;
        Mon, 30 Sep 2024 23:29:50 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5de0asm63596585ad.265.2024.09.30.23.29.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:50 -0700 (PDT)
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
Subject: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Date: Tue,  1 Oct 2024 14:28:53 +0800
Message-Id: <20241001062855.6928-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
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
 drivers/i2c/busses/i2c-npcm7xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 03d6c8702ecf..0ee77e1fbc08 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,19 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address is stored with
+	 * the shift and used in the i2c_recover_bus().
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2172,7 +2185,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1

