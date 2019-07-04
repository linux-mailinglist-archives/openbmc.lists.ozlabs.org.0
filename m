Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3A5EFF9
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 02:14:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fJQ62P7MzDqY7
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 10:14:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C+O0AWVG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dl1D771R"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fJPT2qV1zDqXS
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 10:14:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D046B511;
 Wed,  3 Jul 2019 20:14:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 03 Jul 2019 20:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=FACy4IFHMw68VB8P+GJYr40gHGe/bHn
 0SJBEM5nfXow=; b=C+O0AWVGm5Vz4v0lQll0mWZXAyblLt0+2a5Ro155hK3iZ5w
 Geod8glJL2INsApWuzKPajFnCrZ15uivIe5ds03LMiiajrK8LYabQZIRLspD/IVP
 3KT4eIaLnB61o36QxELBivBStCZiX+LeM6+ubgA1bw6IWXN/dCfCwXB6lxCm6Ml5
 90kC3bpamEl7z2aCVJAaMVjvGbiKmyQ3s9ASsTMr8fKfl84zqw5YUNOCykDcxqkg
 /1JWXMho2E/vhVxkZ+a4oJhIV9rWYTHnD7BuKc6xDjBcfL+vq0lGZrsZw/GaE7G0
 ZSsBLQMNyemyugWqX5UXD/iO4345HHaGD4+a26A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FACy4I
 FHMw68VB8P+GJYr40gHGe/bHn0SJBEM5nfXow=; b=dl1D771RJvcW7hAuV6taOP
 xBPnck+8exkXDum2Pl8xN+A+C0Xe/HakZuZbPwSOcrGHflofAozOee3fFOgaBh1E
 olGsZ7V7uZJfBHUG02x+ytO1lOsgo4q8jVWxwLKTAAsbyMLY31newIGMBmxogGtH
 45T4CRPGweyFsp482fgUYeAk5M2pZaURLSbtuQCx8zlCtzoAX8709MeqNaPL1KAU
 mxIcvJviy2hRBgGkoI9iBeLxHL+bxg4a3o1dHu1qOF5d+XyShn5dpJCkyxZ0At0y
 xnS7XxgedN5lCfnx5QMS4SeN10YwgxdZ0ISpYFPvEr4/aVgs9OFrrRlzBY7kOHcQ
 ==
X-ME-Sender: <xms:2kQdXYAEZHG3nHsM2FhLN32GAHVn92mxWVui2Yiqo4wzPNS6Op_NfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfedugdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:2kQdXenJdlMyaGOiGA21Xr6AJ7mTZ6OhbAm1PAxxjRBAKfSlGmVX5A>
 <xmx:2kQdXVG5jRF5alKcxU0gc308bXOQ-GkjpeNXshom1hYD3LkFjnfkxg>
 <xmx:2kQdXYgbeNsgoA6PO_cusFFjUDejwqeGRkIX8tfVW0YwgHXBTR6dwg>
 <xmx:2kQdXawTuIuuNoIy25_YUyDu3ggrvcXyPABrcFDzVWJEtmVwv9v4pw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1AE8FE00A2; Wed,  3 Jul 2019 20:14:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <db9601ef-3bb6-4747-ae40-f886054cad57@www.fastmail.com>
In-Reply-To: <25cbbfb5-0cc0-e8d9-4808-72bab90cb442@linux.ibm.com>
References: <1560285038-24233-1-git-send-email-eajames@linux.ibm.com>
 <95aa5594-325b-45d4-b777-075426ca3244@www.fastmail.com>
 <25cbbfb5-0cc0-e8d9-4808-72bab90cb442@linux.ibm.com>
Date: Thu, 04 Jul 2019 10:14:10 +1000
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] OCC: FSI and hwmon: Add sequence numbering
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 4 Jul 2019, at 00:36, Eddie James wrote:
> 
> On 7/2/19 7:31 PM, Andrew Jeffery wrote:
> > On Wed, 12 Jun 2019, at 06:31, Eddie James wrote:
> >> Sequence numbering of the commands submitted to the OCC is required by
> >> the OCC interface specification. Add sequence numbering and check for
> >> the correct sequence number on the response.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   drivers/fsi/fsi-occ.c      | 15 ++++++++++++---
> >>   drivers/hwmon/occ/common.c |  4 ++--
> >>   drivers/hwmon/occ/common.h |  1 +
> >>   3 files changed, 15 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> >> index a2301ce..7da9c81 100644
> >> --- a/drivers/fsi/fsi-occ.c
> >> +++ b/drivers/fsi/fsi-occ.c
> >> @@ -412,6 +412,7 @@ int fsi_occ_submit(struct device *dev, const void
> >> *request, size_t req_len,
> >>   		msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> >>   	struct occ *occ = dev_get_drvdata(dev);
> >>   	struct occ_response *resp = response;
> >> +	u8 seq_no;
> >>   	u16 resp_data_length;
> >>   	unsigned long start;
> >>   	int rc;
> >> @@ -426,6 +427,8 @@ int fsi_occ_submit(struct device *dev, const void
> >> *request, size_t req_len,
> >>   
> >>   	mutex_lock(&occ->occ_lock);
> >>   
> >> +	/* Extract the seq_no from the command (first byte) */
> >> +	seq_no = *(const u8 *)request;
> > The fact that your doing this says to me that the fsi_occ_submit() interface
> > is wrong.
> >
> > We already have `struct occ_response` in drivers/hwmon/occ/common.h.
> > I think we should add an equivalent `struct occ_request` and pass a
> > typed pointer through fsi_occ_submit(), that way we can access the
> > sequence number by name rather than through dodgy casts.
> 
> 
> I don't think it's too bad. The first byte is always simply the sequence 
> number.

Sure, but the readability isn't great and the code suggests to the reader
(me?) that the interface is either being abused or wasn't thought through.
The lack of  `struct occ_request` also has an impact on readability at the
call-sites where we're manually stuffing the bytes into a buffer, some of
which are multi-byte where we need to deal with endianness.

> The worst that can happen is a user doesn't write a request 
> correctly and we have a "wrong" sequence number, but in that case the 
> request most likely won't work anyway.

Except it's worked so far even though we were always sending zero?

> I think ideally it would be like 
> you say, but it's also not ideal to change the interfaces at this stage.

What do you mean? It's an internal kernel API, not userspace API/ABI.
We can change it if we feel the need.

> 
> 
> >
> > Also why is this sent just to the OpenBMC list? Any reason it's not on
> > upstream lists?
> 
> 
> It was... it's been accepted.
> 

Yeah I missed that :/

Andrew
