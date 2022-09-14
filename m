Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF315B9201
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:08:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfGG1kK1z2ywN
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:08:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XtZV7oNV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XtZV7oNV;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSJcr4Cy5z2yQH;
	Wed, 14 Sep 2022 21:53:14 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so9260692pjk.4;
        Wed, 14 Sep 2022 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=zNTAPmubHkNZqERn8Ow0wjaXzc3lyqgqXMfCavEhJtY=;
        b=XtZV7oNVYofg92Yb3OX3u7WO49325wE9x86I1EwJeDLpMyFVEI6aWEHF+F2CxM6zGf
         d7b12ga77Yj10JAHy0RwKk6n+LzdcRI5lQKuI7JxBf9FPUhR6iDIdFQ3N61h64hS5Q51
         BcS19VL8tkNUrGVXN06aoxuBoXoxyNRSrgQw+71JKgx0E7RCkiKjC9J5ks0alNkEJsCE
         MaISpyXyfwKEldUldBEkOfhk3+wDXC1fj3EQmnZavxwK/dgQ1lR8cKAbI3w5XdnUu9Q6
         AKb/Bu5LNiuiNRtkZG0SwJ1EZnU9yAuEP4ejK8/L/5S9Z02Y/ambZRUlZtjwLioRqRIj
         vMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zNTAPmubHkNZqERn8Ow0wjaXzc3lyqgqXMfCavEhJtY=;
        b=lZu4ARLtIxZZhNauR8xDyz6nhZVpvcudUf3QE9Hnf2zlHHT2A0XluOwubmiDS2pSrl
         g7SV7QuSurnFBoq2iTEYC9ODH3iTcgWdsOod5PK4IMIth8Ill4WXGHMqK40vkZuLppzB
         q/MV5gKgAqvLeK9QxKaHzT79C1/SEnewuO1N+zzrMzabZ2iWR9FhGuk6Mwkc7k9uX42b
         4poNJqmfG9US1oEN6RQQmbV19D72lRHf3RM3YglfrPguGL+jP0qpJP5Un1u4M72i0zmG
         CPHr+egYVIQw9VLZlg2h/OIpp4Bl65rA32mYUE0sJI2FuDkkmXE5sBmCPoCtOqUJnZjk
         28SQ==
X-Gm-Message-State: ACrzQf1tAAtxcauv8b4Q7CQ7+qU7xAnh9K2THGNP5SduIuAwnH7SJ+T+
	Z7xLCkGU6gCC8lkL05QVyjw=
X-Google-Smtp-Source: AMsMyM63y+ZAyDVuiNe57GaYzJpX0zfKOHIMdAmdRcLvqUT30aH7rhdhTFkoPlNGah14pDgMX8U/OQ==
X-Received: by 2002:a17:90a:13c8:b0:200:17ca:f183 with SMTP id s8-20020a17090a13c800b0020017caf183mr4329771pjf.104.1663156392497;
        Wed, 14 Sep 2022 04:53:12 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce3:4f78:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id f189-20020a6238c6000000b00540e3cbf6c1sm9809854pfa.180.2022.09.14.04.53.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 04:53:12 -0700 (PDT)
Date: Wed, 14 Sep 2022 17:23:07 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3] ARM: dts: aspeed: yosemit V2: Disable the EEPROM driver
Message-ID: <20220914115307.GA339@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Sep 2022 11:04:43 +1000
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

Removed NIC EEPROM driver IPMB-12 channel and enabled it as
generic i2c EEPROM.

---
--- v3- Updated the title and commit
--- v2- Updated the title
--- v1- Initial draft
---

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

