Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA32D6EFD
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 05:02:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CscZM139qzDqnc
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 15:02:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KRZ/FMrr; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CscWK39ZKzDqnT
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 15:00:13 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id c12so5779213pgm.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 20:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YKU5cakq4ZOMMgsFGkzcwvwsUuYeyFxZiHTQd8S3kjo=;
 b=KRZ/FMrrTvGA79/Bao3GRvqef1VkAFusgKCsc55QAy0gLUNfSXxpsbj/kN4dqnXkzI
 g9peDlhL2u52DbQM1uFHAyK8JU+4q5ifi7hT34HcibBXCh8Ih7Oc0nbdSLk7FbsF/Z4b
 qcWb7CnU8D/C5YTFKwshiglqOJABuouetLS+ZQLAfM5IZH/fcp0V3QnLZV3G2JdUR0WC
 OiVOi2OrPpLXlXjIzKN3ji2+Sp+0jY8GUubM4R8oIxn79lLfji8oIY6IE4XOkKHYcPpg
 2FaS8MP8zUGF+F0MidxhvQfDedMyC/xDdZ5rHW8nLk9lLOu/rTZN+ge8YV5+k8ui+p9F
 FB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKU5cakq4ZOMMgsFGkzcwvwsUuYeyFxZiHTQd8S3kjo=;
 b=XZ+DlX50E+qfVhNUQoDo9QbjmcDXNkkdS7iraXO0IJNjZQDW2BFv9/qXBaP3Aw/+xE
 09QRPDHK4nWr0NJWZGW8/1knWPY6Eok7P6EmeGRIYc/sG2DkaMSv8BoR9PqkxlyQm28v
 QxaINcY+bW7w/pa7VC9i+FsxrkRrjXedYvR3Ia/HeheKXZ+KubjR4my6NBuFmiOvryOX
 DnlMRlTb2Y3VyHu/MS646/l5vVIzDYASyF0jfernoq6aEne0MNAeFfTAy6dZjtCmN/Ff
 FvPPO3a9mwDaJzMdWE7Ckixm2yC3KJc4MzcDmFneWpedJtTEjcSTer2OJxFdQ3pfxlHy
 U5Sw==
X-Gm-Message-State: AOAM533s+LJE4ybNNr2ADvgRStPg3zBUJUhpgz1Zz5pM+qolqQQQ5NVf
 VXCSJqdRgJa3OzoHYW22PAeCwg==
X-Google-Smtp-Source: ABdhPJxZxfw+mHwS5oEwbxoTVto2uyCx3b5x72lycfDZ0std0s5/73JJU7DaNbOZxA1gHsTROWV5hw==
X-Received: by 2002:a63:6442:: with SMTP id y63mr9818506pgb.35.1607659209897; 
 Thu, 10 Dec 2020 20:00:09 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id j15sm3076120pfn.180.2020.12.10.20.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 20:00:09 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com, yulei.sh@bytedance.com, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Subject: [PATCH 2/2] ARM: dts: aspeed: g220a: Fix some gpio
Date: Fri, 11 Dec 2020 12:00:02 +0800
Message-Id: <20201211040002.1030-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
References: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NCSI_BMC_R_SEL and EN_NCSI_SWITCH_N should be active-high

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
index 3a4bf3db400c..8baefd2d6962 100644
--- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
@@ -912,14 +912,14 @@ fan@5 {
 &gpio {
 	pin_gpio_i3 {
 		gpio-hog;
-		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_LOW>;
+		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
 		output-low;
 		line-name = "NCSI_BMC_R_SEL";
 	};
 
 	pin_gpio_b6 {
 		gpio-hog;
-		gpios = <ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
+		gpios = <ASPEED_GPIO(B, 6) GPIO_ACTIVE_HIGH>;
 		output-low;
 		line-name = "EN_NCSI_SWITCH_N";
 	};
-- 
2.25.1

