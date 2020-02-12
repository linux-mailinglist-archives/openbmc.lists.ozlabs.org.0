Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E915B34D
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:02:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Htt019fwzDqH6
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:02:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MPAjur7K; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HtmD6Dh3zDq9L;
 Thu, 13 Feb 2020 08:57:32 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j15so1911700pgm.6;
 Wed, 12 Feb 2020 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LujJUjQ6vuT9G1EH+1pDyua8gOLBQgmZvKNk8hNJ9k0=;
 b=MPAjur7KT+S3e/RyXoOYVbFEWxns16KwM8HtVFLFbze0TsYdYTuesbZNNY2bk02IoZ
 ZuaV49erEXTa4kSHbtQfXsdMWALFe62RXBtBPNiaN72SZT5DHSAsJJi0NlRYragOnGYP
 1fbBF0Qs16S3kfMCkMEnZmj+ANywWu9Uc7HssHh+eKhiumdJbPzywGr6BjidTDNN2Pq5
 hTOmtt761oUh9PnqlgxbiXnA3hM0mvo/j2NnYWfrIFHsu5fRcvLGwCsnAk7dORnnYGZS
 B8YYjG/UyPLdCKhuShOuy3iHL+5DbTZhnpMJbrnKDD7PBqwIRxSKb+cCdXiRrYeSWH21
 ZB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LujJUjQ6vuT9G1EH+1pDyua8gOLBQgmZvKNk8hNJ9k0=;
 b=Z4V/oA2SSIvvj7io4wv7PZLobBxAFQ9G4gXO0irJrNjW37VlqupV/aMwDJuDGVW3uW
 YSG1o8McDk5kWQzhZT/YbuyobBfy7WExYe2zRBi+PsjY7LwC+TyuCFIQ1v0DbwKn2jaE
 TSrWkdTR7sds5XZZb/qe+ecJbO40NL3dMNgR19BlEUPTP6XJDIo7xn2vKrdCaUUI118G
 nrZX9g/z+/Gql1gAUag7VwL8PboZQnnqDUZ8gKabqxWM3HlymCVyK5LMskokqUWyDvq1
 nH5S0PLoel0so38xMaFTFT8Rl4T0RZeq8oIbr/3yoPSJnBtyu5iCjTKKH5tGIqmZcQkd
 CDvQ==
X-Gm-Message-State: APjAAAWCHOOvCnuXcZCxE44r3bYbUyNXXd/fvBh2LyxuxAJG7SBgsDZo
 J2vne28cX0WndiBNI7JT29w=
X-Google-Smtp-Source: APXvYqwxq2f7iaRQZmppOXJZwE6uWhP+IzhUAMdPNDCYHFIN2eO34CAldrpvS6sjiyK8XBjPcrxsHQ==
X-Received: by 2002:a62:a515:: with SMTP id v21mr10731828pfm.128.1581544649121; 
 Wed, 12 Feb 2020 13:57:29 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::3:533f])
 by smtp.gmail.com with ESMTPSA id r6sm214431pfh.91.2020.02.12.13.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 13:57:28 -0800 (PST)
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
Subject: [PATCH v2 2/5] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Wed, 12 Feb 2020 13:57:14 -0800
Message-Id: <20200212215717.9474-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212215717.9474-1-rentao.bupt@gmail.com>
References: <20200212215717.9474-1-rentao.bupt@gmail.com>
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
 Changes in v2:
   - None. The patch is newly added and it's given v2 to align with
     version of the patch series.

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

