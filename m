Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB33B6EDC
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 09:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDbqt5W23z302S
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 17:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aRa+5AKV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aRa+5AKV; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDbqY3T07z301k
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 17:35:36 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id q91so622587pjk.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0izTLuRnkj5dD8aYr4Xn0lFlWrYHdpKau3JJLJgVkc4=;
 b=aRa+5AKVDnO0wnGjGRrNS1pR4hIBXhQkWOuAbQUxCj+fUOjExTRTiDjMiBcbLpnnzt
 xOkViiPF0XaQmuEPSn3YOVmSJ2JEIq1j8NGnokMXapzC6sLy0nkWM60jxKDpj4hYBpLG
 q2b+mzVQHhoaDGNLQGU2+yeS8PwMUSwcD/1Um/gKPvARRkYrcPFwMcu0m2APL0OETR8B
 0WMhA7LAJpCsDYVWV4pH9sxB7y15tHPrj7eDS2U363ZHQgC3o8JU0+9rCalB90eniWTR
 YeUWuUjzVHb8QMFwMEaU4WYuTtQpH6IK+a//N17Z6fYo/Jsn8ougseXBmYLa93A2qXCB
 VhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0izTLuRnkj5dD8aYr4Xn0lFlWrYHdpKau3JJLJgVkc4=;
 b=NjZiWRZqhWF1YKIVxUolEwymYfrPVnysYWSXP9f4YCTYxYiY9TAF0/ZdEkpiB61VHj
 1A4ynlLyTd1Je+Y1MEGleOmQRQ+JsxHP708bRwjg5Shp+xo57xZnCeKUk3Eknf0jHEeu
 5Kl7XbmsTAmMR2jeeVd8IeQxuz6QueQhkWZWTk1HfSLbiJDvUyNABshoiA+8EO8oY+XA
 imZkU7Lti7N872sKX+QAToCFvuX5cH78W3JNee/ghx9SaORTGD15GiVB2xkAUFkV+SEl
 8/pzOhs/mIM3lvwmnEqgmBXw6j9IiSji2TBj2jtThg8WSTzK6CqBVaP4YX5y4ZVpgzKO
 MTRA==
X-Gm-Message-State: AOAM530oNAZaSmVGUAJDF+BcHrS10j/Iggv7KzGPNnZND2fHwZVR5vB8
 rarMeuTfYyeCinzrgZOjTWo=
X-Google-Smtp-Source: ABdhPJxXUA0mCs6JeexbhFwMFb/0heZn9EOe71u68qLbv1RSDnJl9gqahmlmTPRHYqiF/uuZI+FueQ==
X-Received: by 2002:a17:90a:e28f:: with SMTP id
 d15mr12539450pjz.79.1624952134111; 
 Tue, 29 Jun 2021 00:35:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p8sm17622438pfw.135.2021.06.29.00.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 00:35:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.10 1/2] soc: aspeed: Re-enable FWH2AHB on AST2600
Date: Tue, 29 Jun 2021 17:05:19 +0930
Message-Id: <20210629073520.318514-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629073520.318514-1-joel@jms.id.au>
References: <20210629073520.318514-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Recent builds of the vendor u-boot tree disable features of the
BMC that may allow unwanted access if not correctly configured. This
includes the firmware hub to ahb bridge (FWH2AHB), which is used by this
driver.

The bit to "un-disable" it is in the SCU. Set it only when the ioctl is
called and we are running on the ast2600, as to not open up the
'backdoor' unless there's userspace trying to use it.

Fixes: deb50313ba83 ("soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 29 ++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index c557ffd0992c..3ba4cee037f1 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -37,6 +37,7 @@ struct aspeed_lpc_ctrl {
 	u32			pnor_size;
 	u32			pnor_base;
 	bool			fwh2ahb;
+	struct regmap		*scu;
 };
 
 static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
@@ -183,13 +184,22 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 
 		/*
 		 * Switch to FWH2AHB mode, AST2600 only.
-		 *
-		 * The other bits in this register are interrupt status bits
-		 * that are cleared by writing 1. As we don't want to clear
-		 * them, set only the bit of interest.
 		 */
-		if (lpc_ctrl->fwh2ahb)
+		if (lpc_ctrl->fwh2ahb) {
+			/*
+			 * Enable FWH2AHB in SCU debug control register 2. This
+			 * does not turn it on, but makes it available for it
+			 * to be configured in HICR6.
+			 */
+			regmap_update_bits(lpc_ctrl->scu, 0x0D8, BIT(2), 0);
+
+			/*
+			 * The other bits in this register are interrupt status bits
+			 * that are cleared by writing 1. As we don't want to clear
+			 * them, set only the bit of interest.
+			 */
 			regmap_write(lpc_ctrl->regmap, HICR6, SW_FWH2AHB);
+		}
 
 		/*
 		 * Enable LPC FHW cycles. This is required for the host to
@@ -296,9 +306,16 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl"))
+	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-lpc-ctrl")) {
 		lpc_ctrl->fwh2ahb = true;
 
+		lpc_ctrl->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
+		if (IS_ERR(lpc_ctrl->scu)) {
+			dev_err(dev, "couldn't find scu\n");
+			return PTR_ERR(lpc_ctrl->scu);
+		}
+	}
+
 	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_ctrl->miscdev.name = DEVICE_NAME;
 	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
-- 
2.32.0

