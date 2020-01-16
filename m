Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2613FD8D
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 00:27:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zL2433ZCzDrBJ
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 10:27:08 +1100 (AEDT)
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
 header.s=20161025 header.b=WyfOo+tx; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zL0b0YD7zDr9K
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:25:47 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id a33so10699128pgm.5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Z0ymMuOa2hIE7iiBVcHruxkjCVfWMIQKWpKlW0MqB0g=;
 b=WyfOo+txeoqq+/5uQ3DSUqKzWf0nBEJ8Z4YLgSagXg65+Y8//6MdDfUk93h6VhhWEr
 zOtLhThEtnAsYLQNxfBF/616YNqjC5IMpc9PkQi+L482WO567JDlnJ78L9yrvUpJvpJp
 gnTCjqmWpR/wvZvJWvcSeRF9O5nEk37lhKtySXW9rkm2B7nmaDqnb+pFbustb43hFwk/
 ZjDJ494lyhGmL9h/GzWZqg/3pWtJjSz0FGmc0sHVSQwZeVgYGuAJsZXazsXbURMdFsaO
 +diRdDJxV3DNMyFYuDgg/xSiCYfLUg/shOiyMO2mlgGnONEROH6AoDmafzF7TBYsUR2C
 4/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Z0ymMuOa2hIE7iiBVcHruxkjCVfWMIQKWpKlW0MqB0g=;
 b=udW19emzwwOk/CBg8jJ/DR5eGa4IZ56ljttp28mva7hTcEfi4vQd6utvGTMbPSVZ+G
 mhMrWiht7DF6/RIhfM4Ywv+dUeB+FVtc/gSxGMpGXnGkP+9h2jMTgRf0r0KHQYH0P45i
 w219K5b2FO9dnweqiFXhpw7MaEEGZjcpa7bLROkdK/RQjrK0yRQe1xiGTf278QF4SLTm
 MIkyp6mXX84HvojIHEz2es99B3OF03Uxn/BJmJxGZcLRLOLojO7hdfnI2OA8p7oT2Drh
 C4lBPKDHSyzgBZUZX+Q5XNS+z/8StfQvs+aD5+PvnQ/Hs7ab8R+nchOxXZRGPY1RmR2j
 bABQ==
X-Gm-Message-State: APjAAAUgT5TGHR2VjQ7eEcoA07wTpRPWsFKjMy8euEv/vFlpU3H6WA6c
 W7kQHQvsdatpJfk81xiv+9U=
X-Google-Smtp-Source: APXvYqym63GHyamPa1QfS4XeyihWnvjyGAUiAW8U/yWUl7SFxQPELNHMiB8JgJsBlQTRrV/lJip1Og==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr39891797pfq.198.1579217144140; 
 Thu, 16 Jan 2020 15:25:44 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:7c0c])
 by smtp.gmail.com with ESMTPSA id o6sm25532204pgg.37.2020.01.16.15.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 15:25:43 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 0/2] aspeed-g6: enable usb support
Date: Thu, 16 Jan 2020 15:25:23 -0800
Message-Id: <20200116232525.2819-1-rentao.bupt@gmail.com>
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

Patch #1 enables AST2600 support in aspeed-vhub gadget driver, and patch
#2 add USB function pins and devices in aspeed-g6 dtsi files.

The patch series has been sanity tested on AST2600-A0 eval board by:
  a) setting USB port A as vhub and creating 7 gadget devices: all the
     7 devices can be enumerated from another Linux USB Host.
  b) setting USB port B as EHCI and connecting a USB flash drive: the
     USB flash drive can be enumerated successfully.


Tao Ren (2):
  usb: gadget: aspeed: add ast2600 vhub support
  ARM: dts: aspeed-g6: add usb functions

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 25 +++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi           | 43 ++++++++++++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c  | 25 +++++--------
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 32 ++++++++++++----
 5 files changed, 103 insertions(+), 26 deletions(-)

-- 
2.17.1

