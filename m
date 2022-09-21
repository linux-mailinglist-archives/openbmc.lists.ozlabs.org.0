Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B955BF825
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVrK1vZ9z3bl3
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:47:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YYVG9n7u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YYVG9n7u;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVnF2CMLz3bnY
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:45:05 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so4930335pjh.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=gq81AJEr+ieoIRCzlGLwjGIh8WQgkQOFIam6iqGrPhs=;
        b=YYVG9n7urizyROtD0Paa3fj6Tfdrr9ww9KtsPInw0Haj4iGXzWPuw2ynE87fj+QEU+
         tkc6LtSlkULPkMY6EXgtD+zPLevX3ueBrv4cpa8Y5VXfq2krM8cadcN8V8HllHaue6Ks
         YqZyL6PwRtB+CLAfj22iB/g2sJlPrV/Qwm4OBy7nw4KLKPF57JIh1+uhpkzUzewG1Fip
         hLPVp4Jr+OQzWIxvK1wjScuq3dfNLT/zNgF2l80Rxz3FGyhIC2RxqzoGDvpoOIppOSXl
         AWBS/h6XKZSrBokgLCu49XcNopw9OgEZGsxcW/YRZslPiA+GA4pItS28dJ1DttmpDIfg
         1JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=gq81AJEr+ieoIRCzlGLwjGIh8WQgkQOFIam6iqGrPhs=;
        b=WIMa5zrOtVpzqiyMs7Xc1rEN8A45YGOZ8TglGYfQl1YEhwjt7whX89+YWWedLhEzUe
         b1VOB7sGjsCDGU0mLykEIxs0+G8ZqT0Cukt2LiRTX8a76+56RQ3l12AJ9SdMr+shdgrh
         54o4ljqNdqtu1g9SUiPVvlEGbIPzODYtpWhOEhUHKCI8s1JWEK6EIG9o8a4xMMDKxDoO
         6B7FLtbreV52N7ewiF5viQi/rs/vZRw+CYpW4LVjdqnxFHQ8EQpTuqe75QCaKx2nQSCC
         atsYIUJ75Nd6+e/e7un1YuEX1PGFq82bWf4hNIoshCjRiMj6WGz1m1EofepD3b12cpvY
         TglQ==
X-Gm-Message-State: ACrzQf0PcL0djjEkCjY/Sv7vTvPz+UdyOtHs3yjTu8JfawulmBC/Wv8f
	bbTziuvlUKsZ/8kwp51nM8RmUMsMizE=
X-Google-Smtp-Source: AMsMyM4PXuI0BC7YZUAQLo+jR9snp3OmgAd3v8sVth7PVodcJI6VY28WAjTa3afmWaKP5D1Jf64EQA==
X-Received: by 2002:a17:90b:3843:b0:202:df54:4c10 with SMTP id nl3-20020a17090b384300b00202df544c10mr7917416pjb.100.1663746302572;
        Wed, 21 Sep 2022 00:45:02 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090a121600b001f22647cb56sm1192339pja.27.2022.09.21.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:45:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 4/4] config/ast2500: Enable RAM devices
Date: Wed, 21 Sep 2022 17:14:39 +0930
Message-Id: <20220921074439.2265651-5-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921074439.2265651-1-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

While the ASPEED RAM driver builds unconditionally, without selecting
the CONFIG_RAM symbol it does not load.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/evb-ast2500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index b83c315e5057..d2a4e835dd12 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -64,6 +64,7 @@ CONFIG_PHY_GIGE=y
 CONFIG_FTGMAC100=y
 CONFIG_PHY=y
 CONFIG_PINCTRL=y
+CONFIG_RAM=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SPI=y
-- 
2.35.1

