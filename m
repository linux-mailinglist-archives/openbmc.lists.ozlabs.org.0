Return-Path: <openbmc+bounces-327-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C65B028E5
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmH74KGz3bnJ;
	Sat, 12 Jul 2025 12:07:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160877;
	cv=none; b=OYG7NTSfn00h3U09hhfm+N83y8AREEbiq2EIj2KCB2XnXwKgbsPhJ5aBbX99D7sq6r9ylsreCL6LyrtBPvTP+X0zmZudyEungLhc49cHIU/Kv2lhOAki7x4vv+4Q1tKnBNylM544BAoZZzaPysq3LD2wsT3L6XrlySEdILjnpuy36OVwfBz5m1JcFl0+GldLUteX0+cjmcVJmIx5Kf3PZGcKi4RT4+c4sbiK79df4+XqT3r3c3bP5bj59exj8HfeHN+pztDQsX+dj4xbhnklQSo3VBP6F4bE2lZIWXeBoq9dm6tU96YccgZRuKCKGkJIQ2uJvRGra+aoxWsAKX33uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160877; c=relaxed/relaxed;
	bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=aL27wC5dQwlF1YvMScZWNHjm5ERlwuQ3rQMtZMh2Hxy7IjycZUJQV6AoGP8c0M8Ii0eEjs2JripgI8jOB/IeISpJIdMLmG7A+omxCkbEpM8hXdFggLMqahs/KG0IfL4uUd8o7WNWf4BpWB+pwXo9PdiUG8wdAwJbrqKqKKiFT7kHDcgx+gijFEX1ybq40cyUi47tVo1iQonFygJGT86s8mVJB813gf0Bv86LtcplcXZr4fIxvx3vyPnt2+iuo6c0OautFavats041z6bNhB1H+9V5G+xZi3mIpqSt0LJ58nP2ZaTleQ8UkL7H/T3qUebuB1JyJL3v6ZUZtHlGnCgGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EYRaYrsh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGX4vGkq; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EYRaYrsh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGX4vGkq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTS6McKz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
	b=EYRaYrsh9XsXUqUzH7OukTAHoFPnIqFEGnadgpHXOZJnBjWOAzuUyjD6p+sbL8nUZ5t4Qg
	KllvqJp9uR0d8dl6q1PVxHCRrET2pgSAix9TcFGXhKz57anH/nX+1gCiBXqP5GbimtRFEq
	7Q4F5f5l6wG10wGjl4zE6bxTtEe5/HE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
	b=aGX4vGkqAIgQ3xafNWVG05HnhefQ3UwGwZNQ2H9qohfcesYR1qX9TBU8V8KVZZPFQP1dO9
	GkWmBOAN6RrK3pl85rGiqxbu/3UYtqzp9o87MfjI4UnqzbMUsqPECCqsrbnktgivW2/egJ
	WKFkVIILdoZBbLw23xgIhjfP1L8K7o0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-ZKygyjoaO3uFVRrip0IYbA-1; Thu, 10 Jul 2025 11:21:12 -0400
X-MC-Unique: ZKygyjoaO3uFVRrip0IYbA-1
X-Mimecast-MFC-AGG-ID: ZKygyjoaO3uFVRrip0IYbA_1752160872
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a585dc5f6aso22979061cf.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160872; x=1752765672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
        b=FU00LMDXnfmvteuAhCpC+uYbJytrw6spT7nbmOm4EYJcjg30keybjhnwitI+Xhl0H7
         FkvblRZ0Hi/Lu0y3nPR60MS8QnvLu+K2mCQ4UumjNpEzX4Otp4UG/0tqJFVtO0l8RESv
         lS9uxk0HZrVIgXk2Fwsf7WzWokSi7ZMFL32oAgY/N9BozGI4flm1Fj8Fy6UeoXZp+CZS
         4oxd9VwjFlqb7H2MMKR7APIczKFzEC8Qc856UENyQEOvb0EaEliUCv6Rf1xn442H7cwI
         Aad+ucRFVKhppYzKP50XM+v9kXy1Gm3CYYXYcBMcsKo5QHBAjhLru4LGMq42HTIjdRRu
         JcUg==
X-Forwarded-Encrypted: i=1; AJvYcCV86a06WG5uR6FZ730vnazDPxvewNnX24VyJYRH3WJlaqr8FUnXDtRGjaeVRVzxc69e6biVJ69i@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/vgsZFIu0wwoqSewIJWQI8d0D62iFO9ooi5sy7kCVc/Tfbyy4
	YptOrOCIKW+ZoTU/lzdR1r/ZM/OdiNEKMBLWVr6xMkL5lFgmM8Ixd+cT8eP5B1T6Ohv3JiPfvPC
	fz+Tzao1CTeuMPperg+czL/sNFuncBp4cHE2QHHoTOqkvl3H0sJ0AI6ROtEvv
X-Gm-Gg: ASbGnct3nkSRsLQbHXjoIfHvtMoJuxZo+q6UkCs0Fp2mK/5nzV6KKWyV/l5JxZuNkKQ
	LDT7GwbBcnyYR2y+2CzAyVaLPCmPqXMNFITSfUvJG7ihB77MBfekJv9WV8Va4FuzMZneR+cg2p5
	EmU5QxYyHnU0QXxXnTx9QfQtk5MQwcwfavMtvNuwqmgIh+ujMbpCl6x4DXx5Xmyf7L87qm2Vzcu
	3ZM1TH/MCCWm1cYHb9pcBltTQSHXfMuLRliwCS2J6vC6s+JyjgjLai2KtgZ2IO92H/bTGU0ztRH
	2z0xDHc6kqdEMXI6NvT1vr3kHPCSJ/zGBUgapNDYIxotlyWjhp2XILB7ghZm
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45147631cf.49.1752160871486;
        Thu, 10 Jul 2025 08:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLT1XiJrU+UqNY9Ntq3luY8jImtJ3Zw7F09c9Cj0qnJVdBHLwN1EIzNkD/8bD8ThuDgwCtJA==
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45146771cf.49.1752160870836;
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:27 -0400
Subject: [PATCH 07/15] rtc: ds1307: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-7-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1810;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4BgFJNK2KApAx8BvGXfufY73usovEfW4jGfRZpX6CSI=;
 b=gO9ysBDglD/2ypzU7AUASOweu+17QRdU21E2uZnqmFKCHQ+Uy7Pcv2JFbQadunS2Oz2cuRLHO
 oMy1rC7ws2ODWASKzDRAvMEp2urJXIZdGJLVZN2+KQPl6b+ZWpTWi8t
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 42i_lH0f_B3vWLjgVb5Wqhplhuf-rDyMZ-GhPFLpgPc_1752160872
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
 drivers/rtc/rtc-ds1307.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index c8a666de9cbe9163ab7e112b01b99d97c94970d3..d9d0e482b5ea9300ec9d7e77e4c3ec531b9df867 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1456,17 +1456,22 @@ static unsigned long ds3231_clk_sqw_recalc_rate(struct clk_hw *hw,
 	return ds3231_clk_sqw_rates[rate_sel];
 }
 
-static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int ds3231_clk_sqw_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = ARRAY_SIZE(ds3231_clk_sqw_rates) - 1; i >= 0; i--) {
-		if (ds3231_clk_sqw_rates[i] <= rate)
-			return ds3231_clk_sqw_rates[i];
+		if (ds3231_clk_sqw_rates[i] <= req->rate) {
+			req->rate = ds3231_clk_sqw_rates[i];
+
+			return 0;
+		}
 	}
 
-	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+	req->rate = ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+
+	return 0;
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1525,7 +1530,7 @@ static const struct clk_ops ds3231_clk_sqw_ops = {
 	.unprepare = ds3231_clk_sqw_unprepare,
 	.is_prepared = ds3231_clk_sqw_is_prepared,
 	.recalc_rate = ds3231_clk_sqw_recalc_rate,
-	.round_rate = ds3231_clk_sqw_round_rate,
+	.determine_rate = ds3231_clk_sqw_determine_rate,
 	.set_rate = ds3231_clk_sqw_set_rate,
 };
 

-- 
2.50.0


