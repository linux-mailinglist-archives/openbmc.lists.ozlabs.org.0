Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646C2E9C03
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 18:29:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8jKk3GXhzDqSt
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 04:29:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8jJl4lTCzDqP0;
 Tue,  5 Jan 2021 04:28:21 +1100 (AEDT)
X-AuditID: ac1060b2-a93ff700000017ec-30-5ff35032d503
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 AC.99.06124.23053FF5; Mon,  4 Jan 2021 12:28:18 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 4 Jan 2021 12:28:15 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: [Aspeed,
 v1 1/1] net: ftgmac100: Change the order of getting MAC address 
Date: Mon, 4 Jan 2021 12:28:07 -0500
Message-ID: <20210104172807.20986-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201221205157.31501-2-hongweiz@ami.com>
References: <20201221205157.31501-2-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWyRiBhgq5RwOd4g71dmha7LnNYnL97iNli
 zvkWFotF72ewWvw+/5fZ4sK2PlaL5tXnmC0u75rDZnFsgZjFqZYXLA5cHlfbd7F7bFl5k8lj
 56y77B4XPx5j9ti0qpPN4/yMhYweO3d8ZvL4vEkugCOKyyYlNSezLLVI3y6BK2PymZNMBc+k
 Krbsn8nawHhLpIuRk0NCwETi6+MvrF2MXBxCAruYJA7seMIE4exklJhy7xEjSBWbgJrE3s1z
 wBIiAp8ZJR6s2sgC4jALdDBKTH3xlR2kSlggSGJR6zpWEJtFQEVixu/fLCA2r4CpxPTtd1kh
 9slLrN5wgBnE5hQwk7jQPQusRgioZsXfj8wQ9YISJ2c+AYszC0hIHHzxghmiRlbi1qHHTBBz
 FCUe/PrOOoFRYBaSlllIWhYwMq1iFEosyclNzMxJLzfUS8zN1EvOz93ECImCTTsYWy6aH2Jk
 4mA8xCjBwawkwltx4UO8EG9KYmVValF+fFFpTmrxIUZpDhYlcd5V7kfjhQTSE0tSs1NTC1KL
 YLJMHJxSDYwnT03UCndZ4qrtLV4uxC/yrzS289bCL+v7grQmWhx/12v1t2mSlgzXwp9KHxdu
 ZVXfu2Lh4Q8nW/4Zm2rLVdbLMW3ds+asuFStr7e/doXykqnBbYUFE7ctjPGcv3wBv+ZzvTlR
 v3oOC4SF2F2+tjGp8sy1Ew+6Vp9lmHuur/LYCwfVQ9rSn38osRRnJBpqMRcVJwIA2rTk4nAC
 AAA=
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


> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Monday, December 28, 2020 5:01 PM
>
> On Tue, 22 Dec 2020 22:00:34 +0100 Andrew Lunn wrote:
> > On Tue, Dec 22, 2020 at 09:46:52PM +0100, Heiner Kallweit wrote:
> > > On 22.12.2020 21:14, Hongwei Zhang wrote:
> > > > Dear Reviewer,
> > > >
> > > > Use native MAC address is preferred over other choices, thus change the order
> > > > of reading MAC address, try to read it from MAC chip first, if it's not
> > > >  availabe, then try to read it from device tree.
> > > >
> > > > Hi Heiner,
> > > >
> > > >> From:  Heiner Kallweit <hkallweit1@gmail.com>
> > > >> Sent:  Monday, December 21, 2020 4:37 PM
> > > >>> Change the order of reading MAC address, try to read it from MAC chip
> > > >>> first, if it's not availabe, then try to read it from device tree.
> > > >>>
> > > >> This commit message leaves a number of questions. It seems the change isn't related at all to the
> > > >> change that it's supposed to fix.
> > > >>
> > > >> - What is the issue that you're trying to fix?
> > > >> - And what is wrong with the original change?
> > > >
> > > > There is no bug or something wrong with the original code. This patch is for
> > > > improving the code. We thought if the native MAC address is available, then
> > > > it's preferred over MAC address from dts (assuming both sources are available).
> > > >
> > > > One possible scenario, a MAC address is set in dts and the BMC image is
> > > > compiled and loaded into more than one platform, then the platforms will
> > > > have network issue due to the same MAC address they read.
> > > >
> > >
> > > Typically the DTS MAC address is overwritten by the boot loader, e.g. uboot.
> > > And the boot loader can read it from chip registers. There are more drivers
> > > trying to read the MAC address from DTS first. Eventually, I think, the code
> > > here will read the same MAC address from chip registers as uboot did before.

Thanks for your review, Heiner,

I am working on a platform and want to use the method you said, reading from DTS
is easy, but overwrite the MAC in DTS with chip MAC address, it will change the
checksum of the image. Would you please provide an implementation example?

Thanks!
> >
> > Do we need to worry about, the chip contains random junk, which passes
> > the validitiy test? Before this patch the value from DT would be used,
> > and the random junk is ignored. Is this change possibly going to cause
> > a regression?

Hi Andrew,

Thanks for your review. Yes, yours is a good point, as my change relies on
the driver's ability to read correct MAC from the chip, or the check of
is_valid_ether_addr(), which only checking for zeros and multicasting MAC.
On the other hand, your concern is still true if no MAC is defined in DTS
file.

Thanks!
>
> Hongwei, please address Andrew's questions.
>
> Once the discussion is over please repost the patches as
> git-format-patch would generate them. The patch 2/2 of this
> series is not really a patch, which confuses all patch handling
> systems.
>
> It also appears that 35c54922dc97 ("ARM: dts: tacoma: Add reserved
> memory for ramoops") does not exist upstream.
>

Hi Jakub,

Thanks for your review; I am quite new to the contribution process. I will resubmit my
patch with the SHA value issue fixed. Please see my response at above.

--Hongwei

-- 
2.17.1

