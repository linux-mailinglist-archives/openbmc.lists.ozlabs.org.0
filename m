Return-Path: <openbmc+bounces-324-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F051DB028E2
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBm61pg8z3blH;
	Sat, 12 Jul 2025 12:07:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160884;
	cv=none; b=WEsvOEvIBjJP0vs8uKYTGsmkrhGdrR5MrzKgC2fyFVb13Uwpq+Ts8xnVii1z+3z8wOBs5lQ+W6QwEo9kcIgTTTJpUuBof7tpexB5ph15Cpjh9siFZtPE5Z0adSdXiaLjf8/6T5AinYgRJ1KD0TfVywhReEtyPopikRd3bq3VdFehb6JqYjVEDls/WgDauQPLcyvTBqV4M89A4dh/Gtxu3Kj8uI5gPP22VWdiaF8GRzXjnfeEHmMODQAGoIrRneAWEbz+5cYAshXXMoBrm9+EH5D52PnHtqGaE94zrFQtegn+gX5wGnw+CS7H2iBCGkyToC542PmO+G4UAhtyaCqTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160884; c=relaxed/relaxed;
	bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=aY4evE4q+ObLhmbOIRW4rXFTgNfY1CAm5ZKWaD7zfxiHrAFHJvaFIPUCsIvdbcBKdCteIzKaTJ3WVbMWESQxt5G7bIROagtQpz6OxRbl3ZIrQumOO90a0dQKrHKnsMssUAriVNeQteoqCcaiNeGN12TdA/y9BW+ggoq7xhjw0uMa2CoRqi42wFmXemZ4yW1XbrlkjdOY7EV+RFCG1ajoJaUst9r9JrvU+BzeYuSc/l0WvqLXLPPLL62b1pZLb47BY/+ojq7qh+n1Qv0D86S2EubmhvA2ZqFUxfl7W+MfQTyb00d5+QPXqifUg8I79h+RCHqHIjtxxXDjdWpw8oeoRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5NAG2/j; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5NAG2/j; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5NAG2/j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5NAG2/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTc0kn9z2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
	b=F5NAG2/jFx3ypDYZCeAKzWOtPfNQp9Gq9DqzoPR++xBk0iUD6V95Roc4HYyViRFHyYfrMc
	651vt70bsZB7hB5IencFlDFtRUr6b0m1fbGOSzz3tMSDTKxlY08U/rAtyMMutpdewVhKvH
	K2R80l/e1JKoYbgTupNMX87k2GzRyEA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
	b=F5NAG2/jFx3ypDYZCeAKzWOtPfNQp9Gq9DqzoPR++xBk0iUD6V95Roc4HYyViRFHyYfrMc
	651vt70bsZB7hB5IencFlDFtRUr6b0m1fbGOSzz3tMSDTKxlY08U/rAtyMMutpdewVhKvH
	K2R80l/e1JKoYbgTupNMX87k2GzRyEA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-n-Q3uT7nMXSVscfl7udCWQ-1; Thu, 10 Jul 2025 11:21:19 -0400
X-MC-Unique: n-Q3uT7nMXSVscfl7udCWQ-1
X-Mimecast-MFC-AGG-ID: n-Q3uT7nMXSVscfl7udCWQ_1752160879
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a587c85a60so23111351cf.2
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160879; x=1752765679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
        b=EEOCuoFOZV3348hb+BvwPFYeLRrWx3IfyxJuKn8I9vtoQd0scT2vEMqJhu6nPWjnSV
         dGHb/fHOH2k7aq4k8LdhxygSIO8Lj7YgkDZC6MCMOAE1tK3XbCqGw04YxMCi3+vsOBYI
         F528HsXqIPMHSaHDSRPvO7/Lvljd02zCeRrWIJc27vEEi/jqfU9x1BtvSrVbbfEUs9YA
         vPutaiKBJvDEm/vmiAjY0F5hDSJcXyWgsiiU0nWHnjBT+SBYOwpIAYIUpwVJhazaq+93
         P/wWCORbNg3RAqtsqpTS6aMlUeEWvRslKj7bWwc0VY/Mt/0nmTKVIST5QMnKolpvyhBe
         qgxw==
X-Forwarded-Encrypted: i=1; AJvYcCVH2GADQEsbXZ3ucxUYs7c+wy2SDqXNobObWHTVF+yHfgYhQsY5AhGWGyvi/k6wV3Gcbaba2e4p@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtqneyN5WuUEcpx2fWfyG3c83WutVB2M0lPtXjfpdUNvNXByrq
	QG+6qfNFHVaC2wLnA1kNCB9SQA4QuT2oUjcY0FRmyIW4S6soy2+QX034Jh3lrds7E3wB4Ibt1fG
	hnm3B9ZnFjKrUGuY/5GasYYm0QVpJqeie7KlmIc7Wn2/gGjC0cJHVngSXbuow
X-Gm-Gg: ASbGnct1S6iyl2KNTWIK8btgzFEhSKXXz61mKrNuG8Cy2SpPUqKokfWc+pEKZ0zritQ
	bFI7eO5pbhCBZ4XfjF/e9VpiyTBQJiZgPAGJV/bLc6J2328FyyPJx9FTDUlofybKbQqgFRMiz5h
	1PwgbuBeWPR2HiOVB2K9ES4+XtOb6ubGFmoS4eANo3ix/ZktIgcaO6v0SAjfHMPoDMP4ZKQEnz4
	kJ7Q5d4vYtg/2nyYjlEgCaDh3SghaSEpRET6g+2ASJBl3iiz9umpNIDOXMngGuFgA/UO4MIVx4J
	7pQQQwEEp2QfT65XvUOvp3vRu5LgTzvjOHQttwWzKJmnnPVuW3lE4A5D718s
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146561cf.7.1752160879135;
        Thu, 10 Jul 2025 08:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYaK+S6nKLNB0+onalYZ18FMGM4SU1Pk1Rw8vuZDxj3sx1uTSsbM+HxfhIu/O6GetrMHApA==
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146151cf.7.1752160878737;
        Thu, 10 Jul 2025 08:21:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:30 -0400
Subject: [PATCH 10/15] rtc: max31335: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-10-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1704;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=UPXy6/C/RD79zBD8+YjC+4PQ2wHdzGnij5BrRNttYFg=;
 b=VczBglJXF7c0OhaNV6IcNJHendkDjPzxJK9SOdtvRnVBdd83JQDd6pRndtaJb0pB6PnPQgE6n
 YzmdtsurZ5VCbLJUyfz/1pItIEplDMwKOk1THQ06/VWvI4nd8eqLOL0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hdt2eK_wJhgE2rhnZ60q1ImS3bcv45uXq_OHtPSqDRc_1752160879
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
 drivers/rtc/rtc-max31335.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index a7bb37aaab9e6e315db70bc6bc0dbaa553fdecfa..dfb5bad3a3691d0968bac78cbc9d54a2ea7662ba 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -497,15 +497,17 @@ static unsigned long max31335_clkout_recalc_rate(struct clk_hw *hw,
 	return max31335_clkout_freq[reg & freq_mask];
 }
 
-static long max31335_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int max31335_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	int index;
 
-	index = find_closest(rate, max31335_clkout_freq,
+	index = find_closest(req->rate, max31335_clkout_freq,
 			     ARRAY_SIZE(max31335_clkout_freq));
 
-	return max31335_clkout_freq[index];
+	req->rate = max31335_clkout_freq[index];
+
+	return 0;
 }
 
 static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -554,7 +556,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops max31335_clkout_ops = {
 	.recalc_rate = max31335_clkout_recalc_rate,
-	.round_rate = max31335_clkout_round_rate,
+	.determine_rate = max31335_clkout_determine_rate,
 	.set_rate = max31335_clkout_set_rate,
 	.enable = max31335_clkout_enable,
 	.disable = max31335_clkout_disable,

-- 
2.50.0


