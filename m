Return-Path: <openbmc+bounces-323-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0CCB028E1
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBlw1Yqmz3bjG;
	Sat, 12 Jul 2025 12:06:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160887;
	cv=none; b=K1ZKZUk8uO0AFuBYsyek2AvGkoVhy4NRNDtUz+s0c8hxq4+pn0vpyRTMGzzTWSpjLai+ARDTL/Rvso5AQVMzhvKYbjUcKCccAvpD5Spra4KfKrbz7EluwplWazX48lb6yytMaicT85F67k3njB5rqPKNe1y1OJGVyblPKzSSmI2y6REA4YyftXORCSi0eIy5Hak2O+BdZLJWTVF/N6m8j+aUrFRmIh777akyo8dZMpMVjMeO+69XCPhHdaab8D7Cw4V6NlTlp6oNL+mQGjHjPtx+v+iZD1e0pRcwkUuDe66kDm/AP+JLt3lbImu4scXG/CuOLkL7E/LbqahZ6NrpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160887; c=relaxed/relaxed;
	bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=nnrtwvpezXIuEauXFj9vbPaC1gV9LmmlH5Gtu80A279MMowxZuLB7+Zuxsz0wAri6L5utFaGOX9DIw5bq6I4uM+iRHHtan+HiZc9gtewcg3T3to7mtMPlg0rPfJwR6zw7uD/utPe1hrf80Fbt48b/IntamuOVIS9ZSxf9D+R/3GVzwDo7/mZwk+icvAHebH1E4XWmujsJltx3EOpWWVItDUpP+kYUkv9EjYLvGhtwsM6fDal9it6ikiVsw4pXTsWbKSlAE/zTtUQRgQTC+sGj0jTFgszSjJNCpsHyQYDJ4JP/T0wU/tf2fnJbTQ6xUoCMuIcDzpJr2OFnNdUzoXBTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b0ImFRvu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=II7ovu9h; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b0ImFRvu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=II7ovu9h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTf6Xf4z2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
	b=b0ImFRvufukVZDUBsfavy/c7dVgTjvZgJz3MepkMVBQXn9maJ1uCo5c9NMMOyis1LN1gXQ
	XPaRPoB2ZaiW3HcNqfOWf/O+PRvd6wmGkL3u7ZAgxiTjqsBv014smwDzCoCW2cSNMiTdk6
	cpJqj683AvhgegyErc9nyVpa12sKqNQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
	b=II7ovu9h2AwFcUppAJbPSch4u7QDjbTTF+JL3X+H3s1vESjzahTSkXbHN2pw/wf4GiesB6
	5yipO25tDbp9iZ/kKHVEMoDgFfq7xTjt+Or8O2lEA59iUvCpP/Dw2QbNH8L5MlSHcVhlZG
	8Yo1DtSJSeS3awvlFIF1kXH80628ZrQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-blEj1bV2OuiFU6xiI2CjKA-1; Thu, 10 Jul 2025 11:21:22 -0400
X-MC-Unique: blEj1bV2OuiFU6xiI2CjKA-1
X-Mimecast-MFC-AGG-ID: blEj1bV2OuiFU6xiI2CjKA_1752160882
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a589edc51aso26316431cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160882; x=1752765682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
        b=lEcGyn7229qigJ8zaxvbN86AYUPEBaRnTh5LaRP6h0JT68XybodjR3DGVVa38/xwdK
         MxTK5nbL65VrtazVsX3Spd1E2yixrr8lYkDKOgkhI8wVF+su0Z0eshQVKbWtcRUIj7e0
         fVI2zf3sHSwfQ0xPfgn+HT72GRopQSCg9T602t0V9Fk6p60f9VAq2gexdvTEN9VPA4er
         nWfLat6CjmNlmI2mXusWR4WEWAHNElocfoPxiHU0Vj41o56pfQ82QbMU3Qf8ii1yVqad
         FDYLOlJU+7wjDOH9I5UjrcCsHINyi5LOwDlDEvD6rTgjNsFLVe36e9d2u6clKSiGqLPq
         0ceg==
X-Forwarded-Encrypted: i=1; AJvYcCVdJl9l9IyzceuZpoYgJZc1fVHIyWelzD1iAUjabgQeQLIPTWDItqeweCBO7/SF1lxzQ0YGYvbf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnHCQ5yahhZY7/tBpL4tY3bEew+3/QL5USk2+vRILi9e8y2SnX
	ihpAxpefHPYyUhgW7zK4+s8ThN70yxKfteEC1Xd3sPVECLXBYeXKXPPQauiJTNtkjaWcpqN/4f0
	KzG8fEzAOz/RLBPayrK6BvqB0VU52Q4+u/qCfDF5soo899TbS2F7RpHDC/IfY
X-Gm-Gg: ASbGncv3vDjAvd1GtV/qJXl+PtXgULOLJnAkuaSV/kNceF51le0+VuWDJMru+eZJQRc
	ulNfoE+OPp8WH1xK+vxFWwg+2fghHVGIl2lzKSLvCFT52x9Bd/+FAcZMVVdo8fpCM5txZG/lmYh
	P2GGzSUIckE64uSQ30WoB6J08JHsB+CQLjOvZB4MmshSUThVcw/qSyLfZ3bQ7AQVhH5lc1j8aOW
	RCtyELnd+h0NJpiAOE3vhfSOu0W2uitKRAO1eqcJoetZVmA9SACcatFUZp3EKMhf34r3jiUpYHt
	ERPtxoZLUKJNT8ptjlWXfV95eY/j/AHYjBlgm4wbqowyQCKn8gwhwieo/8k1
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23115421cf.50.1752160881803;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/1O4MLvOzk7gKxJZFO5slOGKTVfTHOFq+wSEYq355CZZ1O7svKyn2khuzgSoy03/2j0xmxA==
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23114911cf.50.1752160881463;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:31 -0400
Subject: [PATCH 11/15] rtc: nct3018y: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-11-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1680;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=n49+tG0DWMRf1aqATyzqFiQzu9HDymGoH2RU27/qnxQ=;
 b=P6B78+RNiRcz4avwFwJ8Y49o2kiWmwP4zkdeQ/qf8zNH+D8uJk3HIGRZAfLT34wdb2ZKqzKoE
 pRY4BcYTZNGDdsBg2fjEfI6IUZY9CLR90bRG/tlSi/EnUAB3F5vgkHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IXwjOeQqmNmP2xRPpgfBQBVjkY_mvHr0aGhoV75EBII_1752160882
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
 drivers/rtc/rtc-nct3018y.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cea05fca0bccddc6384c462cf1ebdc59b377a24d..cd4b1db902e9f68781787236bec56c2cae8436ab 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -367,16 +367,21 @@ static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[flags];
 }
 
-static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int nct3018y_clkout_determine_rate(struct clk_hw *hw,
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
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -446,7 +451,7 @@ static const struct clk_ops nct3018y_clkout_ops = {
 	.unprepare = nct3018y_clkout_unprepare,
 	.is_prepared = nct3018y_clkout_is_prepared,
 	.recalc_rate = nct3018y_clkout_recalc_rate,
-	.round_rate = nct3018y_clkout_round_rate,
+	.determine_rate = nct3018y_clkout_determine_rate,
 	.set_rate = nct3018y_clkout_set_rate,
 };
 

-- 
2.50.0


