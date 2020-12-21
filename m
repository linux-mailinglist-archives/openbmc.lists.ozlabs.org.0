Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3022DFEBE
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 18:07:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D05WC1B9dzDqNy
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 04:07:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D05NF3PY2zDqQ1;
 Tue, 22 Dec 2020 04:01:33 +1100 (AEDT)
X-AuditID: ac1060b2-a7dff700000017ec-60-5fe0d4eaa98b
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 6F.3D.06124.AE4D0EF5; Mon, 21 Dec 2020 12:01:30 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 21 Dec 2020 12:01:30 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed,ncsi-rx, v1] Answer to initial submission
Date: Mon, 21 Dec 2020 12:00:48 -0500
Message-ID: <20201221170048.29821-4-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
References: <20201215192323.24359-1-hongweiz@ami.com>
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWyRiBhgu6rKw/iDRpfm1jsusxhMed8C4vF
 7/N/mS0ubOtjtWhefY7Z4vKuOWwWxxaIWZxqecHiwOFxtX0Xu8eWlTeZPC5+PMbssWlVJ5vH
 +RkLGT0+b5ILYIvisklJzcksSy3St0vgyvh5Zz5TwSaWis4ZC5kaGLcxdzFyckgImEi8OPqB
 BcQWEtjFJLF/VmkXIxeIzSgx/81RVpAEm4CaxN7Nc5hAEiICqxklejb8YgRxmAU6GCWmvvjK
 DlIlLGAlMf3aH0YQm0VAVWLBm3VgY3kFTCVuLH3PCLFOXmL1hgPMEOtMJVr3vQOaysHBKWAm
 seeUHES5oMTJmU/AWpkFJCQOvngBVS4rcevQYyaIMYoSD359Z53AKDALScssJC0LGJlWMQol
 luTkJmbmpJcb6iXmZuol5+duYoQE9qYdjC0XzQ8xMnEwHmKU4GBWEuE1k7ofL8SbklhZlVqU
 H19UmpNafIhRmoNFSZx3lfvReCGB9MSS1OzU1ILUIpgsEwenVAPjkwTpC/7H7213uXBX/8rM
 /n7PCxOkwv1P2uf83HVLv+wim81tH7lWlqhWz/I7iWuDYh5lLi+/pGr3cUZBwuJHJx337Hw2
 XTl/YvPLBfdulDR7Plzgn27x83dPR9Jip2/2z74fM2Aw8EwQiU94P8l40TpLtu/39b4aXM3r
 KA55u19fijH9/ZFbSizFGYmGWsxFxYkATTfua1oCAAA=
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

Hi Jakub,

> From:	Jakub Kicinski <kuba@kernel.org>
> 
> > ... 
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> 
> Thanks for the patch. Please repost CCing the netdev mailing list so it can be merged to the networking 
> tree (which I assume is your intent).
> Please also include a Fixes tag pointing to the commit where the timeout issue started (even if it's the 
> first commit of the driver).
> 
I updated the cc list and cover letter accordingly, also addressed
Andrew's question. please review.

Thanks,
--Hongwei

-- 
2.17.1

