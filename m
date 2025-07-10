Return-Path: <openbmc+bounces-330-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67855B028E8
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmg5M5Kz3bqQ;
	Sat, 12 Jul 2025 12:07:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160869;
	cv=none; b=YEjowZ8BXo/0uBmhqkKHlkQxFJeEO0Y+JPpYdwVU+FQe16AWImSO9nRkC//1uk0QZmUGYLBhhbiVrfy2wYPO8b9cOmO9P0LVSXH3PG9xPsWG49IAJ9f6VU5wJu3lW16+xB2ZYEySfh1tNdu39GI5zddBD10sqlyVajME50i1UL8YIdWwnSxKoxnNoidrGE88EEpc/r33Lx8RIpiirPo2M6flZCgVlHOiHLA+afHDaWwkAW92cYJ0Ubwx/CngQGNn3DWgnoGBtz5JZBmZL+Y203yFIwdhmebNCcb1uU4pQRAX13oj54Z6uPZNehsrvC7gZXasE2JKwM8g++rm8T6mkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160869; c=relaxed/relaxed;
	bh=yG5bkOzZUY+xOdQihr3txHpC6oZgJ7hI28ABbFz0yUw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=MonCr6DMiuwPphK/N1pH5+r1H6A8+15Q6VVaBsb4t2KgCz8omconi9yioie/A9ZbQwjBL7gmPBJze3CWZ6xkLrw1bhLpk8KZm/yD94E66IZrRTdgCUCtwuRD03xj6skn4JCC73JgVp1ZvlIGIi99WjV2UBYSdxHAvdkaWyBXRlfX+Bzu+TSsOf5YcSt1zmsqv60cZWlUzyU0+b/E/IlhOhVGFdm3Ak0SFhACTmSU7VMdTDYvimq4Hvgr3zNHQ+V1u2Mp9LEltGRH5gM5EczSG+YwGcqp/0L6z6nbk7EyULNkNoLbCwEVi7wVPBCThH0fpwvIDpH6SxWwyjx+C9ljFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FcWTmnFA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NoQ4vxMG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FcWTmnFA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NoQ4vxMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTJ2qdsz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yG5bkOzZUY+xOdQihr3txHpC6oZgJ7hI28ABbFz0yUw=;
	b=FcWTmnFAJ8STy39JdiQE1NSGSvY8kEyRWGjubB/ywxnOL6UWeyVw13SgcF95GCrwxi/425
	/CaJJahgsasALKrmfR2/BPz5M/YGlt6qjfrkQi80Nc5P9KKvYBi2UOG0EMAFNi91wfl0+w
	luHDPx1MbAkBQXb0MoBhx+WPIsxejtY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yG5bkOzZUY+xOdQihr3txHpC6oZgJ7hI28ABbFz0yUw=;
	b=NoQ4vxMGtpbwYud5EOl31P9/2SIKc4jFRBRZASZl0lDLvVwCN8dpZMZP6Ck6ubk8bnfI2O
	sa7QO4K6y8hgJ182QWAbKhsLS1NqVs4Wfaej9U7ibzLytw7g/UVre6DJfqkBB7mxGYNBvz
	Dp0Zf3n78a+4Ay2uOnBwn1Ef4SsE6vs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-OIxGhdxmNt6wZEfU_g7wHA-1; Thu, 10 Jul 2025 11:21:04 -0400
X-MC-Unique: OIxGhdxmNt6wZEfU_g7wHA-1
X-Mimecast-MFC-AGG-ID: OIxGhdxmNt6wZEfU_g7wHA_1752160864
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9783eabc0so21369301cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160864; x=1752765664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yG5bkOzZUY+xOdQihr3txHpC6oZgJ7hI28ABbFz0yUw=;
        b=udmSlyyUdGBsAvKkZxs++txwQSXiU4X7Fq5oNVXJkzKb3KjFJKvYQ+vbDUepw7bKjb
         lIj5nKnkobTqq55mJW9nEWRVZc07jVJyKrsliYX0C9s0ydmz4OhSRN92xLFbP9Q1JgR0
         wPsxTO1siceA5/tS0p410q5LjjHaVqD9Ty0XKs24cFFnQzeVzyvDXAFuk4LaNhUBeotA
         fw2GtwaWGu+1Vh2d4G+VM+tsDfqcACg683TsPU6jMC+N0Tk2rix/ZW3AmXWQBcFVVc/n
         cGoBNqQy1U/fbTDC/1oSXFN4I2dhi6hh1gZbBd7w8bBylpJ0YT+IDz2KQVHsl1ngjY1N
         DeXA==
X-Forwarded-Encrypted: i=1; AJvYcCWWuvIwfPocK/GX2sxvy/MIGnTWL8BW3mu8W7lcEc6+oXLgPOT0+WFO+bIjsmyDkcWDiiVZhmmu@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFhjHKJed88QMacum2x7hwTewCQNFhVCBZ21CCP7O4ufCWWwpl
	2tW5HUfQkbgBAt55XIsTF/vZhyUnQGWNg4QcHU3bo3hMPQb/3c2c6sF9arMr7ie3dtBIrAvpgRJ
	SetlSbzV6S9p0jSeQLCZ4rk44wO9G9Kh7zQo7gfeQA6eL7eE1qDo09XjSmZZs
X-Gm-Gg: ASbGnct4INK2AW/ghyULma6ibK8AYtBdQr3KFuR0AMCElw87IcyF6LA0U2ePDpMOk8S
	683Yt69VRGlal3k4pMccHFn49X3E+LAVzp9OVtBONEEGqReGKfWGW4y4sh5iV9LCa76tqpiO2F7
	avaQtqC7+BzL01RPnh5PZGb+fkBtsJBrnKhQCQ4r4hM4/wLSGc0BhciqKeOg9A6Nxdn47vGImoa
	ds/JmN/E0W49Brfy8LKfngHOWUk1cK69owiRbssSxrY9vtsStvFlNVl2MhVaNcbKiD/FL/oAuEC
	pqtSuzOJTt+zMCheYzl7bzG/xqN0VRco8ohSHBBbIKQN5SZz8H8+uBizBT+3
X-Received: by 2002:ac8:5fc4:0:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4a9f80b01e5mr13972421cf.36.1752160863654;
        Thu, 10 Jul 2025 08:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbBjxTN72GrQJfmGHmh5GutnlL3Jy0awPkDx/UBr/xC/UFSavAHZjx8i1a7+m6MXPSWw2yHQ==
X-Received: by 2002:ac8:5fc4:0:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4a9f80b01e5mr13971891cf.36.1752160863202;
        Thu, 10 Jul 2025 08:21:03 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:24 -0400
Subject: [PATCH 04/15] rtc: pcf85063: fix incorrect maximum clock rate
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
Message-Id: <20250710-rtc-clk-round-rate-v1-4-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1097;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=nWaA+HGMB/hr+CPDhX2qLiaYTUyyKgsFz2YzXzkX8VM=;
 b=Lc/rH1BiGcSbq2l1trnogE3RK5bqbOllXcvhH/uU8m1h7QmCtOaFdEaqj+3itCdqF+FJ+ZtvD
 IuHO8XuPF2bBnY19Dh4DVmMOl8w+cCTosu7fjfV3J5ukBMCZo79gcY0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -8pGBmtMJJp7rTFW7874l7t07LI9RXY-kzlh_iKfTY4_1752160864
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When pcf85063_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 8c229ab6048b7 ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf85063.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 4fa5c4ecdd5a340e6048b0d7d1d9590cff41e8fb..b26c9bfad5d9296ca8d2be3b5ecb04c19ac97191 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -410,7 +410,7 @@ static long pcf85063_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int pcf85063_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


