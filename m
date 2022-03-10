Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF714D3EED
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 02:47:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDX574YZzz3000
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:47:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yaR92LAn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=wangxiaohua.1217@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=yaR92LAn; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDX4h2jH6z2xXZ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 12:47:29 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so3908371pju.2
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 17:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fOEKS38RMgszYvyOabpDPGI2pvf3G+fc2gEmGxJcZs=;
 b=yaR92LAnDTMv08DZtWaXt25mPC2ddld9nCnTjsQ1eewyBpJBCEllGRWNgUtEhq8UlN
 7HBBRxzQkcnyDDlEP5/pchFAZM0fjIR0kUJ3WAWr0KpdDnH1x66b7SyC4RXqLxim4TBh
 t3mJDwe+/vYq+xRXwoaU6fFhX6UfxkYUFyYNQbJZ+Zq0TvhngKFSycueVZIh87NFrKnB
 HsZ2eMx/u+3+G3odbUCuFRTu9ZA9ohNilbEkT13mX0IkqMrriLccvkTQqlwh9nwlP3gJ
 RhnGp+DKj6hs25QXhgFS50J/0x8onmoOugDs0qrl3SQCTwhjkoNkp0WLKaHcPJUPVK3F
 tq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fOEKS38RMgszYvyOabpDPGI2pvf3G+fc2gEmGxJcZs=;
 b=KAgvfVeo+UgJtHoICgqz4DECYT+E/+Xf22VEhigVTfqi439rFZbMaeW10Q+YWzGjB7
 Lt5gVynUlOSGOww0YF6hfFIgEE9EG7xQ1eEqKf7GRh6gHTS+l9XtCAeXCr/HicIMcCai
 ebmYOWxgRCi4lUgW3iET1soHKeXZPO6jqTogi6hQTIpaS1Viq5RB2u9RczKB9cf/FylS
 2i5puk15dAdP3d3JavmBUdmEuZAIsLv412+3EBY5D0lVaaDJSWc5QpqS/IfyOrJHo+r8
 kWmLsSBPAO1lfVKyggz1ax0kYJ9FdeIat/zWBY/1SgjQVJA5xEatJIzyiCI1g1ALVTKc
 oGog==
X-Gm-Message-State: AOAM531ZMDpIx5ANaOtcQgwayBakN5XB3wvTt7YiQrBE2g9QPshftpy6
 khieAF+PIebMyL1HuwP0sLNfe1L5HydDRA==
X-Google-Smtp-Source: ABdhPJwgV8eNh3hbKIwUat7JO61tlg6ENR482bsXQlzoO5dnk3DCc8a5AvTO3orRO/kACksjnVbssw==
X-Received: by 2002:a17:902:ba8c:b0:14f:d9b7:ab4 with SMTP id
 k12-20020a170902ba8c00b0014fd9b70ab4mr2419269pls.23.1646876845047; 
 Wed, 09 Mar 2022 17:47:25 -0800 (PST)
Received: from localhost ([49.7.44.166]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm517186pfj.79.2022.03.09.17.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 17:47:24 -0800 (PST)
From: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15] ARM: dts: aspeed-g6: Add VIDEO node
Date: Thu, 10 Mar 2022 09:47:20 +0800
Message-Id: <20220310014720.439813-1-wangxiaohua.1217@bytedance.com>
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

Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
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

