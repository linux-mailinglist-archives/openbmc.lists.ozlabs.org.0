Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCB577E31
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbX00l43z3bc9
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:00:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=muGbABNG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=muGbABNG;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX8r20Rc0z3bXY
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:16:01 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d17so10758834pfq.9
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/cXVElxHAcvgbTqkcDPEZcgMxgzQCWHYrFhvr/zy9d8=;
        b=muGbABNGtA9/S3bqI69sqvq1V7j7o+j7ZUBLSKeWhEGii5W0XRIzz8RVT+AJInP7DM
         EI+p1lF3BYDUxbuMsiZ5+7ToxEgH/+OJa5hq27fUUqAQwQfHWkYa/AC0tw3WvhN2ePiY
         0LYqV5ODA6HDY1olr3m3PttaMpTVIF94SBKfMJFcW8FmmJw4pDMD4LM3Rqi/yR1snzvT
         VNZBCeqlwR9ZpsuuAYcv5OHiQnTErr2DqA7XZ5pESgbGQpG7m1AMYmOHWpQj/sD1/1Dk
         1ZP/wTXEj09nO700VjH8me0yHRufUa5q+tQh71CzCJ0SYHpKqI/zH9zllXsSqPrWM2A+
         IZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/cXVElxHAcvgbTqkcDPEZcgMxgzQCWHYrFhvr/zy9d8=;
        b=xijeMdGAv7HdbvYloKdBNohTXDSbXCofShWjXSdJZ6zhHRsj+7+44HGpwWQbxrRNxd
         VS+I1MR6kEXT8aMieXPJeelaWzTaEwp1Ggqydg7HS54tm9YCt0IrgmAEp09SYJTFn/aw
         ChywVu5jS6lAuEDsMlYM8kwZULfcLz6bohcKzPTjKTyyoFOE+UekB28VSMjI/etBaxPD
         vlV5jDY5KEUH77I28ZXHVMLMqXuLbQ5ZLepCCkAD2UmKoPb3SlqY7g0o9xJXJFjbxBq7
         KiqNeyETF+MzlNNzmugqEsyeITGLFCNayMavNOe3uhuFAaTEQgKQur7X4obcG0nA4f84
         6IFA==
X-Gm-Message-State: AJIora/l5GUDXfRLMmRtIajqLVjGHXMuHlGTjEn5LZRVzpIP1BDcHuK7
	tyGrQK34TCXN5b1f6njKigAN+Cp3C9fHRw==
X-Google-Smtp-Source: AGRyM1tNId+Nafh89ceJgoLwiAkNzW90wJPenJE4agpbSxZL5Z9DYCVDbCtAt/0w6re4hUirB6TvPA==
X-Received: by 2002:a63:a53:0:b0:411:1ba6:e5f with SMTP id z19-20020a630a53000000b004111ba60e5fmr4658573pgk.18.1656386159229;
        Mon, 27 Jun 2022 20:15:59 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b0016a0b31a8bdsm8046511pli.4.2022.06.27.20.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:15:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/4] ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
Date: Tue, 28 Jun 2022 11:13:40 +0800
Message-Id: <20220628031343.21097-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220628031343.21097-1-potin.lai.pt@gmail.com>
References: <20220628031343.21097-1-potin.lai.pt@gmail.com>
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

change LED sys_log_id to active low base on DVT schematic.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 41d2b1535d9a..d34bfa50620e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -59,7 +59,7 @@
 		compatible = "gpio-leds";
 		sys_log_id {
 			default-state = "off";
-			gpios = <&front_leds 0 GPIO_ACTIVE_HIGH>;
+			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
 		};
 	};
 
-- 
2.17.1

