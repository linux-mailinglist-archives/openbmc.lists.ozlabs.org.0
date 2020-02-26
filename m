Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B675D170C60
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 00:11:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SWl76FbnzDqXZ
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 10:11:31 +1100 (AEDT)
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
 header.s=20161025 header.b=QWyxVPh+; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SWZf6dSCzDqTW;
 Thu, 27 Feb 2020 10:04:10 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p11so292096plq.10;
 Wed, 26 Feb 2020 15:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d+bBE66toMnZI0qXloRJj6VMGyPFgJVsaJU4ycVPU64=;
 b=QWyxVPh+GD1LDDT6SRxgMhM8owHq1R0CxkEM31q0omdXqtjG3RrJxc0WHgK6rk/MMP
 ttIHaK93ze6IblKQAw4FEvQw9q0UdX9mDb22a+ACFhjTsCe65J7N8TEnKSnrYYkpnKoQ
 zsZpBxZvLAV8/4zNQ6QG5wPgVNF5Z+TKmp9Zv2bWYLHcVQ4tnYSFMbEOD4tFr+AQOewF
 N7h/EA/n3qXZw8+cj03pwIggUWsonWYcIhegU5td6OApxHCkmyUAxIKru9tyZLgb6nZa
 6o2+aXBiK8jD7CzidCFVQkhhD3V06zH2D4dIHpVFYUJmMm7xAE2ydtFwnqBA9PX4B4Ns
 kL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d+bBE66toMnZI0qXloRJj6VMGyPFgJVsaJU4ycVPU64=;
 b=h9lJegF1bA5/Zm+Efe+Z3Vt5+lEqN7pRT7+aWiSFC21TJ/zPTn2n6x6SYwRFliBLT4
 cIWslCxFA4a3s4WLYvvyPfbPUDveBJ+qtM7yHUedW6uuAgNY6b7/SnUv5V0rDOXiPHf/
 sQaeFcxI50dD9VFnVwTNFrhWkC1SsqO/4F0tx0Ov/tqFcK20NTEeX+xTZ0ALYUrF4J5e
 oKMm6mZZCCJ1L7RDiQbSh6Zi+WsFNKaLajALdoEQsL16Rd/Es0/oEbMXoH7bT/OyIPql
 xM/TWb7BTH9kGBo4WiJJvAZSShYIUVLMMbOhSftQWSArAPoC9WQPLgQWNGbrtZpbYvQ8
 d2DQ==
X-Gm-Message-State: APjAAAWHLvEybiHTafIMJKPU2dwlWnPCZvBhXTPrCzFSl49XuZtjZK+V
 5EMZxEvQhaloBnf3gT+JoLw=
X-Google-Smtp-Source: APXvYqwW65QAzOMxMHBU9B9LDutGbRm3cSxix5+RauaRaxCzui4CM12rCFWbLrzg/6Aiok32X6FXHQ==
X-Received: by 2002:a17:90a:d103:: with SMTP id
 l3mr1597711pju.116.1582758248654; 
 Wed, 26 Feb 2020 15:04:08 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::7:5ebf])
 by smtp.gmail.com with ESMTPSA id 3sm3912621pjg.27.2020.02.26.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:04:08 -0800 (PST)
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
Subject: [PATCH v4 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
Date: Wed, 26 Feb 2020 15:03:44 -0800
Message-Id: <20200226230346.672-6-rentao.bupt@gmail.com>
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

