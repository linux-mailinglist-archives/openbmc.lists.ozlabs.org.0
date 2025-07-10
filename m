Return-Path: <openbmc+bounces-320-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFBB028DE
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBlh46m1z30WT;
	Sat, 12 Jul 2025 12:06:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160895;
	cv=none; b=daIYY74XVBWjT8DUV4D01xnF3uwOgKilYDZXEnfXmnecLQNlqxL/sSWt0+LISq1lyzSGc3Klu1/ggcV6FH+UkHsZGoFiFUNqNbsQTXT+VQTfV7lAmA+FLWXbFMkXJyHsb43D3bLSFKJEkE5ObfXdwWDGQsljFiD3OpJRbdAQUKf7IBC5sY5pkSWnx0nvSxaK3Wc40SpLY8vnqnb4FqI3Y/TbHtmnx7I6ar4ahQUeE1HSpkxJCQ7/WaxPOncda7qBMmu/s5pAOJyjZwbU+jzEgRbpzYE2OOlVcEFygD2Mk+DF+1gXifAQI0+euNc6HhJIS8fI3ecjHUjzSj1MOaRbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160895; c=relaxed/relaxed;
	bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=G25RY1+fj5+EgKlkEoMwJwypXhCbLugwdB2dbhw6ihhfFyAO0dLqOmuBzjtb8a9fUIVaOMw4YopJFvcLxxbfT4nP0t0CIxc1GTTfs1cHfsvoieMMf5w3mHKiUNIJSqgA1CCWeoEmHYJuKcz0WxPPIqN/QcCmcboLxaSvhKEsyMt9XntZhQhoRvdGF39Wndmb7whiEGhJrs+wAdoPPRabzuRP5YKBXP6Nt+0AeBeJMT0v0nlpyeP3ciUTocUtrRv6AKQVUj0K+XxS4DqV7Y3I0laVIEHZsVUPj0nhF362bjGn3bMCgIFWNrqlIRVnJFnEwKzXfI7zhp+uZylXuZWDjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNYuRFz9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNYuRFz9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNYuRFz9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNYuRFz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTp4lCxz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
	b=KNYuRFz9L60ub8CSLFwHUu3vpsezmpyNnheTpJAVZphV/8PBS7Bna55TwXWvy7skuXmIYN
	hsm6+l9mrYsdcp/HSc5wSh5lDiyC6x/Gc5BHNK+6gpxZtuZUMB9JjBjNTD5GhDErvwRAjz
	NpDyQeXGAmrd1M7HkJb/cazO0U868tk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
	b=KNYuRFz9L60ub8CSLFwHUu3vpsezmpyNnheTpJAVZphV/8PBS7Bna55TwXWvy7skuXmIYN
	hsm6+l9mrYsdcp/HSc5wSh5lDiyC6x/Gc5BHNK+6gpxZtuZUMB9JjBjNTD5GhDErvwRAjz
	NpDyQeXGAmrd1M7HkJb/cazO0U868tk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-T-G_tIxLNt2Sf-eQLTXePg-1; Thu, 10 Jul 2025 11:21:30 -0400
X-MC-Unique: T-G_tIxLNt2Sf-eQLTXePg-1
X-Mimecast-MFC-AGG-ID: T-G_tIxLNt2Sf-eQLTXePg_1752160890
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a42d650185so14305211cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160890; x=1752765690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM4qis1G6x/IJ9CWKOJFCIPRe8ZKC/8LK84o4mYpD5Q=;
        b=v0Lu32bWlskwAqVb5VcSPubxpn8mMxJb3oWz46brVvish9zRnkk3ZE6RUf13A4v/fz
         BA49KsefLa/E8TawFERukB9ufJYk1ahVOMczBnqsM3MBQTrPlEVKDpCv9jkSU3dsFXHu
         5efXImoHLCj0so7pHPIhKbWoRPqR7AOYAoy4XD2rErH2pwManrf3lJnvd+Rr9PL+VDjV
         crkbno5Ggbnsq2e0In+/z69JfyLavDbrFO/8HcnjTohUVpIMOKHZlvd7XF/9i2Fby07C
         8HOrhPqYVBuiiZ4rrl8Vns7CMKArTXUdIfwgsGJk8kzXiql7tCLtSgJ5QaUSxlqPpOqG
         eL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXiZOKgyKN/xGiUGv1RzO2NZI4yfG83cLDPj9sOyag6rcHNTIZKa6Aj7w/msWUX4TsKpBq+Es+J@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlB7Az4ZfWJhOZgVZqkMomSp+F0kR/NtGSDzzX08qWsGNJyTRn
	Z1ia+BUM4JibZCPhkBcWMghceXqXHqKk7VntyQsgcBBOJKGFmImQYaYv5g8H7Zkwrq/UO4zqklv
	QMf7fJxcMqZTWWJ6PpcuMfsNzklPxCBm/Qg2xXe/PXhJ5QvN08m9W3FTbfmjQ
X-Gm-Gg: ASbGncuIgXfHt6I6urSMaM6juHs/gnXDdtMMo8BKA9FDbiTFjw/i/Oie+18mkIXqCx+
	h3RX9rMQ71rA4Wrgmd6EfSrKbmfPn1DUVWrgycBRThzxX/cOcMGYfW0vIsuc7Bm5om/82x8KmNA
	fY9YVtvvvLOZInD3Fw880TJrXIYPtyLFJmyxln+yjU4vGHkbyvFyLF5HXWR8TqPfW4mkizPghz7
	4msnUb9zfY0YVhtJVfn2dZcUcIZoim+pyBeSnGoK9+AJ6new7O+PkjOhKal4TmtCl1yETtphkb8
	hs5DpQC3A8RqfGwwmO3LDihYJDrAp+9IQsqL7Z3Pvquyx04T/rY5GJukvaBn
X-Received: by 2002:a05:622a:578e:b0:4a5:afa8:b3f with SMTP id d75a77b69052e-4a9ec71135fmr53584691cf.3.1752160890227;
        Thu, 10 Jul 2025 08:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELn9Yyxrnbnbzv+8WIZ291jXoQKfvhFR4df1+Ujd1Pr0EttvM1cwH6sXYLpUMcViqOsgHoPg==
X-Received: by 2002:a05:622a:578e:b0:4a5:afa8:b3f with SMTP id d75a77b69052e-4a9ec71135fmr53584041cf.3.1752160889737;
        Thu, 10 Jul 2025 08:21:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:34 -0400
Subject: [PATCH 14/15] rtc: rv3028: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-14-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1645;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1K6+kw78MFrCZuqcS+uDVaMjkGSwFqJNnx34G76ScJw=;
 b=SGK3029kP4/euTyn5/BgsABWH/oduagDLrCnI0mn6/tcnTK4jthZhARW1z/WusOrcyzA0u+qN
 OAx2xRUZGWcBPB//y/aWqeri4puyAzBmXlLt3nrF5Xeb60q8feOxkwU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rNS44KMfhdKxFz3TT4YWeoN1Wuzoupbr2IhrM4gybik_1752160890
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
 drivers/rtc/rtc-rv3028.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 278841c2e47edfefd339f04bf5193f6970ba0c65..c2a531f0e125be7514fb3ad2b11fdb670fb47a16 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -731,16 +731,21 @@ static unsigned long rv3028_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[clkout];
 }
 
-static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int rv3028_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
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
 
 static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -802,7 +807,7 @@ static const struct clk_ops rv3028_clkout_ops = {
 	.unprepare = rv3028_clkout_unprepare,
 	.is_prepared = rv3028_clkout_is_prepared,
 	.recalc_rate = rv3028_clkout_recalc_rate,
-	.round_rate = rv3028_clkout_round_rate,
+	.determine_rate = rv3028_clkout_determine_rate,
 	.set_rate = rv3028_clkout_set_rate,
 };
 

-- 
2.50.0


