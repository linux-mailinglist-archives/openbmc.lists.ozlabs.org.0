Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84EF4D3EA8
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 02:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDWQP6F3Rz306R
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:17:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=y2R9Ex0G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=wangxiaohua.1217@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=y2R9Ex0G; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDWPz35C3z2yP9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 12:17:25 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id z4so3390328pgh.12
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 17:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ThvEe0f78Sd0BofX2grOe9zx+iQy6pAjyWGJ3RNuqNg=;
 b=y2R9Ex0GmE3vCzDK8reYs9cZc2D0qzHtSIlgcK7CiuBdzDHGm35uAYgCAVTPRS/3Zy
 dAFV7RV2AkYvPO1zWcG9FtiR/u5uRMyNPl2yqcDJF19+FZVCmdUOHDapcKwJMmY0Ky1K
 RbF2jfWbtznsA0NEiL3qdaBFSvxHe8PBvFL4rxpEMLkINUshpyIXJeOBGOFXeFa2kBrO
 zK1a4JU1ZLU9TbJPz1JdjOPkXHoLhJ/DgQLSxbf0oSbukZARcH5lerkFV+WWJbq6Segg
 AQqCycd5Qp2Tqx2ZgoOsdMR38BEuTutpK6qZAA+i/T8ukpRlUjKOY9bGgvxWfcQVu/Tv
 CAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ThvEe0f78Sd0BofX2grOe9zx+iQy6pAjyWGJ3RNuqNg=;
 b=VHkF66OnwwDRwhWW9sRv2D7AwsQrMjM9SSTvYTllNqqydpdWf0f+3UE33mGSEkcKIp
 zU5W2b7yLARpPj/Ssr5/jPc5K1BjezymvKrqOUvhhHUdfYCMRHgilIaSubziO6J152np
 GScMmqCKeT+GI1y1vBPuSiDW+w8PwzTNA/N80BbBh11Dw2C28+JePX3ceuQj2yAkjEaB
 4llAVuiJN5WOitp3GdT8VO1I1zLVjwc94JVGQTqBbVoz0+rdWVmWpwPDE19Zqkftkq0L
 1Z5ygu+K4v65FXc87qIY7+qOyakIx9/XM01ZVds3Qoz9QeehvWlH/mfigwjGOByQE2ng
 9NFg==
X-Gm-Message-State: AOAM530c+pENerFqEK/svEG3Xdc9Y5kHxkGkG+s2ZyCso57t7bkZLf2J
 FH22gkTuH8GNsD6OWY1q5GvbeVD1DFVRcw==
X-Google-Smtp-Source: ABdhPJxoJY3hz+X/kBl+CCKm02OXHKA61D7VD2fz7gt2XrHiYX+RQSOZas+QQUQrpaClprxnT/EhZA==
X-Received: by 2002:a63:81c1:0:b0:37f:fa5a:7383 with SMTP id
 t184-20020a6381c1000000b0037ffa5a7383mr2019782pgd.596.1646875040396; 
 Wed, 09 Mar 2022 17:17:20 -0800 (PST)
Received: from localhost ([49.7.44.136]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm3470859pga.34.2022.03.09.17.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 17:17:20 -0800 (PST)
From: "wangxiaohua.1217" <wangxiaohua.1217@bytedance.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15] ARM: dts: aspeed-g6: Add VIDEO node
Date: Thu, 10 Mar 2022 09:16:09 +0800
Message-Id: <20220310011609.439022-1-wangxiaohua.1217@bytedance.com>
X-Mailer: git-send-email 2.25.1
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

Add the VIDEO node back

Deleted by commit 645afe73f9512ee2
("ARM: dts: aspeed: ast2600: Update XDMA engine node")

Signed-off-by: wangxiaohua.1217 <wangxiaohua.1217@bytedance.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index c32e87fad4dc..3827e707f3a1 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -298,6 +298,16 @@ vhub: usb-vhub@1e6a0000 {
 			status = "disabled";
 		};
 
+		video: video@1e700000 {
+			compatible = "aspeed,ast2600-video-engine";
+			reg = <0x1e700000 0x1000>;
+			clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+				 <&syscon ASPEED_CLK_GATE_ECLK>;
+			clock-names = "vclk", "eclk";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.25.1

