Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC568646B
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 16:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4649r56XzkzDqpq
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:34:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FA0jzayx"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4649q65gXFzDqW4
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 00:33:54 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w10so44165227pgj.7
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cp1i3+0DEmZNwBIERzqlGf/Xkabog066G60lOMCkiCQ=;
 b=FA0jzayxfGYVkbhoA8F1fxPcsrCDFgrmNQ4VDlZOk6WmmMLkrgKjhZGDnl02DJx8cJ
 FesQxYWEj2JXoqzi7kn5ttmyBKB/aGUpjyUFsiqT6k5NcIZoZP4hCCkfXHUlYMU2cgaq
 KO3cLpJ2FcvbndICc5HoqXTGTv5rhDq1wzw0MUZDbtf8mDjCy6JbzgShMFTCXkktBUV7
 JJE0UCHbuFcLQc/lga73Ti/lyn5fVdNt5dwuX8kChT3mnyVXOSGAz8AhsbIuq69IdOBr
 M59kcRu0Xkbo7CdwUYjzJiy0MVDzaIxXnUnG9Mjx4wLKtPX58l+gUi/9SBqi3OABy+ax
 w7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Cp1i3+0DEmZNwBIERzqlGf/Xkabog066G60lOMCkiCQ=;
 b=d5T3TzzVskVBctMnIz+LZeqWH92CeSB4t5q3wPMwAoFVW9U987dLCwUBOmNlVt9IkP
 2bpWruWgMAc2u3t1Hduieog6v0ZXuC31HDSJ3KbgCVb08zbQkn6YhO4hSIiBxbzFVq8A
 9X7VCSBvlqMxe5g5TZhsYDWNH2gYtpiH14BMw4hTvyoszD8UIEUYshrdVTQjZi6b95Eq
 YWphyWsbVZj5OuXiqMz7fUQ6vYrLOpNn0cHCXM1LjjSUdt7CktZFBjxN3fUgJ7nwU3uE
 XhOOM2atxXnRSPpvAQAa374GjqnzlG9lHQCotNQb/fHrafbVAHkPReDMJHz6EiNQ5FuX
 OPjQ==
X-Gm-Message-State: APjAAAW3KjcrCu1GeL+TLGPWZ1kqrUsFcf3b4JfbQ59JtKDgN5RifLks
 MmPGCT2vi2KtfHnn07kaBN5PoBKH
X-Google-Smtp-Source: APXvYqzFDA6wwa+ig5uOaqBz6UtRhpPc2xpMGq1iBK5zK0Q0wUkZBXt6vqsn1g5pzw96C82RIwGCGg==
X-Received: by 2002:aa7:8acb:: with SMTP id b11mr15250997pfd.109.1565274831911; 
 Thu, 08 Aug 2019 07:33:51 -0700 (PDT)
Received: from voyager.iht.com.au (210-10-229-158.cust.static-ipl.aapt.com.au.
 [210.10.229.158])
 by smtp.gmail.com with ESMTPSA id c35sm27554972pgl.72.2019.08.08.07.33.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:33:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 0/2] i2c: aspeed: Disable buffer mode
Date: Fri,  9 Aug 2019 00:03:40 +0930
Message-Id: <20190808143342.27779-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series does two things:

 - moves the OpenBMC to RFC v3 of Jae's i2c series

 - disables the use of buffer mode by reverting the device tree patch

Buffer mode is not supported in Qemu, leading to a crash. As OpenBMC
changes are gated on a successful boot in Qemu, we cannot merge kernel
changes that break booting.

In the future the Qemu i2c model will be enhanced so we can support
buffer mode, at which time the device tree revert can be reverted.

Joel Stanley (2):
  i2c: aspeed: Update to v3 of buffer and dma support
  Revert "ARM: dts: aspeed: add I2C buffer mode support"

 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 14 ++--
 arch/arm/boot/dts/aspeed-g4.dtsi              | 61 ++++++-----------
 arch/arm/boot/dts/aspeed-g5.dtsi              | 61 ++++++-----------
 drivers/i2c/busses/i2c-aspeed.c               | 67 ++++++++++---------
 4 files changed, 80 insertions(+), 123 deletions(-)

-- 
2.20.1

