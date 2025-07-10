Return-Path: <openbmc+bounces-321-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A2B028DF
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBlm5NfKz30hF;
	Sat, 12 Jul 2025 12:06:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160893;
	cv=none; b=CQrztPtOb32t3EVA4Wz5sRmKGb7MwGWVJ7iYPI/XEvXbGFZBEzTnvriZ2y0qpCBUdWfAbJ2qRfPBLyrhgUOIyfic+7G59oYB06hi8V/V+9GlKlB+kMDpjt6NdWyNo/mna+Q7LxSELny3JlavuveRyU6pZmqMYp4gW2nYb+80yLvETEIZ0AUz+hxbH8AEPRll2XahSr7Cce0ChLK+ugmftJHiSUNLbvU9uRw3W9xn9OL1ZqeQtSuGASL4qFSvbV7ImYa5ZJiAvC35ooUlDh9Zr/ySGjHeUdQd8+IzalP02MdRt8uPvWU5AZ9bydz7ydkDBFeJaY1k0UbxfERiMHW5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160893; c=relaxed/relaxed;
	bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=bXis4pLV1xc5Xhjop4u2NDBK1o8nvtId1imfov4gsZXNSrcy+STrWJObJ9V/ti2zvPqpfGlcwIzMRYeI7SPQ5vO/d5e0etMypgOwutvzloLJ4QMyyGgRQS67CgceMz4GJ0zizUiqECt8bK67MtEdVaU3LHU1LmHOcAfaaXvMKRIlVgxqEnaCS3x0F/NkMPKiY9nOUca4sk3ZxQ+Ok9Iyl0EE0/2EbVVAVZZvmWsyIfvjA1b4hupCQRpRkdNVVZuMaEpzZ0yLa2WnFFw7Wp0hzewcu/kq/XWx3yXBmgJrf1ust3AYOR2B4znyjeksxARW2P9GiqFLB1/DUN78iysdDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HxIL86mb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HxIL86mb; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HxIL86mb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HxIL86mb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTm48QQz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
	b=HxIL86mbTXPUSs8uRQ7/altyuecxVdZFp08lkB8sPcsRW/Fw9yIcYWEAcD0eoBj+8G3uCv
	ar1HVFsMRHmE4bjz36dqIrpOMhPyXD7125RHOyzex1R/0yuXHMdqBEec3zJamE5reFrJL0
	S8+SHDGFS+veEuxn+ilXUrK7y5IXnpM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
	b=HxIL86mbTXPUSs8uRQ7/altyuecxVdZFp08lkB8sPcsRW/Fw9yIcYWEAcD0eoBj+8G3uCv
	ar1HVFsMRHmE4bjz36dqIrpOMhPyXD7125RHOyzex1R/0yuXHMdqBEec3zJamE5reFrJL0
	S8+SHDGFS+veEuxn+ilXUrK7y5IXnpM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-4JD5a1QlNzGN6w-lanRi2A-1; Thu, 10 Jul 2025 11:21:28 -0400
X-MC-Unique: 4JD5a1QlNzGN6w-lanRi2A-1
X-Mimecast-MFC-AGG-ID: 4JD5a1QlNzGN6w-lanRi2A_1752160888
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a7bba869dbso24557961cf.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160887; x=1752765687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
        b=sp5KN08l9qVUDBI7F0/LAnbUga/D5RUHbSLCm9UvpAei9PC562PxBFoTnUwLTLKyoU
         Xz6RniQ/w2DIjvesafaTP69KnxqARm7YFI8qIF2DPwfjDMviQTF31NxZX3Dx5mB5w+Og
         VCLk9jPEERPCozE2Al6BmlfbBB9r82Z3xWZ2alur+bQF1mloPoig2tuF4SKEZz4ufj2k
         VyvG1jHf3vPZumwlkk6gohGIA0H3yW0Z0dcYp+wmcGg/l9tQFyu9uGdGVZdaoIMkTfrX
         kXdfkT6GqHAsLTzBXxalDLottkWiWwYA8vwZX6GmHTZxr9BcU0ZvSf/Y3NwWOX38qMGs
         iJHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6udKE/+wWmLJ/fi9wYc+sIG8VgFZv/vr8dzGMjIyKGWYGAICYmQC4TeJyYhW14294EH2QTUEO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLMxwzC5J1pBIK0IzbrMfjrv8uHiSNK1THOqUUc7u+kT6cu/bx
	uX5T/nTVXDQZH5MwgW3NKZp9bMi/5qUGFuEXHD07Qy9xQgG+DhSeGrfIzgspjhw9fRWVgLgzCqG
	fsEwnlAUSfdyQLrrG+1Qen8IE7Nz7tbFopEM+jmHeLvFsuKYcj0uCvxw2IJ/5
X-Gm-Gg: ASbGnctVdUB6HPqjBswZrv1n272DKJIZgdvg1xYcoIj5HajR+KS7MInwVqHpOwxuOaV
	mqtLC5WTy0vomYyDjfJhJkBMjBTIxHyCyomF25bO6K1Ld5FMBFGM6uu/AalyGvS9XHdXq4X4tN6
	+zJaorVSIP89vcdJL030Ns39eHnqRVZ60gc/MNr6k+SAAweDH/Snmt5VQyauGuUE11O4SnvogPq
	SHHvGNiNR1rDocyGNE5yOSJ/jPWsLHHcy/orkysI03rPujdn7mDfmyBXQ0ycFENOwdRl6E08uad
	P/A4PzYvD1B1qaMfzFlmPRIpt691kvwWRC0AFrniann3qY79wXNqFtfcI8yO
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61243141cf.14.1752160887572;
        Thu, 10 Jul 2025 08:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp+rjgrTFYPXr2yzX0xKnPs2naabQOdY6kOTU0JwDVLzTwczVY74hpEf/KJzdR2RHlWtIYeg==
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61242511cf.14.1752160886948;
        Thu, 10 Jul 2025 08:21:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:33 -0400
Subject: [PATCH 13/15] rtc: pcf8563: convert from round_rate() to
 determine_rate()
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Message-Id: <20250710-rtc-clk-round-rate-v1-13-33140bb2278e@redhat.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1660;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kz71FhpXSJiP4LK6NL3EGhiadR4ZZmwclRrRnYVh4iY=;
 b=HtQpQzElJ4/cj2HXLwu5RWF2ZoeaJHJijPuStkArACrAwIcV9r53z/PCLSYCNvmBtXTczzLvw
 Yx0zin2Ti9cAacdRJfzbIpFg3t0sPGRc5CfQjMz4BP5O3od8ES6UfXo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IVcRBK95m0MZrS00P75ohZ5T7lcGDtLxh0pz24b7CF4_1752160888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf8563.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index a2a2067b28a127bafec66328cd75f50aa4277986..4e61011fb7a9672ee356f6328a7691ca413a82bc 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -330,16 +330,21 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[buf];
 }
 
-static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int pcf8563_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
-		if (clkout_rates[i] <= rate)
-			return clkout_rates[i];
+		if (clkout_rates[i] <= req->rate) {
+			req->rate = clkout_rates[i];
 
-	return clkout_rates[0];
+			return 0;
+		}
+
+	req->rate = clkout_rates[0];
+
+	return 0;
 }
 
 static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -413,7 +418,7 @@ static const struct clk_ops pcf8563_clkout_ops = {
 	.unprepare = pcf8563_clkout_unprepare,
 	.is_prepared = pcf8563_clkout_is_prepared,
 	.recalc_rate = pcf8563_clkout_recalc_rate,
-	.round_rate = pcf8563_clkout_round_rate,
+	.determine_rate = pcf8563_clkout_determine_rate,
 	.set_rate = pcf8563_clkout_set_rate,
 };
 

-- 
2.50.0


