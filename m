Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326198B462
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp2g6KVLz3fw9
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:30:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764196;
	cv=none; b=jUw3H8wEnPFxc+JuLTfC96bcg+wb58B0zEI32h1bwIK1U/LiLihxUR6SFafdp+Xka336R0md3uspzzSj3JoiHcNcpt7IP2vpaB4Yfz+5/PSWZ8qh5O1AeSYn9M5+fj5nSFLLH7gt+orSO5DNF9q1uz3x5PhQv8MHWvxnWL+z+50laeWpO4Za8HPYU+NP/RdY9sZzTXltB1Z6ULOb2CwQyutIRbTbmI73NqxCWB6OInFy2cX0pHSlE284GIPc3FvA7rkkA3DZcHh/VFRhAY4NFxn19qG9r1kEljkxFS3IgkdF9zuk3nykcpbDjAUD7aA2KSxWqDyWtsMevJzf7SZ1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764196; c=relaxed/relaxed;
	bh=YqzdmEu2UR4QBOUCnQBa7ZbtSWN8HvAvdUKdNjbDuIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ao/3WDFF6tznuRWHIzxvxCSQG2g/+SmEcTICJWYvwq2HjKJON8YTHArqf5X8f8iNs+PvdlEaDXCJE6DV9Tj7xu22tcRSVe+/kGkHzG63NX6KCaQq+QKDfLA87yGf0u9E6tcpVysuT0fSzQqZPO0aBOf4dHWX9TZLVRX20z1L/dnR74T0v6ViIhDJSeXWjkhxtsdnsDdfsfqz30Cdt4OOdPbmpoqQUxq6o53ykEUd7/uuCYdSsYK4Tb0xBPdzJJE8uBpcJTLTxwvogUsTYAjrNuUtA66AE3CQrdcuTFJM3yB85iBsk8PpOerGV5A9jEfZCyf34tYJjUIg88ZnWh1Nfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6Bc6ani; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6Bc6ani;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp2X1QcXz3cb0
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:56 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7178df70f28so4037472b3a.2
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764194; x=1728368994; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqzdmEu2UR4QBOUCnQBa7ZbtSWN8HvAvdUKdNjbDuIM=;
        b=m6Bc6aninKBCBjbygFCVT4rkU4HT8thCQifNijegfA44LU8HHYK+IMzroMhYnGeme1
         Tv68lQiwJe/4IvvotRmNy+es184KU/SLUNg+QSzeWJML+4eO/3z0Izxth6vlIxHPmPfU
         N/ZsNBUyqrJFs1npvEGmhLu+Yg9tfeXIM131fYZv43hNZuNufMNNSjIvQ0WZ7oUXYTo3
         YPy2coF5/fsBtL4d/Xlq1IfMNtPHjUi9h+wnd1VnyqMjcTcv4nnIjp7a/RVW6BP9R6MN
         pnIBmJFNBdqhiE1t7DJLIw3E4XFQZcpOnuSIep818Os7CWe91Lg3M7by8eH2tNHA3Kw4
         gwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764194; x=1728368994;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqzdmEu2UR4QBOUCnQBa7ZbtSWN8HvAvdUKdNjbDuIM=;
        b=Tn4Tr0yYkhLaOQnALVv6CqEsbmS1O5sKlk0I16O/vIYva61/t4RrtHTjlwk9NR8Nzo
         MMW0Cc6WWOCwirE4oGMFu7A3Nk3aHfZ4T8jYFUq7iv6tLs1MMeHfr4WRR+1raC2U/Pf7
         kJI7adq/Lmx8q8UKqpQP+Cmz/lHNwfw7MWPG4Pv+5XO+FsvTRdGjBCJA2wIX7WwcuAw3
         90TyAZ8L/6ICHsTyAsbX5y2TcGPAmDRSPybvgmIuaXSSbSDWMTjYUmyMr2GUu0kPim5N
         HLTDJAzlvYlnoTvYdq01hTVWVS3xq9MwS2jw7mKuz9V1jmmv9bmANfQ2zi021Ryeb/k8
         fGlQ==
X-Gm-Message-State: AOJu0YzpWJjSgdrls2j2aISLebrT3AoDAJ6tQP7pwmBEz/KOxQ+MT0sg
	OnTLsha48bVtB3TovtTenK8K75a0KcrF7x4tLAQrcJFWgnAzEIA=
X-Google-Smtp-Source: AGHT+IFAynLD7Y6INIeHChoWuMPGG7kXyaw3SFtjQ+rhKIWR6q8jEBeLr3s9/T+mqw663JthV2If0g==
X-Received: by 2002:a05:6a00:cd4:b0:718:edeb:5a35 with SMTP id d2e1a72fcca58-71b2607ec59mr21161483b3a.28.1727764193783;
        Mon, 30 Sep 2024 23:29:53 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bcc30sm7296746b3a.68.2024.09.30.23.29.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:53 -0700 (PDT)
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
Subject: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
Date: Tue,  1 Oct 2024 14:28:54 +0800
Message-Id: <20241001062855.6928-6-kfting@nuvoton.com>
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

Modify i2c frequency from table parameters
for NPCM i2c modules.

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
index 0ee77e1fbc08..2ed69e92edf6 100644
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

