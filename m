Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE012A06A1
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 14:41:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CN3Pg4f7mzDqvx
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 00:41:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=IyQDQsVD; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CN3CV24l4zDqtY
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 00:32:53 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2A4B24139B;
 Fri, 30 Oct 2020 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1604064768; x=
 1605879169; bh=GBnliRSXHzOk8VmuuanSwENRgAzGOqdnK85S/HHZ0Vs=; b=I
 yQDQsVDIDpAdU2cPG3BjaqX8EcchRfQDL55leS3gLjTqalCekidPdb9+f6u5eR6q
 CaZk4d4e+icbt5Ivtwhd4LjAQ7aiL3oHNwxOspsLubsMzKzqi3mDw92dddncQHix
 oGJGT2FbRiCHu7d/PtKNkcRfHF0M156YiOnuLTN/0E=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tbokTmwqF5K; Fri, 30 Oct 2020 16:32:48 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8C14A4137C;
 Fri, 30 Oct 2020 16:32:41 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.0.28) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 30 Oct 2020 16:32:40 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>
Subject: [PATCH v3 0/3] add ast2400/2500 phy-handle support
Date: Fri, 30 Oct 2020 16:37:04 +0300
Message-ID: <20201030133707.12099-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.28]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch introduces ast2400/2500 phy-handle support with an embedded
MDIO controller. At the current moment it is not possible to set options
with this format on ast2400/2500:

mac {
	phy-handle = <&phy>;
	phy-mode = "rgmii";

	mdio {
		#address-cells = <1>;
		#size-cells = <0>;

		phy: ethernet-phy@0 {
			compatible = "ethernet-phy-idxxxx.yyyy";
			reg = <0>;
		};
	};
};

The patch fixes it and gets possible PHYs and register them with
of_mdiobus_register.

Changes from v3:
   1. add dt-bindings description of MDIO node and phy-handle option
      with example.

Changes from v2:
   1. change manual phy interface type check on phy_interface_mode_is_rgmii
      function.
   2. add err_phy_connect label.
   3. split ftgmac100_destroy_mdio into ftgmac100_phy_disconnect and
      ftgmac100_destroy_mdio.
   4. remove unneeded mdio_np checks.

Changes from v1:
   1. split one patch into two.

Ivan Mikhaylov (3):
  net: ftgmac100: move phy connect out from ftgmac100_setup_mdio
  net: ftgmac100: add handling of mdio/phy nodes for ast2400/2500
  dt-bindings: net: ftgmac100: describe phy-handle and MDIO

 .../devicetree/bindings/net/ftgmac100.txt     |  25 ++++
 drivers/net/ethernet/faraday/ftgmac100.c      | 122 ++++++++++--------
 2 files changed, 96 insertions(+), 51 deletions(-)

-- 
2.21.1

