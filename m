Return-Path: <openbmc+bounces-328-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C913B028E6
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmP4FRLz30gC;
	Sat, 12 Jul 2025 12:07:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160873;
	cv=none; b=YxFkkMwofO1o2g60LyJE5Mvlpfi/tCEd5BMhdEJak6gjboWXZUoBn8kN5wtmwvpBpduJnCNS0lFzo/L8D71oDlFHIRPhQkGB99Hnpbawf7lSqH8TjN1z+d0q/ktC048Xt9FD4Xl+fw2oR1myXr3ox/NAFzAog+Qksza9Gix5hJcmweNLESnkE76xq3PSRWeghvH8h4mg+iEyCFd6PY3CfZvVKu/+OEA25OaSfJgdloJ+nkR9Cug6cM/iUYq2RF8zYnz0GoeYpMnynbEzoB55uxY45YVS24LODkjsLmwR6tnbYDJSpO+PPRf+gz711SIYkhxB42rtfNLSjvUIWic/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160873; c=relaxed/relaxed;
	bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=ArZkDgOZkBnNQ/V2/IRofqIsQajOPDOCGbuGdAvUel2P5T9nm7I3Lux9cS9DS7MWa0zQRYvwTrEGiFtLkRwGpwRrXMF2J4T+cnvcwd9mNC0Um6sVOIf3+O1iKxPzpblWN2Y+A48NfDfB5XcPg7XgutmGhNnD/CN8qBpSnCuVnWAyTRv3a+kBavu0eK907JOAEsGBSEekmq1s+0oT/ciWh3emC45vd1WbcHaJYINsM7E+P/YS1OhXcu/GF59GUXizp8UXSoyImky+MmY4ll1kvBK5JnffVl/aDhR2UE99zKrdjlOBGkI7EkXmueqz8kgim82Hhoi+SKjrr6jINYCKbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iK+1TXej; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OsR4exhg; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iK+1TXej;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OsR4exhg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTP2Mmmz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
	b=iK+1TXejIWMMEsCwUtM4YYc+CqSZh7IfLxrcsuoOnnupsXKtlhYehso3FnHWrm/i548Pou
	r1YGwzhAGcrN830cdItmcupd1hzqaLJBX1LRB/XHKYILV2KVaq5sOaD/+v6JhlgsyAA2OI
	uYNnB7nM6nE4pvGJoipvXXR3zVYeP3k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
	b=OsR4exhgTnVq3VC69wQn+eztYZHBvFsaIYSZa/Qhb+x41wsCdK+zvpg1C6PxmDjjx+MveF
	3wVAso1QSYzQVZkkECqwMHGkA/CE68SQE6K/fKz5aCaNS5qoX0MyhcUsj6d2Qn0g0wMKos
	WjuYx1zJ6y5pumzI8UlZVKqgueNa9wQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-yUpCClgGOQOFup-SjufLKw-1; Thu, 10 Jul 2025 11:21:09 -0400
X-MC-Unique: yUpCClgGOQOFup-SjufLKw-1
X-Mimecast-MFC-AGG-ID: yUpCClgGOQOFup-SjufLKw_1752160869
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a77e31d163so10759051cf.2
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160869; x=1752765669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
        b=QrO/PjELSsRg3aL4uIyakOqOHBniJI81RYLuS/leXKQwqNwz1nNET/78gZu4c5H4+A
         rXPjCiTg3InmiBOSxuIbuXQAQdfDH6DPfOeKW9Z3GTG9+TUZb/IuACNMIAD77Q7QQrLI
         /A/qoYynEx+krsTfOnGAB7HJqpq5pXjEZpwU3j8hHs0wgfVLPGaNtKjic9ylgwB/qIW+
         Nr3sRyjBisBKOFg13T1KJkedwbMuC84a+9FB49hD/o0DSFIebB7erJELA6udbqRzaUYI
         nY8BKaOgxAh/mnESmJMI2BzknD+UdDtQWWyGlAfcLWIjVtmnp9QiLkrBiocsEpJE8mj/
         d00Q==
X-Forwarded-Encrypted: i=1; AJvYcCVH9ef7dWoJ0Rn3XUi7huZe33sDLkBgEqu/FORtEdrd4Uj5chIPoTvYbJKN66oxzULy6lJrlc/u@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkP/ZMmLcLiayQ4DLMxdbExNagKyFLE/w+nNmaFkpiH1SypwML
	zMKPDHMl6+ygQUf5D2XXSkQqisuyquiLbkJ878Y8HhjKpSAQD6QnAMU1NZTrN9KSx+3UkFfU+9O
	jLwfTgac1OdQthLAsvU8tiwbNc9L1Khxv1RnQif/wE6Q20OeqCjeg4XULWfSc
X-Gm-Gg: ASbGncu+Pwylpk30Lt++2813apayMmX/sfJ4WtoWmHsut/STTMkUhqrPQLvWgH8xL+/
	avRSsH+g39SrD+VUePSd4KBdluU+L6rlyvWPW1GadaOMJ2tPbtp95+lkJ6JnQDiXSAG6RQpSN7M
	WgVE3zXpnL5ashR8BAEY3qHlffsmJbHnL2X03TisJtAHzASVj/AgsEyBq34routPiAQGx4EHDVr
	jnFKF6IRb/nKvMCrmSutDwJCOaLeYpL8k6KTzFcqQNGvQ51VgLBe2d8Cdu0mWOD2ORk5oyIz4tO
	/hC/x1hU5BAhiVyl/kx2KzoUXJhyXy6z7ujEV7YfpW4mrRJCexerm2+2Fsyl
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45333421cf.41.1752160868721;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuCfhZPQ7Idmvh1qtK7kQPM/uffYT3OzQJBiz87ujd30b3ETbzpQriwnIDdG+tuY1zMSqkBA==
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45332871cf.41.1752160868384;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:26 -0400
Subject: [PATCH 06/15] rtc: rv3028: fix incorrect maximum clock rate
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
Message-Id: <20250710-rtc-clk-round-rate-v1-6-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1044;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y+AZFWJL051hZPxzrLPHAl9zoCHqdwam8bIR61IfRhQ=;
 b=0KJSbBt0DCZNkUMOmwxns1NITMSVMXCg2QJNQ7+FpDcQdwXvMZxfWyFb+ZQw34oW708cql8Z0
 8ZzDlOPfUDOCuuTRShwnoG3D5ui88qCACdqmSjcf+TQTW6jSrQvcPZi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fsPVIsmGuu_DfUT-X0UPqCPNWsEZYhkYU0zcImeWqts_1752160869
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When rv3028_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: f583c341a515f ("rtc: rv3028: add clkout support")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 868d1b1eb0f42e8cdf2895033c24f0d2690587ca..278841c2e47edfefd339f04bf5193f6970ba0c65 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -740,7 +740,7 @@ static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0


