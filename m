Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3820AF080
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:34:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tWvy5GnhzDqQ5
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 16:34:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jYDfqezk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OqLJIazO"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tWtp4b8szDqBM
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 16:33:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 89E0F6FE;
 Tue, 30 Apr 2019 02:33:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 30 Apr 2019 02:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=7BHyuMZEtWVw1aM28rd7ZKLQssz3IoR
 qFFKRJpojlI0=; b=jYDfqezkxBxiDryd76ADSedNGsGyLnyqwJkqwE/bqZAZzXZ
 /jpOCaKAOx50803f89O45lGVOtDtZk2xoCFNlLCLbC+ONg7wfDKy+jyf7fOZKvMT
 uAInYtnmln0nM8Jf1vOv6EUSLwAuYnrnnOnLOmQnglov4nTBZ+q+GZZlWhqVyTh0
 b8o7g5Fk3uYoEvm00IK6PsRCzcQqN/VEzcCtmnzn2j7eIkuEZXZGD81ucDA3Lk8k
 v3hEmZApEH2vnkJrfDZd0BrmkcqfUuGHgMXP3kaC5qA5zx/GGAk+pNmqDuON8/UP
 TRnLzuKeRUpwPxxcNqb1lU7rquw1mSjCFkFNCrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7BHyuM
 ZEtWVw1aM28rd7ZKLQssz3IoRqFFKRJpojlI0=; b=OqLJIazOsJ212thPtdLdQx
 Sof4i11df0dRxISiMcDIA3KyyzL0iB25YZNeBiis/TOBk0dsed04GtEU0Z3IYJg2
 mDLWduZ+JY/TReTDGtOuqEnSoH+1CKyRqsbxsOvI6mvTXGxaPNtx9x7tc3tqh011
 OnBc8x9+xvx8pVDIMTo9bu3U3eMJLNNB4sahuQtUnJRTk0spaPkmHq+1zs+oxhDc
 DzUjKMzWoqY3T1pkDlmHyzmQtimlGTnOpDZPLcsmU6eIN6zKnWMApBvuBIQ10nNz
 vln61WqATugpPdtOIq5ZuSU5IP4ZW6dPN1iEIT9mCDBEuqHA3q4ZiYyIpPCWx2qA
 ==
X-ME-Sender: <xms:LuzHXJjXARY-sWsud2oxqtKN11LjnnPYcL-akD1wTVvBuQLdTwV_zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:LuzHXDlJ2QrWS3Szf70ooGJBq8jinTMb0OgbI5YeSpWbgdmi6E26jg>
 <xmx:LuzHXLE6gBAeBPUhVceq9OEKO_TNdnQ8OvCFPCbOwZ1g03j4WaSwhQ>
 <xmx:LuzHXMyndRwiBxy4JwL5aJtNcb4pL3ZNDRXgxVriIbn-aLc5OvD4Dw>
 <xmx:L-zHXAuvQ09V4ZCnyydg_KDPI0ztAbKXZ9H01gaG96n__9J9OupNpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EE9207C199; Tue, 30 Apr 2019 02:33:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-448-g5cc1c91-fmstable-20190429v1
Mime-Version: 1.0
Message-Id: <9275a330-6ee3-4de0-8f0b-53b208abb81d@www.fastmail.com>
In-Reply-To: <CACPK8XeHKyVF8FvcS9BCt9uaSaYSR6-+suGYr6-NCDZisK33mg@mail.gmail.com>
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
 <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
 <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
 <CAO=notwm0eqmk1G+B-YziEf0Y=6PjAPM-Pu=d1Kc6Q_3QD0B7g@mail.gmail.com>
 <66a33cb9-19fe-4ccb-8449-76d2ba807cb1@www.fastmail.com>
 <CACPK8XeHKyVF8FvcS9BCt9uaSaYSR6-+suGYr6-NCDZisK33mg@mail.gmail.com>
Date: Tue, 30 Apr 2019 02:33:17 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 29 Apr 2019, at 17:57, Joel Stanley wrote:
> On Thu, 18 Apr 2019 at 06:20, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Tue, 16 Apr 2019, at 23:56, Patrick Venture wrote:
> > > > > Looks like the issue is 5.0.6 doesn't have the lpc parameter optional patchset.
> > > Sorry, I stopped following that patchset a while back, I just assumed
> > > it landed.  Was there some push back?
> >
> > Not that I'm aware of. Vijay has been pinging Joel periodically, I'm not
> > sure why he hasn't merged it. I'd like to wait until Joel can respond in
> > case there's something I've missed here.
> 
> I can't see anything relevant on the list. In fact, I've cleared the
> entire backlog today.
> 
> $ pwclient list -p openbmc -s new  | grep dev-5.0 | wc -l
> 0
> 
> Do you have a link to the email in question? If not, someone please
> send it along and I'll put it in the tree. I assumed it was applied.

Maybe it's best if Vijay resends it. Add him in To.

Andrew

> 
> Cheers,
> 
> Joel
>
