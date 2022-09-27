Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1AF5ED2F6
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 04:21:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgGk4bLNz3c29
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 12:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AhsmJYB7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AhsmJYB7;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McHqr5BmYz300V;
	Tue, 27 Sep 2022 21:45:26 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id v186so9421675pfv.11;
        Tue, 27 Sep 2022 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=uDOSqBZttnZv7P8HqZ8HwCRjONKPJ/QjDGFAByRBk1U=;
        b=AhsmJYB7vUwD9hZbhrCt5aKSpdDXmbhi/cFdz4w53f7B9pDA+aWfVC0YNBKnkzgQgN
         Y9g2/CUvucAlI1Oi7sxk9PGgJASvbBrcE77xLAp7aizn/yE7gFgsKP8uzwJVmirYdD1m
         cSom14nCDEq4dyUu8yqTvHGQ5+5kDfx12wt3E8tY7gbq6JSGGpNricFxp4H5EroQVp1n
         oD3vnt20CQqTQPaqqV90tEtFPKIgAwvLwBn+/cy1I8ZOJLAWkS/EkGhaQkJkrJoI1mzH
         gAS8O/istinclXcRWhQXomPfbshfyPfJp2QoOef66xnYDRpp/mMj7ibOkJFi2ln9TgGF
         sFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uDOSqBZttnZv7P8HqZ8HwCRjONKPJ/QjDGFAByRBk1U=;
        b=65p3QiUrY82Mgmg0phy9ZGFJTC3jnWTrlc6AMjagjsuU73FDtRmAnxFnLcOVBpfTmE
         r0qNthFXDyaDFAKg9bMga3niOIUdqj9VF2KuCfSzETuPO/fgtYUMtkClkXybwC+aPgcS
         XPU0o6CP2X89QiOtSPhwG1NurzDGIklvC4biazMGTLTpuUwQYPyfA3E6Rx8p8TKIRNOQ
         +n0iw+yPl1OE0jtqU3uyI64jpWO83sNT6SGtzQkz5RQzHW9okh/+0lxmiMQy6lLGB2VY
         CqEpa9Aq6HPe8WeVJukxGdnmDPZ4RspwsNplemcu2nwzMLLWMvQCINasut/+mNokmBI+
         OfeA==
X-Gm-Message-State: ACrzQf3tHlKhVViRxvmHW83DzpbkDbjBWjZt/tGP4mm7Ahps4c8tdOL/
	Rk7tFtn7gUg8KopNLinIyy4=
X-Google-Smtp-Source: AMsMyM4biyHOCvyZbMp0yHoN0xIAZYO1CLD1sBXnTujiyM7jdoD6yUh7tJ/NNE1wHq1sO87xZ017Hw==
X-Received: by 2002:a62:17d1:0:b0:54d:87d5:249e with SMTP id 200-20020a6217d1000000b0054d87d5249emr28803450pfx.14.1664279122155;
        Tue, 27 Sep 2022 04:45:22 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2409:4072:2e86:dcf8:cdbd:fcea:ad98:effa])
        by smtp.gmail.com with ESMTPSA id p6-20020a622906000000b00535d3caa66fsm1476441pfp.197.2022.09.27.04.45.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 04:45:21 -0700 (PDT)
Date: Tue, 27 Sep 2022 17:15:15 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v6] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
Message-ID: <20220927114515.GA22344@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 28 Sep 2022 12:19:09 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added IPMB-13 channel for Debug Card communication.
which improves the readability of the machine and makes
it easier to debug the server and it will display some
pieces of information about the server like "system info",
"Critical sensors" and "critical sel".

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
v6:
 -Fix the commit format

v5:
 -Updated commit message

v4:
 -Resolved syntax error

v3:
 -Updated the title and commit

v2:
 -Updated the title

v1:
 - Initial draft
---
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..84236df522dc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -215,6 +215,17 @@
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	// Debug Card
+	multi-master;
+	ipmb13@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
 &pwm_tacho {
 	status = "okay";
 	//FSC
-- 
2.17.1

