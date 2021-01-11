Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA52F2154
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:02:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF5kj2bkBzDqWT
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:02:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF5g95wYqzDqRy;
 Tue, 12 Jan 2021 07:59:33 +1100 (AEDT)
X-AuditID: ac1060b2-a93ff700000017ec-75-5ffcbc32772a
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 DB.85.06124.23CBCFF5; Mon, 11 Jan 2021 15:59:30 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 11 Jan 2021 15:59:29 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Jakub Kicinski <kuba@kernel.org>, Dylan Hung <dylan_hung@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx, v2 1/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue
Date: Mon, 11 Jan 2021 15:59:00 -0500
Message-ID: <20210111205900.22589-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWyRiBhgq7Rnj/xBtevq1nsusxhMed8C4vF
 12sbWS1+n//LbHFhWx+rRfPqc8wWl3fNYbM4tkDM4lTLCxYHTo+r7bvYPbru3mf32LLyJpPH
 xY/HmD02repk8zg/YyGjx+dNcgHsUVw2Kak5mWWpRfp2CVwZ27aIFvRzV9xu3sbSwHiHo4uR
 k0NCwERi5f12JhBbSGAXk8TrPokuRi4Qm1Gic8tkZpAEm4CaxN7Nc8CKRAS+MEoc/CoAYjML
 ZEpMPd7JDmILC/hJfHv/jBXEZhFQlTj9/wuYzStgKvHi20M2iGXyEqs3HACaycHBKWAmseeU
 HMReU4nWfe+YIMoFJU7OfMICMV5C4uCLF8wQNbIStw49ZoIYoyjx4Nd31gmMArOQtMxC0rKA
 kWkVo1BiSU5uYmZOermhXmJupl5yfu4mRkiYb9rB2HLR/BAjEwfjIUYJDmYlEV6vDX/ihXhT
 EiurUovy44tKc1KLDzFKc7AoifOucj8aLySQnliSmp2aWpBaBJNl4uCUamC0dFj7NCfP7eHk
 jZ9MxOrrn1W11k1NfnT+wX0Pm8AC45iPidlb+iu1bRgn67tI5srlalSZOJ8rXn5g3/O+B/bi
 lfdWZIl++9ojNTNXr1fZXV7pcl/Dkaxkcf1rH4833Aw5PiO/NUpnHh/jyintfjvlF36ynr9a
 6/LUxe5rJhprfZSeLF1eMFGJpTgj0VCLuag4EQBqeW7RYQIAAA==
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
> From:	Jakub Kicinski <kuba@kernel.org>
> Sent:	Monday, December 21, 2020 5:10 PM
> To:	Hongwei Zhang
> 
> On Mon, 21 Dec 2020 14:40:26 -0500 Hongwei Zhang wrote:
> > When FTGMAC100 driver is used on other NCSI Ethernet controllers, few
> 
> When you say NCSI Ethernet controller here you mean the main system NIC, right? The MAC on the NCSI 
> side is FTGMAC100, correct?
> 

Hi Jakub,

The use case for us is the MAC is configured as NCSI, so it provides network
 access for both BMC and Host, the Ethernet controller driver is from BMC kernel
side.

please see my response to Dylan in another thread, <20201215192323.24359-1-hongweiz@ami.com>,
he points out the root cause of the issue.

> In that case I'm not sure how user is supposed to control this setting at build time. The system NIC is 
> often pluggable on the PCIe bus, and can be changed at will.
> 
> > controllers have compatible issue, removing FTGMAC100_RXDES0_RX_ERR 
> > bit from RXDES0_ANY_ERROR can fix the issue.
> > 
> > Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
> 
> Please fix the commit hash, this hash does not exist upstream:
> 

will do.

Thanks
--Hongwei

> Commit: 8711d4ef64fa ("net: ftgmac100: Fix AST2600 EVB NCSI RX issue")
> 	Fixes tag: Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
> 
