Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05728172EB7
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 03:17:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCpv3L86zDqJl
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 13:17:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SsXX5/OH; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCcg2XKYzDqvr;
 Fri, 28 Feb 2020 13:08:19 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id a14so648020pgb.11;
 Thu, 27 Feb 2020 18:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KBdWDv5pYXspLR13NXBmBo0uH7q/9EYA/+sUUf6ZaRY=;
 b=SsXX5/OHRxtFZBMPk+LSluP8pZ7Y9dSJwSdFjdsQ80SwwOz3PxCnoxWVzleXsMoGxF
 gSI7TSegZgM1u3WdoU7qoJeuZfa3E2knlnq3WrQe9htu5pDCLsE1ehOgr49Y3HjHam/l
 WyOuABtyMjV7r3eKfkmamImeNnouIYocfrHMLmHbVcArYjEb7sXXfUPPH5TiKmYt/A3l
 tbSYDZ35yVJHYn2ywo2Ijzwe9w8I0uA7idDbvMiaZGhcK5ZRL/Mu5LCXxd0ubjKiMFqW
 mPu6b9SHKUnGOw2zymloTzshoKxgIqB9whnDUBoII0T59anuNb6UZmQ9W52UkGDBtJz0
 7foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KBdWDv5pYXspLR13NXBmBo0uH7q/9EYA/+sUUf6ZaRY=;
 b=VfIJ00dE5qT7k2jT0aByqNYXNLjIenqI5qEHdau5ipLoSI0bEec2oBr7xLghn9TH3c
 +74YKg3qnDAfH/9dnb57kt2kNT0uRjOV+LeSEqbm56n3dIzHhmNZs3Lciq1kWTLFMDHQ
 AIq1mQeTyIiDZtqjuz2BvKlqW+KFe2Dm+xLim4r99x2v9DME1AuuAlF/BAwd1a7Ts3pn
 XVJ8+m+YSki6Ea/LV7frDFhSrR+eZPuqGYW5owaHtgBtnt1W7R8k8sbehN0z7uA14aML
 WcfXWScNf2FJaCTcp8elz62Mq186Intmcx7VnpS2dMJE8oQG56IWB7qwk/flyPHq/RlJ
 sT8A==
X-Gm-Message-State: APjAAAXvzPU9Dakan+Rz2YS1fRzxaCDPOVUBJOf9Iv3D54XbwBiKG+b6
 nb+BPA2fXI/vfk1eVkfq/Qw=
X-Google-Smtp-Source: APXvYqwNeplEU5l3T+Bd+pYaCQcv8MrZ31vZLAMzGT+6bg15sdUb7fvXhnVpEI58PdviDIh3DOVyoA==
X-Received: by 2002:a63:505b:: with SMTP id q27mr2214730pgl.39.1582855696830; 
 Thu, 27 Feb 2020 18:08:16 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id k24sm4931972pgm.61.2020.02.27.18.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 18:08:16 -0800 (PST)
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
Subject: [PATCH v6 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Date: Thu, 27 Feb 2020 18:07:56 -0800
Message-Id: <20200228020757.10513-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228020757.10513-1-rentao.bupt@gmail.com>
References: <20200228020757.10513-1-rentao.bupt@gmail.com>
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
 No change in v2/v3/v4/v5/v6.
   - It's given v6 to align with the version of the patch series.

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

