Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 619899655F5
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zz4dl5z3gJd
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989754;
	cv=none; b=YTKaKCsJGeDpwYKIBs4r9unLSXxFcV5IvxzTjR+xcrwJ1g51R0VWJ2BEv4JbphgE7HjLOquguf4jN4TxmzHam8sLdlN1jXzSQbC2BYV2XfTNgJU9r3YdSqx35obcvmAUObXpw8p1tygOsdYQWcljR/RqGDpkq/h9c/hpvHHRZCxj5COJRkkm4S5bXmK4qSYv5ZctK1E+bgcjxD4cseHLZPqe79O27Tc5rntpqxNfqMdX/O8GSdNXv6/SQhwUK4LuXqdN7C/H/ssrh2snl42vcB/CdnUS/IBnMP8qIDhA3eNPUth651zBCHzHhs0tMvPMjDgJpkfalETZW2JRYTOkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989754; c=relaxed/relaxed;
	bh=2L454eIDBLlnhGWV2AoOWGsI5wsfWExAXNrzW47/oEs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=YKXikJZENlKRK1LGQyxk38knYS15z62kCJO9UXC5iMxXogXPPcVk8X6VcYJxlfEO0FM2wBFD7hQdvgRX1zrrWCVzfOtBOCyaFuHUFTIi5ZnZCHldqhvfam+uVdudLpOXtJaUYgFEfEAuggox42vSsLgB6zls0aA2RN+iLS4MSxxLq5KttjArTNtYsp4tjBLDq7TXTFTP5A0iRRQZfeast/3QeTpHmuG4DTLK+bsBeVvDThjgEQR2X1hbh0lIwamp607AiJinHnKRjEZULrVg8Qflw2c2yDckDYk2hcQpw6eoufx8df11P4e5EfnQpsFF2kNqGSIjZjrxxkFNYLqW3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=asI6OeWk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=asI6OeWk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zs5ZYFz3g2X
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:49:13 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3df08d53820so753600b6e.0
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989750; x=1725594550; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2L454eIDBLlnhGWV2AoOWGsI5wsfWExAXNrzW47/oEs=;
        b=asI6OeWkzhrIKU88WaVrBZ3FyMWzTO1+2POLj/F7anfrvb9o3OqxCvMqTwjGxkvIrV
         p1tVVCm+G+xWZrXb1Ymr9RpJbFKZ7KAXhuQ3z9E+kcc7tmX7tWG5yoKFvzpYsmgQm/rX
         1zFQxpptdDPKMw+MLyCc5y48Nj7UY3vUZrIjzTzzkjwUcwbGofQszbFZxq9BDoaOGvAk
         HU+4G8S6z+5v00iwokKZRmCjCYJ1kvQXyrYIEZYaTDJACz5eXBDLKk9o49h5RXehiYiu
         GltPdXYvsaPo/XKwQ6ZE402j17gg6bq8h3IUwmH8HgWojLS7hwrFtyKZIjjpQ1giiz3I
         EolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989750; x=1725594550;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2L454eIDBLlnhGWV2AoOWGsI5wsfWExAXNrzW47/oEs=;
        b=h8m4BgmU9NG2XvdNtXeiqMLteuh7UcgClKehFqPaVikfFKk5pcEv0TlGfEsN8oCFfF
         EUmFJeRfCfrYtVlP1fy1j7DP/1dgJmzF4CaBflHu4fHbz3JcaTerDm5Yj0ts7UmVLK9T
         aXMUfKvYmA9R3uynuiHzPlr1ZzRWJb1qiSkQo/7jBO3QEOy7FGLEw/TFf43c1qTna0yd
         79TFdOeSC6leKwWGHMbO3iOka8X6hBO/NcYETgetAfKbqYUN0GMknmIclztqgntonLtH
         p8mGaivnYmNbn0etZO+OqVQyrUe2Dl7NIukgAPT5apP+I3yz+02GguAan+RtkpY0f92M
         FyhQ==
X-Gm-Message-State: AOJu0Yx+UeHNsvyaeFYbdRy28YdGdRfIJqRbBFtGObnYUYbJo4qYBjXP
	SErdmrF84Evomw4t+j/GCeyRwHSqoLRrCseypeeZd1Mz0VRfeMs=
X-Google-Smtp-Source: AGHT+IGwidesUKI82CPYAGh+W1ieZRNF+5w82gFIAHwY6Qk0VuD4TCzaj+YRUNr+4/vPjVQUAB6OdA==
X-Received: by 2002:a05:6808:1809:b0:3de:13dd:3c30 with SMTP id 5614622812f47-3df05d99f8fmr5510291b6e.10.1724989750502;
        Thu, 29 Aug 2024 20:49:10 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575b7dfsm1866058b3a.190.2024.08.29.20.49.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:10 -0700 (PDT)
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
Subject: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Date: Fri, 30 Aug 2024 11:46:39 +0800
Message-Id: <20240830034640.7049-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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

Modify i2c frequency from table parameters
for NPCM i2c modules.

Supported frequencies are:

1. 100KHz
2. 400KHz
3. 1MHz

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
 1 file changed, 144 insertions(+), 86 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 67d156ed29b9..cac4ea0b69b8 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct SMB_TIMING_T {
+	u32 core_clk;
+	u8 hldt;
+	u8 dbcnt;
+	u16 sclfrq;
+	u8 scllt;
+	u8 sclht;
+	bool fast_mode;
+};
+
+static struct SMB_TIMING_T SMB_TIMING_100KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4, .sclfrq = 0xFB, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 62500000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x9D, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 50000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x7E, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 48000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x79, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 40000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x65, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 30000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x4C, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 29000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x49, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 26000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x42, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 25000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x3F, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 24000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x3D, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 20000000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x33, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 16180000,  .hldt = 0x2A, .dbcnt = 0x1, .sclfrq = 0x29, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 15000000,  .hldt = 0x23, .dbcnt = 0x1, .sclfrq = 0x26, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 13000000,  .hldt = 0x1D, .dbcnt = 0x1, .sclfrq = 0x21, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 12000000,  .hldt = 0x1B, .dbcnt = 0x1, .sclfrq = 0x1F, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 10000000,  .hldt = 0x18, .dbcnt = 0x1, .sclfrq = 0x1A, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 9000000,   .hldt = 0x16, .dbcnt = 0x1, .sclfrq = 0x17, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 8090000,   .hldt = 0x14, .dbcnt = 0x1, .sclfrq = 0x15, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 7500000,   .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x13, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 6500000,   .hldt = 0xE,  .dbcnt = 0x1, .sclfrq = 0x11, .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false },
+	{.core_clk = 4000000,   .hldt = 0x9,  .dbcnt = 0x1, .sclfrq = 0xB,  .scllt = 0x0,
+	.sclht  = 0x0, .fast_mode = false }
+};
+
+static struct SMB_TIMING_T SMB_TIMING_400KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x3, .sclfrq = 0x0, .scllt = 0x47,
+	.sclht  = 0x35, .fast_mode = true },
+	{.core_clk = 62500000,  .hldt = 0x2A, .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0x2C,
+	.sclht  = 0x22, .fast_mode = true },
+	{.core_clk = 50000000,  .hldt = 0x21, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x24,
+	.sclht  = 0x1B, .fast_mode = true },
+	{.core_clk = 48000000,  .hldt = 0x1E, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x24,
+	.sclht  = 0x19, .fast_mode = true },
+	{.core_clk = 40000000,  .hldt = 0x1B, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x1E,
+	.sclht  = 0x14, .fast_mode = true },
+	{.core_clk = 33000000,  .hldt = 0x15, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x19,
+	.sclht  = 0x11, .fast_mode = true },
+	{.core_clk = 30000000,  .hldt = 0x15, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x19,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 29000000,  .hldt = 0x11, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x15,
+	.sclht  = 0x10, .fast_mode = true },
+	{.core_clk = 26000000,  .hldt = 0x10, .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x13,
+	.sclht  = 0xE,  .fast_mode = true },
+	{.core_clk = 25000000,  .hldt = 0xF,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x13,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 24000000,  .hldt = 0xD,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x12,
+	.sclht  = 0xD,  .fast_mode = true },
+	{.core_clk = 20000000,  .hldt = 0xB,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xF,
+	.sclht  = 0xA,  .fast_mode = true },
+	{.core_clk = 16180000,  .hldt = 0xA,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xC,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 15000000,  .hldt = 0x9,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xB,
+	.sclht  = 0x8,  .fast_mode = true },
+	{.core_clk = 13000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x7,  .fast_mode = true },
+	{.core_clk = 12000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x6,  .fast_mode = true },
+	{.core_clk = 10000000,  .hldt = 0x6,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x8,
+	.sclht  = 0x5,  .fast_mode = true },
+};
+
+static struct SMB_TIMING_T SMB_TIMING_1000KHZ[] = {
+	{.core_clk = 100000000, .hldt = 0x15, .dbcnt = 0x4, .sclfrq = 0x0, .scllt = 0x1C,
+	.sclht  = 0x15, .fast_mode = true },
+	{.core_clk = 62500000,  .hldt = 0xF,  .dbcnt = 0x3, .sclfrq = 0x0, .scllt = 0x11,
+	.sclht  = 0xE,  .fast_mode = true },
+	{.core_clk = 50000000,  .hldt = 0xA,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xE,
+	.sclht  = 0xB,  .fast_mode = true },
+	{.core_clk = 48000000,  .hldt = 0x9,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xD,
+	.sclht  = 0xB,  .fast_mode = true },
+	{.core_clk = 41000000,  .hldt = 0x9,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xC,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 40000000,  .hldt = 0x8,  .dbcnt = 0x2, .sclfrq = 0x0, .scllt = 0xB,
+	.sclht  = 0x9,  .fast_mode = true },
+	{.core_clk = 33000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0xA,
+	.sclht  = 0x7,  .fast_mode = true },
+	{.core_clk = 25000000,  .hldt = 0x4,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x7,
+	.sclht  = 0x6,  .fast_mode = true },
+	{.core_clk = 24000000,  .hldt = 0x7,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x8,
+	.sclht  = 0x5,  .fast_mode = true },
+	{.core_clk = 20000000,  .hldt = 0x4,  .dbcnt = 0x1, .sclfrq = 0x0, .scllt = 0x6,
+	.sclht  = 0x4,  .fast_mode = true },
+};
+
 struct npcm_i2c_data {
 	u8 fifo_size;
 	u32 segctl_init_val;
@@ -1805,102 +1920,45 @@ static void npcm_i2c_recovery_init(struct i2c_adapter *_adap)
  */
 static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
 {
-	u32  k1 = 0;
-	u32  k2 = 0;
-	u8   dbnct = 0;
-	u32  sclfrq = 0;
-	u8   hldt = 7;
+	struct  SMB_TIMING_T *smb_timing;
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
+		smb_timing = SMB_TIMING_100KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+		smb_timing = SMB_TIMING_400KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
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
+		smb_timing = SMB_TIMING_1000KHZ;
+		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
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
+	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
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
+	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
+		 & 0x3),
 		 bus->reg + NPCM_I2CCTL3);
 
 	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
@@ -1912,13 +1970,13 @@ static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
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

