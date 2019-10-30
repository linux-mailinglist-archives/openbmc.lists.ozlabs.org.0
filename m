Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE2E966B
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:34:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zFG2f5hzF3m2
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:34:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFWydlvf"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCW4mcxzF3VC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:37 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id c23so92498pgn.9
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NGTvq01oX8C0PqczS7KlP+0ZuJMSUMePY2X02OEuMSo=;
 b=QFWydlvfO0vEYNwm1qaob/nk6BT7TZMro11MmHS++KjBW4EbS8UW53j5ArSJby72sE
 XwRouIc6NYGhFd5wXGTcYShjXBCVNafyAbwD/0ZuGnDxL/8UCIJsspBZjIl5PTZAQVP8
 or66VGKSpUzyt5D5YeUP1vJRYd6YPyXn5rGN6wcSB1lmBDpRaggJLcrzwQrWCYgV8qh0
 Tlwf+LgE158uMWEi/1h9ta064vG83fi02jP5UY6igovrhRME42Mfclqt+P8iMgzl1gLz
 nPO3ZJEiYCDEp9kHMut+Z1/txKxa6yrEaSCAfkR4IOwfcyQw1eCwOhuqZ+mGwE0y2Loj
 fqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NGTvq01oX8C0PqczS7KlP+0ZuJMSUMePY2X02OEuMSo=;
 b=k3RrCfhT7dJHOKjTUM1fAMKHGCWzbQZ9nQ/LR+JBeyU3BZwmLBQwpktdEQuwzyYVGs
 Jdvd8VuysprIn6BimAMBYk6wWN4Gn40WRdH65lX6g4xEAsIqy4olinVuot1rDnwYcXka
 q+R64NvKjHgy34IXWeEJSXZPPCXjOtE8DouYtPnT8ZqnCRyqPNtgq8AAhV5fRFGdyx3y
 SjOzzkP3km9y+vUQHGncuzSJ2yfdoQb2TokYj9tSK1McDsfzC8lUTOHBeH5GODR8sBrQ
 89yXcpuPk20KoVQrh09nI2pArJ2piHzf5makZ+hsqMi0MBWLKnYP639UVyMK+wp90W2K
 8hBA==
X-Gm-Message-State: APjAAAWT7m7ZleaslVWzyRFPoD0UyGXZ99A/VkBQWcEGC/FAT0mSZp4t
 uY0LJilnhTQXcRl/euHl1XM=
X-Google-Smtp-Source: APXvYqz4kER3x1VctxNu2eb2601tYDillprA1SOgwX67oM7Hdv3ZkiCv4ZuWJFua7m/w7htHqSsx+Q==
X-Received: by 2002:a17:90b:f15:: with SMTP id
 br21mr8039026pjb.107.1572417153520; 
 Tue, 29 Oct 2019 23:32:33 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 0/7] FSI driver for u-boot
Date: Wed, 30 Oct 2019 17:02:18 +1030
Message-Id: <20191030063225.11319-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Ryan,

Here is a FSI driver for u-boot. It can be used for basic control of the
FSI master.

The patches can be found in https://github.com/shenki/u-boot/tree/fsi-master
too, if you would prefer to merge them from Github.

Please consider merging these to allow FSI testing.

Joel Stanley (7):
  dt-bindings: Add FSI clock
  dts: ast2600: Add FSI description
  aspeed: pinctrl: Add FSI support
  aspeed: clock: Add FSI clock
  dts: ast2600-evb: Enable FSI masters
  Add FSI driver
  cmd: Add FSI command

 arch/arm/dts/ast2600-evb.dts              |   8 +
 arch/arm/dts/ast2600.dtsi                 |  31 ++
 cmd/Kconfig                               |   6 +
 cmd/Makefile                              |   1 +
 cmd/fsi.c                                 | 153 ++++++
 drivers/clk/aspeed/clk_ast2600.c          |  23 +
 drivers/misc/Kconfig                      |   6 +
 drivers/misc/Makefile                     |   1 +
 drivers/misc/aspeed-fsi.c                 | 556 ++++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl_ast2600.c  |  10 +
 include/aspeed_fsi.h                      |  14 +
 include/dt-bindings/clock/ast2600-clock.h |  39 +-
 12 files changed, 829 insertions(+), 19 deletions(-)
 create mode 100644 cmd/fsi.c
 create mode 100644 drivers/misc/aspeed-fsi.c
 create mode 100644 include/aspeed_fsi.h

-- 
2.23.0

