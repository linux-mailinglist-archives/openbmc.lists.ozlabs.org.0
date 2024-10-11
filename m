Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6D999C51
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 07:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPwlJ04pwz3fsw
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:53:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728625977;
	cv=none; b=etBZn3g6UJXREBKawuO4w3MtYI7a8/h2I6WXYpUmdPRb32UgOpRAYSLDduKZoauhBgfi/DmjaYShk69UpYoGSlRTIjcfiqiNwEd0Jasfq3FpXJ34AjYwx0Pzf3msBwg8+7AZQOEYwb03wznxdyjS+SNdL9rEBIdUCkuY5Y3olHqbO5MHDM5xmBLEA4lK+SX6Y2r0rRtDrjDkj8lO1+1WNqqI0K0GZOv9zu1mtCNWkCQWl9i4IZ7kiePwx9DM/sYGwp98/I59UJXpnAPAUgUZrzyDIAtq0ImFQnoVhlgmAdQmRDJEgZgWfDrhOyxP27f91n/Cs9G1crOB2ujZFLKOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728625977; c=relaxed/relaxed;
	bh=r9deFa3EazRwzr47uk7mbD5Xv91NCzC1Edzbw63mWXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KwCz1bYWTVn/2Plveb8rcBdRO3sHOvqgnf+5XZmRylztfJVPchF1fQBRvd7SdOmyUZcZ+YQYkkbQ8a50qfsmgQRSPbckzbwRanRMu3I5NhiJWuW0Iae9Au0fs4JMkLykAtr/cC9yuUViOgV+BNoB62JGojYLE9MvBWKMLKB04Kj2hUWwkJRvncBe+iLVzG/CGQnPMvO/cTIrE0Iw1mgSHyUxd1vRK4x/TyXO/isln2T41q8R5Qrm71ooTkc7PzKtpq/SMfnoe33l6lZu6PcOxYo/g/DbFK+V+z4gNC/n8wKuBuq1n30v5rl4lHu2KJhMSrPiJflJWuG+LgdLaK+6Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=km3d4QU7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=km3d4QU7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPwlB5sBDz3cP5
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 16:52:54 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so66159a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 22:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625972; x=1729230772; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9deFa3EazRwzr47uk7mbD5Xv91NCzC1Edzbw63mWXM=;
        b=km3d4QU7c+QHHne0X0es0+ybKeK5fziUBKBFQaBMf+QGTULAL+Md+4fXp1eHxpI+OP
         wmLhsvR8gmfl1bTpj1/32SYNArJUeJwf6KhSUPlI4u2Ge+zphpUosNuqcX2V5BAHbZiq
         l7zgXvfZL5Eum1SRQsI8N5OodONMHdK67Rok3fud5Xb8UjcDLAbpHaj8JwF27tO+Wr+N
         MtsszEgnjzI5kZ3voJqf3vQF4D0IyWZArToOjji+SSj4c0vSq1M2Q72e34nwpyE5wmUM
         xn39fplhNYPXtVjz9FdA3E9d4EUbzqoLkjqtfwdVN6TszAFigkp6FHmGSuZAiLwXuL3H
         /hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625972; x=1729230772;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9deFa3EazRwzr47uk7mbD5Xv91NCzC1Edzbw63mWXM=;
        b=CrJDBApmVbNPa2Yx/it8woRBbsV9BsLri7JUgFn4rYrghfrBknXVnV5hhGk2XGFglJ
         ZE68pNHReHjYkV6ZWO28jTpuupDCdxP2JPtG2bNuo6jFr8fnudZLBwJDCdyF68TLIAG7
         Dk8+kK1J+HMF//uvsbS/tfBClpnkkTt+U+2EqiFSHNUtL/GTEW5QQNnYa+7m6U8UbHaY
         /5pm1TyTjXr08u6GucKVNwn3OrmXQGqeri+Y+0RL6Vbmq++jypAV6gvUk4XmJWtHZFFY
         DIHRyFxhIhy6PNhxaea8RrfzXdCS3S2BR+TzvlpUCVBJZ698pqdbpiF/Ly7q25diMD6y
         KVUg==
X-Gm-Message-State: AOJu0YxngOyMNfxfdQHG/cfOKyIEz5R6mHy5jNqgDoQE5VxDJ8HTxF15
	w/d+ww425NU/RQIr81XvM0OMHcbVtn38OJgdUpTbcJI8tgHX7bI=
X-Google-Smtp-Source: AGHT+IE6Zg1xsUZ59crJPToTtwOO5diITSD8mxT0bqWraLXk3hd9NPw1H/G6nZSGxAWWIKv/CRugvQ==
X-Received: by 2002:a17:90b:11d5:b0:2e2:d87f:3cc with SMTP id 98e67ed59e1d1-2e2f0b3dc62mr2268483a91.23.1728625971848;
        Thu, 10 Oct 2024 22:52:51 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5fc5e35sm2393669a91.54.2024.10.10.22.52.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:51 -0700 (PDT)
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
Subject: [PATCH v6 3/4] i2c: npcm: use i2c frequency table
Date: Fri, 11 Oct 2024 13:52:30 +0800
Message-Id: <20241011055231.9826-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
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

Modify i2c frequency from table parameters for NPCM i2c modules.

Supported frequencies are:

1. 100KHz
2. 400KHz
3. 1MHz

The original equations were tested on a variety of chips and base clocks.
Since we added devices that use higher frequencies of the module we
saw that there is a mismatch between the equation and the actual
results on the bus itself, measured on scope.

Meanwhile, the equations were not accurate to begin with.
They are an approximation of the ideal value. The ideal value is
calculated per frequency of the core module.

So instead of using the equations we did an optimization per module
frequency, verified on a device.

Most of the work was focused on the rise time of the SCL and SDA,
which depends on external load of the bus and PU.

Different PCB designs, or specifically to this case: the number
and type of targets on the bus, impact the required values for
the timing registers.

Users can recalculate the numbers for each bus and get an even better
optimization, but our users chose not to.

We manually picked values per frequency that match the entire valid
range of targets (from 1 to max number). Then we check against the
AMR described in SMB spec and make sure that none of the values
is exceeding.

This process was led by the chip architect and included a lot of testing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 374 ++++++++++++++++++++++++-------
 1 file changed, 288 insertions(+), 86 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 349492f114e7..fcecb098298f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -263,6 +263,265 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct smb_timing_t {
+	u32 core_clk;
+	u8 hldt;
+	u8 dbcnt;
+	u16 sclfrq;
+	u8 scllt;
+	u8 sclht;
+	bool fast_mode;
+};
+
+static struct smb_timing_t smb_timing_100khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4,
+		.sclfrq = 0xFB, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x9D, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x7E, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x79, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x65, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 30000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x4C, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 29000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x49, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 26000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x42, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x3F, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x3D, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x33, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 16180000, .hldt = 0x2A, .dbcnt = 0x1,
+		.sclfrq = 0x29, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 15000000, .hldt = 0x23, .dbcnt = 0x1,
+		.sclfrq = 0x26, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 13000000, .hldt = 0x1D, .dbcnt = 0x1,
+		.sclfrq = 0x21, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 12000000, .hldt = 0x1B, .dbcnt = 0x1,
+		.sclfrq = 0x1F, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 10000000, .hldt = 0x18, .dbcnt = 0x1,
+		.sclfrq = 0x1A, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 9000000, .hldt = 0x16, .dbcnt = 0x1,
+		.sclfrq = 0x17, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 8090000, .hldt = 0x14, .dbcnt = 0x1,
+		.sclfrq = 0x15, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 7500000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x13, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 6500000, .hldt = 0xE, .dbcnt = 0x1,
+		.sclfrq = 0x11, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+	{
+		.core_clk = 4000000, .hldt = 0x9, .dbcnt = 0x1,
+		.sclfrq = 0xB, .scllt = 0x0, .sclht = 0x0,
+		.fast_mode = false,
+	},
+};
+
+static struct smb_timing_t smb_timing_400khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x3,
+		.sclfrq = 0x0, .scllt = 0x47, .sclht = 0x35,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0x2A, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0x2C, .sclht = 0x22,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0x21, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x24, .sclht = 0x1B,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x1E, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x24, .sclht = 0x19,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x1B, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x1E, .sclht = 0x14,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 33000000, .hldt = 0x15, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x19, .sclht = 0x11,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 30000000, .hldt = 0x15, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x19, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 29000000, .hldt = 0x11, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x15, .sclht = 0x10,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 26000000, .hldt = 0x10, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x13, .sclht = 0xE,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0xF, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x13, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0xD, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x12, .sclht = 0xD,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0xB, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xF, .sclht = 0xA,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 16180000, .hldt = 0xA, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xC, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 15000000, .hldt = 0x9, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xB, .sclht = 0x8,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 13000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x7,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 12000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x6,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 10000000, .hldt = 0x6, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x8, .sclht = 0x5,
+		.fast_mode = true,
+	},
+};
+
+static struct smb_timing_t smb_timing_1000khz[] = {
+	{
+		.core_clk = 100000000, .hldt = 0x15, .dbcnt = 0x4,
+		.sclfrq = 0x0, .scllt = 0x1C, .sclht = 0x15,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 62500000, .hldt = 0xF, .dbcnt = 0x3,
+		.sclfrq = 0x0, .scllt = 0x11, .sclht = 0xE,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 50000000, .hldt = 0xA, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xE, .sclht = 0xB,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 48000000, .hldt = 0x9, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xD, .sclht = 0xB,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 41000000, .hldt = 0x9, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xC, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 40000000, .hldt = 0x8, .dbcnt = 0x2,
+		.sclfrq = 0x0, .scllt = 0xB, .sclht = 0x9,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 33000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0xA, .sclht = 0x7,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 25000000, .hldt = 0x4, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x7, .sclht = 0x6,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 24000000, .hldt = 0x7, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x8, .sclht = 0x5,
+		.fast_mode = true,
+	},
+	{
+		.core_clk = 20000000, .hldt = 0x4, .dbcnt = 0x1,
+		.sclfrq = 0x0, .scllt = 0x6, .sclht = 0x4,
+		.fast_mode = true,
+	},
+};
+
 struct npcm_i2c_data {
 	u8 fifo_size;
 	u32 segctl_init_val;
@@ -1805,102 +2064,45 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
  */
 static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 {
-	u32  k1 = 0;
-	u32  k2 = 0;
-	u8   dbnct = 0;
-	u32  sclfrq = 0;
-	u8   hldt = 7;
+	struct  smb_timing_t *smb_timing;
+	u8   scl_table_cnt = 0, table_size = 0;
 	u8   fast_mode = 0;
-	u32  src_clk_khz;
-	u32  bus_freq_khz;
 
-	src_clk_khz = bus->apb_clk / 1000;
-	bus_freq_khz = bus_freq_hz / 1000;
 	bus->bus_freq = bus_freq_hz;
 
-	/* 100KHz and below: */
-	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
-		sclfrq = src_clk_khz / (bus_freq_khz * 4);
-
-		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
-			return -EDOM;
-
-		if (src_clk_khz >= 40000)
-			hldt = 17;
-		else if (src_clk_khz >= 12500)
-			hldt = 15;
-		else
-			hldt = 7;
-	}
-
-	/* 400KHz: */
-	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
-		sclfrq = 0;
+	switch (bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		smb_timing = smb_timing_100khz;
+		table_size = ARRAY_SIZE(smb_timing_100khz);
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		smb_timing = smb_timing_400khz;
+		table_size = ARRAY_SIZE(smb_timing_400khz);
 		fast_mode = I2CCTL3_400K_MODE;
-
-		if (src_clk_khz < 7500)
-			/* 400KHZ cannot be supported for core clock < 7.5MHz */
-			return -EDOM;
-
-		else if (src_clk_khz >= 50000) {
-			k1 = 80;
-			k2 = 48;
-			hldt = 12;
-			dbnct = 7;
-		}
-
-		/* Master or Slave with frequency > 25MHz */
-		else if (src_clk_khz > 25000) {
-			hldt = clk_coef(src_clk_khz, 300) + 7;
-			k1 = clk_coef(src_clk_khz, 1600);
-			k2 = clk_coef(src_clk_khz, 900);
-		}
-	}
-
-	/* 1MHz: */
-	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		sclfrq = 0;
+		break;
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		smb_timing = smb_timing_1000khz;
+		table_size = ARRAY_SIZE(smb_timing_1000khz);
 		fast_mode = I2CCTL3_400K_MODE;
-
-		/* 1MHZ cannot be supported for core clock < 24 MHz */
-		if (src_clk_khz < 24000)
-			return -EDOM;
-
-		k1 = clk_coef(src_clk_khz, 620);
-		k2 = clk_coef(src_clk_khz, 380);
-
-		/* Core clk > 40 MHz */
-		if (src_clk_khz > 40000) {
-			/*
-			 * Set HLDT:
-			 * SDA hold time:  (HLDT-7) * T(CLK) >= 120
-			 * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
-			 */
-			hldt = clk_coef(src_clk_khz, 120) + 7;
-		} else {
-			hldt = 7;
-			dbnct = 2;
-		}
+		break;
+	default:
+		return -EINVAL;
 	}
 
-	/* Frequency larger than 1 MHz is not supported */
-	else
-		return -EINVAL;
+	for (scl_table_cnt = 0; scl_table_cnt < table_size; scl_table_cnt++)
+		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
+			break;
 
-	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
-		k1 = round_up(k1, 2);
-		k2 = round_up(k2 + 1, 2);
-		if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
-		    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
-			return -EDOM;
-	}
+	if (scl_table_cnt == table_size)
+		return -EINVAL;
 
 	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
-	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, sclfrq & 0x7F),
+	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
 		 bus->reg + NPCM_I2CCTL2);
 
 	/* bits [8:7] are in I2CCTL3 reg */
-	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
+	iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7) & 0x3) |
+		 fast_mode,
 		 bus->reg + NPCM_I2CCTL3);
 
 	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
@@ -1912,13 +2114,13 @@ static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
 		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
 		 */
-		iowrite8(k1 / 2, bus->reg + NPCM_I2CSCLLT);
-		iowrite8(k2 / 2, bus->reg + NPCM_I2CSCLHT);
+		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
+		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
 
-		iowrite8(dbnct, bus->reg + NPCM_I2CCTL5);
+		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
 	}
 
-	iowrite8(hldt, bus->reg + NPCM_I2CCTL4);
+	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
 
 	/* Return to Bank 1, and stay there by default: */
 	npcm_i2c_select_bank(bus, I2C_BANK_1);
-- 
2.34.1

