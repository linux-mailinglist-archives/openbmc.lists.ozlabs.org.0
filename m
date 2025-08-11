Return-Path: <openbmc+bounces-426-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D5B20CD7
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 17:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0yXp3KXVz3dBM;
	Tue, 12 Aug 2025 01:02:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754924538;
	cv=none; b=BUQnuMNCEJ1RIRyUr08V4Y+W0+EG0NL0TQFd5cc4EmQZLyScH2phXN4dNyT+jrv3A2cmtIFyH+RuUd0GEP6h3Re1KgRzhCUputpuXEsD9SHZtJYfr2iGhaZAFJl1gJnCkFdqlul3bxuKgSg3zm9k6dMoMDgPOeqHOFCoF7bbRW+VxKPN6HMP7VV/P91hEaC21Juhwe3EMfNoQeINjbymj4dLqyUL9trbQhR6RrvwwqE5qkveSB+Ivfv4uywC2d7s5OB+xUU6LaQAm3x7AhHVoVEFntQY0drmu/fKX7AQ2xamtEqQcbjYbveZRj1LFzeJ4KGG6UTAzOzlUp9rzVwCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754924538; c=relaxed/relaxed;
	bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7ZJyHStXLnL92TE2lDrm/N0gGgGtZCt14xRSDmVLGv+v99nIl+MkdKLDdTcy+kO490vwMWot8UvA/fGAXnuTpBvutl15G3+7Ds0V9lClhuxt3rxqhPjnES5NKjNlMT+ow8ElahP90NJ9u9BV0iw/RaCpnDLLkeuF8PXqxLKYXp376D5wDkVMQPzH4GklmCUC4Sw2JrYIIraN8dop26pHTgSOL9zDH/iol27wKouon6sltQILVqbID775clEfqFpohYOa0BY67AgHI0JElc7VHrPeUF+tudtipH5Fe6TV2cd8ex+Nu/nl+Fvck/Pd10EzCVsQxM4eoRrzaDcBVZSjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=rpLYZmqw; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=rpLYZmqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0yXm12fWz3d9t
	for <openbmc@lists.ozlabs.org>; Tue, 12 Aug 2025 01:02:15 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so41418065e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924528; x=1755529328; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=rpLYZmqw5KhU4lWRG1ZvVnd46aDxKXzXab8RIgcaQOvq0GJZ6qo3CIXQGto0knKWRI
         0bVXaeXlJj7AlIA02LMev9zbs9oaDsp8w1ly/xksxzloXa8mx9a8CCSOzwix0JI+x9gO
         bs1QALYMf/Jz3zi2xJzYD8S65hV1VmVOb8swKUyh8ZTOpaMRq3nHOdgSvyhxHsjD5MEI
         P+mslMlIAe/kfkDKMQLRj8Fxs7JJpRB758QO9fxlXSock3JIXe4LiDoeFLBUo2n/OSkF
         Jgv5d6HTe94+H4tnxFsRAqd2L5erX+pxGJAJbidUG3FMmIgdPNJKKnr1s1l9rmHYEsnY
         MAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924529; x=1755529329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHA4EWqZ5RDD8xOnfMI1h8e9Ub4VWbYnIWSqRJ+WHMo=;
        b=GTUCoaZIv1CgGv/uPEsorbxUgk2feals1icqUgajJ4hTMPbTjHbXLSebiEH0gwlse8
         fFD7Ai3n0ujx5gWfI4G5QTkMeF6aQOuXw0N7aL8JGzJYc3+552F67lQG1GpD+UuZziSn
         WnKdQAbVwbxCIRJmDVPKesNO58aDMn7T2rQTtrDXoiQjg24+SHZQjdyePW++7EF7WOUF
         d/SBYavi96WVLmgBWC6d/66krLXaYqDv12ngv8W6axtQej1K0DQrIDEoMBQ+WzYzkXFy
         ha3cTAzTVnd9b+sWjnFiMkmfQ6cs5GX1b3neNid1QqnscOOBL28rRQHbI2jvNwv5BUVJ
         IlnA==
X-Forwarded-Encrypted: i=1; AJvYcCUTD2TE1Yy1qPc4LgU/P8iRS+bvSXK0f0eKKVnRHcZ0knxps8U6rZyVn/M20pDRhPRVwuqTquqN@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFOZYNJCFIUJ/O3XiNi9yZcsJUOQ4rZIBQftCZn+oegrkCf3qw
	MI3g4Jzj/hCQx5psM1BRJu5OTfQG+AXgsD25WdZAIaT/oZPVpUybKERNP/yZJhxjxOI=
X-Gm-Gg: ASbGncvTUjk/PrjQs9Oq2eMaux7jSzkimRpVVC6P7+QJspE3LNSnnQncA3UpXq1rzGO
	99/zu6C44vBSJJrQ+eCKbksAhWrrKUxzchfd5o76hoaD3NUzx/Wpib7HX+7CbJTUYzQFd9TRMZh
	cEUC9UOub9JsJMBfdqmfidfr7Bk91WMrgjHwi29oAjQDNkc6MfUqEuyurWRGzrA8TJ0aC0ZlmA/
	taEqa0kRD8/K4/zBT50F334j3fBA0g3f/mm+BEnPQmAjnu3z+zcEN2N4GyOhDnpao5ZpbyUYdI5
	M+Vt3+re3EZKd83d3cTFJ6RMoZ6UGKcUUITx8myZynRRhVZLN7wV0WkJ43BUIKlPPnS4544uzjH
	i8zfOKkzvp77roPqD
X-Google-Smtp-Source: AGHT+IF+THEVCFuwYQu8m6VAawSu2em0TIQUS3g6fESwp8AcQJ26VNGTNiQ2rv1tKPajap4Wv9a2Ng==
X-Received: by 2002:a05:600c:1c2a:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459f4f3dc83mr97971385e9.7.1754924528440;
        Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 17:02:00 +0200
Subject: [PATCH 1/5] pinctrl: stm32: use new generic GPIO chip API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-1-a84c5da2be20@linaro.org>
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TAuKojjyD6nAKERqSGd5+r/u4OVzV5ZEvxmxS/gEado=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomgXshqBLlfnYFEFYK7uY0jFJFrmHe39l05Pcs
 k4vccla8yeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJoF7AAKCRARpy6gFHHX
 cg7AD/9pgOoPP+pShNjLjROnRjG6ynKjPXowGdW0ABn5sAkUvwA1fgSz4BPTxcdOu2W+Mj2vZHY
 XAcoX6QuhsYKer2Ij7zEVCFDSd2+udUclQR6z/1sd9VJkcvIU/Cxmh6o9S7S0eDGNlXT12iVKcH
 M/EkMJ1nvsruX4Gt7mIphpAl++6vvrv1+745OgmVHhYKFicEpzEly2P+jLkiVq0tISzg986/vRM
 xFCBolAsRNun3fiE99GiiaYkwrse9aR+2q5bpAwjohDzgbwv7ePgGXUzf3KRK6d9zHvxvqa7e12
 mO1pIUTCB+/Omb/OzwjvQUMJO/mPYXkjGI1HfCz1gUZvJgCVyU64A4HjqjN0eneS0mZCRO2jbpO
 /Rhq++1FNkVt7HV086RTI0wGxd2K39LvS3fGyOnmmCc4LIpwL2edcBYSL+hEpZHA6JnTJLGGiMN
 atUmuiciLUCWrgWjBsmur3+KrCq38mMzE2A4bifdCDU78T41+OZ6jq+hvXNGpfE+TG2htol6EjV
 0U2MhDMYKV0jSaBCcphL9S+4OBxXL5+APecu01nQ+aNi7mmSNo7JzdDRQGVXvXCd0pq25kpcZiN
 mVTFPFtmbX3ShdoJ3x9oS/g9h9rgCONYNuSoHzUQZdGFjsaxJE0IFwgrNrOHSNgUIG7b27lX5wn
 kWen1t/i4XapRRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index e91442eb566bb21f7691fa14fcf684957eb6549b..dea49b9aabf2aebbaaa3cb33c8add9926972ed9f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -6,6 +6,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -45,7 +46,7 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
-	struct gpio_chip gpio_chip;
+	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
 	const char * const *func_name;
@@ -603,6 +604,7 @@ MODULE_DEVICE_TABLE(of, stm32_hdp_of_match);
 
 static int stm32_hdp_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct stm32_hdp *hdp;
 	u8 version;
@@ -635,21 +637,25 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
 
-	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
-	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
-	hdp->gpio_chip.can_sleep     = true;
-	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+	hdp->gpio_chip.gc.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.gc.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.gc.can_sleep     = true;
+	hdp->gpio_chip.gc.names	     = stm32_hdp_pins_group;
 
-	err = bgpio_init(&hdp->gpio_chip, dev, 4,
-			 hdp->base + HDP_GPOVAL,
-			 hdp->base + HDP_GPOSET,
-			 hdp->base + HDP_GPOCLR,
-			 NULL, NULL, BGPIOF_NO_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = hdp->base + HDP_GPOVAL,
+		.set = hdp->base + HDP_GPOSET,
+		.clr = hdp->base + HDP_GPOCLR,
+		.flags = BGPIOF_NO_INPUT,
+	};
+
+	err = gpio_generic_chip_init(&hdp->gpio_chip, &config);
 	if (err)
-		return dev_err_probe(dev, err, "Failed to init bgpio\n");
+		return dev_err_probe(dev, err, "Failed to init the generic GPIO chip\n");
 
-
-	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip.gc, hdp);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
 

-- 
2.48.1


