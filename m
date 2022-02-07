Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD374AB541
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:55:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscNY5z5Yz3Wtt
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hh53y7v9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Hh53y7v9; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbvM6wBPz30Lp
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:33:49 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso12395406pjm.4
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=5w4/ennwCAEEkQywko6dYbRCf/YpCkpMTELAq3SETZ0=;
 b=Hh53y7v9NqRMkLkoNG8j78dhkJPtGq5sFnpbaHmwv98uBLw3f32oI311L5p3FsJKJ3
 IgrPn3pu9YeOnJzCeFAgfkY9+N8XVvBodUNzDn+qfjnrk/4nx0g/L9pyLyBsTMjfrZ/D
 34Eb2vBm+bm+FF7/WxOe/zU/utjATQBnpvQiEf1XRkuAyaDtQXGOSRla9Rx36lSnSFCl
 Kz/cEyzX+XqzrcnXtwAMRKwYkscyU0U+9pzEy23Rd0t7zzMfFKAAKNA/iop5FskRk39L
 JOk5Ut+nY244dW4vzbXVIg8BJiCeT1yfuxCNAR7SEZi5s6zwM30kAYnVHR0rD06KNikt
 Bhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5w4/ennwCAEEkQywko6dYbRCf/YpCkpMTELAq3SETZ0=;
 b=blH3HvUdWniSf+th7HoTUnIa7MHsARlz7TrwA02zmv9XNOYlczUjS05B8I8CuDnncK
 Ped95JHNOEbXf6r/TDy4AFvWuStO4D4q02kzbRzJ2cuqeI8pEieIe2i37P2ro4q2TXEf
 a+Uq/YxlVZzJ49EI6LO1kAa7wX2oVXDv6AZeAi/LbTWVJndpV0ZkpZs8ZuLfawGYPeiM
 v6BToDHLTiNxKbxIGa0CuiK+KGkUeRdaR5u8h7jPIjoY/JgkInP9gfuCwY6GWPBBxxhq
 6Cb/tpS7a+GrXUV22bZElnbVPDYL82QXEGrEkgwUMsxeRAVNZg9hFuxWaRyZ5H1Csnl/
 +lNQ==
X-Gm-Message-State: AOAM532HmYBbh5G6wLXiyVOd7Q/b8WWhANmvLih0YCSzSbo1JD1nyJso
 lbrDgqiQq65d/SLSaVvRUQ==
X-Google-Smtp-Source: ABdhPJwAH1K+CWgey8aVJCIHJ53hQkGzwDi9PAMPA/2HOH43X+MSCDHXYztTHNJXL8NB9GZijsI3XQ==
X-Received: by 2002:a17:90b:351:: with SMTP id
 fh17mr5008108pjb.28.1644215627026; 
 Sun, 06 Feb 2022 22:33:47 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
 by smtp.gmail.com with ESMTPSA id d13sm2803452pfj.205.2022.02.06.22.33.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Feb 2022 22:33:46 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v1 0/6] i2c: npcm: Bug fixes timeout, spurious interrupts
Date: Mon,  7 Feb 2022 14:33:32 +0800
Message-Id: <20220207063338.6570-1-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 07 Feb 2022 17:54:48 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

This patchset includes the following fixes:

- Add dt-bindings description for NPCM845.
- Bug fix for timeout calculation.
- Better handling of spurious interrupts.
- Fix for event type in slave mode.
- Removal of own slave addresses [2:10].
- Support for next gen BMC (NPCM845).

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Tali Perry (4):
  i2c: npcm: Fix timeout calculation
  i2c: npcm: Add tx complete counter
  i2c: npcm: Handle spurious interrupts
  i2c: npcm: Remove own slave addresses 2:10

Tyrone Ting (2):
  dt-bindings: i2c: npcm: support NPCM845
  i2c: npcm: Support NPCM845

 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  21 +-
 drivers/i2c/busses/Kconfig                    |   8 +-
 drivers/i2c/busses/Makefile                   |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c              | 191 ++++++++++++------
 4 files changed, 149 insertions(+), 73 deletions(-)

-- 
2.17.1

