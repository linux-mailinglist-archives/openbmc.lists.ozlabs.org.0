Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6118215153
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 05:14:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0VzP3VtHzDqgF
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 13:14:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=gYNSYbAd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rKl5aPS1; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0VyL1zL0zDqf3
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 13:13:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EF235C00ED;
 Sun,  5 Jul 2020 23:13:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Jul 2020 23:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=n/rB8dgpZt05OIXdy/VBHsrB1T8Fgdr
 h/XfCS1jv4CA=; b=gYNSYbAdpGp0PV2AZ1uI7cp2oq86Nm4ie6REnEpJIGlTP64
 sOk8kOKhpBeQyJoFRRcM3sbHmL8ZvyYO+DDgDp3bO3u16mTCW6CtATZ/zRa/7oKa
 pvRNX6Qrbc89O56Mjgtit2ywM7i5JJY3yyXv7vbfrv8gDFnum3LQGSL/6I4AJGBB
 vvg7Bz8ZBMHAp4clOIAgqu/ukcX/nB5xX+5uAfdsF+JFmhFk8rNChMlL5+jVazzh
 xJZVQMh8NJSzlC5HNZQJTEHUTdRO9MdLMZgEQzo3t00xFCcygw7MccogNVNpkzjY
 +GWIHnIJtPqFDtgJd1RxTo9ZZSO9sXankBKBDXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=n/rB8d
 gpZt05OIXdy/VBHsrB1T8Fgdrh/XfCS1jv4CA=; b=rKl5aPS1G5F5Hl76j5m4+5
 GlPGwh+hu0LzAR5vOek47d3X/4OFqUAixwE3CuDwkBqXDP30Gf2we/6kuP5AVSqq
 vvb/G2XLgtZfEt/9ZlMxU1AB4cFzAl/bGqsWGgM0jrfpsFSf5LqfgZu6QVMws5ji
 fvC2sQTKevii2JhFUZWluQ8oWlJFFdWROIQnDUO1MdlYial4fUxUSxo8N0KllGyc
 fqxCbBy2FMhi1gp1TvlMSPiPMd2iN8i3SfN6bSDARLekL7tmWHg2Ju6N6ApTbNvX
 3jsrAgW5Jf7ImgRZMItq8swiXwuc2eGpZwdj3H7EniiyH9gaVDaOnot8MbHnj0CQ
 ==
X-ME-Sender: <xms:1pYCXzTCry_Gn20DvpmVT8zUKerLPMMYnnR2Eoz88YxK33-ctvtJCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 jeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepffefieegteejuefhtdetleelhfelgeek
 vdektedtgfeuhfffkefhgeejtdfgveehnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1pYCX0yENp6Ko51oxsswJZeQtHti54jlBEMzolLRl2GnYPR8LkyYOA>
 <xmx:1pYCX430gi1uDL49zhuXD0e7C6OS2tbf23k4HaFjhjive0HtvEloHQ>
 <xmx:1pYCXzA6WAX2i6LiLqhhnCDImhZbJsH7aFBdh9EYhFYlqq0PoVh-_w>
 <xmx:15YCX4ZbytDD__FZ8W7EpuSYCnJ25eqlj1pCKoIFN6EmK38Fr4IEzw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 15E8DE00AA; Sun,  5 Jul 2020 23:13:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <2b9de3db-222a-4a70-bbe9-36a0aec0e66e@www.fastmail.com>
In-Reply-To: <be5a68c4-39b4-2d88-425d-0ab2121ed564@linux.intel.com>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
 <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
 <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
 <8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com>
 <be5a68c4-39b4-2d88-425d-0ab2121ed564@linux.intel.com>
Date: Mon, 06 Jul 2020 12:43:04 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Jeremy Kerr" <jk@ozlabs.org>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>, 
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_MCTP_Null_EID_-_Physical_addressing_support_-_Binding_priv?=
 =?UTF-8?Q?ate_in_API?=
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



On Fri, 5 Jun 2020, at 12:53, Thomaiyar, Richard Marian wrote:
> Thanks Andrew, 
> 
> inline comments. Captured this as an agenda for our next work group 
> call discussion https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG

I noted in another thread that I've pushed patches implementing bridging and 
routing along with the provisional EID concept to gerrit:

https://gerrit.openbmc-project.xyz/q/topic:%2522routing%2522+(status:open+OR+status:merged)+project:openbmc/libmctp

In the end the implementation uses a "provisional" flag in both the mctp_eid_t 
type and the route table as there was one race that couldn't be safely 
eliminated without it.

> 
> [Richard]: We 
> can't know which EID can be used as provisional. It may be real EID in 
> a bridged network. Please educate me, if the same can be achieved 
> without having a conflict. 

Because the conflict shouldn't matter - it can be detected by the binding 
receiving the message by looking up the source EID in the route table and 
checking if the result is a provisional EID.

However, the complication occurs when trying to remove the provisional EID from 
the route table in order to deliver the message received from the endpoint that 
has been formally allocated the same EID. If there's an outstanding command 
whose response hasn't yet been sent which will need the provisional EID entry 
from the table in order for the message to be routed, we can't deliver the 
message received from the endpoint which is non-provisionally assigned the EID. 
It's hard to unwind that properly and still account for issues like deadlocks 
or application crashes which will lead to a denial of service.

So the result is we have a route table with two separate address spaces, one 
for formally assigned EIDs and another for provisional EIDs. This partition is 
managed by a flag on the route table entries in the current implementation.

Andrew
