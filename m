Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C799B0669
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TLbN4jKlzF40s
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 11:22:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PT4QCYuD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XRIPhBjS"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TLZs2pHKzF40H
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 11:21:41 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BAD52506;
 Wed, 11 Sep 2019 21:21:38 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 11 Sep 2019 21:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ZTn2kq7nZFPFP/btNivBRqpCcfvgekb
 qm7zdg1d6CQQ=; b=PT4QCYuDTwU/bkpHBstKDxps7O/twuV9bzL3GHxdjbSbbXm
 H+VAj417dguBPzYuIdPSVYsb2LuvNA6f3bm4zH/VQTsLNesVFitTBIhbrUbrcUam
 GMstcUJaqgpP8N1mUgm6h4RQVMIAESy0rZnIz97hVvDXeLqz7489zv6AgUWlFvxv
 IynQyfUGV8r5bVTJ80+I6kJc6IKwVlNZFzJrKQTeKv/HICAlB9GrqXbzoN8YdPpt
 qdOiN3JXHdjShf7SRP+LHORV63G0DLNJRxCXrAzB/gSXVkN7a81q2ITdh67WkGbP
 VtxUpLMXLv/dPMD6UFS/XiZa77M8VqCksadM/qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZTn2kq
 7nZFPFP/btNivBRqpCcfvgekbqm7zdg1d6CQQ=; b=XRIPhBjSyQ1JGuhfPdO4c1
 sDnT5yDGblfVg3NWf51M2q+IPb0tHOzusHm+r4OHr+MZxKDaQZms5nsm7E33iBlQ
 fkmRuvLS2hL8NcQeeLrsJCMDF7FyvsESTAhYrKFShen8ABcnUvKszFy2cRcB9bCm
 qPQrYwut9IpEFu52Wif6xi14SwfKCdpatCE7ssDsuHPeAMepSWTcaRrS/hmBZwCX
 FQtluT5rImQimu2kG/EUHnOSbi+G0IHUqioxAQrRO/DExQlmaXNyXpfyq15Cc3fU
 E5CjtQq+Nz7IgOcsNOD1O7DdsmgFE0sPLVDc3ufg6HpcNYMy1slp18H/zkiD4H2Q
 ==
X-ME-Sender: <xms:oZ15XVcgxU2oLImZV_wWKKCYsEZIV_SgR-D3dLWzHCkomSWDMdyxuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghenucfrrghrrghmpehmrghi
 lhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpe
 dt
X-ME-Proxy: <xmx:oZ15XX5y4Zkw5bahulceKaXTxKetHtAzUwhlIHmj4xnZrGzcxnF_9w>
 <xmx:oZ15Xexb8UTk5tKDnvQztAowGaexXtOHbdu9QKlyfKLg8589A0chVA>
 <xmx:oZ15XTFoqqMSp6RzlGQZq4axr2ksimZXoIR1z7_UFjJgcFSZPJBDaA>
 <xmx:op15XfvMqoOgj_U43_HbYZufBlimYEKlZGVY7IUWtsBpbg9WDeFzsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 297CFE00B1; Wed, 11 Sep 2019 21:21:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <a9ae053b-4974-4ac9-824f-ba43cdfba0e0@www.fastmail.com>
In-Reply-To: <c8058df6-559d-7b78-f843-2e319219caaa@linux.intel.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
 <ca423521-05a5-1fcd-27f1-bb5f68fa3c23@linux.intel.com>
 <e37f18a6-18f0-4768-96c7-fb4ad05fe03f@www.fastmail.com>
 <d2ceccb7-2b1c-d944-76f2-ea284f4197f5@linux.intel.com>
 <d602a97b-4555-43cc-b801-c87f3c2899b6@www.fastmail.com>
 <35ff4cb2-0cc7-ba53-da71-980cc11a09de@linux.intel.com>
 <c8058df6-559d-7b78-f843-2e319219caaa@linux.intel.com>
Date: Thu, 12 Sep 2019 10:52:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Eddie James" <eajames@linux.ibm.com>
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
Content-Type: text/plain
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
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 12 Sep 2019, at 04:26, Jae Hyun Yoo wrote:
> Hi Andrew,
> 
> On 9/4/2019 5:54 PM, Jae Hyun Yoo wrote:
> > On 9/4/2019 5:10 PM, Andrew Jeffery wrote:
> >>
> >>
> >> On Thu, 5 Sep 2019, at 09:10, Jae Hyun Yoo wrote:
> >>> Hi Andrew,
> >>>
> >>> On 9/4/2019 4:12 PM, Andrew Jeffery wrote:
> >>>> On Thu, 5 Sep 2019, at 08:31, Jae Hyun Yoo wrote:
> >>>>> Hi Joel,
> >>>>>
> >>>>> On 9/4/2019 3:54 PM, Joel Stanley wrote:
> >>>>>> Hi Jae,
> >>>>>>
> >>>>>> On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo 
> >>>>>> <jae.hyun.yoo@linux.intel.com> wrote:
> >>>>>>>
> >>>>>>> In case of multi-master environment, if a peer master incorrectly 
> >>>>>>> handles
> >>>>>>> a bus in the middle of a transaction, I2C hardware hangs in slave 
> >>>>>>> state
> >>>>>>> and it can't escape from the slave state, so this commit adds slave
> >>>>>>> inactive timeout support to recover the bus in the case.
> >>>>>>>
> >>>>>>> By applying this change, SDA data-low and SCL clock-low timeout 
> >>>>>>> feature
> >>>>>>> also could be enabled which was disabled previously.
> >>>>>>
> >>>>>> Please consider sending your RFC patches to the upstream list. You
> >>>>>> have a big backlog of patches now.
> >>>>>
> >>>>> Thanks for the reminding. I can't send the RFC patches yet because 
> >>>>> QEMU
> >>>>> H/W model isn't ready yet. I'm still waiting for the fix from Cedric.
> >>>>
> >>>> QEMU shouldn't be preventing you from sending patches upstream, rather
> >>>> it prevents us from enabling the buffer mode support in the OpenBMC
> >>>> kernel tree. You should be sending all patches upstream as early as 
> >>>> possible.
> >>>
> >>> I met a QEMU issue when I was upstreaming a patch set last year:
> >>> https://lists.ozlabs.org/pipermail/linux-aspeed/2018-September/000750.html 
> >>>
> >>>
> >>> If OpenBMC community accepts the QEMU issue, I can submit the RFC
> >>> patches to upstream. Will submit the patch set soon to linux tree.
> >>
> >> Ah, didn't realise it was Guenter that ran into it. We have some 
> >> changes[1] in
> >> Cedric's aspeed-4.2 qemu tree - do you mind testing it out? If those 
> >> patches
> >> resolve the issue Maybe we could point Guenter at that tree, though 
> >> really we
> >> should get the fixes upstream so this isn't an issue.
> >>
> >> [1] 
> >> https://github.com/legoater/qemu/compare/59dda66ab756e52e6a9c1ef89660d30b3769f63c...aspeed-4.2 
> >>
> >>
> > 
> > Okay. I'll give it a try.
> 
> I've tested I2C buffer mode support in QEMU using:
> git://github.com/legoater/qemu.git
> SRCBRANCH = "aspeed-4.2"
> SRCREV = "1b31d645c448858eb7d11d463a4cb77df0ee7923"

This looks like changes to the qemu bitbake recipe? Have you
integrated openbmc/qemu into Yocto's runqemu infrastructure,
or were you just using bitbake to build qemu? I'd love to see
patches if you've done the former :)

Andrew
