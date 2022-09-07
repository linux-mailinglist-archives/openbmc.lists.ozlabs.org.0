Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2B5B5A66
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:46:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5vJ1Q7sz3blJ
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZAMD8mIt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZAMD8mIt;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN2DQ56cvz3bSS;
	Wed,  7 Sep 2022 22:50:44 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id j12so2081710pfi.11;
        Wed, 07 Sep 2022 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=jPyKiHK9Z1f/mDgcNl32AxqjgUc4Ptqqz+HyhxKfYq4=;
        b=ZAMD8mItqJ7YqDQ3bHcwDY/4B6fkAILhnL2e+pz66KKPOOfXtKhThy+IvJrsL+fV0D
         8Iffyu6DNtCG9aFafbX7HOsZnYXYDY2W2B2A/5eBzzKxZNJXa1kK73Uv1GLSiTb8SLn3
         gn3PIIYfJd5/ubD7E3EGesaQaCBk9EJbqpgwnK2VqaCRzFNWB0U0A0YttBLYdUIf475C
         DsVWovp/Gv+xDYy9R86dagC4WH8FBlBg86mYLdLJYaUU52bzC90dN3sCSyesAL+toXYN
         sJaSz7l+Kz0N5yOiLI/5a6JzydcSFLzclETpmVHhjDMkvYj1UNNsRJKbOMWAATqjAji5
         Oxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jPyKiHK9Z1f/mDgcNl32AxqjgUc4Ptqqz+HyhxKfYq4=;
        b=WtiylSomprFcGK/3duUIRe970q37Yf9PbJ4xTTL5GgV9G53+fN/YA57wSn86xIriuj
         qlqbkVW0exciBXUbnHcfWuaWi3x6QPaZHAYUJOX+gIceeD9B1x8n5apjvnychseq9szO
         TvReQHMa/pXlHNUIpzgxvOHWXseMRevtzD5yDmifFNz5PL+G3AzWxn9naRalHSURtXQ4
         a8r44JzS1YWFyLhjXTbNHUXCZyh2S0PhOp5KggfkJpTG9JEr23DQUlQH2yc3sCtRG689
         gwmkLcyv1S7qqqcyFNmuhJMC8YozRTaKoOnPenKH8urluSCLLmmm9W7XMfNgmL6sMIFq
         mMmw==
X-Gm-Message-State: ACgBeo1AyJOcdRLL2VrUVR+5Zl0A76/bQN06/QBHG7mUxTNNa+4VxRk1
	PIOg1uyV+emr3sslgqLfDoA=
X-Google-Smtp-Source: AA6agR6wqTSiC4quRaCw4iH7eVY9qz1KHmrlAlH7dE8ysQ1Msha5l8j12ZXgbQ5wEWXPGl9od6MaGg==
X-Received: by 2002:a05:6a00:e85:b0:52b:5db8:f3df with SMTP id bo5-20020a056a000e8500b0052b5db8f3dfmr3966989pfb.14.1662555041806;
        Wed, 07 Sep 2022 05:50:41 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce1:13f0:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id bj9-20020a056a02018900b0041bcd8f3958sm10450967pgb.44.2022.09.07.05.50.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Sep 2022 05:50:41 -0700 (PDT)
Date: Wed, 7 Sep 2022 18:20:35 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: yosemit V2: Update for Facebook
 Yosemite V2 BMC
Message-ID: <20220907125035.GA28461@hcl-ThinkPad-T495>
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

---
--- v2- Updated the title
---

---
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

