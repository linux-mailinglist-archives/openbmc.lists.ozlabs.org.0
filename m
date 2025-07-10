Return-Path: <openbmc+bounces-319-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD4B028DD
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBlc59vCz2xS0;
	Sat, 12 Jul 2025 12:06:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160898;
	cv=none; b=IOLaaSOX2o7rUjVHtkvnijnRtPbXmdZvmw12oTxbE6gFhijNf64llIxGJ4gTLY84PPuWGdN8K0MUV2WvjvBKsz/U72jUFhwooNn5/mcZcR5sYXEBM1Cp3xyXyS5PO/0a/rQIXy8Mrj1hp7TpL/6VkRxleIU2oTdm+7mP0czaq5hHFoHpLDw16lr/p53IXQPkqz9t1Y9jBORMyj872ukRNeCwK1oQzsvWsCxRL1wVtTxfCMfk4sMvSAPn5QGAvSlRXM9cD3qOn1g3xDi1lU2VAv/CvoW6cQKiKYsME/rEYzHqJQP6YStUA2VXPb3lu0f/w7JSY78TTa9QL6mWQ2JrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160898; c=relaxed/relaxed;
	bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=NxLWtyie6JGElVJfEjDdjdS+lkX6Lk/uFWSItZLXjGge1jlwg/03z07oek/6Mocx5DL+mvuEkM1sF7nvkuCvY6OaR/Hdn1HUpJ8crDsMssyaA/vqUeENHEsGEB+ynjt3SQ6/PRIst1VA0dfUWQOnag95jMQy2VvZVC9YhXZC8UiYXyLGzDYOrkE6baTpV2t+4LSfdQedys2AQXaSvyRDvn4Vfmyq3PUr5PQw+oN5362xvlTnUiyGFfsYTK3PLby4O7qb3qHakB1tm5dZ0kXzrebWp/Fe0QfEq+4NFDl1k5LhHHVfhOjosVEUa4L28ULp+GqTae7Ctdyehk1BI9zJug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvzmGx1r; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvzmGx1r; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvzmGx1r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvzmGx1r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTs3z8kz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
	b=HvzmGx1rf/kP8sgfI8FKIroURiqe4k6998B4903i9wqmgxJ4jsqjgMXZBgvkA12R24jn/4
	X7EN7HS3uwN2rMX0j1BNu7v6Q/CRfommcFTAnCpS6Wbzrhz69WBeUZ8HHxIUzZbU5z8i0Z
	BnfelOnVgvqYNuNhI0GLr6E3fcrMJqY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
	b=HvzmGx1rf/kP8sgfI8FKIroURiqe4k6998B4903i9wqmgxJ4jsqjgMXZBgvkA12R24jn/4
	X7EN7HS3uwN2rMX0j1BNu7v6Q/CRfommcFTAnCpS6Wbzrhz69WBeUZ8HHxIUzZbU5z8i0Z
	BnfelOnVgvqYNuNhI0GLr6E3fcrMJqY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-UN_2Kli9OQ6FMWzpzRqpmA-1; Thu, 10 Jul 2025 11:21:33 -0400
X-MC-Unique: UN_2Kli9OQ6FMWzpzRqpmA-1
X-Mimecast-MFC-AGG-ID: UN_2Kli9OQ6FMWzpzRqpmA_1752160893
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a7bba869dbso24559361cf.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160893; x=1752765693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dw2Z+Nvvv7e9dl6Tk8Gm4QoVSZGDUeLTWDCuXgyoEs=;
        b=AMO8jUPg6obXTlNm3kuGhdKJLhg0iP325uqRL8I4Smze/qsHI/ntuZh08Uol7W0EvW
         gRgQoFcc2o/Z6tool/Niq0IOFYlRjWi27GVkOBB1XWkcVEtD9YIp/0z/JjCpGjxvL93W
         FBecabbwaDMBEozLu8wMtmly3oX1L2AuWQyLROv3pIkJY5Jm1pB1ZQkGNJgg6h3ytrCm
         YxMEGvLbYWBT0cqI1SMh7y3OewWslasCYmvi1Ih3ug6/RVCKSNa1MqAA5cvrUCyCK6oD
         5+ZUBW2oaWsXEtmcdwzKjbFMVAUaIvdcCnXdU9jxA70FjI/9QfOf6qX+e18Lh3RXDa0V
         e/9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnbuCROTGMW3HcAibzDOzv2qj6iqOz8KRmKNpbJOPOb00fR844mbuop1hZ17VHzifRKwcvZ65C@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1Xs/3vGGtnUcbil6ZZN+gQqHPnJQ7eq4pmq67bImx0FEFGhmP
	zbqo5jVzxkO9BiQIFW+QXU4voLypD+hOYm+3CoeN4AqmBP5owXLGVc0D4xhKu0ixjWlDTxBBFJp
	9OipThZ2RCgnUOzf6JN2mYFa/dYN/xwke4bb86sJ4ilmSxlfIE5gRFCUOP3bn
X-Gm-Gg: ASbGncs8NPzoUNdcQ+Q12eDf1clQujiDQ9uBax6RMNZvzENSJfOKNSePvhOLcHMzxl/
	rvqdfaoVAPWYzGgnAloaj5o+ErLWzNcLsaYn9r77Y8DktU0pP+D2TNNouHPfzUYN0eUhByvzhQu
	gYzEkhnOL3MaUMHtEwXloD4Bu6WlFeUzNXKW99W/QqySJw7ZCEc6C9QLkv/Lj3u78YNABPQlhGi
	+YE8zW5xm7dznWh5gdULkZ54zctPmeCRlh2QpNiUOziRb/eITMFqY5vKETld1y2+Avu2nKWCmlX
	pMoHKaSCRXpxfcWXJZwZpRz5SppY7leB+szvpzvQfm6g9dkuksGkIYNQLFMw
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60788221cf.2.1752160892702;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEssxFzmy5DZaFLWrhwRKaLprHY91yPLmVxKn2VUF7H3TGYR0HmxKyVMLk0dM4mEtgHsRmiqw==
X-Received: by 2002:ac8:59c3:0:b0:4a5:9b9c:2d9f with SMTP id d75a77b69052e-4a9e92fb39bmr60787681cf.2.1752160892253;
        Thu, 10 Jul 2025 08:21:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:35 -0400
Subject: [PATCH 15/15] rtc: rv3032: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-15-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1946;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5ZVOk+ZOrENo582GUq8LCq+7YYXjCzCCpjXuZ1lV7ck=;
 b=DT4kedVd9JHLVr7GcGFwVFd+HuL+eV6cYmrDz6pnKaO4779AT/8pJh1xVZGoHYgcUbXEwBISq
 HkwA/DTaq7wAhW2EXESEGcFAJ+P+8vXhpwlHpiLGX//6sA6oikBaxHi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HNsUDqqJzRCaRFDA_r2cNYbnJ8gkng9eOzbuXHvkf6U_1752160893
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
 drivers/rtc/rtc-rv3032.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 2c6a8918acba50e57ed923db0834c7c4620ef2cd..b8376bd1d905be63afbcbc688825c0caff74a3b5 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -646,19 +646,24 @@ static unsigned long rv3032_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_xtal_rates[FIELD_GET(RV3032_CLKOUT2_FD_MSK, clkout)];
 }
 
-static long rv3032_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int rv3032_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	int i, hfd;
 
-	if (rate < RV3032_HFD_STEP)
+	if (req->rate < RV3032_HFD_STEP)
 		for (i = 0; i < ARRAY_SIZE(clkout_xtal_rates); i++)
-			if (clkout_xtal_rates[i] <= rate)
-				return clkout_xtal_rates[i];
+			if (clkout_xtal_rates[i] <= req->rate) {
+				req->rate = clkout_xtal_rates[i];
 
-	hfd = DIV_ROUND_CLOSEST(rate, RV3032_HFD_STEP);
+				return 0;
+			}
+
+	hfd = DIV_ROUND_CLOSEST(req->rate, RV3032_HFD_STEP);
 
-	return RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+	req->rate = RV3032_HFD_STEP * clamp(hfd, 0, 8192);
+
+	return 0;
 }
 
 static int rv3032_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -738,7 +743,7 @@ static const struct clk_ops rv3032_clkout_ops = {
 	.unprepare = rv3032_clkout_unprepare,
 	.is_prepared = rv3032_clkout_is_prepared,
 	.recalc_rate = rv3032_clkout_recalc_rate,
-	.round_rate = rv3032_clkout_round_rate,
+	.determine_rate = rv3032_clkout_determine_rate,
 	.set_rate = rv3032_clkout_set_rate,
 };
 

-- 
2.50.0


