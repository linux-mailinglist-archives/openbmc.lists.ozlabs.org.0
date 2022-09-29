Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD95F01CA
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 02:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdrll1Ffnz3c6d
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 10:32:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pZ2yUFLu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pZ2yUFLu;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGW53QRvz2xGk
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 11:49:21 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id v186so135085pfv.11
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SCE7PjRLwj6A9cf3VX+SP/oH5MxVVQmwgQMAjTSH2Qk=;
        b=pZ2yUFLumzIhDy9GhV8nmjFedMBdCcg++BfgYfeqdvKkUAoKEkoLkEE1bkg13BpT02
         9V1BK39yj4o0f+ysADR5djutv9+wBK/vdoINAVeiJzsMarl3J23VRou2PUxGXEbct7mm
         G0pk8NzxQrkbyKZALwzg/VUxrPA4VhS56ZKNm1GssO4/NxGS49eh5RQKQx1U+yHFDeJZ
         i+gEhD01K9pn/rtRoiylban8YDOwlIZWm13YjSmlEoVmBZ7CKtKOO21ZPV4nRsmAFP3V
         DxjRlINeCvRQy0vtCwucy9tJqYV5FKACRmAOd1O66euPBCLAT0aXyykGcE4mu7K13seD
         1yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SCE7PjRLwj6A9cf3VX+SP/oH5MxVVQmwgQMAjTSH2Qk=;
        b=TYQ1/SJYRpnhrD3w8/GKt845aDGaVcsqn3rPJpLoumivMBxn/5hwV499i01zldBay7
         Ptz9+A67wCYQd5LMxqnFDsnsV5zqwwpOMLbrBL/0nBBhAg4nhKMYMAWG4qb3CKG5q4IP
         etvKrH4cKq81QgdzVSBsp0oTjfjFDNYoYO03AT2IELy0RdrWgSEG8Kl9V+j+284K9Syi
         D3ngGaC4zbvMczk4wGly/G3c6EuBzAyMLne/lLj71DEsNVeUxKsXy0sJGjAF9V4Rvupu
         zh17ALJoPVPOzihx1H/bdybdt6R/khnXGWtMeUZOm+0mbBlcGp4Pt27fI7Q17xtWEwJ5
         zd8w==
X-Gm-Message-State: ACrzQf3xDq0Hmi34agNwT/1jpePi/IGsk0uU1MBBr/SRWJ7kWtuoR2RQ
	OhFIg8mXGTismNZAJbzOKpqXQmPqnhI=
X-Google-Smtp-Source: AMsMyM6/ZPjfQpejlGBmX/TAeK4JHip+tEULV1OLY+0hUEZM5To042sePS3JWm/DfdghSxoP/mGFvw==
X-Received: by 2002:a05:6a00:14d3:b0:546:e93c:4768 with SMTP id w19-20020a056a0014d300b00546e93c4768mr871312pfu.36.1664416158970;
        Wed, 28 Sep 2022 18:49:18 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id b6-20020a62cf06000000b00536097dd45bsm4597072pfg.134.2022.09.28.18.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:49:18 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/2] ARM: dts: aspeed: bletchley: update and fix gpio-line-names
Date: Thu, 29 Sep 2022 09:47:05 +0800
Message-Id: <20220929014706.1917372-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220929014706.1917372-1-potin.lai.pt@gmail.com>
References: <20220929014706.1917372-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Sep 2022 10:31:22 +1000
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

Update new GPIOM7 line name, and fixed typo of GPION6 line name

New GPIO:
- GPIOM7: USB_DEBUG_PWR_BTN_N

Fixed GPIO:
- GPION6: LED_POSTCODE_5 --> LED_POSTCODE_6

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 1f72017c1e2d9..f5986f5909cd0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -984,11 +984,11 @@ &gpio0 {
 	/*M0-M7*/	"ALERT_SLED1_N","ALERT_SLED2_N",
 			"ALERT_SLED3_N","ALERT_SLED4_N",
 			"ALERT_SLED5_N","ALERT_SLED6_N",
-			"","",
+			"","USB_DEBUG_PWR_BTN_N",
 	/*N0-N7*/	"LED_POSTCODE_0","LED_POSTCODE_1",
 			"LED_POSTCODE_2","LED_POSTCODE_3",
 			"LED_POSTCODE_4","LED_POSTCODE_5",
-			"LED_POSTCODE_5","LED_POSTCODE_7",
+			"LED_POSTCODE_6","LED_POSTCODE_7",
 	/*O0-O7*/	"","","","",
 			"","BOARD_ID0","BOARD_ID1","BOARD_ID2",
 	/*P0-P7*/	"","","","","","","","BMC_HEARTBEAT",
-- 
2.31.1

