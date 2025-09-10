Return-Path: <openbmc+bounces-617-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115CB50F37
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 09:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMC0Q0DVHz3clx;
	Wed, 10 Sep 2025 17:25:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757489157;
	cv=none; b=WbuFT5Q09iOI44YVTozYVrmj4OQT2NvkPLTEe7ZmzoHmU8fnAyPK8BKcCQrvIpfRYm7rb/ugqx3qmxladL18GzO0cWpMZufe5hnQyEWBo0Dj4AQJuUgAY/F7nFoxQDkH0rjMLVZC/T5loQXec8IpPnImTObKtj+PpQIbCpOCWweagFIyyZhQrqtSFmsGZZ+9cGpYYLA751BCnSPijOmpdwqMjziEOHGPybd09bMPz80t3Mp22yV4UIdrNnYXD7KQ40aYHEX3nDYTWF35eXV+vh8jbGAdnQFTy8JYeSf+Zn/ZDPVkXyz6OkHHWtJ6usyEfk3JAyQjVaURclZvSvT+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757489157; c=relaxed/relaxed;
	bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFT1f9vTFksnP4dHLQ4DlMCXiesY0vh6Xgsp0HLBlIc7OK/CXkxpGGm/iwbACHH1lbefooSZ5bBs3Zjry2IxzoOgD3Xf4f1m09qK5XSkmU5+AvnGt4vm6VvpbYkiM9fBPbFl+mCHqjE0TjHEyukLLkx0oSpJY36oyzRT06lbT1fmOnVIexgOPWH0cWdo4vcFsRZxiPVmQgDjaKigikPMOwJf3gyhEJwSj0ZMcfWB/dmIGsKiEt+SPYbb+8aqtXwvrxSWw4INGsLP8uPI/exN3qdRiEamjp2+W+wgWkN9HzyQInuwwJVEsLjI3GHNaQMe/oTaU0iPGUywDDyf9cqs2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=acPpdUmy; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=acPpdUmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMC0N22Dlz3clp
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 17:25:56 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3dae49b117bso5683353f8f.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757489153; x=1758093953; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
        b=acPpdUmyQSILqfiuybWzgVY4B/MY6A5AqRIzf1m3Kik9S5pluS/eCyml6Yuiy+LWJe
         Bx01qsiicGQYvRNrvAynnJ/FGg9TIqw8KTxX78GC6i6sWoHOS9ts8f77xeWVz8WrUCen
         /ot8JtaoKMRmL09bUkgquGsqD7PgkBop1v1D+UI8z7ekLQ5kuu5ZR1/f4bVZCy1uh52O
         ge9ddiMxfphKQ3+IGtv3ZX9c+lJGy1EqsD+IbUpvcKYc421p+oYNGVk3cOPmf6Uh24Zx
         pogLbWWjuTZ57yT3e5rUytuGSAMowDJ5vE2koVlL4dJQLoGSrFrYWPbTxqJvkxtQKAr6
         Lciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489153; x=1758093953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gl5EvZZ7qePjJl2BaNjHQ+dzPz2TAyeCpTwHy9T9Wfo=;
        b=vuziO7pN619V62F3WQ83nqWRgG6IrCre28qdqFkw09bfioTw/FbMdfVRtHhzVg5kHC
         aeOCtqXRhutvmAMGIdhWJ2y9aqb1dxtEL/Xz2GwwQAo6Doyp35IVj2Pffkho3aimtGUZ
         IvDVYy1zmavBpQTY072ImVeTjBdZiEyxgBDaMUJXD6DyB/nlBv6uUUOF3rnDT0mT19z6
         oN4+OOQp5DApuTo3DmcXwwVnsl4bve46jsrC8Ymsw2PWcfoxSYAiITJwPpoevZK8B4cJ
         6u5APQBylukAU23ECE7Ja4UGlW8LSojeOWoTAdTpFWae85TnfAps4ReL0tuFQmNSXcHT
         4ivg==
X-Forwarded-Encrypted: i=1; AJvYcCXO3/j0N/Flr+ArvDtxzMc4+MEQVpyqv4Ard8Uy92NZMMI/9b5vODav4VKpR39njro2VHrG8VFL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3/G7kxgQV6ljehEnaJ57EaZ63NJE5s7OVzdYzWfkuRYyk8xBl
	WMfQoxSHF/2833TNytXN979iV3Xdt5C6PpSW1F+06dQ9/NsjKabN7GTgE/ORr/VApwE=
X-Gm-Gg: ASbGncu8EtWWDUeGbWmJlG2+TMu7rwjfCWb1HL7Vt5h2Nj8wvR6zKnxKElR5TBp5igZ
	33hRzlOrLda25yomXGsgFFati0cthlQ1SoIo6RVOQ2kGOMBnmCJQQgVUgm4x7eaUiTalAKzf3uP
	w6EdaFLXvepzrNE4Zrex26u95C0gC+f+YAdhb/Ek3q29gFT/N8VImHy9/YDAoDc29pkBYDzH021
	g7dUMzZZbzorw0f6jY2IXTBGUXd66hy4c9eRkugokk1YfjKikulCqslLQ9Bsku2AIGHvlzHkXJN
	Ewl/4KhCW34RAoa04IWWJDq6zkSvt50kiuyw9N57h4nlj02SOU8IXohuFheZAWRGWCHwZJCEaKS
	kbcDxcCetyy5JX+PsvMVFv3xzN4OWl/qEjJzHqMU=
X-Google-Smtp-Source: AGHT+IFKdWd/MOTTMywYPHVw5YIDU4ZG0NZ3VmH44f3IGf1C3HlllFBC2cfty+fO45t0VoMp0fb6YA==
X-Received: by 2002:a05:6000:1a8d:b0:3e3:f332:73f6 with SMTP id ffacd0b85a97d-3e646257abcmr9958246f8f.31.1757489153027;
        Wed, 10 Sep 2025 00:25:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8236428sm16729825e9.24.2025.09.10.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:25:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:25:45 +0200
Subject: [PATCH 1/3] mfd: vexpress-sysreg: use more common syntax for
 compound literals
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
Message-Id: <20250910-make-compound-literals-normal-again-v1-1-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Hoan Tran <hoan@os.amperecomputing.com>, Yang Shen <shenyang39@huawei.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
 linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2AiYFCloD/4RAraZbO+KeVDtX8xcEqWOa6di+UP2k+Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSf8VTnO9QVF1tR30IBvEZEbYU3RFZcMzjLBO
 2ZoExM1MEWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEn/AAKCRARpy6gFHHX
 chgMEAC1UA+PKD6t6aGSJKb2WwHVdpLkaweVvLymwppdHKPAhq4e2ZXBwcfe2Xf21UCZiVRN5Pb
 sXKBL7TU2hsVJnh+nY1deWzVbeenzo8hfzM5je3+XttTa2Cd7DH6irICePcyIIAX9BlaWTAaKiP
 OzZfpmYjW0CygB3YYK5biWI3U5cbt8nLFSPKK/ST9iUNo1jaFukc6FipCfVUosMTABpdPQOqmxc
 EhVqSROfAU4VXT6X9L7y4z/srhtMFu2ufagfAW3sz0zMFPXiSOQcSirf7JyGZrRkwKN26VcH7XE
 SMpZQkhb/5/ccgPK9pObeHyNoII8VEhVuraYCkIOiW6C04U2HwPu6nfDQ0YdiITYx2gObHsjuKA
 dFyC1qARBLWkPpFha9B/WfdT4effL2+txlK5x8JKZY3ZYwbv+7kgyLjuwGt3fYKMneEXrd3GWwj
 Ob2IeaFzQUJplmbPWMbcU/LOW4JBy7aOXHImgg6G6fOJSUTexbqJflcFeQ6aqoJ+iMezbpCUVxX
 DaEUCGs/NEd4R7KcgIrmSebHGlPJot9MGekvnPntd4Xt/34GEdDUYMriQBIjB8jshF2MoPpqAbq
 MVDAbVmCWbgIP0Aljy2QDxkXCnS8MoTibWav6SmYomsrAUE1bXtWLPW/j4cOMWhP7q0xosfcc/0
 W2Qzs1Uc+uQvMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The (typeof(foo)) construct is unusual in the kernel, use a more typical
syntax by explicitly spelling out the type.

Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 9399eb850ca29b0a9d9be2173bee4bcf6888d10f..f49cee91f71cc2e6132cd3118dafd42a48821e0d 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -120,7 +120,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	if (!mmc_gpio_chip)
 		return -ENOMEM;
 
-	config = (typeof(config)){
+	config = (struct gpio_generic_chip_config) {
 		.dev = &pdev->dev,
 		.sz = 4,
 		.dat = base + SYS_MCI,

-- 
2.48.1


