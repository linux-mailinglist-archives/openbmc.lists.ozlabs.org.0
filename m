Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85822161F80
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 04:20:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M5gx2hQzzDqWK
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 14:19:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.193;
 helo=mail-pg1-f193.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X3oSrPHw; dkim-atps=neutral
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M5Yn0WjVzDqSw;
 Tue, 18 Feb 2020 14:14:36 +1100 (AEDT)
Received: by mail-pg1-f193.google.com with SMTP id 70so10207907pgf.8;
 Mon, 17 Feb 2020 19:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZFyQEdWxvwBxjLzrFGGVsFOAAPD8i2AvVgwQpt25K/U=;
 b=X3oSrPHwn3fmMokFFba0Psbe8GMZM/aNgleo0TXOkMdoeXtWOcmIUiaN48N9xLIRgN
 +/7TJndN0fzeZchT0RC+V9+oiVP9gQxJZaj8sB1/lY9Z7P/Uj9u6q/nH+saF+TlS1j1m
 4f1j9YqXpQMqpy5y1jtLa0Z9/NkHgGFCVacAgly/rkKjCfwxQttJhYIxLF6oNRZkGJbz
 anpuUKGGk6JhsH1q+WNWDfxlSheexwjId/xd214r1gc75NKJnPRlzKtu8BgqC7PkXz4b
 hQVv48DPxDYLBG4Hed5/t7aSZmawvUEF2PmbUPHWjoHl4q3WlcozknmU4M3PE6cS8kXJ
 tVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZFyQEdWxvwBxjLzrFGGVsFOAAPD8i2AvVgwQpt25K/U=;
 b=Kqk+yQuI/Yh8E3YXG2pmiZkO0c0NxrJMgAyYMOzwsiJA5QjzS4QgVjTdqDp7K0UnY8
 AEOHUyUXbOoqnJbCwD1lYfiPG65bUNqfKqg5vn5Fbu9dGjWTQ/ySWed/g1t9Z+Koua0v
 VqmX8+EIsXuqPgU4atdxLt6q+GoRL2kztVxlae/4rJr9GYtVrvOILHM1ogabqjPzlp7y
 nOAa6XqRNH49A1WjvnUdqvSTVdRKQJoOR1IdySCCwM3G7iOUe27x1HeqYyUss/gcpUEj
 o0zJu0lSOJfvTJc5DJa8N1+IOXkWciIPv+hAUQI34arxAE6Gff4bTY2sv5a+now53cCg
 sVxQ==
X-Gm-Message-State: APjAAAW0G7kMBkJ1qhkjMr2gTolxMu8IB+dgD3weiJPfdXOcFGr23g5A
 alP03Nv9LLYzGfn72VPzeZ6BNPKEbc4=
X-Google-Smtp-Source: APXvYqx5X191Us6wKiAbBYcJ+hEwCRwb0WAXLxgCTj5dGYTmWJiFy9sNG10WQKcON5Vp5efq+phbkQ==
X-Received: by 2002:a63:ae0a:: with SMTP id q10mr20715662pgf.178.1581995613715; 
 Mon, 17 Feb 2020 19:13:33 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:180::6f94])
 by smtp.gmail.com with ESMTPSA id b18sm1812595pfd.63.2020.02.17.19.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 19:13:33 -0800 (PST)
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
Subject: [PATCH v3 5/5] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Mon, 17 Feb 2020 19:13:15 -0800
Message-Id: <20200218031315.562-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218031315.562-1-rentao.bupt@gmail.com>
References: <20200218031315.562-1-rentao.bupt@gmail.com>
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
---
 No changes in v2/v3.
   - It's given v3 to align with the version of the patch series.

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

