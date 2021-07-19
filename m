Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 910DD3CCBC2
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:19:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSjCD3h0yz304j
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:19:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VHIRZh80;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VHIRZh80; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSj9442xhz2yYS;
 Mon, 19 Jul 2021 10:17:44 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 70so13935432pgh.2;
 Sun, 18 Jul 2021 17:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1gtBV11Yp08tX+bShNS4fOnnqi4rnWJMiZDXxIw07HY=;
 b=VHIRZh80EZf7ljdAEYZJc0XzORChQ/oS9ZpcsfIKq1C/zPibRc+JifbI5VPYrZqMxc
 0Ev+RVv8VlX2fvkd/cSWPD58Hiq5Allr5Jek78yxMeWS2zYElE8vwHdeDVfrkYZMWV+9
 ITrJ3bh0iS37tFEEyxDfyqeiykd3dj9rx6ny7Y4ZaNqQAVZ5gQJPQZsihufJyqf0lTdD
 VodM6HwNI7q6N4BKT0k1y+nNBpEpkhcIbq/ELbvcD888J6yXGhHGFhAs+NrFS8ANuTOy
 +diZOovi1zxJQyePsHgwz1auOl7gjpkqWIc/vXlvWPZTWorQI70A90ILBeN6oGk+jkwI
 4JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1gtBV11Yp08tX+bShNS4fOnnqi4rnWJMiZDXxIw07HY=;
 b=ECSa649ljdLZzgJujXiLow/4TCW6/7AA3hZMTitQ5C7TjjfGq96k2hDJAf/MlrPn5A
 gN/xV0ykThrcO1TsSacEk3Q42oi52iIGPkVeuvjsZndNtx83Fee8E6wXbU9Q54HpIARb
 YXQiRLwTLPEs3kctzviKXThpTmJY4+DBmKqvyKLf5EBobsmwP07etz3Hg0x1HimBJSIr
 mPMIFMDov9HY/KhljVdI1ScZ4SBt52HtZNC36W3yIQcHtQPmHhBplk+O5demCiY9j9a6
 GM5AsZZqt5o7ZlhPkdz5OnP3upUG5+W8JZi7+J7ei0lLLiwXkFq2RhnD5cPMXuqc22xU
 UTRw==
X-Gm-Message-State: AOAM530bPMrx0x9QsnO5DHSknm3d9QC6iP7GhdQ5ISiSEBLmenQtLEvO
 PZInsTEiP9eeyKxZmmThqTs=
X-Google-Smtp-Source: ABdhPJziOmNCGHJ54lIjSTicoJLCkd9r6laOAsYHbZkU5k7hWg+BhWm5brJrvi3bGNBreHWhTzmaFA==
X-Received: by 2002:aa7:8058:0:b029:332:9da3:102d with SMTP id
 y24-20020aa780580000b02903329da3102dmr23071284pfm.21.1626653861877; 
 Sun, 18 Jul 2021 17:17:41 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x7sm1059847pfn.70.2021.07.18.17.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 17:17:41 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 4/4] ARM: dts: aspeed: wedge100: Enable ADC channels
Date: Sun, 18 Jul 2021 17:17:24 -0700
Message-Id: <20210719001724.6410-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719001724.6410-1-rentao.bupt@gmail.com>
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Enable the ADC voltage sensoring channels used by Wedge100.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
index 39c6be91d53f..584efa528450 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
@@ -12,6 +12,11 @@
 		stdout-path = &uart3;
 		bootargs = "console=ttyS2,9600n8 root=/dev/ram rw";
 	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>;
+	};
 };
 
 &wdt2 {
-- 
2.17.1

