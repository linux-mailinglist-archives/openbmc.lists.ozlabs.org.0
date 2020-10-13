Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7228CE75
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 14:37:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9ZnW6g46zDqWN
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 23:37:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=dOtd0uVE; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9Zm72TBDzDqWP
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 23:36:22 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A72EF41308;
 Tue, 13 Oct 2020 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1602592576; x=
 1604406977; bh=XasVKcmk9zHcf8vYXQS/Mo+FYkiZDzuko3Qn62C6a/Q=; b=d
 Otd0uVE5gsCq23qejGThIp57iQiwqQ2QVXZC0kfpjAzOupPKHY9H5Dcjv0U0M9rX
 auAHPbmG0vyUdjMoZ0bWUHpltmL8QIpaeiN9F/TqnrRkrM4SXqJitsUR7r0VnrVR
 r7DAnBDwXOyl5asUQB/u3qilrVOh+A/hVu5wlz4vio=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoDA5D-__qrp; Tue, 13 Oct 2020 15:36:16 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 500CA412CF;
 Tue, 13 Oct 2020 15:36:16 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.1.110) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 13 Oct 2020 15:36:15 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>
Subject: [PATCH 0/1] add ast2400/2500 phy-handle support
Date: Tue, 13 Oct 2020 15:40:13 +0300
Message-ID: <20201013124014.2989-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.1.110]
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Ivan Mikhaylov (1):
  net: ftgmac100: add handling of mdio/phy nodes for ast2400/2500

 drivers/net/ethernet/faraday/ftgmac100.c | 114 ++++++++++++++---------
 1 file changed, 69 insertions(+), 45 deletions(-)

-- 
2.21.1

