Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C959F7803
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 10:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDPr76qsDz3ftn
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 20:09:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734599362;
	cv=none; b=asYlxr0E+5yR4zy7j0toKMbOUVXbXMAI94X1EnUXuvgnWMviLjsWuFiHc6PO3iNU1paViujdh72QyRRlcCGVQnTNZleYgOIuEOtet5wD1pjd39pqnECQdd4ngoW4lNYoKOtEc/7pV7OYIfNSimSutO0yd8JGksIzle8pXOG8kUO/Q/zF+42+xkP2h0gjHbMZi55Gt5tEeHMqBcVo5xCEXukRDuBiHcm0vU3o4cMrDvqp01xpxE3DAFhRPvtYEGcZd2VJj7LMV5nad2Yu2FhIlWhv9oKltOSVXw7FLCOFNpoqz863FnkSmZE9ykoHUbYkm5cn9lvVGDB2WPjOc/RWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734599362; c=relaxed/relaxed;
	bh=LRxrdan5tHoMlrGZXe9w+RTf9KmkjJ92usLwMDr0nrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IG8kipKDjqbWIz6H/79W6aSzFtIeP62hdV4E6kFz84pGYxi5YEQMKfjQwvPqdQxawjC/4jc5/52LXfiJbFpBvuWGcTBmbLyckWa6W9vxaO1J1woGVsaikiwNufR5SX5P9vGy/FRYcwuCxrLniuiD7uFCbhk35jm3Jl9AvRWh9hctqh1HX/fW7zg9rvgb16wiXzwzrrNhbDTrYG6IYHnCefpVagi4BX+ixAmAISjUwYKUUcFsMJzAbwI/oXTm9uWEJLQmwtjwkBdXBuYgeMcrMeum/fx49syOlx+JCglw805zDWZbT6N8X4YCDzoF2FR0dOwmAWqHNaGDAw/vdbWHfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VLoL5PkY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VLoL5PkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDPqy6MGHz3dDx
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 20:09:18 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-728eedfca37so630670b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 01:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599355; x=1735204155; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRxrdan5tHoMlrGZXe9w+RTf9KmkjJ92usLwMDr0nrc=;
        b=VLoL5PkY3UdcHkKZwPDRXvwIiWMlVf+2F09OtW7TPW+VTkn5JrLssid14RoSTFtL2B
         Vk3lvDI5jmJaByPEj+NA2P+9tH5v910Rusa5itlHrp7HaTFeL4UWkyFEF8fV/ZObFAHL
         k3+DaVNoJ5e+9useR/zWwaP8tabBoVrUyd0qTWI2wxpIHZJdUymwilzse0cr8Va9oITH
         GZ8GMQNaTGyzerNS7WgEty/L+G/+0itRINWaoCswRTc42JMiO3xBMa0kxkcPfdPkeN2R
         yB+5EgVAF7ZYCnqleNJ0FlcMOZFx8o/SdWkBTMUlQiBphwcDwDtqllQ+NJteeQ+7nTeF
         ErvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599355; x=1735204155;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRxrdan5tHoMlrGZXe9w+RTf9KmkjJ92usLwMDr0nrc=;
        b=uT81qQMxH2Rt1f2HJW+8IFsQj9m/FsjjvbIniclChpUIFn/LMnefDcyKNk05s6oyXM
         r5xSvndiclXVry81Z8Yur87+ZHSZ6u47pcLrfN8Cw2FMtr8/e7Hlp4pX77YYql/zdFje
         1U5osO2j5r+91ULKLSLBAVcToqHzmcfF2aHdEdJ0IeXwxznuX9j/RtRDWvv1s175nDvT
         e3FYlG1GcB8oYPReb/TQZgggO5JaCSWtNyLv9Y6IZi68o9x9+yGNuo9JkSS7ntVOg66d
         5s3dlV6bUb2XEU4lJkwhzzOyJhTVVG/cHvnNjeUyqQ63mg4lSre3jKbCifGTRjHBi9ds
         TFoA==
X-Gm-Message-State: AOJu0YzTN073Eo20iMeWhsZkQZ7KK09qm2Q/FzeRO4OOKKKUxgQ+4XtH
	xzEyBLLCrsLfkBSVjmX03Yw3ORdu/rL8FShaSeONUmCnqJoalmE=
X-Gm-Gg: ASbGncsCzq7cPefn17t+o+zq1znFA3WKiWYKgOnHUdunN2OYz6J7eYzwOi9kKUEr/OU
	0hTD9w5ilVfw4fg4jrCeCi656vqrqkFvWVDsk8m+ukWsEvSWleaGITHvX7zilno2ZRMrOYIF38o
	U0aRhsbyaEAs7P+EbJauXtVoZUJssJAqdjLjicehfJQopicJsDyavg4lFhL2vmpHq0yvYP5Ivmv
	6fnyna9QB/n6x4IW+W7N61k1zsuWXUB+lNYaWDlFiFSafQbm5Yx7R5bKETruajm0xWskWfH5enW
	IjyIdZw53TaqMuA5OAjBGFz3KNWAfBpftEomaHBuLK62RiFz
X-Google-Smtp-Source: AGHT+IGmXYteJJlUcoAavZ+KIoD3czehp0N0Ue4e6GT89wgj0kegwbwWZSbvo2mGJxNaByTfgAu/pg==
X-Received: by 2002:a05:6a00:a81:b0:725:8b00:167e with SMTP id d2e1a72fcca58-72aa8dab6edmr4287520b3a.16.1734599355482;
        Thu, 19 Dec 2024 01:09:15 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb70sm813090b3a.98.2024.12.19.01.09.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:14 -0800 (PST)
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
Subject: [PATCH v8 3/4] i2c: npcm: use i2c frequency table
Date: Thu, 19 Dec 2024 17:08:58 +0800
Message-Id: <20241219090859.18722-4-kfting@nuvoton.com>
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
index 760608fdd075..1aae1a8a8055 100644
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

