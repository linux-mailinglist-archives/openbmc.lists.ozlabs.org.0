Return-Path: <openbmc+bounces-174-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DBAD6433
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP10vcVz3bgV;
	Thu, 12 Jun 2025 10:01:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622478;
	cv=none; b=m6Jnr56y+jGjZpis2CS7VB2Crtl4DGnSzMTHuTayKv3dlfCP2MzfU9XjHJXIMV3v4/s4u/zjCyghi6MMWLbfNMyNHefZw6792mn60Q+g3rBBw8ha43Rs6bR/+udGjgWrmxpp8N9ct21wDhueEPsJ9cXKqdjnhoohiUISChmvBZo0fl57xRAXaVBL0G1MDCHXCZExshmEb2JNtwm1lBqqpxtlZfU65UtY8V+4sBY7XaxTJw1mv+qtnROwlD6r+XySpD/JhBtv2r9+KpfY8Vsav040B1iikuvU/qBtE1PhWExVzTzg97LEnU9JXENX69YqfgIxY2nnHP0U/wqXlh+IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622478; c=relaxed/relaxed;
	bh=XnLFUD39k75RvyOsvSUpokGQQJJEnSjbraGrbRyjjYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkdSHP6GYjX1iORfbSHFKxpVLi6G7fNyyNc0SMiMzZEWXcrLRo1kVdBUpVR/dzz6mLCcHJF27Dy378AZUjjRju1Z+vrIWnmBP+qepnfCdXfJtz77Xdtu+PBCqV6IPHRxQhKdQUWFZZN2rOR6lh0qchIT0vcIIriPVxY5QHrrPnn42TlGkxxZpWavuQ7NFZefKhr1tie5tN1117jQC9GB7MFsoCwSRyZn5I4lW0EXGHkqxZXIrQADrjuO4vdEkeKHOQfMK7sHJuBmpERulDHcgx1MCvvyAMnWaBgUCHY0mqZSjCRxD8jKQSeOmJK6jBDjCk721w/tLvyK/D66llpQQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SvinluD5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SvinluD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFk55sdnz307q
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 16:14:37 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a528e301b0so26358f8f.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622475; x=1750227275; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnLFUD39k75RvyOsvSUpokGQQJJEnSjbraGrbRyjjYo=;
        b=SvinluD5ifbmIlZNxB+wFSxpmyi5vZziuEQJY8i78qMqIAmWmfopHDvQMzkNR5tKNv
         Eq6y8NR/bIBNk18xihEqrTNCZ17MC1vsRzqn5HDi1rsWF3m6/Jv204wAfwmv/TK0xnCV
         8cXuwEzIGVRmPC5Vl+8atFHvBTYdC2jR3w5Icl2tKpIKit+hhUpWl1XOhTMPvGaqJTqr
         NFIKOtaTBxgyBF4NPzYmAVPLTKJV30tMqQF6mna4GHMtJJW4P9WQ/yhnu4xPb4o/G+kW
         Mp67LUOLY+nxLvN0CBWDEyT+CzIhVFB6gZ7T/pz2k45sFXexRiWcikiLBuYMJmCZTOWV
         jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622475; x=1750227275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnLFUD39k75RvyOsvSUpokGQQJJEnSjbraGrbRyjjYo=;
        b=wNtidsIR0VUrFawngooBgjcY/d1c49b9i95hvZKksXlhNwRtKFNwdsZ+NtCEj/bjN/
         WCq/HJ4+icXrg0ln32JnaFwCx6BvXNnsZD9QYQxB5BqxDzZzYxklNG8PusHNaMZU6c0l
         H41gPr7LLDO6yH7gkDp4mXpupJSDYmpE0Zj9dTOM4I90n9ECnHODFmMXUJSoxGNv3Yhh
         gtSDS2AH/menfeYZrSnHbaNa4t0gaJPQjUJ+xJ6ndzAcNYW7eN8d/o3TZxb6Er5E5LVt
         Os679PRFLluR0RbZdBfazPSxHaTD/b/LVBjWZLRJufoOGhW/oEaqFMkqmwSa8MZ69Hp1
         3eZg==
X-Forwarded-Encrypted: i=1; AJvYcCVtwHooAZB1Yr6fsyy9yQ20RVtF3Y9ma4IwjnmF3ignB9o2MCK8hPXwHZcta4rL7ie2MVNRqA/u@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAfOyV52KylU4XR7+wrOgCnyJWRIWF0h9RM6deHAqknAjbWnVb
	vxiwbFv9n/t5mDGPdQgetdfMzSo4+HK6t62WJW6VJLzzxorg53VhoLMka6gp9j2vdhA=
X-Gm-Gg: ASbGnctZmMFz7V18CJcoJDImkeAyQEgpvIAo2QoCbRDs2Zd6PhA1PKme8pXnCnISwyp
	7Tf+Cgz/ngDytLwwkSSy2kYnsjwz1ERfA2bLat0yxt7AWSDSmpD4od4wMJEuiCu/M8WgeY/MkXA
	3ywM+VhHhPzf6+TE6IkjePfnQRKVjWO/CXj2Gl1NQMVbeEsD2voqX2xUg9QNdLcwZNBwWAqzEEr
	7RkCkY9kX0CJyz9YnrIRHTEAzTFB4Z2tRIWVk/7fOTnHCVhCt0eIgz192Z2aGDRp75JqLqZRHwT
	oe/o4hz1WUyVhu2So89yIpLpBIHNp4nKdJuISstCziZFNkCw5l2f2+TLvd+rFUsTc6ovPuWIRev
	5gNjG/VgNC84QWMOi4Q==
X-Google-Smtp-Source: AGHT+IGoxFPnKSOuXs5+P+w12UCxO7i6IYKkquyOTs50YDw16EatHwFgkdZHgJxhBLiIsXS+NYIhbQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3a55864e245mr501034f8f.0.1749622475009;
        Tue, 10 Jun 2025 23:14:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:39 +0200
Subject: [PATCH v2 07/17] pinctrl: bcm: Constify static 'pinctrl_desc'
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
Message-Id: <20250611-pinctrl-const-desc-v2-7-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HD2ybe35U69JMcN2LPl+PuBZpABAAgcl4909AF32gW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6k2VlhnFI+XkL8KeRAOaTjFqEm1OVlmncWS
 rPXhB+tl7qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepAAKCRDBN2bmhouD
 16DFD/0SKqg2JC8W86kMSCJYitbKb6yqfOLns9qNtePf4wdTGlJeDaoc3YKlMDnvNZ+pOyKNe79
 ZvEAFS8hVTNcrOUlY6yoViXS+fdnvUzZRSKrhwnbFhGYdGsk4U0RI3BVQUJLJ1r1tpUniY8JPpa
 F4B8J8VlmdcwPlmxwdxKok+jE4TmbO/R8F5+2zqopNLDST0OktDaB8zVfMI3hU6EPMg/s5oPyzW
 qRhTjQ8G36rZRsT213YTjHbevOB7qDNNaqOZz+3/QfKuSsefkxdkJYIE8K5DvIB8z/dnd488oST
 wdobH5rJp0reL06Fu09kW3MCHDQoeBLfqNkbPm3QQdg/tWrON6ZB6PG4XcLA+QjKHWwuP0n5Vjz
 h1guP+Qfja/he/U/Be3awTAfepm1GoPL4rvF5XUdl8DblNAk7dpSyv8kLbvdYWn9ECWWgn7Kizr
 CI2vBrL/FLxPgPfqBCgAooN3zOV5IZzvcbEHxkd6hbCWAedVfM3YyCE9PI5iOok4s+hA9iqR7v+
 LoV9gliP0O/k6QKsu7CkMWOGtB/SDySHFkkxvMSsArd155YXJubuzfpRmLRD+9zGymyt3rbWxSS
 YvBomqxCg5/kd7H6bxQXfQVlWr4GCJLRsUvSB3kx9X6uRXHHY9dMK29lOnz1htG7rmxKXBGOWp+
 apN0cq+tr8+M+1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index f190e0997f1fa9fe8bf07fc3ae5700bc721e1651..12f7a253ea4d5bd0af5dbabc320fc2df32172e4f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -456,7 +456,7 @@ static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc bcm4908_pinctrl_desc = {
+static const struct pinctrl_desc bcm4908_pinctrl_desc = {
 	.name = "bcm4908-pinctrl",
 	.pctlops = &bcm4908_pinctrl_ops,
 	.pmxops = &bcm4908_pinctrl_pmxops,
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950bef5c420f1b250d48fcf6e907b98f..03bd01b4a945adf72445576a8a111f3c0637e095 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -192,7 +192,7 @@ static const struct pinmux_ops ns_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc ns_pinctrl_desc = {
+static const struct pinctrl_desc ns_pinctrl_desc = {
 	.name = "pinctrl-ns",
 	.pctlops = &ns_pinctrl_ops,
 	.pmxops = &ns_pinctrl_pmxops,

-- 
2.45.2


