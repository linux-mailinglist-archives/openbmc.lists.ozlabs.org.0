Return-Path: <openbmc+bounces-322-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 670FBB028E0
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBls10GZz3bcW;
	Sat, 12 Jul 2025 12:06:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160891;
	cv=none; b=hr9aQKfYGh0qV92Jk9NYkUz6j15wjnB/j9Q7q37MMOh+iZAlRSajttsDry3P5L5ZmUkPyx5F1IpUX3ErUWkKhjQ8TBqOBcidd8AxAwvdDGKz/6AVIs8PXFAcjd47oBYVU33Vw3s6K5zaPuB8mEc8yWxr/qznwRh3LlNmEpGzkD+AtGZbxPS0HqiaiYh+SfNaLmH5hWw5MWfIF1S/6BinEevqez2P4+dYIUrupSEkQCYXWhsAJz94Rvi46mEZzo37uIPvL8N4fA/qHK9mDXJ0FTdJzgtCaP04ewh5MMmGxDdTju03EyionEJJVN07SAINZ1QqUS1qWetn13WvVaUjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160891; c=relaxed/relaxed;
	bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=TDSgPxpHQoxd1zYg5RG4IZ7RCBPO62SpEtVHkapLSSPssJ88zaO5u/59adnVcX2OV/EcnyZYSr8/lhvyWi2LERsoCD8okirlZKMAxEwCFE+VLwwWNsesUmVW9ZyTSvV2N1NRtyIQgtFDboFcovh0vxIEKM4hjt4/90+3lIBVjcyo8ArI97fgOzHdXGjOyH/xye6L/Q16yDsoxe5na+cJz2d7l+4kynP0U6U6NQ90Fd5okmYhU3LvQaz5PmblbxsHWOogtUHm71lUwrxHKvKpCTv1P9InqsCVRt9B3dJD7IGrJ98YGBFHjSXdyV7Q/pqNg6vq9z13n/ExhoZmhmAOIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4B5Rgyp; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4B5Rgyp; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4B5Rgyp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V4B5Rgyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTl0q8kz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
	b=V4B5RgypblNgBAnGL+jPeCwd1HkGp35cVbk+FN1hW2mnnXqS3Hhf5YHJC28/U++/jUeiKx
	gcfDWjdvq0xDD7NdZf09mvzGjgAQ2Zu4bdp1kfpHbL7j/bGeFezdJbMf4gbJhiVnQwW4vs
	eI6ecgZW/D4VL8PiD+A77lpKQZ4EXPs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
	b=V4B5RgypblNgBAnGL+jPeCwd1HkGp35cVbk+FN1hW2mnnXqS3Hhf5YHJC28/U++/jUeiKx
	gcfDWjdvq0xDD7NdZf09mvzGjgAQ2Zu4bdp1kfpHbL7j/bGeFezdJbMf4gbJhiVnQwW4vs
	eI6ecgZW/D4VL8PiD+A77lpKQZ4EXPs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-vE4QsoixNqSBMF7uLtJ8lw-1; Thu, 10 Jul 2025 11:21:25 -0400
X-MC-Unique: vE4QsoixNqSBMF7uLtJ8lw-1
X-Mimecast-MFC-AGG-ID: vE4QsoixNqSBMF7uLtJ8lw_1752160884
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a9cce09a9aso23571171cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160884; x=1752765684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHrxzt6oBAK7nbUlAaS6YSCPJAz4yjcPZzUXcr60eqQ=;
        b=hwkiak3bmrK+Vf9LJJlsQe+hjVleIhoJFgKfMelB7A764XhQYlK8OnZwErnTWi3b6o
         CpEkRb3A2/5rzzQFfa5qyAectO8hpS1TtkUtrRg1yHgutQkLdD9Pi8KhuV73snsklEaP
         Gq0KQKwLM3IVEW/eOo2AFxV7ZeKPYZIvhneP5ConR110Sbgq+0+pty8NgsnyVI9G8suS
         +ONGOe69h6gggx8ca8gTOv1Pa1l5TeMSfA3UtYd8n4ETY9mkFk4CNxO51ejc69a66Rrw
         0kywwTUZOWrqChvBOzByoDoZbvn/1ZlFdCaWILReiuI/EXznH6rfkIiWcZRJhbZVgiyF
         ZbMw==
X-Forwarded-Encrypted: i=1; AJvYcCV5YiQUXhve07986WSePG0aipX7+mbix4CNDsr12nGD/vH1+eJOAHu/YrGKwKXIr/gq1Vt4bsTI@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9hwbVOpPUi33jUBe/OL4dMhZbzsi5r2XwDy3u/mbU2gQB/D4U
	qhxdquWVnz5m3v9iZdhmcgwBW8TOAabQ4O1Kx6fs7Ltr4+DKBHWcVsoAVbviAK9qXAj7XlC8STx
	cbA7+IAqEKSi+t6UlNtqrLR7d3UkG3UXWtQeK40moWpP70Ccp1VrMWj+KaTL4
X-Gm-Gg: ASbGnctazSKE3gBtlyGtjFteWgjz7G3M5OL1/7zUfUHqN8CYhTbjNV6KTXrmdRj/mXP
	+31CW/Trwk1om0+OszViutiAMr9N3dS/yBiQxh5A7jgr2Pc7dqtfwwJs5iLLWtWTgbI8hDqVlnP
	+/D+5K01FKjnI8fd1/CFpvk+GU+ZfcdZYufsbCJ8tTSjHeFy14HBQqhyS/eFwEiBZO/NQrjaG5L
	7XfvgCxLwibODZ7s9cNf6n9KJ2riNjenbQ5aXY9uxMVnpeqwkNgtKVmr0g0bUAnCfc7IyfZw8fn
	4d+px803PDRl79ZUl9rFzFMT1Z9oRcUCyWQGukrVfGhY+x8kDFPmW0MxA+Pz
X-Received: by 2002:ac8:7dc9:0:b0:4a9:957e:abfa with SMTP id d75a77b69052e-4a9ec768310mr46701501cf.20.1752160884354;
        Thu, 10 Jul 2025 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExNE2eoKe+QdzlIFX9zvN4NAZlfmpgtS7RXKYKxt1/AsAPcsp5gHofzn/kMZ5xQTYoVqGvIA==
X-Received: by 2002:ac8:7dc9:0:b0:4a9:957e:abfa with SMTP id d75a77b69052e-4a9ec768310mr46701151cf.20.1752160883963;
        Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:32 -0400
Subject: [PATCH 12/15] rtc: pcf85063: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-12-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1678;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=CKo9LaRRqcp1kervDO8TcSEMoHxesfYK30Hcksflj70=;
 b=9VCibQW5+lIsm2ZJtIf/1irsi8yh8liaiSDjxvieKKChnEbb58K3vG9919ehBKwAvx8GcyTT1
 a3/d+7m2/QtCzE6zvrB6HQv5fQ3ZG9FGj7pXg48gJgO0YwcR8r1xjEv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NRPmG7r3nFeav_C34xib6g28ojt0f8rZyZL93U0tWb0_1752160884
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
 drivers/rtc/rtc-pcf85063.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index b26c9bfad5d9296ca8d2be3b5ecb04c19ac97191..779fd627262bde8429ae48735ca591747f871025 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -401,16 +401,21 @@ static unsigned long pcf85063_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[buf];
 }
 
-static long pcf85063_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int pcf85063_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
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
 
 static int pcf85063_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -482,7 +487,7 @@ static const struct clk_ops pcf85063_clkout_ops = {
 	.unprepare = pcf85063_clkout_unprepare,
 	.is_prepared = pcf85063_clkout_is_prepared,
 	.recalc_rate = pcf85063_clkout_recalc_rate,
-	.round_rate = pcf85063_clkout_round_rate,
+	.determine_rate = pcf85063_clkout_determine_rate,
 	.set_rate = pcf85063_clkout_set_rate,
 };
 

-- 
2.50.0


