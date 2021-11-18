Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 973004556FE
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 09:30:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvtKj49kKz2ynk
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 19:30:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cKxB1LeY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cKxB1LeY; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvtKH1TlXz2yHP
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 19:30:25 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id i12so5240307pfd.6
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 00:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6Lxx4TXfjBkvm4wGudSZgIaFPEI/+SKic/apfT6R10=;
 b=cKxB1LeYrLZ4qFfo+ekjpTch+jOOBh3aE6wPkgLog+oCnjj3QpeonlaqaUWQw5gG3w
 7xCxT2UHhso+SIOM19zT1OlWeP1z8prlJ9NSyFP97sqLRgpe0w64WGTTkapFr1xe9gIa
 KQ7G1Lfr2E+W8c2FSGZ93a6lFzx9uiRJC84SjnDt03D6P4lB+15WfiYy/HjGC5F5Q31p
 p0yojJ6FCmSF/zf0I0hPmh44O5xLrDSs1yHRODTORhf7af9RUTN+SJk6neemavVtT0hi
 XeNuwzBY8M4aQRZnK4TIHQpIwjPeWvNakJhY/k/5mfhuNbCNHm26DsAK+PMWAevGAQmb
 /gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6Lxx4TXfjBkvm4wGudSZgIaFPEI/+SKic/apfT6R10=;
 b=IJfpLL1XRDMp1FVNrBbT9aa8xe2S02KETHVv+9lMclugvWqtaBF6mwtEoI0/zkAcFy
 opjoj4berZkUzZCO2xv985KSUH84Bg7HTMileGm3JjSGsm5innkHgby/gSqp6lWvQzp5
 fMTwzXy5I9LwG8uzyKwgqGTDkeY9s14GHOAuuf0SDjVPu/RZgF7DQ2E+1zboPD9gi5Du
 fQgi6fzjdgileVACRLSh2xrzH/VrXapzIxcuuNhBjJJQgAaTX9+QxoURvIm04VU7cK6Q
 L8fOVtwtANlgdkM4dkrhSh7CRkxSfMWYxxm/FN8UHuRqg3j/kzLCF50ai0rC0T4GsmFo
 Q2Yg==
X-Gm-Message-State: AOAM532OqxjDVGlc5shJ8lw8E4yP1fbbEk6jF2EA7kkn/+MmgCMCkE64
 JdHT5bpxWsb6j4YtxXSt6zg=
X-Google-Smtp-Source: ABdhPJxQ9wL1q09H9aed/A6vCOvB0QmdwbHXmPIA1QbrvEK9NoCXyXVcrc2RgWtgMF1sfra+lALpTw==
X-Received: by 2002:a05:6a00:2313:b0:49f:d9ec:7492 with SMTP id
 h19-20020a056a00231300b0049fd9ec7492mr55481875pfh.25.1637224217085; 
 Thu, 18 Nov 2021 00:30:17 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e13sm1770391pgb.8.2021.11.18.00.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 00:30:16 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: avifishman70@gmail.com
Subject: [PATCH v2] clk: Use div64_ul instead of do_div
Date: Thu, 18 Nov 2021 08:28:58 +0000
Message-Id: <20211118082858.165538-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117011244.158541-1-deng.changcheng@zte.com.cn>
References: <20211117011244.158541-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: benjaminfair@google.com, sboyd@kernel.org, venture@google.com,
 openbmc@lists.ozlabs.org, zealci@zte.com.cn, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, cgel.zte@gmail.com, deng.changcheng@zte.com.cn,
 tali.perry1@gmail.com, mturquette@baylibre.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

do_div() does a 64-by-32 division. Here the divisor is an unsigned long
which on some platforms is 64 bit wide. So use div64_ul instead of do_div
to avoid a possible truncation.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index e677bb5a784b..c75880af2b74 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -56,7 +56,7 @@ static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
 	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
 
 	ret = (u64)parent_rate * fbdv;
-	do_div(ret, indv * otdv1 * otdv2);
+	ret = div64_ul(ret, indv * otdv1 * otdv2);
 
 	return ret;
 }
-- 
2.25.1

