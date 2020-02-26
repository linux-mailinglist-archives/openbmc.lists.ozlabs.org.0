Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E479B170C66
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 00:12:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SWmk1r9jzDqWG
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 10:12:54 +1100 (AEDT)
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
 header.s=20161025 header.b=UsV2z0nL; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SWZj07cPzDqlf;
 Thu, 27 Feb 2020 10:04:12 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j15so391867pgm.6;
 Wed, 26 Feb 2020 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9+yo/IkGPp1qDak3+DSJKS9yrgwDO9MzyJ8Z/QdBbKU=;
 b=UsV2z0nLsIGEbKk+qJuR2AIBGe0jT686xaOz+Cdvr2brfJy3XufK6vafPNeTlqEdDl
 jQXw2AmzgODnhKY0gRDpSTptStvAi+JcsBoxZkWq5Cp5rvx2Cyw7811czn9lgPCXbPFr
 l+alMpaOh/okFgZ7gLwQv6l26KL/gowRdHaagnpBbBdHWLebr2mJeo5CBncYNgKg/YAw
 L1mFBx6WmF7goijaPGuUM3HEn4g2hGUT95JK1Szpov+Mq8r0xndMzl2W8rBpJV/R8D6U
 EYaC8FaSPglTWvv1uwucNOhFn/YiXahwfghkgOMgLRA8N/NfaixNngtZZGA6LFOVryUu
 BDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9+yo/IkGPp1qDak3+DSJKS9yrgwDO9MzyJ8Z/QdBbKU=;
 b=OKuYikOWZ+yXCW4MiF61yRxq0xArdorwitLQGI3BE8XlJCX8Z4E2qzUYyuXS+2kK3s
 +tpQq7Iw3sZFEqkC6B7f9LqJQPE3yrvfYiE+SUjKWI/c7WioTZZfAeENrjoedHSrjSFX
 CajzLJmyM/Bz3HnbjPhbSSvR1qbSSicRPyhonVNPtLOEKtPyrvdr+dY7vsRsvXlDYE6B
 s6RqORYk9QqG1Kggz7Yu//ZtLADrSwc2jkBRvkyP1P+knf8W4srdqbvMCS5KJmbqfjXB
 MON9l1Ozqk/kTkWy7md6NlQtxq1Z27/TSsjJNyLLeILFu0I5wW5AkaZvTyLyfy7UJT4x
 dqEw==
X-Gm-Message-State: APjAAAU38vDcJPNTlQqY9mGZ4k9uvN1RT4jZJTclFzOz2Obr4A1YUhAl
 ACNECDnu4ut2zHZkeiNW0wQ=
X-Google-Smtp-Source: APXvYqwtmuVHJUmsqUiAmU2eGpc2/nC9gueRZYlpT1/CdgW1IuN3362bQTc2e9PKgoTMIdnagaO9kw==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr1028547pfi.131.1582758250273; 
 Wed, 26 Feb 2020 15:04:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::7:5ebf])
 by smtp.gmail.com with ESMTPSA id 3sm3912621pjg.27.2020.02.26.15.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:04:09 -0800 (PST)
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
Subject: [PATCH v4 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Wed, 26 Feb 2020 15:03:45 -0800
Message-Id: <20200226230346.672-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226230346.672-1-rentao.bupt@gmail.com>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
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
 No change in v2/v3/v4.
   - It's given v4 to align with the version of the patch series.

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

