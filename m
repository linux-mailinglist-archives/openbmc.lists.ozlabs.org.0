Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC812977D0E
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qtj4x79z3fR2
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222505;
	cv=none; b=fiIV3i6or/JJAWKc5veMRV6JVTcFcx496fykrd7Yt0Fe5WvF7IIjWBCurHH1+D3V+5bmKdA5JiPdCNlocOpFuY54a+QdPQH7MJairTYnQTu3Myo9rU/Ch1LCkwVsz146f3l1P8iqjnTd4Ll9IgGSYuK/gDV4IpLdu6mSNzh/tlxv4Dzf9I6M7loLapq95Wgut3VFUgdXV/Fz2fo5zCCRLI6H5XfefuyEa2lQN3ld39U/yVOEzLnufhcRPNyxGurjV2tppdvLsuwaukfxQQqY5bL/Bh/RyqvF9It7WwbIX7aykInr+8VTdYFDiAFliUZG6xREdgXkoVj5O64in8s9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222505; c=relaxed/relaxed;
	bh=1BGcthvFE7iZ7GLQ5GBYdiVKahiHTHcdNQMsIVlcYPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GVMPwsLBsZO12cjjNRWyljPazrseQbN8mH27afJjtqkh2DYszgi2TvGNVz+jF/lPAaoReikth1KoiG5HMPZMf/YW/YLY4n+dQv0H6bZUt1pnAK1C+7Vx+e0NRaX6BKICUWykjxHXWl72hsXB25HA1BwrxPK5Zta3r6U1KcA15EEvpjUtovwMLQNw6g8URfZfvqGiKbcCZhfzN3EPVuktxXLHwQdyf7D5CvfGzWtXthBTuWxWxiWfix8EYOs+C8gze6zUQ+8GyRJyxLKMP3MIBwP95IX7CBtt6UxCs9OpPmnP8E+T8pgh7vnk27eamQqS/HIGTrZ0Nl+kugydMFBqeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YCbbbpIq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YCbbbpIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qtd0Llfz3cVG
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:15:04 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7db12af2f31so1855427a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222502; x=1726827302; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1BGcthvFE7iZ7GLQ5GBYdiVKahiHTHcdNQMsIVlcYPg=;
        b=YCbbbpIq0mFc6XjW5saUy3sHNTjbYdH5QoUKrHO8fdA8muOu4BEF/vPi6QmuK9NZ16
         vUvsLAPKNONju7dFMVi7j3Cfua4m2QQiIWYNGTPhacZB36kWfQmV+SkC+bDmr4Vdc8P4
         yy5BqwCmPwZNJskgk+6gRvWnlmsJNA8MoYGncHon/6JONlBQcXQdAKMHQUvFS0ZaWjLM
         +JV7fMBC+eBPfuijSbX68KIvPkPI6XZ+qfJPn1+ZaEYHqPPz2fMsbUby0ghCiMdaKHrD
         gOQsZxAwO/c1CLRaHCAyhhfj9aiDbHOaJKCQK4VGQCj594t1IPrKhLyKq7Gm4JDUntTE
         5+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222502; x=1726827302;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BGcthvFE7iZ7GLQ5GBYdiVKahiHTHcdNQMsIVlcYPg=;
        b=YotCUPM43KbsulQZ05kHPKOEs/RvPFhl7wefWR8MltYhnw7jbTCpmw75gtIKWgO+1i
         ySRMG4weunRDoghUp2TcPi/96CqH1loN4YncbDDEBGeNroZYMD//FunlP5nJJGnBDcoL
         NuEPm6UAjV3lz+sdG7ezw53EippoRQPdDtDQ73Na6B23pvHY81sZ/bysgUEH/EGsYk3a
         hzOD0WiSkZP+xxiuK3s8DGqR2ndnEJgCuJGv/egcUO9SmSNgh5aMtN2ALqs8rJW9fDxK
         jW3AukfugK2rZX1cFLt1eiUQnj3JORoOuQ/d4DJ1E2eoMiRZcaFy7cmtWKDT0FDwI/sN
         Hkyw==
X-Gm-Message-State: AOJu0YxNcMMZ3LQeDrAHMtzrga4h7TGtn1qtSk17ORiyJtOYEVoATwAJ
	cYVtVdaJGXi9rYUZNuZuZoHIBucIjIbvZvVEzsuyNl3ebEPfGnU=
X-Google-Smtp-Source: AGHT+IFN/+8+evtZLjVKFw6cYdVaoUYs3aUOmN15pQaGNz/9tKq8F0s/IxmSII3BTDfiXTypDRemBA==
X-Received: by 2002:a05:6a21:58b:b0:1cf:6953:2872 with SMTP id adf61e73a8af0-1cf764c27f2mr7849092637.48.1726222502190;
        Fri, 13 Sep 2024 03:15:02 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190909256csm5804618b3a.125.2024.09.13.03.15.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:01 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
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
Subject: [PATCH v3 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Fri, 13 Sep 2024 18:14:42 +0800
Message-Id: <20240913101445.16513-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
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

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2b76dbfba438..2d034503d8bc 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -334,6 +334,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1

