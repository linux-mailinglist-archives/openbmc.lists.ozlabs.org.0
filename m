Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C63E7C65
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 17:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkcVH636Rz30G9
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 01:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=XKb/AQsB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=XKb/AQsB; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkcT64Y7kz307n
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 01:34:50 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1111E48A6C;
 Tue, 10 Aug 2021 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1628609683; x=
 1630424084; bh=Cpz7STHdgDcx3h44+KtoM9BhcJjIzj3viQKNuLSI1cs=; b=X
 Kb/AQsBBfPD0Pkqdh5iCA3r0zmuSIPy595R9OYg6sBm72D7PkwtMLjefJhqvJWVT
 rBCcJg3bvxCYc5M9+NrjbWn/JP2TxGaF8w9EK+uzPFKywxo3U9kyYe0e4AoF5/Vl
 gyCko+Z3ZSAsHvi4MspDWDnO3m8J77nLcggwMYugA8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSU6vnUXcWCo; Tue, 10 Aug 2021 18:34:43 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3771A46796;
 Tue, 10 Aug 2021 18:34:40 +0300 (MSK)
Received: from fedora.bbmc.yadro.com (10.199.0.188) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 10 Aug 2021 18:34:39 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/2] rtc: pch-rtc: add Intel Series PCH built-in read-only RTC
Date: Tue, 10 Aug 2021 18:44:34 +0300
Message-ID: <20210810154436.125678-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.188]
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add RTC driver with dt binding tree document. Also this driver adds one sysfs
attribute for host power control which I think is odd for RTC driver.
Need I cut it off and use I2C_SLAVE_FORCE? I2C_SLAVE_FORCE is not good
way too from my point of view. Is there any better approach?

Ivan Mikhaylov (2):
  rtc: pch-rtc: add RTC driver for Intel Series PCH
  dt-bindings: rtc: provide RTC PCH device tree binding doc

 .../bindings/rtc/intel,pch-rtc.yaml           |  39 +++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-pch.c                         | 148 ++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/intel,pch-rtc.yaml
 create mode 100644 drivers/rtc/rtc-pch.c

-- 
2.31.1

