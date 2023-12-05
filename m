Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21587805082
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:37:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mAxTuqjr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxnC4H1Nz3cTD
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:37:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mAxTuqjr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxld5nvqz3c8L
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:12 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so2282146e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772562; x=1702377362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtMf2uo6v4HRaO3aTGATHxiPGfcXJjAcpZInpCqs6aI=;
        b=mAxTuqjr/93dIcKPVTrHlBM589YIccmBZRzI+XVwSm1vRVIDiAq1DmPNH4ic3X97kT
         lmLtk8FBjACBFlTssR/uU3RFwsc+fl/4CVsIBdC4SjPdLIKW0kpAb9wsKAaQPPCxWKGY
         5GW0rY29k1VB6FCCzrj/ilP0HvfQrGv1EFtKDd6IZOVWdk9p3HdxT32yeYtMeKY6bSwR
         cMcWqKgKLXwP4fvO6khQ07LgcL2vRjIhrP3dyoq+wf8ZWNFTLhS0AsdC2UXP8cU7+REH
         i1jv1neluAta44l2ZV0VGvDqO+P/VSpiweqPd9bkfwLTfgFBUtBBMixpxbyuuVbR4wB7
         1X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772562; x=1702377362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtMf2uo6v4HRaO3aTGATHxiPGfcXJjAcpZInpCqs6aI=;
        b=Iigx9797ibC4EgnQdlDXPEfzckwbjYEms9W85b6yBOm+tsK/fyNhTYAuJ9PSq9LZDG
         Aa6k4Vb6IYxGTNg7LqsEwUzYbPg6uOoricc78AIcUcpbX7Mfou6Wi3q/sNLZqeLhyJ5W
         alXuTMqXO+2AwOvH2E3ABAPaAtjaK1f9maOt9MNXqGxAmRHjAfS8Z5uHJB9gydBWVG0C
         1RAbWRiVnr25WDrzC6zqi7B2P6HjRx8zELcmLb0h4GkpMrPrtcNo5TRrkDZCy5Xj6Dxq
         Xc6u30C+UargwjWq9QaJ+EIStbgeqmvSyZQqR0Ke9QFFoMseSfflJIBRqPQypUiW0HQW
         cuYA==
X-Gm-Message-State: AOJu0Yw6CVUG8I3g+yUXgka2dmMzdv6W7hNQrQo0XBGVLy8GgK20yA+M
	nMxP39i8V8S2uuWPCg8wHKU=
X-Google-Smtp-Source: AGHT+IGlNIwd4/e0H62YzHZHqaYqpG0StEiFbdOr/1a/chFWUYy/uwi3/P3hdcNgTRT9b2PsOO2mVg==
X-Received: by 2002:a05:6512:2013:b0:50b:fafd:8a6e with SMTP id a19-20020a056512201300b0050bfafd8a6emr1336040lfb.54.1701772562280;
        Tue, 05 Dec 2023 02:36:02 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id r15-20020ac25f8f000000b0050bc41caf04sm538386lfe.304.2023.12.05.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:01 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH net-next 00/16] net: pcs: xpcs: Add memory-based management iface support
Date: Tue,  5 Dec 2023 13:35:21 +0300
Message-ID: <20231205103559.9605-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The main goal of this series is to extend the DW XPCS device support in
the kernel. Particularly the patchset adds the DW XPCS MCI/APB3 management
interface support to the MDIO subsystem (basically it's a way to access
the memory-mapped DW XPCS devices), modifies the DW XPCS PCS-driver to
being registered as a standard MDIO-device driver and finally extends the
STMMAC MDIO sub-module functionality so one would be able to support both
SMA- and MI-based ways to communicate with the XPCS-device. The later way
will implies to have an XPCS-device passed to the DW MAC node via the
generic "pcs-handle" property.

The series traditionally starts with the cleanup patches, which can be
also considered as preparations. First redundant sentinel entry and the
header files are removed. Then two errno cleanups are introduced: return
EINVAL from the soft-reset method and make sure that the validate method
returns EINVAL straight away if the requested interface isn't supported by
the XPCS device instance.

Afterwards three preparation patches are introduced. First one just moves
the generic DW XPCS IDs macro-based declarations from the internal header
file to the external one where some other IDs also reside. Second patch
updates the XPCS registration procedure to avoid dummy MDIO-device
creation if it is already available in the framework of the specified
MDIO-bus. Finally third patch splits up the xpcs_create() method to a set
of the coherent sub-function for the sake of the further easier updates
and to have it looking less complicated.

The next three patches add the DW XPCS Management Interface driver to the
MDIO subsystem, update the DW XPCS driver to support a PCS-device
registered on a MDIO-bus and add the DT-bindings for both of these
objects.  Note the hierarchical design (having a DW XPCS device defined as
a sub-node of the DW XPCS management interface node) has been chosen for
several reasons. First Synopsys calls the MCI/APB3 interface as Management
Interface with two possible ways of the MMD CSRs access (direct and
indirect), which is basically a bus between the system and the PCS-device
with a possibility to have more than just one device attached. So the
chosen design looks more correct from the HW representation point of view.
Second the drivers for the SMA/MDIO-capable controllers (STMMAC and it's
glue layers for example) will still be able to manually register an
MDIO-bus but from now with custom XPCS-device identifiers. So the DW XPCS
driver will get to be attached to that device activating respective
internal functionality (see patches 10, 13 and 16). Thus if there is no
way to auto-identify the XPCS device capabilities it can be done based on
the custom device IDs or DT-node compatible string (see patch 10). But if
it's, then the device IDs will be auto-detected by the MDIO-subsystem and
the DW XPCS driver will still get attached to the device on the MDIO-bus.
All of that AFAICS would have been impossible (or much harder) to
implement should the Management Interface MDIO-bus be just internally
created in the DW XPCS driver.

Afterwards two patches add the "pcs-handle" DT-property support to the DW
XPCS driver. The first one of them is a preparation patch, which just
converts the name of the currently available XPCS device registration
method to having "_byaddr" suffix. It better identifies the method and
will make it more distinguishable from the method being added in the next
patch. The second patch introduces a new function which responsibility is
to create the DW XPCS descriptor based on the "pcs-handle" property and
PCS-PHY interface. The prototype is specifically selected to be looking
similar to another XPCS device registration method and to the phylink
fwnode-based connect interface function.

Finally after two small preparations the STMMAC driver is finally updated
to support the DW XPCS devices specified via the "pcs-handle" firmware
node. Thus the STMMAC driver from now will be able to handle the cases
with the DW XPCS devices accessible over the memory-based management
interface or over the external MDIO-buses.

That's it for now. Thanks for review in advance. Any tests are very
welcome. After this series is merged in, I'll submit another one which
adds the generic 10GBase-R and 10GBase-X interfaces support to the STMMAC
and DW XPCS driver with proper CSRs re-initialization, PMA initialization
and reference clock selection as it's defined by the Synopsys DW XPCS HW
manual.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: openbmc@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (16):
  net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
  net: pcs: xpcs: Drop redundant workqueue.h include directive
  net: pcs: xpcs: Return EINVAL in the internal methods
  net: pcs: xpcs: Explicitly return error on caps validation
  net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
  net: pcs: xpcs: Avoid creating dummy XPCS MDIO device
  net: pcs: xpcs: Split up xpcs_create() content to sub-functions
  dt-bindings: net: Add Synopsys DW xPCS bindings
  net: mdio: Add Synopsys DW XPCS management interface support
  net: pcs: xpcs: Add generic DW XPCS MDIO-device support
  net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
  net: pcs: xpcs: Add xpcs_create_bynode() method
  net: stmmac: intel: Register generic MDIO device
  net: stmmac: Pass netdev to XPCS setup function
  net: stmmac: Add dedicated XPCS cleanup method
  net: stmmac: Add externally detected DW XPCS support

 .../bindings/net/pcs/snps,dw-xpcs.yaml        |  88 ++++
 .../bindings/net/snps,dw-xpcs-mi.yaml         |  88 ++++
 drivers/net/dsa/sja1105/sja1105_mdio.c        |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  31 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  14 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  51 ++-
 drivers/net/mdio/Kconfig                      |   8 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-dw-xpcs.c               | 384 ++++++++++++++++++
 drivers/net/pcs/Kconfig                       |   6 +-
 drivers/net/pcs/pcs-xpcs.c                    | 285 ++++++++++---
 drivers/net/pcs/pcs-xpcs.h                    |   7 +-
 include/linux/pcs/pcs-xpcs.h                  |  36 +-
 14 files changed, 908 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
 create mode 100644 Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
 create mode 100644 drivers/net/mdio/mdio-dw-xpcs.c

-- 
2.42.1

