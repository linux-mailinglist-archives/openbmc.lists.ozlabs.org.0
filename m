Return-Path: <openbmc+bounces-326-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A147B028E4
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:08:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmB5JHlz3bmc;
	Sat, 12 Jul 2025 12:07:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160880;
	cv=none; b=RTtmiiG6QM09ougfXh7d25KsiQ0cj5XAgxl1Na7jnjEksCtnFabwJhpEcwW7lLWlJCHF2rtGi0l/Iq5VFixu+/PLiKzfkXroV/aJUx4c+IxnLQiA1+USWg7hWEHDuiJ2R8pTznSVqzdmdUjfR/HNKdnt+gh+XvYma/bKFXundJrR91fjiTs7i6jPeZZ8YJZPOUH24aU8/B1+O4XAX3WABoC0zh8w0fAK4thxhFqcPQmI1HTbDIFUERRRBY5jjU+Ki5ZPLRBcfpyjRq+cSPmVXcgthfd6dWVN2spsGzwheirKlT8XvtzSfvkv2PF7LjCypOtOJGCWzSBhERWUt9zp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160880; c=relaxed/relaxed;
	bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=ZZypEn5rOFxvQr8FaIl5AkZ3WetzLLA6ULtFqZPi+UhJv+2gCghY8DLf9VI+m7vceFPh2eb+pKOoAvgSkxpKH5b3tSB9HSIpK3LSuaBpmlDsUwcH2HmlQUfcndpd0iUZGZ6ZG2gqzEb5mx0UcoE/t6ACzUdwQB58EUOefpSqDx7Oxzbk1IG10OKJD1oxjIi15JFBH5/rMBYGfYzFK0JDvD56NhU6kZpI8MMjAFrr6DtKzZ3M6fGvl07ufW8pkIiH6RXN3LcHquP9qCWb5QZKsq4S5Bu7Zt2uE21KKJ0nMmmeKz0IGVayD1xiSqEMsAYtSrVgcOeIxENRT+fFkmVIuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hUe9MUUH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hUe9MUUH; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hUe9MUUH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hUe9MUUH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTW3mG5z2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
	b=hUe9MUUHs39cU1xVZkD0KITJpujYwcPsMwsvg8dZ1NL5beplwpjw0d9h4IHyxvPi9vMD7h
	ZSQLB+xt0yR0pM5OrSPs/O9esRVypPoKKjnRfDP9Xh9goFlgkERtHU6aQR3ovstLiFIGkG
	CkkSfqMX7HAChdgZ9pZpq5/fWRdWVRI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
	b=hUe9MUUHs39cU1xVZkD0KITJpujYwcPsMwsvg8dZ1NL5beplwpjw0d9h4IHyxvPi9vMD7h
	ZSQLB+xt0yR0pM5OrSPs/O9esRVypPoKKjnRfDP9Xh9goFlgkERtHU6aQR3ovstLiFIGkG
	CkkSfqMX7HAChdgZ9pZpq5/fWRdWVRI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-ZRXvg2MfNMSfP9ppOjrH5Q-1; Thu, 10 Jul 2025 11:21:14 -0400
X-MC-Unique: ZRXvg2MfNMSfP9ppOjrH5Q-1
X-Mimecast-MFC-AGG-ID: ZRXvg2MfNMSfP9ppOjrH5Q_1752160874
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so208905585a.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160874; x=1752765674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
        b=d9j0qoFH3aJIq24hl5x451Oz4bdRNgAoRD5Z0TixtrCtw781a2szbcg+PG2pkh5h2r
         bPWZa1CPcJEhTgM17AJPICL1/obGrvgkmdvIX/wRwa+J9rsjn+iV7Fs7GJY4jCJVR+Is
         YlhrzJGgk17G7MoeYL5G/bd9Z1KpjGzdnCTfinUwpYUivSJbdQbqJnGzJ2rKdhpOnlVA
         sJOIaVMEcaCqi1E+FjGHIaoMgv1eywPccjMcAakMtkEPYwxVHsp/G4lUfd3JN4pjiDrB
         HYu+wb2mE7EnE+oO4BekN5DMDvKdG0pHTpo5B+9VoxZCT7h5r2C/OqPjl/TzcNhPBpVX
         qkMg==
X-Forwarded-Encrypted: i=1; AJvYcCWnixuczcl1ba4GDbYfZsCW/KWTx3DQLG56K762eu64sf4ad7sEEM1fyUCdv2tWksETRnIVpcvL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy95Cf2GffhhjvwVzVKR+raPdVleh/qUtHbVtlA1P61vze4gRTq
	CEE3q58AQ2dUuX9uX24p4sdjUVG8HjYnK25b80e+qlpqjIYL+ombY2F6NGakAR5WeKO8SD0NBdI
	H1BapNzknYvFA9ccHyvyY4NyCKd+wpq9ZSUqSNXmQlJo1v+9sK4aqT0SIFB9R
X-Gm-Gg: ASbGncvqhqLC9WOMdBD3EZZhEQRvKgjgzC1tF4NlnTjx+qRPw00PML4dl0HzOl1WJXs
	63pJbrxf988ztXL+oVBuT75CHsd7iF4WjjkZtFsM4oiBHajD1yPsCsKKnGw/UCj9lFRxVHAqmgO
	cEiRTsl/hg4DdKNV1lIu3eDyyZdZjSMti2UlHWqKcJ/l90mU84dQjvze6+GSF98MkBU+BkV5mGv
	IrtswtLV6G/opN4+gqvNpbLlEwHJ80ICR8QdIeeFmwVeGMDsiN08l2rq/ypX05T1iDc06XsIsh1
	in0VSc1jkGm8TUzmDz1UAiD/gVcGH5ItmJv9L56wT3oVV+H5EwjK4kUCJniX
X-Received: by 2002:a05:620a:4414:b0:7d4:277c:7116 with SMTP id af79cd13be357-7dcccbae331mr486938185a.51.1752160874101;
        Thu, 10 Jul 2025 08:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5eH9L7io++DOG6EoLD7uLEBnCEDCHEDGmoS7FTL8+M99Rr9LdDHR9Ug5tFrdjn3kFCzmWmg==
X-Received: by 2002:a05:620a:4414:b0:7d4:277c:7116 with SMTP id af79cd13be357-7dcccbae331mr486932985a.51.1752160873576;
        Thu, 10 Jul 2025 08:21:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:28 -0400
Subject: [PATCH 08/15] rtc: hym8563: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-8-33140bb2278e@redhat.com>
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
 bh=HosgLre4sOV32zuup5VY1mXTPGrX7i+9z9+0wka2BHE=;
 b=ub/cp96oaMsM4GvzWf+fAuWAKwOmG1F2KhV0jGfn1QS+ylEuMZ1/zZzX8TbakzDsX+uDxdWl5
 YBJs96EaePoDm7hbah3U9wXmseNz+pETLmzurmldCyeTiHswKmzq9vD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QRGnq3c4ZvcnZDK_F60q_0kj4wEv_HQfP7Ar284mKnc_1752160874
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
 drivers/rtc/rtc-hym8563.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 759dc2ad6e3b2ad57072b35a2642ec5bb78cd98c..7a170c0f97109f9a2bc08946845cb8bb5a377bd7 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -285,16 +285,21 @@ static unsigned long hym8563_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[ret];
 }
 
-static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int hym8563_clkout_determine_rate(struct clk_hw *hw,
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
 
 static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -363,7 +368,7 @@ static const struct clk_ops hym8563_clkout_ops = {
 	.unprepare = hym8563_clkout_unprepare,
 	.is_prepared = hym8563_clkout_is_prepared,
 	.recalc_rate = hym8563_clkout_recalc_rate,
-	.round_rate = hym8563_clkout_round_rate,
+	.determine_rate = hym8563_clkout_determine_rate,
 	.set_rate = hym8563_clkout_set_rate,
 };
 

-- 
2.50.0


