Return-Path: <openbmc+bounces-333-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4341B028EB
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:09:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmr33PQz3brv;
	Sat, 12 Jul 2025 12:07:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160860;
	cv=none; b=hTppT5vf/9pM0AbjFYbg3m4xMXrjpI4fo+DsD/ezJwHI/dCjxqFL1o1Q990/YPAwelshPGSXQ+6apYTkR9741m/jkyyFn46A6iqiUMCl/LWOasNckakvo3DBVEyaHfFCtsHUaLIDxBYtD1pYVPa75/iZt+N9n8CjMS9j81vgg0ZHEDXmCB6MvikXd9S6wckYy6St2ElRFz1iDhT1ypMXiUARKTfcBr8mQeSVypIhgdftB+jQEXxCqLd/p793+PZ09ARwQ5AAH56x9XsgHJi07Xq3/oSosTTSf+kVOJ/etq+P4LJ31aKClfJTRe87kV/h98OGInRW6D4RCgPPduIWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160860; c=relaxed/relaxed;
	bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=YlBa3Ar82zYnDGd5TmSzJfQHtPV27IDZ8CganvzpJndjJoEEl5dKD9jK/lhmWODwkB2FDmL9Ey5RrK8RD8cIfMOeQ0ndDBb4ZWDxolCx33F8B/1CT3y5MmUMODHivq2vJXMC2Dg+jeEbjmt8M+7iIUkYVfF2DYk5joxHgvfCizz5JOp6LhrrhMFi9O8/IedaJ0NV/vMcF96AITEjBB9Qn426RO4qqLzfCU3JPSvpxC6Q9sU6UqwAsiuXPw4/7uIwEGWmPopOVgmvcJeiTYm8795Cjscq7NvOJBzGD8A1Ve29npagzS+trcwcSQmp+vjqNQ+7Cxm8KNQYbPMsNobA7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YNRkH1e/; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YNRkH1e/; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YNRkH1e/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YNRkH1e/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJT81XStz30Vb
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:20:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
	b=YNRkH1e/hekPqIPvpxj4vvOasJUc82LQ95oXqhGfBY1jwT/EJFHruWD0LwserkvTO35ewb
	JNyNcYFnCHLL7EGej305IdcZItJSX3nPaRizmtrpF6b455cLEgD+LlKkOcwsl9547DwamB
	G8OFEnD05v7hHJkd/DEbWYwcJuUd6mo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
	b=YNRkH1e/hekPqIPvpxj4vvOasJUc82LQ95oXqhGfBY1jwT/EJFHruWD0LwserkvTO35ewb
	JNyNcYFnCHLL7EGej305IdcZItJSX3nPaRizmtrpF6b455cLEgD+LlKkOcwsl9547DwamB
	G8OFEnD05v7hHJkd/DEbWYwcJuUd6mo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-0r-dmV5ZOTec_E6uEouqqg-1; Thu, 10 Jul 2025 11:20:55 -0400
X-MC-Unique: 0r-dmV5ZOTec_E6uEouqqg-1
X-Mimecast-MFC-AGG-ID: 0r-dmV5ZOTec_E6uEouqqg_1752160855
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a44c8e11efso30445491cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160855; x=1752765655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
        b=ulk93LMQy3lhHz1e70zdx3vPEoIW5BAei+p0yORWQgua02hAb21fs/S/EtFsQKd6Yr
         61o01Poo46pVs0Twgk/CiuWYz1OQPcUi3jyRDlNqfJ9ya43sNWzhrHDWXG4S3uHDaLMS
         P+Zr826ESd0zkC3Hyr3OMceY1CTTP4kirbtq5TgVtoEfjq1Dg80qlazWvgV3XhPEvPxr
         ZY+PSE2HD6hIWV60NbnmTnf9ppE0gCID9brp/5A/VZ4dnHjQljb2l2htVDFsMUv2oRW3
         I4l+ogaclQH2r/GLuHsAe7BsISmZtINzclbqOTQphemQ7vigyo0gcc9GBAthHXt74vi8
         +lbA==
X-Forwarded-Encrypted: i=1; AJvYcCWCKUtYTfV487fNegZNyUg3ekjg3nw4/i94HKKvpcZ7TGC7r3NL46FBRxqI0J74VFl0dnasxLqG@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBWbF8mwe8eKypQQuBLh5ze6oxybCTlB+91I7MmpfamHQpnk7j
	WLkBLfvRNno5UistlZhAL7Hc+bocjCCw20eOEYyybIdDBdMpa+6sqjXY3oF4uJRUkUML2DClbDL
	QQuc8Q4tcCYwnIANUsSQtdJfneuqUCcNUFdR5axrjINoCDScoPSvpDVFBCqHP
X-Gm-Gg: ASbGncvSxtkT1+vTvqnSSiion4CnpnHjGeSZq9jvbQztfs+uzbThP3Rz08v0wOJhpOH
	7kYo9yNwu7Zk07QSYSfhthOi5yNypADiKfZFef/6HvnN485+d5Fq/sPuuM/SheZI+igiSV7zg74
	4GL7VtldSR9OLDRB/F/XyYYNKobseSbGxBR1X36d2I3nl7rDpHY0d002/K7xFyDbs6mIF3RlUaT
	mITXxWx0byJS60jkWLY2aG+ei3CeAByHX2us4LjfUnVmcWgZdha/rxPCuMX8an22flRQkLSkr2F
	dwwkxsF1xN6+UQ/oI7VfmnJnxLJdr4pnGHeyRo/oTUt8hbzrE04+jSB8XR3z
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392711cf.29.1752160854896;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDLcNv2lDHhPRuPa3PBLGRvRknazi0MkGkMJ3jjn/hzszBgqiL8MPXlo3Ug0921v1/TzKKEQ==
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392181cf.29.1752160854435;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:21 -0400
Subject: [PATCH 01/15] rtc: ds1307: fix incorrect maximum clock rate
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
Message-Id: <20250710-rtc-clk-round-rate-v1-1-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1091;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=wnFIaXx40Vz/ClvnEh6f8bTkAdbeJwxG+N4rRNHdiSk=;
 b=+A8YUXgylGkUHOwIsLqyv4get20Ku0mnYqFwH3tYHrj3MlQDQaPOSNxpmXm2HBwGJcu7rJVBN
 2qwZqI6Hq0xA8ZZ0bQnzaWsxGGatsZPg2KaA+vl4sQUtpFK6xQIbwo6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZbEWRYyAsjofi3wP_GuycmdscLjwlaftz81QrvD9g70_1752160855
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When ds3231_clk_sqw_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 6c6ff145b3346 ("rtc: ds1307: add clock provider support for DS3231")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5efbe69bf5ca8cbc2a325cf2797afcd14f3760bf..c8a666de9cbe9163ab7e112b01b99d97c94970d3 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1466,7 +1466,7 @@ static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
 			return ds3231_clk_sqw_rates[i];
 	}
 
-	return 0;
+	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


