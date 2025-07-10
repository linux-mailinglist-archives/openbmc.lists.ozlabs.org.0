Return-Path: <openbmc+bounces-331-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0CB028E9
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:09:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmh0j3vz3br5;
	Sat, 12 Jul 2025 12:07:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160866;
	cv=none; b=DMZzvZIjCkDNXUWlrskLt7N9P0TXnc0a9/64IFv7VxWq/Mit2XIV57vvFKOz07x6/GQfpe3KTPIizzsmr9z01NppDpu5dtaZ1un4K+GfOodirAxjFBLhf5uO4S5TctYxvd3GhKK8NE5RQU4oUX2xve3A3pNsQLIZmke5g4AL2D8AyAUsfiy+BndTsesrXYUKRxH2fZDIUdz8Cieclq4/s88MASYPQz6shVximw8dBVWWS3CsJwDB0PS/vbBcONOR8Dc0+M/dwBCUsysxFXU93bkHrsj64/zlgvZbhEPnbyDsh35Kk+pLNtMjit9j9fs8D/zGCalQ3DQfa8pPpmXFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160866; c=relaxed/relaxed;
	bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=POcL6A9e4L9w+HDHGNRgRrXNDK6oiBa2BDY4xts7lw2l248XZoVplTTASipff7ZpldhBLDGFe2qgtytWdiKAkDxAW4vYcB5BbSX16/KKlj1XNKCmyZQpdA/sIoPY2iENkbJ4bSuddjNA85g6ldoYLqUA0ZwENiLS50a45S7XRwY0EH0VKNvqDM2Qv/DjAmTFaRPM2BrtxTfSthVfXtgQa6djcXepiDonRPrdF9wrkYByu3gdrlLyj2Gaad2v3LXCkQG37tf/i88nDxTd2T7vt40YrB+T1HSCpadCxFOIFVOyG7XedpguUwf9l8LI3/Zounm/RZgiR6cXDbh0OZPh9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YMd2yIQ0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcCZZjRz; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YMd2yIQ0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CcCZZjRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTG0MdFz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
	b=YMd2yIQ0Fw6Q5kdEgkV8XWxJfrhPyUwiWVEgMzVgBK/IkNixBoq1Y4AOUOGpWcJnec26VX
	BRWJyJcFtarJLSctALPPGCQoRHblUX5+Zx3Qg8Z+BaGsMTHVDT40Vsb7fXyW5z7gyrP8nP
	UE2bgWJhTbY8fpmag7Ih6SnkEFnk8tw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
	b=CcCZZjRzCK7jZi7XZgF79U8+E1b779OfqFWbx+wQtbYGgQkMo4BmeSjZOD+Db/UdvUwWUA
	J6ohY+pD/xZmHoEAHRR7Eq7mXaEisE4SgzqtEXiEUji+ybFrlDGTZXzNF11z+VUCmgTFx3
	6bO94LQ+D+aVJiVNE9gpf9y56v6vq34=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-9BgzerVOPmOW88cv0YTiHQ-1; Thu, 10 Jul 2025 11:21:01 -0400
X-MC-Unique: 9BgzerVOPmOW88cv0YTiHQ-1
X-Mimecast-MFC-AGG-ID: 9BgzerVOPmOW88cv0YTiHQ_1752160861
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a585dc5f6aso22976301cf.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160861; x=1752765661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
        b=tbcJnDI52d/fG7c8y5bw2IzDtuKCvD5s/2FZfPuxYLpunvMBX1XU1cuVglSk3fwFf+
         vUTfzDTRAGV4cSrycwk50zQ25J3F7DlSKJWcPJ2GV1Zj3v105EPpo/541SXGpFDr0SG8
         E/mxle/sWGjekRU7NrN2Ta/DA+QKdqHGemErDoHExsmum/JNuOFUy5yxLwlOv5xqgqkh
         0CYzAbwUFtiPBLkuEjDAUJjFiIp5kd8nHZc6jrr5vburJNxzMLILYfEI9IKoOvagTqTc
         zNV5L0OrX7hvB9StrR1+EFQyvCQBQWqk1zxgHzHam4JE6tTh9LcVQAQgvg9bQeTrrod3
         am5g==
X-Forwarded-Encrypted: i=1; AJvYcCVW8lGecLRykV5C2HMoFuHvbfmxZXHXpl2/l9akyoGVcZISfzReYBC6Tdzp3ViPduPv9YHUs++O@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFnR2YvoWLOXLctWbpEg7uufxslOHMRLDbPv+46NrLDYtpkGlg
	lsuhldLCDkD+BU40j5b+j0Emesl02i8GHGWC1ZHtxfOUSnC0K1KtdbDT11nqAZ16x6IVcDGAGbm
	Q1LpBIbjbbPgzMtYO2ys4gzzicqkS+7MqOQptGXp1ocHPw5JtkwgaoSd5P7RR
X-Gm-Gg: ASbGncs/OKihIOOa/pjp1MwPZv8qG7fSK4u0EBOOAXODrsj3Zwd6Hi8jPUZTsQRFHpv
	9/ONSFutOSpiUWepTXxtiS3sJwfzH8iQR9FG9iuYguz00mkN1gmMcGdYP0Tu6B322LSHL4d0rRO
	VaVTQGkKVo3T7cPZ4TF2oTcHw1oj8SUzbF12MtZFkLssCAA96OLFbL6MS1p35oqYVjAFO6M+HNg
	1lIoJ2iev+u/4cToj7oB2XC8u8MlToDFNZsu7tY32tkkPj8dBWAtMMSLO9wa15HQL2VHQK+dBqw
	LmFoWAP8Szwbb96t/ZQXvbarYTQeuF5Gjcjj3v3w8leUAcEkEkmCoFBpymg7
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54126371cf.39.1752160860725;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZg7tT2TKkLa812dOO0cuVbNuTqTsuTm9YCrDOkt67pP9zNi/06aVHc55G542WY91jCJtYaQ==
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54125881cf.39.1752160860286;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:59 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:23 -0400
Subject: [PATCH 03/15] rtc: nct3018y: fix incorrect maximum clock rate
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
Message-Id: <20250710-rtc-clk-round-rate-v1-3-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1069;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5dhSXbabSOIot1EwSUx0tN+/kwz+r3qTKvgei/0M1C0=;
 b=Z+eHnE3yFv9Mc/2pw97GUAxK2h0eRAwimIQZHOw0PqyzYENQDmyX8/9qqzMvrvfVYCneaOqS6
 wbDceofTElTBQ1umKhp9Jwiwd5C7UTuyCYdg3bAtiY4LJ8MkwhDIFRV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qnb2ADb3zIFagTDk6kfsjAEJrj6LOjkvQTZPkDEew1Y_1752160861
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When nct3018y_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 5adbaed16cc63 ("rtc: Add NCT3018Y real time clock driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-nct3018y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 76c5f464b2daeb59fa8367bff3ad261ed75dd937..cea05fca0bccddc6384c462cf1ebdc59b377a24d 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -376,7 +376,7 @@ static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


