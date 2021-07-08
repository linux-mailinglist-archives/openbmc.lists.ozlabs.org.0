Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198FF3BFA1C
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 14:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLFtz4pbDz3bWm
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 22:28:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=iUam7raN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=iUam7raN; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLFtk0VfJz2ymZ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 22:27:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 04C1349E3D;
 Thu,  8 Jul 2021 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1625747271; x=
 1627561672; bh=bO6Qk1sZMJQVSInPZGyfZf+bln/u5E6eqcOxjG61nAI=; b=i
 Uam7raNvzYwN4+UwSq3eZuNlTjP5MUUCB9cggKvAaJV3IMfiTp3tTfoELDGyU78C
 PEE4y+++SLQ0O3+dxaPq0eYaGylne3oLUUs+TL6Z2B4I/Chyowea68IdB0NX7JDE
 mkuJZZKICAA9p5ywlFHaQo0psLvNEQekFsKFZ4KTos=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb_Ks_nfBjDz; Thu,  8 Jul 2021 15:27:51 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0320949F4C;
 Thu,  8 Jul 2021 15:18:25 +0300 (MSK)
Received: from fedora.mshome.net (10.199.0.196) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Jul
 2021 15:18:25 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 0/3] net/ncsi: Add NCSI Intel OEM command to keep PHY link
 up
Date: Thu, 8 Jul 2021 15:27:51 +0300
Message-ID: <20210708122754.555846-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.196]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Add NCSI Intel OEM command to keep PHY link up and prevents any channel
resets during the host load on i210. Also includes dummy response handler for
Intel manufacturer id.

Changes from v1:
 1. sparse fixes about casts
 2. put it after ncsi_dev_state_probe_cis instead of
    ncsi_dev_state_probe_channel because sometimes channel is not ready
    after it
 3. inl -> intel

Ivan Mikhaylov (3):
  net/ncsi: fix restricted cast warning of sparse
  net/ncsi: add NCSI Intel OEM command to keep PHY up
  net/ncsi: add dummy response handler for Intel boards

 net/ncsi/Kconfig       |  6 +++++
 net/ncsi/internal.h    |  5 +++++
 net/ncsi/ncsi-manage.c | 51 +++++++++++++++++++++++++++++++++++++++---
 net/ncsi/ncsi-rsp.c    | 11 +++++++--
 4 files changed, 68 insertions(+), 5 deletions(-)

-- 
2.31.1

