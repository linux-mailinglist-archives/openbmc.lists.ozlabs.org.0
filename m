Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 034982F2149
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:00:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF5hX0BwLzDqZH
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:00:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF5g61pLzzDqS2;
 Tue, 12 Jan 2021 07:59:29 +1100 (AEDT)
X-AuditID: ac10606f-231ff70000001934-0b-5ffcbc2de2f4
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 29.08.06452.D2CBCFF5; Mon, 11 Jan 2021 15:59:25 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 11 Jan 2021 15:59:24 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx, v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue
Date: Mon, 11 Jan 2021 15:58:59 -0500
Message-ID: <20210111205900.22589-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWyRiBhgq7unj/xBt0XTCx2XeawmHO+hcXi
 67WNrBa/z/9ltriwrY/Vonn1OWaLy7vmsFkcWyBmcarlBYsDp8fV9l3sHl1377N7bFl5k8nj
 4sdjzB6bVnWyeZyfsZDR4/MmuQD2KC6blNSczLLUIn27BK6MI68cClZIVqzauYitgfGHcBcj
 J4eEgInEoe4VbF2MXBxCAruYJPZsfMIC5TBKXHywgwWkik1ATWLv5jlMILaIwBdGidePgkBs
 ZoFMianHO9lBbGEBP4mTx46ydjFycLAIqEr0rikHCfMKmEp8ePGYGWKZvMTqDQeYQUo4Bcwk
 9pySAwkLAZW07nvHBFEuKHFy5hMWiOkSEgdfvGCGqJGVuHXoMRPEGEWJB7++s05gFJiFpGUW
 kpYFjEyrGIUSS3JyEzNz0suN9BJzM/WS83M3MULCPH8H48eP5ocYmTgYDzFKcDArifB6bfgT
 L8SbklhZlVqUH19UmpNafIhRmoNFSZx3lfvReCGB9MSS1OzU1ILUIpgsEwenVAOjpx3X4gZO
 24lXGp6oX14oXPbbfgW35X7vQyJ2dsvP3M4wvPqo7XX16v8/13/0O+pxbmnto9DErnu/X71d
 v1XlZJMU58abZj1cfzhVXsQsio595PT3gVNllNiPOVe81/D1yPW7mCQUF+5j3dJdxyzCMXPv
 hab9UuZV9WvcP773CGF9wvVcsdVHiaU4I9FQi7moOBEAUVm7GmECAAA=
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

> 
> Hi Hongwei,
> 
> The NCSI should run on 3.3V RMII.  According your log, you enabled NCSI on 
> ftgmac100@1e660000 which can only support 1.8V I/O voltage.
> Did you observe the same error on ftgmac100@1e670000 (MAC3) or ftgmac100@1e690000 (MAC4)?
> 

Hi Dylan,

Thanks for your review and input, you're correct, this issue is not observed on
AST2600 MAC4 (ftgmac100@1e690000).

Though this issue is caused by using NCSI incompatible MAC ftgmac100@1e660000,
we thought this patch is still having value, by providing an extra option to
user to be able to use ftgmac100@1e660000 for NCSI, and this is also true for
AST2500.

--Hongwei
 
> > -----Original Message-----
> > From: Linux-aspeed
> > [mailto:linux-aspeed-bounces+dylan_hung=aspeedtech.com@lists.ozlabs.or
> > g]
> > On Behalf Of Joel Stanley
> > Sent: 2020?12?22? 10:26 AM
> > To: Hongwei Zhang <hongweiz@ami.com>; Ryan Chen 
> > <ryan_chen@aspeedtech.com>
> > Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>; netdev 
> > <netdev@vger.kernel.org>; OpenBMC Maillist <openbmc@lists.ozlabs.org>; 
> > Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Jakub 
> > Kicinski <kuba@kernel.org>; David S Miller <davem@davemloft.net>
> > Subject: Re: [Aspeed, ncsi-rx, v1 0/1] net: ftgmac100: Fix AST2600EVB 
> > NCSI RX issue
> > 
> > On Mon, 21 Dec 2020 at 17:01, Hongwei Zhang <hongweiz@ami.com> wrote:
> > >
> > > Dear Reviewer,
> > >
> > > When FTGMAC100 driver is used on other NCSI Ethernet controllers, 
> > > few controllers have compatible issue. One example is Intel I210 
> > > Ethernet controller on AST2600 BMC, with FTGMAC100 driver, it always 
> > > trigger RXDES0_RX_ERR error, cause NCSI initialization failure, 
> > > removing FTGMAC100_RXDES0_RX_ERR bit from RXDES0_ANY_ERROR fix the issue.
> > 
> > I work with a few systems that use the i210 on the 2600. We haven't 
> > seen this issue in our testing.
> > 
> > Is there something specific about the setup that you use to trigger this?
> > 
> > Ryan, is this an issue that Aspeed is aware of?
> > 
> > Cheers,
> > 
> > Joel

Hello Joel,

Thanks for your review, please see my response to Dylan, he pointed out
the root cause of the issue.

-- Hongwei

> > 
> > >
> > > Here are part of the debug logs:
> > > ......
> > > [   35.075552] ftgmac100_hard_start_xmit TXDESO=b000003c
> > > [   35.080843] ftgmac100 1e660000.ethernet eth0: tx_complete_packet 55
> > > [   35.087141] ftgmac100 1e660000.ethernet eth0: rx_packet_error
> > RXDES0=0xb0070040
> > > [   37.067831] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> > > ............
> > >
> > > This patch add a configurable flag, FTGMAC100_RXDES0_RX_ERR_CHK, in
> > > FTGMAC100  driver, it is YES by default, so keep the orignal define 
> > > of RXDES0_ANY_ERROR. If it is needed, user can set the flag to NO to 
> > > remove the RXDES0_RX_ERR bit, to fix the issue.
> > >
> > > Hongwei Zhang (1):
> > >   net: ftgmac100: Fix AST2600 EVB NCSI RX issue
> > >
> > >  drivers/net/ethernet/faraday/Kconfig     | 9 +++++++++
> > >  drivers/net/ethernet/faraday/ftgmac100.h | 8 ++++++++
> > >  2 files changed, 17 insertions(+)
> > >
> > > --
> > > 2.17.1
> > >
> 
