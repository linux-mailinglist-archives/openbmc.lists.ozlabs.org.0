Return-Path: <openbmc+bounces-332-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B2B028EA
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBml0FSgz3bh0;
	Sat, 12 Jul 2025 12:07:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160864;
	cv=none; b=fX7QKm7u+Uo35fMySnQuaz5uc1ikyfv52KvhCER6rgri1y4xMKjp4LMwrCsoaXuwj3udUDs1DDJMX0Qn1y8IwDsot23LC1JMov48XOkmK9Zn21NSsbjqQRU1hpSq6CfMLULpQJ3lOHS5yzI+8Hl/BhQf5m/kCv0Z834haVkkd9b/rAapg6F3CJbm8BRddgZzgxcQA5/PphvMMX72IffH3EiVl2QYswGaorndfTcpByQTfRlKHkhZBsZlSz+jzuzjnPteEd/gDOE58ZdyHCkAi6fPvp8AnBVWPlCfZV3D9e8P9Qprfdf5iDa/B91qiIyVc0A1sSdPEfc7z6qOV7ihcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160864; c=relaxed/relaxed;
	bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=C6GTzJf/80I4Zp+u0/qecD9l97wpEFJkaWYjYtbeQzSZbbbzTk7//pa2WsWujG3H7+CeGjrSJhNxJodrP1PExKYJzDsbl9rpwyJW81NeD+KJ13lNqJWbT3hfSO5N6kgFGAK2LaV4E1P9U+8rQC0E26s4XARLAB1qnHlIybKbbih4L5PXS3MKNraWDPj8WDqp4ZAqZMwZAtI0h5EOo+a6O/dJ+SNcjWxVyDzNGXfLU3OXTjkgAblxiQs/YTbz0C7r5FRz/Gqku9g9zXQYXSo56QIN5VM7KJxfuOWn5HCQKqcw+YDrupAf2d0VyFecmVy/J0Ndu1hlwHC6Px+xvCo3Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ErFohjFP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ErFohjFP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ErFohjFP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ErFohjFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTC2nFmz30Vb
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
	b=ErFohjFPWnyorsnHMckUDR6QU0dN73Vd4f/869Xp74xNm8VQwKPadv80mfqu3Ynj4vt581
	nN2s+o3HyeLda/QvESSdvnOxyKP8r0S10fhqq4sZ8UL4QUHpMPdtSqb1TGL1Yc4JhvgpwA
	a6IJ+tVwq+IO4fJNWSFKsEpEoTno92I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
	b=ErFohjFPWnyorsnHMckUDR6QU0dN73Vd4f/869Xp74xNm8VQwKPadv80mfqu3Ynj4vt581
	nN2s+o3HyeLda/QvESSdvnOxyKP8r0S10fhqq4sZ8UL4QUHpMPdtSqb1TGL1Yc4JhvgpwA
	a6IJ+tVwq+IO4fJNWSFKsEpEoTno92I=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108--oE5Se7jObW814xt_3Ki-w-1; Thu, 10 Jul 2025 11:20:58 -0400
X-MC-Unique: -oE5Se7jObW814xt_3Ki-w-1
X-Mimecast-MFC-AGG-ID: -oE5Se7jObW814xt_3Ki-w_1752160858
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a441a769c7so19303091cf.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160858; x=1752765658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aZ7iow2nlSmHO3Sa6zhsOQGqzvxbDdCc1+cSeaMIJY=;
        b=wu+qB2yZj7eDEVYlh6970cJkLc3jOw9u4N3IKXvP2x7syZJ+28K1lCn65aJfKumkSm
         b5HDSBCTmNdPv/OA9tP8hAtsCjQFmWCiXK/+Jz9zC1b52k0dzujQEMAcUDayu2PV9c+a
         he0BkxN3soryqkg07IBwtlyTnHdbK3qj08Z3qaGjBCQrqMROvyhPiAs/b3sjJhCEHBQ2
         NBMEPz5ljzHxvleMZX/WpLGkEjomiBZBB0gsJ3iBMAUNn49F8JbfFqDRxGFR1KPtmuZj
         bLcqlKOhie77S/l/cNcDeRDEATDm2QOTNAFLuXgGv1LFwY7ZW5DNKSXT24uvO1fyQRK1
         O97A==
X-Forwarded-Encrypted: i=1; AJvYcCWOXZm61f594fp0ZYU71hGctDIgueCGTarq6ITVzTmFMgJtFvLcKue9qRi6sooPubVZVoQIvByb@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz19wuRVGrfXmgzq7irE5k7vhdehhW5/cZ/LuDf/FnNmjfCbHaa
	ilPuKL2t/0d8cn7y1+JbTz6eLlEMKYhlRcsIf6wJwmgvHRLg4o/Y9m0EiiaWAkjq9VwoCIbLV5E
	VkDs5fkifJtvImIFsqVJPSA461FWNknINUgfrsCCtVb4N9bxjEdShCKuZ0SaB
X-Gm-Gg: ASbGncvAVirOItXg0DT9r2NUvDmMq5i0odHvZKfeILKFsvm/TuXxzCAncre1pTh5odr
	Sk3kQWAydHCVelxINstyjcDr0ewuNxjFhK5EVVybrfcuDdOWtDanaakk7nn+5Hzn0BJJ4w6abDF
	SK57JHunAb4v39N9w8Ar9O0rLrfsHgK3yH978V2hDer0nOdGk34ECfcKsNCzhufDZLKJVUE1QVU
	01CJfPL99z7jYfY4kmMODlWIwT6OI8+FEosROs9k22YCM5SdMEtUtpbfmKVUg9XzUy0tqvVM+Yg
	JiN5HKqZqJjDN7yj7QLb/bzTT3T10CqCDj9MfvTSgts5Y20NsDlCh413MuIA
X-Received: by 2002:ac8:5a83:0:b0:4a7:9d00:770 with SMTP id d75a77b69052e-4a9dec57aa9mr107799021cf.18.1752160857796;
        Thu, 10 Jul 2025 08:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW1Y/+ZghE0XOiqPvb5+bbhr0BhriZx2/H84nr6c5hQpG4IkOaOonwxFNS6q9oehgxfat3nw==
X-Received: by 2002:ac8:5a83:0:b0:4a7:9d00:770 with SMTP id d75a77b69052e-4a9dec57aa9mr107798321cf.18.1752160857249;
        Thu, 10 Jul 2025 08:20:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:22 -0400
Subject: [PATCH 02/15] rtc: hym8563: fix incorrect maximum clock rate
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
Message-Id: <20250710-rtc-clk-round-rate-v1-2-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1048;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=oTegq5tfB2V7DcSOZNV9XX2rhgoU7Wa+qoYDD3MtOpY=;
 b=g2MQCAAnSehCZ9tjenRcNXWBC1pOM+MFKKZ0kDoelFsePnd5wSPzRosgQPIlyhLjYj1+jskfi
 fLHbu93SQr/A3IjwrnMB769Q5Odb2T9TMdLRnSLSgnjgIWwtway/qbM
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SfwiMRHkbC1W91fVssg8ruH7-z1nc47Ij2ZzQXqec4I_1752160858
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When hym8563_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: dcaf038493525 ("rtc: add hym8563 rtc-driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-hym8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 63f11ea3589d6439ac0ee7f6ee4ab70e2a52bff4..759dc2ad6e3b2ad57072b35a2642ec5bb78cd98c 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -294,7 +294,7 @@ static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


