Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C252DFEAC
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 18:02:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D05PL4DJ8zDqPQ
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 04:02:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D05N446vLzDqNr;
 Tue, 22 Dec 2020 04:01:22 +1100 (AEDT)
X-AuditID: ac10606f-247ff70000001934-bd-5fe0d4de40c8
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 58.BF.06452.ED4D0EF5; Mon, 21 Dec 2020 12:01:18 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 21 Dec 2020 12:01:16 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx,
 v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue 
Date: Mon, 21 Dec 2020 12:00:45 -0500
Message-ID: <20201221170048.29821-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWyRiBhgu69Kw/iDXp7NSx2XeawmHO+hcXi
 9/m/zBYXtvWxWjSvPsdscXnXHDaLYwvELE61vGBx4PC42r6L3WPLyptMHhc/HmP22LSqk83j
 /IyFjB6fN8kFsEVx2aSk5mSWpRbp2yVwZZx51MhYsEaqYvK5I0wNjLvFuhg5OSQETCSWX//M
 3MXIxSEksItJ4u3tx+xQDqPEyT2bmUCq2ATUJPZunsMEkhARWM0o0bPhFyOIwyzQwSgx9cVX
 dpAqYQF/iVVzFrN0MXJwsAioShxt4gQJ8wqYSny6c5cFYp28xOoNB5hBSjgFzCT2nJIDCQsB
 lbTue8cEUS4ocXLmE7ByZgEJiYMvXjBD1MhK3Dr0mAlijKLEg1/fWScwCsxC0jILScsCRqZV
 jEKJJTm5iZk56eVGeom5mXrJ+bmbGCGBnb+D8eNH80OMTByMhxglOJiVRHjNpO7HC/GmJFZW
 pRblxxeV5qQWH2KU5mBREudd5X40XkggPbEkNTs1tSC1CCbLxMEp1cAYfVxH629B50S7L3az
 Zsyaz3/GzsPl0K7Y4JByr8TXhZX7Njueuf1Vgdmu9vjBqse6O759W5M/saFs894/IvUVC/R/
 ZVRefhdXn+4x630166fuXae6bVYuvpzHXfGDN/MQt27B/qV6nH9mtp0NnFLBf1X7svjy/54Z
 1z+sFdHj0AnRrzj4j3edEktxRqKhFnNRcSIAbIgpA1oCAAA=
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

When FTGMAC100 driver is used on other NCSI Ethernet controllers, few
controllers have compatible issue. One example is Intel I210 Ethernet
controller on AST2600 BMC, with FTGMAC100 driver, it always trigger
RXDES0_RX_ERR error, cause NCSI initialization failure, removing
FTGMAC100_RXDES0_RX_ERR bit from RXDES0_ANY_ERROR fix the issue.

Here are part of the debug logs:
......
[   35.075552] ftgmac100_hard_start_xmit TXDESO=b000003c
[   35.080843] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 55
[   35.087141] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
[   35.094448] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8 
[   35.101498] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
[   35.108205] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
[   35.287808] i2c i2c-1: new_device: Instantiated device slave-mqueue at 0x12
[   35.428379] ftgmac100_hard_start_xmit TXDESO=b000003c
[   35.433624] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 56
[   35.439915] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
[   35.447225] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
[   35.454273] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
[   35.460972] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
[   35.797825] ftgmac100_hard_start_xmit TXDESO=b000003c
[   35.803241] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 57
[   35.809541] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
[   35.816848] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
[   35.823899] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
[   35.830597] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
[   36.179914] ftgmac100_hard_start_xmit TXDESO=b000003c
[   36.185160] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 58
[   36.191454] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
[   36.198761] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
[   36.205813] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
[   36.212513] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
[   36.593688] ftgmac100_hard_start_xmit TXDESO=b000003c
[   36.602937] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 59
[   36.609244] ftgmac100 1e660000.ethernet eth0: rx_packet_error RXDES0=0xb0070040
[   36.616558] ftgmac100_rx_packet RXDES0=b0070040 RXDES1=f0800000 RXDES2=88f8
[   36.623608] ftgmac100 1e660000.ethernet eth0: rx_packet_error 0xb0070040
[   36.630315] ftgmac100 1e660000.ethernet eth0: [ISR] = 0xb0070040: RX_ERR
[   37.031524] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   37.067831] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
............

This patch add a configurable flag, FTGMAC100_RXDES0_RX_ERR_CHK, in FTGMAC100
 driver, it is YES by default, so keep the orignal define of
RXDES0_ANY_ERROR. If it is needed, user can set the flag to NO to remove
the RXDES0_RX_ERR bit, to fix the issue.

Hongwei Zhang (1):
  net: ftgmac100: Fix AST2600 EVB NCSI RX issue

 drivers/net/ethernet/faraday/Kconfig     | 9 +++++++++
 drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
 2 files changed, 17 insertions(+)

-- 
2.17.1

