Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8FA172C1B
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:14:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7ls5cw8zDqvL
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:14:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QutkKvm5; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7Yh18SrzDr80;
 Fri, 28 Feb 2020 10:05:28 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id y8so403442pll.13;
 Thu, 27 Feb 2020 15:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VMrpm+GBoFpUrGbFK1mApjxlqzffVTj/tMTENO9WLbo=;
 b=QutkKvm5robSH6hAa5Xt7Hj7Zcy6P3FiZ8FYe/QIWDo9zihshyynnmsHT6Ca9ZjOeU
 tfEh1iXGgwjmh4B6z5ThkuglNDNVJ0wI9KIq3xBN+7khYZeNQEYc5Jrd4PYyRkVI7cWM
 ZhOJsUe+OPCchh4fSbR4W34FjpAjhLi2zLyDHSIj3CxkGIcVyndH5XaGZmd2zPUZ1Vwo
 StJ2lR1GEtrJPUVx4q5L02E7Zf2s+/r2bIh+TbVi5Ca9jd+bxX/xWPxQJy2pHMaLdzxv
 DySMOwi3yIoDNH/PexCONhd6epK6+wuuve6KfXhJ/oHdEEyM7O8Oi45laz/JXO19Nh1J
 Jfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VMrpm+GBoFpUrGbFK1mApjxlqzffVTj/tMTENO9WLbo=;
 b=Y2L4WS/7NLv4670uwA/k0hK6NxqC90hXPJubq3MMIAQb42eCGzSiCd32GINZgg116x
 Zpd+zQRF1jlcA8VbSO6vGquBXPLVWw3p7B4ljSBgCi+9kt2sbwSg0sB/aQ2+FMuIo0Jp
 +6bNERMWG7qnlilT6UngbEsiDrgmsMuYwqw7HKlibhxgEBJ9wospAC+4Ilsm613I86W2
 SLilw00sY82araFoa0pT6WdFOC89klGGzeTPgM/Idsdczd4pyGtJMc8ddQPvadEEo2Na
 MaY8EzVPZC0BZ+0uKjhXiOeG/Tax4mGN895Q+2Q3p/1f4H1vQMI8ZgGdnKrFNPI5I1mo
 4ZXg==
X-Gm-Message-State: APjAAAVlTTVh8hZk6MesMH1qwG+8Ff2GbSZtXyRIR4m4E8Q/eKcLqJsK
 bbSO866eBRkcIQr7DSbyUYQ=
X-Google-Smtp-Source: APXvYqwgWS/gVih7kVY03mopBRkpenOgLxxgiUgs0jIPy2qu7PEK3PIFGXT2xwolufGS4P55SEUsgA==
X-Received: by 2002:a17:90a:5d18:: with SMTP id
 s24mr1244304pji.141.1582844725992; 
 Thu, 27 Feb 2020 15:05:25 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:05:25 -0800 (PST)
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
Subject: [PATCH v5 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Thu, 27 Feb 2020 15:05:06 -0800
Message-Id: <20200227230507.8682-7-rentao.bupt@gmail.com>
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

 arch/arm/boot/dts/aspeed-g4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 807a0fc20670..8e04303e8514 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -164,6 +164,8 @@
 			reg = <0x1e6a0000 0x300>;
 			interrupts = <5>;
 			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			aspeed,vhub-downstream-ports = <5>;
+			aspeed,vhub-generic-endpoints = <15>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_usb2d_default>;
 			status = "disabled";
-- 
2.17.1

