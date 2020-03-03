Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326B176F7C
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:32:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WnHN4NvpzDqgD
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:32:16 +1100 (AEDT)
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
 header.s=20161025 header.b=EAYDCY7S; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wn5m5HSFzDqY2;
 Tue,  3 Mar 2020 17:23:56 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id u3so840426plr.9;
 Mon, 02 Mar 2020 22:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TI3Z8YY503FP0KWJnGcP8fCbF2AkQr8pkKXqhxZsBmc=;
 b=EAYDCY7S4bhB2WRC9nvVwFPyK5XgymtItdht/AXBXjWl4G4vRkAEs0a89EbW9UXGJK
 4AMHFHAVVrfXI6FGDnx3vHen7TN5/Bm2Nb0g3b3G83Dm5Yba+V9doMYTV2kSoU0LcqSV
 xcX2Os7LGLf/Um4io/wG7mTQVJVlazLWmGGyJIw5Yyk/N5LrLZ7QB1B4VGhb4lViumw3
 UZa0wiEtq3EuGyFUBCQ6rsGYCpdkivrV2VtUz+Uxkh47VVeKg7EwReRulojx6iBgrnb3
 pSrVqaGSdo5F0T7KirZrS113pbsX+uxXRBVqy0ZVgnqvKvY5B9RDlEJjcdfYJ2x7axJ0
 /2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TI3Z8YY503FP0KWJnGcP8fCbF2AkQr8pkKXqhxZsBmc=;
 b=NuuJybxsZieYKB2Vd0/S/4KWTJlo+pN/RMziJgeQ/yQpIIp1r0NUSKl2BQIBKDTIbD
 7HJP9EJMg4NAoxLn3mhRlC2a/Tg2RYbahSa4wCc8AdPDqS4pyNFRf/7yrr2ZjWgYNnSM
 p8pogZxIWGSDvMSZZQ5H4vt6O+1X4BWINOkJdbxcx9BoKxgdRF3tOIHkJAd1zfNq7HGM
 JlsmIpUMvu4uYKZeNqj8l9kAkHqRjhjP6GshQmsm3QCNVoOnADax68RAo9Sb9DzKBnpv
 1RDxUelt+xjtp0j8Mv6BBOh0cy7erXtR+f2UmjghAHOgw6mn9msEn0622Y328fgvnzpj
 cv1w==
X-Gm-Message-State: ANhLgQ3OpIblrgyV3kXwnmc7vX/3Iag0CZcWYgcpqrS+rrWnTrCGTLxF
 Bhfxx0YK6nIVArluxSNSpwE=
X-Google-Smtp-Source: ADFU+vt9tRuqC9HtMQlJWQEOzdX43o3XQH7276qTwTP1ViurSta8NASB80y6m5uKUP303TtRaWHTww==
X-Received: by 2002:a17:90a:f009:: with SMTP id
 bt9mr2411146pjb.150.1583216634072; 
 Mon, 02 Mar 2020 22:23:54 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id k5sm7453526pfp.66.2020.03.02.22.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 22:23:53 -0800 (PST)
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
Subject: [PATCH v7 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Mon,  2 Mar 2020 22:23:35 -0800
Message-Id: <20200303062336.7361-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303062336.7361-1-rentao.bupt@gmail.com>
References: <20200303062336.7361-1-rentao.bupt@gmail.com>
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
 No change in v2/v3/v4/v5/v6/v7.
   - It's given v7 to align with the version of the patch series.

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

