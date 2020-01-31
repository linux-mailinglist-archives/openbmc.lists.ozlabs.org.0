Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4B14F4B1
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 23:24:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Wwx3mmgzDqT2
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 09:24:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DatComwm; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488WtG12vCzDqgk;
 Sat,  1 Feb 2020 09:22:11 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 84so4075609pfy.6;
 Fri, 31 Jan 2020 14:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/HFcoQMFwoF5gwXFjCOgMWeMPSstLjSDHZ4Dum+BpLY=;
 b=DatComwmXGtiPYRomdkOy0XFknlTGW4jw8cqnPXUs3c1PayQQ01hJkqNdNRCG8/3as
 pZ/HWMofmFNsf38uGdGoFb3KtxSkVedmPKnu1jwNA2VWD0/4lpfh7rRv7HJc7BHC4AJa
 O02dRGqtmspUgZGqsDhaanNF5EdARykMjcLg8SgyQktv9O3aCgdAdKUh2t+uFNq/6oBb
 9tKZ9w8vkAtdC8LszUYhH4MUge04bpiWX+0BGuCp8I892FKG/uCFih4C0Sz3kVIhKEqk
 IM6KyEzpAP0RXQ1QsP0P5JnzqdRzaJdfvyMe4Y6yG5V9RDGEL7j/Dw0JyZdCWhnGly0V
 pSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/HFcoQMFwoF5gwXFjCOgMWeMPSstLjSDHZ4Dum+BpLY=;
 b=cUqX5GYWunEUfWj3BJVNagihKi+K0MRiKsjwJDdKUl2ASZLLoTw/a5azp6d2epSVlr
 Q0VmcyQaKrQm0gy7DipEwrlvZ0IIvqyc6V1clij37DIfEpNQXdSMUyaDvCJ0skPhF+3m
 jfK1YswU9VYb+Ela6Db+4NNlhT3HRZjGLcjS04RTm7WFefPoyzGG7HyyDZR+nbROL6Em
 FhQjvv0s0MgE5Y/D2dzrRJqttQ3S6+6xuDO+0SFvEmSfD/xpPto0zK6iyhXc05rMnKGy
 BwUhJK9Un4FR4czAqsUo6RwiZUz1UZM4nkDmnTZGJm61/HTeLL2LDvzCILBI1M/vziA8
 wWoA==
X-Gm-Message-State: APjAAAWEQFmEcEkYWY2xvNpVCghvEt87XavjqR71gqGpeogp89Cui5UL
 wecCvwNU6c/ZBEYhUffMKOM=
X-Google-Smtp-Source: APXvYqx7oLNYYYIoBn05Sgk8HxhcExQrlyg5hCf0aIq/sj8/mwAJ8Vjgu7X4e0+MgzPbAFocAsrZ6Q==
X-Received: by 2002:a62:ddd0:: with SMTP id w199mr12425962pff.1.1580509327790; 
 Fri, 31 Jan 2020 14:22:07 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:a521])
 by smtp.gmail.com with ESMTPSA id v8sm11201515pff.151.2020.01.31.14.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 14:22:07 -0800 (PST)
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
 openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] aspeed-g6: enable usb support
Date: Fri, 31 Jan 2020 14:21:54 -0800
Message-Id: <20200131222157.20849-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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

The patch series aims at enabling USB Host and Gadget support on AST2600
platforms.

Patch #1 moves hardcoded vhub attributes (number of downstream ports and
endpoints) to "struct ast_hub_config" which is then attached to "struct
of_device_id". By doing this, it will be easier to enable ast2600 vhub
which supports more ports and endpoints.

Patch #2 enables AST2600 support in aspeed-vhub gadget driver.

Patch #3 adds USB devices and according pin groups in aspeed-g6 dtsi.

Tao Ren (3):
  usb: gadget: aspeed: read vhub config from of_device_id
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  25 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi           |  43 ++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 109 ++++++++++++++-------
 drivers/usb/gadget/udc/aspeed-vhub/dev.c   |  30 ++++--
 drivers/usb/gadget/udc/aspeed-vhub/epn.c   |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c   |  26 +++--
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  |  23 ++---
 8 files changed, 191 insertions(+), 73 deletions(-)

-- 
2.17.1

