Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B75B5A5E
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:45:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5sw4q9Rz3bmc
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:45:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbT8jl7k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EbT8jl7k;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMN5Z5Vy3z2xtV;
	Tue,  6 Sep 2022 21:12:33 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id y136so6064852pfb.3;
        Tue, 06 Sep 2022 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=SaAS/zEVeX9aW0q1fpyxO05gvDdBuKUtUdG6Vtt1kqY=;
        b=EbT8jl7kMqIb2ZrGnLPw+3qlMxE6yCNckMaWo1NvNsMrIQl1Pu8yXfIBVZRddVf5vy
         Sg0DMR9Qh/jfTKXGkx0IHViHX4qTk4eJg13Y5QgpiOyMpkeYiMoIN9XSP7X8NJZ8vD67
         MePeCLdqhJw7h8Zk3HDp8+/o401RMd9cyHwyjp6VHtIoKwb8mcKiN1LJaINiqPBiQ1QY
         VZfWh5TYG84VdHYHdnYa/u7fJ6afRlRwMukoPcSUxFadKOWF7Cce6mqp5E5lDXgNrgen
         CVIGIzbB4697b7eXhMVdswffK9jNDRVBN2Ut5xoo+N73uZiN+ndmu7rhKAgEG3P5uaJL
         Uiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=SaAS/zEVeX9aW0q1fpyxO05gvDdBuKUtUdG6Vtt1kqY=;
        b=tv99JeuNMOJtnucHp0Z4rOC3ZophdCU9WnXvrqVeimE+dNU/5FcSJ/9PJhwT3xU6/H
         dfg1iqSYr0DpVlcn0oWl/sDQuCnbA4Ie4QBlhQ6+71REeraDtKu/bXcwI8ej6Vqb7UG0
         Brk2CbUoVKFt8GERsZZYK9XYPqfke6yrRxBK3HO5a9Fe0eUYIHEcgfwlufaaDZfdzrG8
         NK+SXoSoyvwqrKJwA8QvIRppwd5PGjuxHVAuASIR+TkBdNkInUMfg92wM48YTzFO1a1R
         8o70Ql35Fte9u0aGOewsLvYFWtVD6QI67bTFLcal9TMQjqCSFgCM2ny26MIzJfuIMy5E
         7lVg==
X-Gm-Message-State: ACgBeo2xGQ+GGA7vm3R5NE04/TbKN2G5fDsXwQM9BX3FlJb8AwC838NI
	UO7Ai/uz+/cfeILOD/C5xdc=
X-Google-Smtp-Source: AA6agR4UlyMIdI6ISnbB4ysRbFQPseOYt+uq+FzYFyjbH0klhw1Ba+7fS0f2daADAZ3eNvNX7JHnwQ==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id 185-20020a6204c2000000b0052ebd4d50e1mr55860465pfe.8.1662462750183;
        Tue, 06 Sep 2022 04:12:30 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce1:13f0:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b001753eb66692sm9548734plg.250.2022.09.06.04.12.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 04:12:29 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:42:23 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v1] Update for Facebook yosemite V2 BMC.
Message-ID: <20220906111223.GA1779@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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

Removed NIC EEPROM driver IPMB-12 channel and keeping it as
"status ok".

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..2293f10e94d6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -207,12 +207,6 @@
 
 &i2c12 {
 	status = "okay";
-	//MEZZ_FRU
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-		pagesize = <32>;
-	};
 };
 
 &pwm_tacho {
-- 
2.17.1

