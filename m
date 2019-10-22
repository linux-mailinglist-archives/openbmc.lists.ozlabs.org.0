Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EDE0DF6
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 23:59:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yS894tlnzDqP9
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:59:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNztzyFH"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yMXn62rbzDqJB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 05:31:33 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q7so11159326pfh.8
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeDvAjQsjrYrlLSuu+Jz91MnGz1OObnz6v+WgTTWu5c=;
 b=gNztzyFHWTtfSDCaP/HfT9zML2AyKrbFMMzvR9H+nYAokweZkjfCBHOp3Xzh/GF+tZ
 davs+puk3rn8lzmgcQgZREMAXBv6WGKyR2GDKTuglcL8/a9h8L0+msxpAlh+GcVurkel
 B+U64TbXlLAq5tHow2iIei6DMzWMgD098kfesOkkv8+/M1vCXIv3Kb3xP/vQorI6pLh6
 lUWAcHDbuf4T6S9FkFgnktH2QC6MbbeMpej6WEJuGeWWUw3bXS+dG8FmLZHUzUGNCx8f
 KRSX/3idatgF5LbyT9pCxGuGjOogxaAi3YHkKwXQEO9dDqLD2KWnYR6Yhe5P7MOELP9J
 aQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeDvAjQsjrYrlLSuu+Jz91MnGz1OObnz6v+WgTTWu5c=;
 b=TAPJzeZPhaj7gYLIwoxyp9jlglx1JfA7K5s5GGJuzb10djLh0A64Rn01r2O5jWYOIa
 hluMt+5BffzifEjp7+kxuSkomyq5Ru+chyeOQNitsl05sQ/xp08jlqzySMqO5Pgb6UUq
 XJl3HQeajEcCTT8AC3CFus1zxMa6ePmPZNOw+VsQulTMnJwQe9NCILq+Zvonb1LJSGXj
 /b1ndhXf/jDpn/Hk49haa6iz4rYyqlfNo31QDsiPG1LhcGAioFFjp5/0O1QsEBcCreWy
 o8nXrjoikQncsV2IMVz0GB+uB4n50CUiCCWRSSBwCWUgKiV0FCAhdcuhTtkWNrNNdyEs
 ZqBQ==
X-Gm-Message-State: APjAAAUSrGefO6nQ9wMgxfQAp2SWvFfUc8a9QXNxQZPREzFnEU7vfJFO
 xlNazLML6vTgnv43tKBnI5M=
X-Google-Smtp-Source: APXvYqzna4x7O6NiaYj3+n+EKQggUVh1mmKq21UR1LLUMJLAz77V7BP09P9HL2gIhzrBXlRLzgA8gg==
X-Received: by 2002:a17:90a:741:: with SMTP id
 s1mr6612216pje.113.1571769090041; 
 Tue, 22 Oct 2019 11:31:30 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2398])
 by smtp.gmail.com with ESMTPSA id m19sm16787947pjl.28.2019.10.22.11.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 11:31:29 -0700 (PDT)
From: rentao.bupt@gmail.com
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v10 0/3] net: phy: support 1000Base-X
 auto-negotiation for BCM54616S
Date: Tue, 22 Oct 2019 11:31:05 -0700
Message-Id: <20191022183108.14029-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:55:44 +1100
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

This patch series aims at supporting auto negotiation when BCM54616S is
running in 1000Base-X mode: without the patch series, BCM54616S PHY driver
would report incorrect link speed in 1000Base-X mode.

Patch #1 (of 3) modifies assignment to OR when dealing with dev_flags in
phy_attach_direct function, so that dev_flags updated in BCM54616S PHY's
probe callback won't be lost.

Patch #2 (of 3) adds several genphy_c37_* functions to support clause 37
1000Base-X auto-negotiation, and these functions are called in BCM54616S
PHY driver.

Patch #3 (of 3) detects BCM54616S PHY's operation mode and calls according
genphy_c37_* functions to configure auto-negotiation and parse link
attributes (speed, duplex, and etc.) in 1000Base-X mode.

Heiner Kallweit (1):
  net: phy: add support for clause 37 auto-negotiation

Tao Ren (2):
  net: phy: modify assignment to OR for dev_flags in phy_attach_direct
  net: phy: broadcom: add 1000Base-X support for BCM54616S

 drivers/net/phy/broadcom.c   |  57 +++++++++++++-
 drivers/net/phy/phy_device.c | 141 ++++++++++++++++++++++++++++++++++-
 include/linux/brcmphy.h      |  10 ++-
 include/linux/phy.h          |   4 +
 4 files changed, 205 insertions(+), 7 deletions(-)

-- 
2.17.1

