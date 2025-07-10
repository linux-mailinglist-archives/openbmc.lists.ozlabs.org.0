Return-Path: <openbmc+bounces-325-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C78B028E3
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBm64GGHz3bm3;
	Sat, 12 Jul 2025 12:07:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160881;
	cv=none; b=je/HyNC0D+ymcpYJ+ysmWxr9aegazLTau/YaEPjp4PqAL+VkfITGiYWYlpEtgQoa+DFwuhqFFR/RzglLRJUGqX+7pLDavC8pFgO4e/GJZjiI9Pp7zHv6NtUtceSlX7htzF8pGV6vSEU5Swkwr/3pvVUFmrQBK8UGRl36/voRY4ZAZnG8m+jsEdOFaF5k95+/QbK+a66JhXQpucYIr36kZARGnJvGlLdVwKHpJoe5ddVIviURP8VOPu2Qd5sHnGSOJIAeOnG+HLJw21K5IwpRBPhSh0+//JR54lvn+Ku/o1qMEGVp3N0URKEeWz45t39IBS+ajTDAOcH3OQ8qkJBvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160881; c=relaxed/relaxed;
	bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=KDBXsZ4oKGIgsUfS9xXRP6tXW6u4eW4TC2uhrn7cgllk809me6JieQpP39/xNswT9QsDv+Opd0dzkNJhvgvRbuUpO/mtcIekmCZis2Ih9uQjYU6VRka3Ud8A8qF36eKjLAgCCceBHq315HIrrD3CRAU4IyNdAkaD2pIh9hvK3Itfkb12DFGPluQ6kKuAS0MVeO3/NSJNuZdKaZwnqNBAH9PGV6kkVNy9ryXLjhEGz7BSHqXybwZY0AB5tN1Gq1Vdhe4IAVdUPz0SI4B6cD8MwPpKtxahVXWnlvofSwa1m5OW2CEYcI4pm3O6MfnJMLQHnCtY08e/IRsybEf/NZGSQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P/uFT9xh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DA2I9ouj; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P/uFT9xh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DA2I9ouj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJTY2MJVz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:21:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
	b=P/uFT9xhlZyA7A8Qlg5akb/ck/XP/UpFNUHX8OlRhkfR8alCsZBakRHZKaRRUyj9GTgtZy
	WkwpBoL2UgV31As7k7XtJK40Da+M5S2UqNL/PVCZisefXBPVCS6DRcOdgb4KqX9DH2zoal
	8OGTzK0gKQE2/+WLl2n3USYPN4NDB68=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
	b=DA2I9oujh93GPGqVM6a1V3jO0cqsvjGR85Lz1TmH2tb7Nk4pjY8oKWLEqMNB8hUnJc14GE
	U8VLrmJ0LqOhHVsQi+7TQZc1McWIBLYehVrRts66bOSF92MI97naXV7vTj6/Tn/ftiseK4
	rDaSqceDNDub4/SRoI1wQKPDwjdbvhw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-B0HsAzo3OZ-LBz4nD3PTKg-1; Thu, 10 Jul 2025 11:21:17 -0400
X-MC-Unique: B0HsAzo3OZ-LBz4nD3PTKg-1
X-Mimecast-MFC-AGG-ID: B0HsAzo3OZ-LBz4nD3PTKg_1752160877
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a581009dc5so21118731cf.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160877; x=1752765677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
        b=DdMUZ4Vt6JrdfutuCzUA/3sXTEYA/ACFPzK6PhG7pmy1tQmQfjSO7vlR5DRZHCFk3G
         f3jT4ki29+B/1fdFn0xP9a1Qji1LpiS75z1q+60O9eSpCPsYQalbMuYqjCzZ1+/37TBa
         3jmyIXwfkZ+O4I/eqG2PhAedLt5GkvWzKhmN8DSi6ROLL9oZDFm63FXsILDXHCkeHaBS
         NvHpNiraELaBpxwxtKt11umyPa+VC2CfYAuns1MF7uJq3TA3ddLAErZFIx719G89ThKz
         qBTMKNXr44zVyKBjN213QZSGWQUJ67REKnpEI9FvqX3E6l8nUpCHo9OPspDFpmRLRZip
         DvmA==
X-Forwarded-Encrypted: i=1; AJvYcCVIkjmvXE+MPLJuAlCjvSGhh6vFib2qstMMFbuGSrn29AuvTJ6hLyzIUYufdVtCnrX3smer0Alh@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7LjW3tG5Cw5rkyQD3gp86lL5ko2LBB4Yvvqs9jWIG6NZPimzP
	7QpvfGw806VHLT4EHM0DptqCvGeMQwHAAoDvJ09jCrO9ffA0ZbFlimnu4zeSWaeC6t/0ecKaB7s
	yfr3Nb4VnorJZgB4dK25uhKY4p+FdLY+pDzO5GVmprTpelOt2nhF39f8rIA3L
X-Gm-Gg: ASbGncsnC5Jg2nLOoOx20lNYWmEQRFSa8fUysCXTyU7RGQXstj/NdcUDA2GSxmm6yAO
	eoikogyFr8x7Qog+g3g5vSXrgYpmK2eJ1y0rBUNg9lqytrKAErMn5Om2o4kpOANs40fzn64Jwoe
	jzcdcOKfkEyeP8Mzut9TNhpTZCAV+bgwCxaQfSqDhf8Ba1XVOxT4i1aDHQ4cTniA0+THsaOhmw2
	ybeCbD1X+NpeJRD6MQTgNE407vVc7oI1U12GrL2b7HcskIar8fmFmCQKXcAmCbA89RKFml+emEn
	hJ7LxNIgUG7Fksalk+dMNSlUvwNyPDj3gDPK+hYfmux9Ctf6VMup/Vh24kOi
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515821cf.21.1752160876757;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEktnXBUPzvGbZoA7Bfbi7aUOBKs0QSJoWa7pWCkvWbCkOdt87sQ9haOuMdpsEwCBfM0IV/Rg==
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515221cf.21.1752160876213;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:29 -0400
Subject: [PATCH 09/15] rtc: m41t80: convert from round_rate() to
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
Message-Id: <20250710-rtc-clk-round-rate-v1-9-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1772;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gRYxCnwkm6+irA6938Yxi6DImy0GX438/iYdpVHvAEg=;
 b=kdySgV3nLQK/nOox4fwHOlhGEFmW0wqNr9VHY7vGwOwPSM+A7pKrKapXwM8vxkIukREKQD7cC
 HuxCZizP8wRCrbf5QFXxnXIAg7hjFGFve1Y1H3RLVpUJwKN6oL6+xHw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SUzxZ003CyD-KK8pa7SFJAunPL--5-7UEP_uNe-lgjs_1752160877
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
 drivers/rtc/rtc-m41t80.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index c568639d2151702440d726030e9f08a0eb514da8..719afb9de9a831a4f335f505e3a0eae5293ad6c8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -484,16 +484,17 @@ static unsigned long m41t80_sqw_recalc_rate(struct clk_hw *hw,
 	return sqw_to_m41t80_data(hw)->freq;
 }
 
-static long m41t80_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int m41t80_sqw_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	if (rate >= M41T80_SQW_MAX_FREQ)
-		return M41T80_SQW_MAX_FREQ;
-	if (rate >= M41T80_SQW_MAX_FREQ / 4)
-		return M41T80_SQW_MAX_FREQ / 4;
-	if (!rate)
-		return 0;
-	return 1 << ilog2(rate);
+	if (req->rate >= M41T80_SQW_MAX_FREQ)
+		req->rate = M41T80_SQW_MAX_FREQ;
+	else if (req->rate >= M41T80_SQW_MAX_FREQ / 4)
+		req->rate = M41T80_SQW_MAX_FREQ / 4;
+	else if (req->rate)
+		req->rate = 1 << ilog2(req->rate);
+
+	return 0;
 }
 
 static int m41t80_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -564,7 +565,7 @@ static const struct clk_ops m41t80_sqw_ops = {
 	.unprepare = m41t80_sqw_unprepare,
 	.is_prepared = m41t80_sqw_is_prepared,
 	.recalc_rate = m41t80_sqw_recalc_rate,
-	.round_rate = m41t80_sqw_round_rate,
+	.determine_rate = m41t80_sqw_determine_rate,
 	.set_rate = m41t80_sqw_set_rate,
 };
 

-- 
2.50.0


