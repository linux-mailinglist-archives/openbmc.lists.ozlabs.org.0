Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195144CCB1
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 23:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqKJD4381z2yY7
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 09:28:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=g2UbOksn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=g2UbOksn; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqKHs5tjnz2xWt
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 09:28:25 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D91F045135;
 Wed, 10 Nov 2021 22:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1636583301; x=
 1638397702; bh=ujb4GC9grTv/jvMk6Gp1Kf5rclIO070PfVmTW4wEeso=; b=g
 2UbOksnKslJ01YaEB2qDlVdaVtiFe5jGGTiEiZmKzIXqXemjH2+kzke/gUe8v1uX
 ax1D2t3nhJUsGAawF+p41QEPoOm8xKPp2N3zDL5wZ24WHHKa8fkFnvebUBKXCA7D
 ipWlYDoMPAWT02S0jD69OGSCd4ZcQncS2pLC2hx75E=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rDZC4b3qj3o; Thu, 11 Nov 2021 01:28:21 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 486BE4149B;
 Thu, 11 Nov 2021 01:28:19 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 11
 Nov 2021 01:28:18 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] ARM: dts: device tree for YADRO VEGMAN BMC
Date: Thu, 11 Nov 2021 01:28:01 +0300
Message-ID: <20211110222803.836-1-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.10.105]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This brings initial DTS files for VEGMAN BMC machines

Andrei Kartashev (2):
  dt-bindings: vendor-prefixes: add YADRO
  ARM: dts: aspeed: add device tree for YADRO VEGMAN BMC

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +-
 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts  | 149 +++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts  | 255 ++++++++++++
 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts  | 154 +++++++
 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi      | 381 ++++++++++++++++++
 6 files changed, 945 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi

-- 
2.32.0

