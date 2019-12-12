Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FB11D9EA
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 00:20:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YqXY5Q86zDq9D
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 10:20:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bKH9jNlx"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YqSV5VyxzDr86;
 Fri, 13 Dec 2019 10:16:58 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id az3so271449plb.11;
 Thu, 12 Dec 2019 15:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6RmPSySB6yaq33KtHs8XUNhrbCfHLQh1/I6bnoO7bOU=;
 b=bKH9jNlxo+A2rwduZywwg1nKEr08Ppi/z84u9kTTiy/LU/3n7XeUEmRWWF3XFOuExZ
 D1Y99V2zbwDgmJN06eBZcmpdm+ytzlZlbhWa2Z77UW8yChFuuc3dhaS0oK8KNUrIrXAO
 S/O4LVHu/glTYi3b+HhiU089OEeV7M+WZU2N2Xo/9x/llfsErnkx49I5oCwuS71MWLL2
 WGP5adS0EUc5+N5RcpLO9tr7vnhs5DKa5EG1fM34Vdc80t8Gu+vtmWn0/C+8S8U1OjSv
 FN/J8dGBvcE+VhSYnQholdvV6D/MkzdWflJ/wjbgGE5sV9CEN/v5mqS/x3SIWeSb+I63
 GP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6RmPSySB6yaq33KtHs8XUNhrbCfHLQh1/I6bnoO7bOU=;
 b=ubmG+RUeExsAoREBZGM8T3SXffqijIQurlNOxTixwXNFlR9+6hf3Dw1hAcMdEyMx4K
 /WP55ubU/ZKi26Udh667zYwA8CSRi0+PRavjTX8148q7rWha7zoFkLlJhQch3BUu7vER
 WlfgvNVvkIG9SnuBoLCbn7EUm6WmQ/sEL5Bq3jH7QDeQKukqzL6i+yvF1qbGtqLY4iiv
 35ePzO0kelGsCVxo+aMUvW615EQmwYOV/xow11XdN8naDJRZYHkHQRhoaN4f+TsRYvk1
 GMUHdM6NUjPOO1UyVwn3/78sWx05lXb6eVR7OiJ0JzevaEfpNMFqDnkYpnAsHSimOD4m
 OkAw==
X-Gm-Message-State: APjAAAVrePII5AME+xbaibkFtFvsdkhpFDm6O6+18hd5Fg4+pKlwGzdg
 YF3+HDUvpsnoFKCOuhThsKA=
X-Google-Smtp-Source: APXvYqzMJkjYW1LUjKBbYMB1MnB4ShrNNsXMvWSY/vdGaL1YzXcdKJXiZJDWzU6pYvq9i5fxGyp73g==
X-Received: by 2002:a17:90a:d807:: with SMTP id
 a7mr13304783pjv.15.1576192611097; 
 Thu, 12 Dec 2019 15:16:51 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1072])
 by smtp.gmail.com with ESMTPSA id ev11sm9423307pjb.1.2019.12.12.15.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 15:16:50 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ARM: dts: aspeed: delete no-hw-checksum from yamp dts
Date: Thu, 12 Dec 2019 15:16:22 -0800
Message-Id: <20191212231622.302-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212231622.302-1-rentao.bupt@gmail.com>
References: <20191212231622.302-1-rentao.bupt@gmail.com>
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

Delete "no-hw-checksum" property from yamp dts file because ftgmac100's
checksum issue has been fixed by commit 88824e3bf29a ("net: ethernet:
ftgmac100: Fix DMA coherency issue with SW checksum").

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
index 52933598aac6..fe2e11c2da15 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts
@@ -35,7 +35,6 @@
 &mac0 {
 	status = "okay";
 	use-ncsi;
-	no-hw-checksum;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii1_default>;
 	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
-- 
2.17.1

