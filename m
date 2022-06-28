Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49A577E32
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbXh4gSwz3brV
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hBepgJTv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hBepgJTv;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX8r31Yz1z30Qc
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:16:03 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id m14so9885765plg.5
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YNhd/FL425kRzxrVXJkEkRoau5KOg53TFkVnNDFPTbE=;
        b=hBepgJTvwSuUKXayKUY1qo27MibDNgZzYzqQ0c/A29AVcXALEx47jUYPBixbCH4x2Z
         eX9oDiCih0Dv7sFh0JYz0TBx9fUwpccg54OMymqbdpV+XZIGjczUbJZ681k9Q2MocFbI
         6/PvgeIa8HOBJtMktA82XKrkNO8ubUPkDkqoA0YRRXbtxMLacDnlqvhx0lHWbwag2UpI
         3NINjzUAbpEnlPM8RNlI71kIlY83l5bDFnVY2CCF7SP44BVF49xck/CVwK36q9XkVhW4
         OSLLd4KRk70dN+LoRGUQlgld9r42/aKRkIZ32wPqtX/NddCmmOhX95MwmFyllVt+R4m3
         fqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YNhd/FL425kRzxrVXJkEkRoau5KOg53TFkVnNDFPTbE=;
        b=Z9qm/GtmihavlcdtXJ0ouHf6zJ1RM7Tt8yRhv5A12q7pdVABFwpZ7QA0i2N5H+G9FI
         RPltyuS7/faoSfoAh0vDJrZOM9DkyrtXrqAS/wf1uaRlZgjvT3FthIWipD+6pcjrHzGx
         kf6qaqKhNfDnrDTL8upFILz5YoDI4LwW+vE4UCTWLYM8YSoV/IL4xb5U8QX0lvltBIvN
         9Tfd+pXXzuO755HxPs7rWrIBcrNvouGfLsS7Lq0jegt/qWPBGY5m8nF+PztS2UvyQ+wM
         G+1DBVkoayk42fIfC8qBovjXzGeUw1TLt2/+ioDXolN9dcvDkhaLJ2v4dLlpb0U0ra+m
         2YNw==
X-Gm-Message-State: AJIora8Gw0L53u4FOEtHqBDnWAMkMeNq0epQP4laRMHhbproT8SGlyC8
	gJ4qEvD+fsUe1i2wGTpHto1aHD6RAEGFow==
X-Google-Smtp-Source: AGRyM1vPsWChReqa49Sfe53hGa1ZRl1UGuYIWOc0R4K/PgUyEIOH52Uf1WZLDJ5cyvhQIjW/PRcPOA==
X-Received: by 2002:a17:90b:3d0f:b0:1ed:3b8c:7cb1 with SMTP id pt15-20020a17090b3d0f00b001ed3b8c7cb1mr19443470pjb.44.1656386160927;
        Mon, 27 Jun 2022 20:16:00 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b0016a0b31a8bdsm8046511pli.4.2022.06.27.20.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:16:00 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 2/4] ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
Date: Tue, 28 Jun 2022 11:13:41 +0800
Message-Id: <20220628031343.21097-3-potin.lai.pt@gmail.com>
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

The external pull-up cannot drive GPIOV2, so disable GPIOV2 internal
pull-down resistor by the request form HW team.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index d34bfa50620e..ee33cc3efae4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -860,6 +860,9 @@
 };
 
 &gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpiov2_unbiased_default>;
+
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"FUSB302_SLED1_INT_N","FUSB302_SLED2_INT_N",
@@ -950,3 +953,10 @@
 &ehci0 {
 	status = "okay";
 };
+
+&pinctrl {
+	pinctrl_gpiov2_unbiased_default: gpiov2 {
+		pins = "AD14";
+		bias-disable;
+	};
+};
-- 
2.17.1

