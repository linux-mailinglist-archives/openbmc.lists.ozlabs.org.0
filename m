Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33043B9FA5
	for <lists+openbmc@lfdr.de>; Fri,  2 Jul 2021 13:17:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGXbz61Rpz3bWj
	for <lists+openbmc@lfdr.de>; Fri,  2 Jul 2021 21:17:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=turOmgmP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=turOmgmP; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGXbD43Fyz301J
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jul 2021 21:16:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DB8A346759;
 Fri,  2 Jul 2021 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1625224593; x=
 1627038994; bh=LT52yX2+1sgdqwo6AJLkCSNgc56psjUMyc9SnqouNRc=; b=t
 urOmgmPPa+oOyMmrYIMCU+zcLdgK1d6zizAPaObiI2tazyhsnUtu49dsYopKu9QG
 gjLSvA68DTuDEkQOCVuxxtpz4eMCMtFVu7xxPJDXZ7br1lTmabe0E1a8o73n5voR
 UOrG/WnIfpb8mdGUQk00vXW+WmQWdPpgHjYFjwkmdE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsor2mjJayvm; Fri,  2 Jul 2021 14:16:33 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 49715412FC;
 Fri,  2 Jul 2021 14:16:29 +0300 (MSK)
Received: from localhost.yadro.com (10.199.0.133) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 2 Jul
 2021 14:16:29 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH 0/2] Add NCSI Intel OEM command to keep PHY link up on
Date: Fri, 2 Jul 2021 14:25:17 +0300
Message-ID: <20210702112519.76385-1-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.133]
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
resets during the host load. Also includes dummy response handler for Intel
manufacturer id.

Ivan Mikhaylov (2):
  net/ncsi: add NCSI Intel OEM command to keep PHY up
  net/ncsi: add dummy response handler for Intel boards

 net/ncsi/Kconfig       |  6 ++++++
 net/ncsi/internal.h    |  5 +++++
 net/ncsi/ncsi-manage.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 net/ncsi/ncsi-rsp.c    |  9 +++++++-
 4 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.31.1

