Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A481637CD
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 00:57:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Md7p0KqSzDqLn
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 10:57:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q3+9YPzs; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Md6Q2x6mzDqZF;
 Wed, 19 Feb 2020 10:56:12 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id p14so11501428pfn.4;
 Tue, 18 Feb 2020 15:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RaNnl3+uu7fV0u4Un9uuTw80YtZZSfmJ9Z7lllWiZwI=;
 b=q3+9YPzso4OBjcsYS2BGJQuc8RXnF5FAOBKDmsn4C+kUWEPNeBpu34WaqyCW892Rx9
 +ikfWY67U+3ZmXajhzgMqKeEuzNDfjI8hlYDQf+9PP/l7gSfgcQWQOdNP3T1TsPtP8+A
 Zti+38TKv0ZapaDQnVOb/EtYxZh8XbF58UqIb3qEDYAeQzer+jWuPd8ngsgNoBxbltmv
 5JMOSDtI+7J9nvpLyQcWwd28aWQWysec9iFlnQ/LHc9YML1AVMtDSdO08srWz0rdBQZG
 3YjIBU7P2osVOZBfqQ4Q6/v/xcALtHxkLUy2CDGlY/ADQIctpN6FXmaMhuX98ogMctJK
 5I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RaNnl3+uu7fV0u4Un9uuTw80YtZZSfmJ9Z7lllWiZwI=;
 b=Q39d04Ijpt1mrLGvSrGDvP/edv38M0RBe5Peh0fZEYio3kcaXjEgnC20X4UKQYjHaQ
 uBarjOV3/wm5c3eDnJW/XDbMcp73xo36b7vjHgg2qcxiNchfbrJpc63eGmK5YMVz2w+Q
 lm6E/ER9dLF8HceLB/tXvfrxAQZNufyOf7815v8XVev0EChL4ME9aGHkoKhXAbrgnDrS
 0DJL+cX/RI/KOjMOBKyhTEC/T+SWcaUU+9PcFDh8s9LJbFQ49d80QRFpb9a99Jc+1ZCT
 +0V5eaXTZRwZQsFx/f+XCoZUBaPS2xoI/jlV5VzVSWtmRwr0UK8Es/B41SsurAQTW6Jc
 U8qQ==
X-Gm-Message-State: APjAAAXij302UqZ26HTx2R283zfJSwnhdLbryni80oOAZMRmeH24hQZE
 9dWtfhpEgHeIs1wIHSfYwqs=
X-Google-Smtp-Source: APXvYqwZmgIEHqOxLQ1cyJyx3ogGpJoEg6ROKfneriZnTEoj6j1aqMsH+aDmEeM9a0OC3ahr/2pl2w==
X-Received: by 2002:a63:5807:: with SMTP id m7mr23349426pgb.83.1582070168618; 
 Tue, 18 Feb 2020 15:56:08 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::5:1718])
 by smtp.gmail.com with ESMTPSA id d3sm80558pjx.10.2020.02.18.15.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 15:56:08 -0800 (PST)
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
Subject: [PATCH 0/2] usb: gadget: aspeed: allow to customize vhub device
Date: Tue, 18 Feb 2020 15:55:58 -0800
Message-Id: <20200218235600.6763-1-rentao.bupt@gmail.com>
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

This patch series allows people to customize IDs/strings in vhub's
device descriptor through device tree properties.

Patch #1 overrides IDs and strings in device descriptor if according
device tree properties are defined.

Patch #2 moves fixup-usb1-device-descriptor logic from get_descriptor
handler to "ast_vhub_fixup_dev_desc" function for consistency.

The patch series needs to be applied on top of "aspeed-g6: enable usb
support" patch set to avoid merge conflicts.

Tao Ren (2):
  usb: gadget: aspeed: allow to customize vhub device IDs/strings
  usb: gadget: aspeed: fixup usb1 device descriptor at init time

 drivers/usb/gadget/udc/aspeed-vhub/hub.c | 93 +++++++++++++++++-------
 1 file changed, 68 insertions(+), 25 deletions(-)

-- 
2.17.1

