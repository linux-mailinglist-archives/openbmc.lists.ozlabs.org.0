Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30A176F75
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:31:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WnFt4KhjzDqXw
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:30:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=APn8RafP; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wn5l47PFzDqXl;
 Tue,  3 Mar 2020 17:23:55 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id a18so877016pjs.5;
 Mon, 02 Mar 2020 22:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AJWVhyWnEHa+16Vui1urxy6sASoDRCYbuAsm+q77gXs=;
 b=APn8RafPWLC33RJLX6TCTiGRb/43wtYEQOud3T6k/8l5hLjc08tRx5C2qRpMKAeAnA
 ZPB2XlcQcSz9uRgyvmkWsVWp0jwp1wCNBPnad6vFVDVgsCX7qWcBNGDtydlsYjgG13Q+
 JPV+xK6HbibTroJ3PMREqbZCjC2J3dM2lgB5dIEzYSPexKJsny6YxFQDl4qg4QY8BST3
 rHz4Oc+wu/2kDQkW2NZYRd2BfOC2YUuymHLrN3DmnonUFyvtJXl59/oS/JHfUjlQE7xS
 mNtZFeAbRKyTFr7R2IqrYDyjfq/sqh8R3AhV/pFlCnjw23rnbfifPejKh/05DDLnH7v+
 WkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AJWVhyWnEHa+16Vui1urxy6sASoDRCYbuAsm+q77gXs=;
 b=i8dBk3T5yTRNRy7ZJZ7B37v1x5Rl1hVMWDUchxZH2ZH+VQu2/N7H2IiLduuypeGlyr
 IqQRqkWNDLvxI6AY7wn0x6vfyTlrATX/BB2VbMhuU4Z/QO4dBiFfBLGUZba7UDqzHF86
 nA1IwAzUfkUYRYpM0Sxew1L+QcGygY+ZfClAHnuLCpyrB2Dn45EX8IYwWNDaNF7S5VK4
 hKxSNP0WLu1SZukMzMbYjr/j9AHotm/VUhzGH1W/fL6+oEv4vuEmwEPcVWBWliGyR08R
 oOeuimzsPZpYfY4HBdgBACZb7/Fk89Z7FLlSHzVGApBTsT+81k/h4xwKtijJIVTZkSZo
 hoDg==
X-Gm-Message-State: ANhLgQ17bu3VpZP7+YVeF3ZGOjPAckzfuHUX2bxVhMbiDzTA5ZQhjESP
 c1pjsDrXYSXrzjwHf72VSjs=
X-Google-Smtp-Source: ADFU+vu9XHZAPJ11uio30zd0ulJFBhMoXCNmPsvqw6amAMfXgqEAt3txRdMXOBF/hDXaXINhU1En/w==
X-Received: by 2002:a17:90a:fb4d:: with SMTP id
 iq13mr2332424pjb.165.1583216632735; 
 Mon, 02 Mar 2020 22:23:52 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id k5sm7453526pfp.66.2020.03.02.22.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 22:23:52 -0800 (PST)
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
Subject: [PATCH v7 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Mon,  2 Mar 2020 22:23:34 -0800
Message-Id: <20200303062336.7361-6-rentao.bupt@gmail.com>
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

