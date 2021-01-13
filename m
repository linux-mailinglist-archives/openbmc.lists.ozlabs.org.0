Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB412F54F4
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 23:39:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGMnY2wkNzDrj9
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 09:39:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGMmJ4ssrzDrgR;
 Thu, 14 Jan 2021 09:38:22 +1100 (AEDT)
X-AuditID: ac10606f-231ff70000001934-d8-5fff765a36f4
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 42.3B.06452.A567FFF5; Wed, 13 Jan 2021 17:38:18 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 13 Jan 2021 17:38:16 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH, v1 0/1] gpio: aspeed: Add gpio base address reading
Date: Wed, 13 Jan 2021 17:38:07 -0500
Message-ID: <20210113223808.31626-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRiBhgm5U2f94g+Z7aha7LnNYfJl7isXi
 9/m/zBZT/ixnstj0+BqrRfPqc8wWm+f/YbS4vGsOm8WplhcsDpweV9t3sXu8v9HK7nHx4zFm
 jzvX9rB5bF5S73F+xkJGj8+b5ALYo7hsUlJzMstSi/TtErgyThz8wF4wm7mi7/QBxgbGI0xd
 jJwcEgImEncaJjN2MXJxCAnsYpJ4/aiHFcphlPi4ZisLSBWbgJrE3s1zmEASIgInmSRm7f4F
 1s4soCLxY/U1VhBbWMBFYufUh2wgNouAqsSbNQ/AangFTCVuTTrCBrFOXmL1hgPMEHFBiZMz
 n7BAzJGQOPjiBVhcSEBW4tahx1DnKUo8+PWddQIj3ywkLbOQtCxgZFrFKJRYkpObmJmTXm6k
 l5ibqZecn7uJERK++TsYP340P8TIxMF4iFGCg1lJhLeo+2+8EG9KYmVValF+fFFpTmrxIUZp
 DhYlcd5V7kfjhQTSE0tSs1NTC1KLYLJMHJxSDYzyyqqSIXmcaSLpyWnbZsc0Hju7Refmntx7
 k2w0w8qWdmZcfRwtcfzowSM3dTbYtks8FWHe6H0nQz1F8xuv4KEzB3KvvDiad2T527jVUjYu
 z68saVdQWj7xy6uQf1uXfAnYvef6hXuRFdWlMTnfvhmvrTQ/2qz45vu0B7tFwlY3zwopda8q
 Nf2oxFKckWioxVxUnAgArcLYW00CAAA=
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
Cc: Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Reviewer,

Add gpio base address reading in the driver; in old code, it just
returns -1 to gpio->chip.base. In this patch, the code first try to
read base address from of_property_read_u32(), if it fails, then
return -1.

Hongwei Zhang (1):
  gpio: aspeed: Add gpio base address reading

 drivers/gpio/gpio-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1

