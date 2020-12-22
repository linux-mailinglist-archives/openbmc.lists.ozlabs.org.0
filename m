Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC82E0F34
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 21:15:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0ndt4SSkzDqSg
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 07:15:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0ncr4BN2zDqJt;
 Wed, 23 Dec 2020 07:14:50 +1100 (AEDT)
X-AuditID: ac10606f-231ff70000001934-4f-5fe253b6a921
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 F1.71.06452.6B352EF5; Tue, 22 Dec 2020 15:14:47 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 22 Dec 2020 15:14:44 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Aspeed,
 v2 0/2] net: ftgmac100: Change the order of getting MAC address
Date: Tue, 22 Dec 2020 15:14:35 -0500
Message-ID: <20201222201437.5588-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201221205157.31501-2-hongweiz@ami.com>
References: <20201221205157.31501-2-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWyRiBhgu724EfxBpNvs1vsusxhMed8C4vF
 ovczWC1+n//LbHFhWx+rRfPqc8wWl3fNYbM4tkDM4lTLCxYHTo+r7bvYPbasvMnksXPWXXaP
 ix+PMXtsWtXJ5nF+xkJGj8+b5ALYo7hsUlJzMstSi/TtErgyDtw/wVjwkqXi+LE5TA2Mn5m7
 GDk5JARMJLpnrWfqYuTiEBLYxSTx5uRsGIdRYte79WwgVWwCahJ7N88BS4gIXGaUuNH1hBnE
 YRboYJSY+uIrO0iVsECgxNMr51hBbBYBVYlX9yFsXqAdJ56tY4HYJy+xesMBsN2cAmYSF7pn
 gcWFBEwlVvz9yAxRLyhxcuYTsDizgITEwRcvmCFqZCVuHXrMBDFHUeLBr++sExgFZiFpmYWk
 ZQEj0ypGocSSnNzEzJz0ciO9xNxMveT83E2MkIDP38H48aP5IUYmDsZDjBIczEoivGZS9+OF
 eFMSK6tSi/Lji0pzUosPMUpzsCiJ865yPxovJJCeWJKanZpakFoEk2Xi4JRqYHQyTb9XNPPT
 jnn/ZB8G/oqzndBaVXb8spzp/ToRv7TSjbH36ibdju30W2Tt0fPxzrKsWbIfdXQWyPrs/TeV
 d+92gb+pDOsYduy68HXRz6YKf7c3HpaZHN7xd/YstIjclM33/7KW6NfTT2ZE5SfcmqlQckVt
 Z/aR54mhPxcxZ7b0PZ7nHzRx0wslluKMREMt5qLiRAAUA96kZgIAAA==
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
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>,
 Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Reviewer,

Use native MAC address is preferred over other choices, thus change the order
of reading MAC address, try to read it from MAC chip first, if it's not
 availabe, then try to read it from device tree.

Thanks,
--Hongwei

Changelog:
v2:
- Corrected comments in the patch

v1: https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=221576
- Initial submission

Hongwei Zhang (1):
  net: ftgmac100: Change the order of getting MAC address

 drivers/net/ethernet/faraday/ftgmac100.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.17.1

