Return-Path: <openbmc+bounces-329-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F9B028E7
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmT2Drnz3bpM;
	Sat, 12 Jul 2025 12:07:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160872;
	cv=none; b=RCiuZoj8F/t2vpgQaLdTB9EKscSxRlJPMMV6Ji2bnpanoUeLMbnQxWssukiFXAHdiL9pTN1y8X5aywhFGIc7KHe9kadEDG2dUNgEsFs/9hDK+xEBcntogsq2DqDOFd5JRoFnbzbzNvpGpUbl6/a3XyergxjJAi6r7z4zH6Oh3kp+qbEaRZroNZFQkXJAXzSc4wPzYJ44DQG7ajgrJ/qdRYdwiUQhvmW6+b9QkIGA7SgXdCPD0Z31msLUHR4ssAq/eWpEhu3e9FrKl7j2MOQgntfK/uCBKk1+5lqXAEX11GVl6c1Wv/08gncCBUSKhep4y9XweUv8cE5yeaDtUd4qUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160872; c=relaxed/relaxed;
	bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=mq0wUpYUi35/SMwj9OARIimd3xu2B4M09TAXMAKY9LRoyEMKGE487JPOQ2tv1YOD+gacipGiQ2llSmOtt1CfBTpZHXIoy5KOvfL/HEepCTf41+Jr5lM73YcuGcnd3TNEy7UaL7IZm2PHjd2KLZwYZSyuUOqSpmcloD3YD1BSf6S82YOpvrecJya38LXtvoSrmZ0M2qHgOVkEARxzbrRdDz9HEk4vrjFNn2qfGbc+veRxMYBAB8z9DbFXWVJFqxPPgtaCvTQjJ4ixI07ISK11UMDkq59q0u1JLxmJplu6W//yzIokLx7HjBMqM1FmnagzZlY9vv8/2ExDqNGtTIQN6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WY3upx/Q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WY3upx/Q; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WY3upx/Q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WY3upx/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTM31zpz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
	b=WY3upx/Qy1UjDxkiBaD12yS8p/40Y3+dTMF9lLU2+c6GAU0QkaKgFnvPvJV3Fcelt5rzev
	bmnXolneqI7xa5ksO0DpCx8VMVoNqv3KVZwL4lXP+FO2lkDJV4w4w6kO0+V3acncJBiiAX
	C7wLmXpDSj5T/Rr5jveMifli7YF237s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
	b=WY3upx/Qy1UjDxkiBaD12yS8p/40Y3+dTMF9lLU2+c6GAU0QkaKgFnvPvJV3Fcelt5rzev
	bmnXolneqI7xa5ksO0DpCx8VMVoNqv3KVZwL4lXP+FO2lkDJV4w4w6kO0+V3acncJBiiAX
	C7wLmXpDSj5T/Rr5jveMifli7YF237s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-Xp91QbQmN3Sa4zGa_8FJoA-1; Thu, 10 Jul 2025 11:21:06 -0400
X-MC-Unique: Xp91QbQmN3Sa4zGa_8FJoA-1
X-Mimecast-MFC-AGG-ID: Xp91QbQmN3Sa4zGa_8FJoA_1752160866
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a762876813so17545301cf.2
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160866; x=1752765666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWgai9je4M+dBmQHfs2DnCFlZRU+HmuUrj6HyZ1DawM=;
        b=uv+WW+aw56W7XnyCYfZfihO2Dy4cfuc4dRSjISQtly14z85ML38WKYzeH0U55fjqzc
         5j+SFr4BzVzl4WPEqo94czSAz4R1afjBzeAfWqqs3iAjdsn1CAnDtLQvpqijleiif+CD
         y1jYRveeN/k/j8T3r/4O25pMmR55kMh223afIgU6ydTTuMcY0xJbNTC9nH4I+z4/VriR
         l3QD6pLE+qWqcAtJJR6Z6dDbGK+z0fKnzHei9D2toWPlDd7eD0Myph/zYvGjLF9Kb3FA
         CZZZn2Y551CggXWXgp8cMj3V+CiX+1rKUM3Blqnv+dPcKjBmvbE/pLp46Z/08zfygPnX
         Efmg==
X-Forwarded-Encrypted: i=1; AJvYcCVGxnDo5YT8gVvm68oBXsMiSOcQ6gIb4Qc02kOy+VlcyyvCzNvtmZgbsSEgm3px3PrPvrni8uRL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZfSpLRlHuYMHLsZIy+4XH2RotHYQGCkPgda7+Gs4MlyiS9dZy
	qHLzbuMhO00gcnX0TXziBI9sAZUiSds+0CeNX6ae7GMuRMNknNLKlreR90vDuBAqpPCkbyxavgI
	PP2tLM5VuGuyxAnZTSmoxz0eUBI++bQZBy1+xwyWYEvzIW0ffg3Fuw0RaUOgY
X-Gm-Gg: ASbGnct2FPs3o+4/NFDY5jcSiojYyr0m7x96dKnxjUQfx2u48fI2crT10EPjYgZwJfo
	cr26iMSBZNS0/XhFMWLzu595B+qaFEYSvFA/3FT1KWs7019rTBVmfF/FXqUsaPEieZnrR9VtBK2
	oDBISgbqvti77irPlsg+pttkhwKgcxwrOoMNF/ytjuykGqsM48ynWRSTXumgoR/FHQFTc4zOdIJ
	z1BwBI4U198lQFGONqkpS3a9eJo7Zq3T+MBMIJNYGeYMEinvTmH7+/KXtY6BGUOZY89CWQY9a/u
	LoLXEKiNLeYHDq3ms19s/irmk/sItebm/A2lISAtgIj0M/93S+oKlIl2tv1r
X-Received: by 2002:a05:622a:211:b0:4a7:5c21:d4d with SMTP id d75a77b69052e-4a9dec28dc5mr103787091cf.3.1752160866012;
        Thu, 10 Jul 2025 08:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGi78LTzsYtSVkKEALzl93XPTGvuqLAQzDkHoOcxcArk4oREKyBP6wLdcXeCmuUpcKwg+gWg==
X-Received: by 2002:a05:622a:211:b0:4a7:5c21:d4d with SMTP id d75a77b69052e-4a9dec28dc5mr103786631cf.3.1752160865622;
        Thu, 10 Jul 2025 08:21:05 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:25 -0400
Subject: [PATCH 05/15] rtc: pcf8563: fix incorrect maximum clock rate
 handling
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
Message-Id: <20250710-rtc-clk-round-rate-v1-5-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1071;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PB+j173ZUCvMx00QR0amUhQt36vO0IOlAp4XxnvHyoA=;
 b=SZd0Tpd6HF4yy+Mmrqrn3tbJsWSKYgTwu87RGcBvNECkHFO1D/v+Vw/xZqNbu+/k2SLWi8+ZB
 mcLVNVwJoO3DhAIo51s6cEWtuxqa7l/mVXZpDVSt8sXgmkm5TMyGPgA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 25606Dx1VfpS5wdQVKbdPm6L_94czcKAR86yLHkyGaE_1752160866
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When pcf8563_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: a39a6405d5f94 ("rtc: pcf8563: add CLKOUT to common clock framework")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index b2611697fa5e3adc61f687e39385d10736dec677..a2a2067b28a127bafec66328cd75f50aa4277986 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -339,7 +339,7 @@ static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


