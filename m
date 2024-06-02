Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EA8D764E
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:38:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EGtD8ZME;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vsfbl0NCZz3cT2
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:38:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EGtD8ZME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZC4jT9z30TK
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:36:50 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52b90038cf7so1787950e87.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339001; x=1717943801; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXPoXP/AySz0XHYgei622iDE7uESUQYcBgiYpHCz3Tw=;
        b=EGtD8ZMEWzgd2B14b6fT4xBFl6/iK/4IXkTOuwbBTD2MBljDBOlDVPGCajY4F/lMcy
         b0WNkjzxh7KJW6g6KL7a+4dlzHgYZkz2Hs4y/4COebalPNK6ib+AA/gGCofsTHBPbzcv
         qJ1xS32LKHl7wXRnB4uQmYrxhOXCaXEjhVZAsTPDJKEiyryKCKiuZ+7VghlL0g4eECcE
         wfu/+Ecy6YH9sb/a1G9vFnxLfDWhR/nFGW7FC7IksMop0jSLzW5x4KCdjFzvKGYooWgt
         /gLLPWkz4u5Aga9eyuZNQmUilfk273e+g6OM74j1T20ZFK9m9Rn77m9e9eIMqslwlCn1
         kjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339001; x=1717943801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXPoXP/AySz0XHYgei622iDE7uESUQYcBgiYpHCz3Tw=;
        b=jf8Bbtij1exYHlyCHFR0L1qgoWeXcG7boRZ5nca7mTJOuAPFEmUrGB2TBmnWuUF41q
         W9WrUYNhQCg9EYb21SrOcL+Sz/3Sf03rPg8zvHUkJV+Qk5c9yn/UlshM0b2nBqCuLQfs
         OMQHst/M2AKNGDPy/B7azV4THDF5dOy0UXMQNbZ4ZsbIXeWI/nAO7C/R1x/WBB3+Brq9
         TMFcZaYplUD93qlSC6oQHzHS0oBa3e1MWu+I0UaqDUHFdfDHym7jXtDnJqXv6CBRsn+5
         +zce4FkicN1fdNhZ+4fC8WRX1DGWgBYWellNAO12krEqqN4vuXuwnoBtQV51Dq6o2E5+
         gtgA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Oi0oFK0XNOh8F8+d7qnuS1GJF3R43tLS5BjapDK6MLzjwCy67jUdGbENHTOsn8gUd9wOONWmh9Ja0x9pgBHFj9pIN6bjXaA=
X-Gm-Message-State: AOJu0Yyc+xIl33sRuH5gIVg14dr4ka9sykD/i/W94C4WwS1Fk/IhpbIk
	aktSVVaVHSTxLnJTwQF6Be6SJ0EvBUr0E1x5kiSbmnjYqCsDJpkl
X-Google-Smtp-Source: AGHT+IFvQ4MofMSQPsYwDnuGyQwkZ+4P6i911LV4JO5fgAr4XMRSOlm6EKYxbM3al0JdYh+u8PaAQQ==
X-Received: by 2002:a05:6512:250:b0:52b:797f:b21f with SMTP id 2adb3069b0e04-52b896c0c2dmr4119681e87.51.1717339000622;
        Sun, 02 Jun 2024 07:36:40 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b95681eecsm314108e87.305.2024.06.02.07.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:39 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next v2 00/10] net: pcs: xpcs: Add memory-mapped device support
Date: Sun,  2 Jun 2024 17:36:14 +0300
Message-ID: <20240602143636.5839-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, Mengyuan Lou <mengyuanlou@net-swift.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The main goal of this series is to extend the DW XPCS device support in
the kernel. Particularly the patchset adds a support of the DW XPCS
device with the MCI/APB3 IO interface registered as a platform device. In
order to have them utilized by the DW XPCS core the fwnode-based DW XPCS
descriptor creation procedure has been introduced. Finally the STMMAC
driver has been altered to support the DW XPCS passed via the 'pcs-handle'
property.

Note the series has been significantly re-developed since v1. So I even
had to change the subject. Anyway I've done my best to take all the noted
into account.

The series traditionally starts with a set of the preparation patches.
First one just moves the generic DW XPCS IDs macros from the internal
header file to the external one where some other IDs also reside. Second
patch splits up the xpcs_create() method to a set of the coherent
sub-functions for the sake of the further easier updates and to have it
looking less complicated. The goal of the next three patches is to extend
the DW XPCS ID management code by defining a new dw_xpcs_info structure
with both PCS and PMA IDs.

The next two patches provide the DW XPCS device DT-bindings and the
respective platform-device driver for the memory-mapped DW XPCS devices.
Besides the later patch makes use of the introduced dw_xpcs_info structure
to pre-define the DW XPCS IDs based on the platform-device compatible
string. Thus if there is no way to auto-identify the XPCS device
capabilities it can be done based on the custom device IDs passed via the
MDIO-device platform data.

Final DW XPCS driver change is about adding a new method of the DW XPCS
descriptor creation. The xpcs_create_fwnode() function has been introduced
with the same semantics as a similar method recently added to the Lynx PCS
driver. It's supposed to be called with the fwnode pointing to the DW XPCS
device node, for which the XPCS descriptor will be created.

The series is terminated with two STMMAC driver patches. The former one
simplifies the DW XPCS descriptor registration procedure by dropping the
MDIO-bus scanning and creating the descriptor for the particular device
address. The later patch alters the STMMAC PCS setup method so one would
support the DW XPCS specified via the "pcs-handle" property.

That's it for now. Thanks for review in advance. Any tests are very
welcome. After this series is merged in, I'll submit another one which
adds the generic 10GBase-R and 10GBase-X interfaces support to the STMMAC
and DW XPCS driver with the proper CSRs re-initialization, PMA
initialization and reference clock selection as it's described in the
Synopsys DW XPCS HW manual.

Link: https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com
Changelog v2:
- Drop the patches:
  [PATCH net-next 01/16] net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
  [PATCH net-next 02/16] net: pcs: xpcs: Drop redundant workqueue.h include directive
  [PATCH net-next 03/16] net: pcs: xpcs: Return EINVAL in the internal methods
  [PATCH net-next 04/16] net: pcs: xpcs: Explicitly return error on caps validation
  as ones have already been merged into the kernel repo:
Link: https://lore.kernel.org/netdev/20240222175843.26919-1-fancer.lancer@gmail.com/
- Drop the patches:
  [PATCH net-next 14/16] net: stmmac: Pass netdev to XPCS setup function
  [PATCH net-next 15/16] net: stmmac: Add dedicated XPCS cleanup method
  as ones have already been merged into the kernel repo:
Link: https://lore.kernel.org/netdev/20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com/
- Drop the patch:
  [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS MDIO device
  [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS management interface support
  [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
  [PATCH net-next 13/16] net: stmmac: intel: Register generic MDIO device
  as no longer relevant.
- Add new patches:
  [PATCH net-next v2 03/10] net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
  [PATCH net-next v2 04/10] net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
  [PATCH net-next v2 05/10] net: pcs: xpcs: Introduce DW XPCS info structure
  [PATCH net-next v2 09/10] net: stmmac: Create DW XPCS device with particular address
- Use the xpcs_create_fwnode() function name and semantics similar to the
  Lynx PCS driver.
- Add kdoc describing the DW XPCS registration functions.
- Convert the memory-mapped DW XPCS device driver to being the
  platform-device driver.
- Convert the DW XPCS DT-bindings to defining both memory-mapped and MDIO
  devices.
- Drop inline'es from the methods statically defined in *.c. (@Maxime)
- Preserve the strict refcount-ing pattern. (@Russell)

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (10):
  net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
  net: pcs: xpcs: Split up xpcs_create() body to sub-functions
  net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
  net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
  net: pcs: xpcs: Introduce DW XPCS info structure
  dt-bindings: net: Add Synopsys DW xPCS bindings
  net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
  net: pcs: xpcs: Add fwnode-based descriptor creation method
  net: stmmac: Create DW XPCS device with particular address
  net: stmmac: Add DW XPCS specified via "pcs-handle" support

 .../bindings/net/pcs/snps,dw-xpcs.yaml        | 133 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |   1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  28 +-
 drivers/net/pcs/Kconfig                       |   6 +-
 drivers/net/pcs/Makefile                      |   3 +-
 drivers/net/pcs/pcs-xpcs-plat.c               | 460 ++++++++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    | 361 +++++++++-----
 drivers/net/pcs/pcs-xpcs.h                    |   7 +-
 include/linux/pcs/pcs-xpcs.h                  |  49 +-
 include/linux/stmmac.h                        |   1 +
 10 files changed, 905 insertions(+), 144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
 create mode 100644 drivers/net/pcs/pcs-xpcs-plat.c

-- 
2.43.0

