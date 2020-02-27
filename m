Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33719172C0D
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:13:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7kZ3S9wzDqvg
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:13:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kXDz9qkp; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7Yg1hrSzDr7p;
 Fri, 28 Feb 2020 10:05:27 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g6so418324plp.6;
 Thu, 27 Feb 2020 15:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6ZPTBc16gsRgOtb4TnzocOZ8irwL4eMbyH66vQS/GYA=;
 b=kXDz9qkp6qs92/X6p/L9WmMF6gPd5XAV+dtAGFDrOEy9BrsrFN3gdjeWoMBAfSsN5g
 rFjD+rXGU//RVwilhjvoVKaVw54OFUEJb7vPoeVeogqSnFtpo14Mv2FwW/tr3Kc4QhiS
 qSA3dkK+gn0cpIFRXeBqpQ+o7QpUbDFF8LsPg0Soyp+KeL+A88eeyOQ/Ejc1KQX/7zqA
 mxmWOTjyjEO+LbGyQjJqZ13AZ6cP0bg9vT5qU4RS+eBHIeGoaFSyJefheYkfWA+GC9o7
 k4bFt2X8UIKF8YA1FVZW5L+qk+LtfbA3dYqMKbp4XCcQuVNolALVXTSvDZYsMcqmNNrt
 574Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6ZPTBc16gsRgOtb4TnzocOZ8irwL4eMbyH66vQS/GYA=;
 b=m3DE782vzVnROPBhZTbaQXseY1UUnp0se6glGD+364+xHVNMNZXENyB1FnAwXAqE1J
 ijdc8dFdXfsXQs8635liaP3HvIg5bAuOIzXxZqusXQJm4XPazZzI4rJA4T0Er2k4P5mQ
 bo7aEfhGl40SPnKv5X3m5aihTBZ8SO5pUJSYHVZ7Gs9NsN0AOOGaTVyF//crfMPIMy+6
 DcbNVxikjVnhaYcFQ/pQp8BuqCEsf7b88V1iMlo+QhXC48jQl+1Vt84dlV3hAsn5mh96
 tMslF+JRHz4WfkMswlaTgHpZ0GHsQQj0o3YoKsH234aceeThcvUy+mh9bFmeHsHqiibb
 m9/A==
X-Gm-Message-State: APjAAAVZBwPpqhvRbrbILPUVp2IWcpdGT6PfbeTeWCuqU1D7g7P1/WNI
 ogXK6o2dASDQSoNHqnq4OWw=
X-Google-Smtp-Source: APXvYqwaQgE0kh+k6ox6GjNUfuX9eBxyJlL/7uMbDKwkNIQDzt5x2XGvHBsGHIJPgCu9HrHuIlE2Sw==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr1395149pjn.59.1582844724422; 
 Thu, 27 Feb 2020 15:05:24 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:05:24 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v5 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Thu, 27 Feb 2020 15:05:05 -0800
Message-Id: <20200227230507.8682-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227230507.8682-1-rentao.bupt@gmail.com>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
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

Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-endpoints"
properties to describe supported number of vhub ports and endpoints.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 No change in v2/v3/v4/v5.
   - It's given v5 to align with the version of the patch series.

 arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index ebec0fa8baa7..f12ec04d3cbc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -195,6 +195,8 @@
 			reg = <0x1e6a0000 0x300>;
 			interrupts = <5>;
 			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			aspeed,vhub-downstream-ports = <5>;
+			aspeed,vhub-generic-endpoints = <15>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usb2ad_default>;
 			status = "disabled";
-- 
2.17.1

