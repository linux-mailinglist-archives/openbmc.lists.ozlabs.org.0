Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1D2D579D
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 10:55:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs8S1159WzDqM9
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 20:55:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UT8Yn+ik; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs7tM6M9mzDqn1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 20:30:03 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id q22so3476805pfk.12
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TMM7FRlCD8YfgT9nH5Pw055Xkr0/ntfYTn3LIAtEXLA=;
 b=UT8Yn+ik/8OWESdJcSvQ/Oc8zrhhg1LljtviMYjdMXDqGlQ9DwKBFOq6Gr5Wf5Hsu3
 KFppzMrnbNOMyXCQU5t5v+cSwf3X5aMjaHNy8SUnqgDILPdTI5Eoi+1cS+9V2/dMiXNW
 zaQJleuvkgMUonmEypT42bkCn2dvQt52PYq/AhT3O5K/jxpPER2//darWwHoiE/D/GDE
 AE9D5Art9xT5mWuP/nKCSwKYHpSg64fKSpiIKvA0lkM29NQbg5Zyy2T+zMhyppSHfvYz
 9Wq1OVfQbix0ilhtIdMza6O2sVIjDJg7oadGRaNFb+XDPs6HQcYJLsGjjU+e+OR/sB/v
 y+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TMM7FRlCD8YfgT9nH5Pw055Xkr0/ntfYTn3LIAtEXLA=;
 b=rtmyG5eyvw7/4l53WFeBksr3WP8eU9yt5DkSZ+d80oNIlCmbQ50tnYbJLFIapYgqis
 NWxz3ZpMbU2Ag456OBPTdGoSWcUS5fQk2r2x/i/NnffI7vgMz314oi0S1QtqSnVgtqYG
 C24AJyJGAkemWF4ccHecUB8jlGG0dIXO5uwxd/UTNozY6GZzbm6wbZSzBFeVpx/ft415
 Zi+CgWm8xsA4h5XPlv4DQfgpxLf/K5nACY1NJcKZNG9Hp/LE21IoA1FZ+6vuTdv+U6j6
 1yIIxbeTusCycc0D0MhrKHypHNYmvMSqZU0QqjxBMBmhoOUylpfpvP5VvnnxI5hPimLg
 FeTw==
X-Gm-Message-State: AOAM531UzvWV34JKuTZvaEBbfdEGiB6mG2Gtxumb61PZq+mK3N07jU3h
 k7hm6wCjQI9DGJ2BkuUv3o17sqD8SMw9q1HR
X-Google-Smtp-Source: ABdhPJy8KpNbujB4HGwPSYMJgHDpj9HX6rLYorgHAPHsIdk2p+WnoHKcC4d0hLX7b73wbH1fPychpA==
X-Received: by 2002:a17:90a:d0c2:: with SMTP id
 y2mr6583100pjw.183.1607592599227; 
 Thu, 10 Dec 2020 01:29:59 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id q23sm5726461pfg.18.2020.12.10.01.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 01:29:58 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: openbmc@lists.ozlabs.org, xuxiaohan@bytedance.com, yulei.sh@bytedance.com
Subject: [PATCH 2/3] ARM: dts: aspeed: Add uart-routing node
Date: Thu, 10 Dec 2020 17:29:55 +0800
Message-Id: <20201210092955.358-1-wangzhiqiang.bj@bytedance.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 30bbf7452b90..bf40e8960244 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -523,6 +523,12 @@ sio_regs: regs {
 						compatible = "aspeed,bmc-misc";
 					};
 				};
+
+				uart_routing: uart_routing@9c {
+					compatible = "aspeed,ast2500-uart-routing";
+					reg = <0x9c 0x4>;
+					status = "disabled";
+				};
 			};
 
 			peci: bus@1e78b000 {
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 4b1013870fb1..8b37182e8f36 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -311,6 +311,12 @@ pinctrl: pinctrl {
 					compatible = "aspeed,ast2600-pinctrl";
 				};
 
+				uart_routing: uart_routing@9c {
+					compatible = "aspeed,ast2500-uart-routing";
+					reg = <0x9c 0x4>;
+					status = "disabled";
+				};
+
 				smp-memram@180 {
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
-- 
2.25.1

