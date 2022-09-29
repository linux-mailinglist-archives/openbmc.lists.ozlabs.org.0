Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E05F01CF
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 02:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdrmS6vhhz3blV
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 10:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ui8HMsT2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ui8HMsT2;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGW70VJZz2xGk
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 11:49:22 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id iw17so28591plb.0
        for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=A78/h1Yexl7Q/hTxPF37Ok/UONpxdO8dwh6yuAvjHaE=;
        b=Ui8HMsT25Bx2XkrGLzM1zvoQKkJTKvuZFs35MFUkJfzECBNPyBTcjHleAHTbmSv82Y
         9ZxGTjf+lpfu33a0W8z6IizV8QRRv0TAulOrWEc0q+i0bXCu3Db0QJCdG59xZfCBIRAx
         g/A0koOfAdbQ7ErsUHD3qOYb9vxxdOf6pXJZRYZWZzVSrKzBiA/3L7/A7d1r5krH3+r/
         EAscaPhjuStlJTF+ChR0f0JUXFztmz6KndMdfOIiIqmcEArGW13QVHTRCY+fNxldYD4C
         HXRE+3NS1lbJXLmC5HmEViwW2YLITo8UhOusPWsUCJcRX/VgZnmy5ZbOhioE0UYbVxrv
         sDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=A78/h1Yexl7Q/hTxPF37Ok/UONpxdO8dwh6yuAvjHaE=;
        b=ryTv/MVULzhveRKpNgLjRY4ka+NEoVu+UZSh8mdkUmVs8Bu/45aPNl6f3HoI5un5nl
         Fbc2+qsAXHsVwp/suNfEseTXAK/USR7Qmn9x64pScGcWYmyKLxxQBf3aTX2R4vyDwjMb
         t3AMBuETTV8mIHi0TBZJeXup3KZ+sRqEofl8ug9M4YVfraFFCmDD4bu9+GZznPowbcos
         lQnSi94aAh9NjU9xQDkYnxN17/LFRa7Fzo0V+IzTJV8DGm0pNzRInRYuQtdbaSrfuAYV
         U1kYDZRC/zV3fdH7BIhqjKhShom2qDEZ3Z/JVn8QtTVr3b4f4NFcWseTy0pYx+mMLALy
         kLDg==
X-Gm-Message-State: ACrzQf22a9DwHtoYiSwvY+h08jJedIozHolHXWThqp3GpuqI7Q8t1MNM
	J3gY7KgvHEAZuF0RMCGw20h80jZEwAs=
X-Google-Smtp-Source: AMsMyM4SdPaGiTp8D1KDVQlF2KTuG+CGLwQOLwWKD+/U6FmM+b0gomuWRvNG94YRQ1yf+kMU8qZPQg==
X-Received: by 2002:a17:90b:2786:b0:202:8ad9:f36e with SMTP id pw6-20020a17090b278600b002028ad9f36emr13718091pjb.83.1664416160669;
        Wed, 28 Sep 2022 18:49:20 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id b6-20020a62cf06000000b00536097dd45bsm4597072pfg.134.2022.09.28.18.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:49:20 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 2/2] ARM: dts: aspeed: bletchley: enable emmc and ehci1
Date: Thu, 29 Sep 2022 09:47:06 +0800
Message-Id: <20220929014706.1917372-3-potin.lai.pt@gmail.com>
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

Enable both emmc-controller and emmc nodes for storage soultion on
bletchley, and enable ehci1 node as second storage plan.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index f5986f5909cd0..a619eec70633a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -1046,6 +1046,18 @@ &ehci0 {
 	status = "okay";
 };
 
+&ehci1 {
+	status = "okay";
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl_gpiov2_unbiased_default: gpiov2 {
 		pins = "AD14";
-- 
2.31.1

