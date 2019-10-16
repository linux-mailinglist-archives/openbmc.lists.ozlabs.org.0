Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C8DA21C
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:25:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpM36yM5zDqPn
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:25:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="B4c6kNPW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wz8m9KEn"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpLD1WjbzDqC0
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:25:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5213D12F0;
 Wed, 16 Oct 2019 19:25:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=LFBo2zo7ucpEAZ5mYd1NJStpAjTzuhZ
 prmnvtb7UvW4=; b=B4c6kNPW4hRWt/+usVBGEXxllUQ0Ex2OVUqErNu+HdlwZ81
 OGQddtpL+AF8i1oaGCH6RCbd1s/IqGEDRZLKQRP0gu6V9iU/Odr7QUhfp6z2J6ag
 c2k2V21sR/YLXbC/320Dbuer/X8v0HfUxfuMDE0wNvOHrIWH5BFtkaPMsf2ZGqRI
 7BfuFGWk4E+PII0JNfQ4cuXwhvq4Y3aO6gjol4omVNzAtj5MdMXN1qlMj70kmB9M
 nVz2jkppGKsHhJ+ExWAFFVDkOCUwpeUP7x+KqSnCXNeHV7x5KHgkYknhSIjjdXLB
 9RCnfy0rvJmw+my7s1ZphXtleQ1iUA4SUchqvow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LFBo2z
 o7ucpEAZ5mYd1NJStpAjTzuhZprmnvtb7UvW4=; b=wz8m9KEnZ0LTWNG+N5f9/7
 gh6vJdvwixRM2P+rirDueLZIqxjtL4RHpU0rr/XFR+RBMH6CilzaRhbnc5d6xf1s
 hxMkPD2JGKTdo29FYJbzavOr54g7VGNpVTIbmGYeMp3wykTAT+5EskjK2dogSNPl
 W6wPatHtZuyt5huEL7pnkIsz8D34bD4CZgy7fiYqB4uIjqM3+txb9VhkW2sgNluY
 QZHj8YxxCrNlYJ6HiwejrlZxUtqI25JagKEEtrL8mDVLY0psT8PJ7JCfjuymiGSp
 W1oDE41Ww+RtReK3fi9PDu8HP2w1IkztKnB16LUtBnXr5C8CvWtT9vjXxf/O/VFg
 ==
X-ME-Sender: <xms:0KanXTP1J_q5G0Znrf6NECEMhEzW3_Hn8HH6e-Lyxck6E-On1wscOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepphhorhhtfigvlhhlrdgtohhmpdhophgvnhgsmhgtrdhorhhgnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:0KanXes8GzFecS3AjZUBo66N9rDarMqIo5knne4i6VY_IC_aEPOhTw>
 <xmx:0KanXR4jaaa9Gbys1es7G_k0ggstqYQhZ48TWpWCUpHLA-d5I38Wvw>
 <xmx:0KanXQ5vZbOb3msS1bqACfPhPK4knxv6JU3KwIssV1Rb87q9cThOAw>
 <xmx:0KanXdNP3ntcrHxrork_uir0Ke-tdUdblSdIKidybu8g48CeSc3GcQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 829E2E00A5; Wed, 16 Oct 2019 19:25:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <3bc00539-bfb9-4fd8-a7dc-a6a1d7dca3b8@www.fastmail.com>
In-Reply-To: <b4ad804a513048e4bc8df7ff9cb8598b@SCL-EXCHMB-13.phoenix.com>
References: <b4ad804a513048e4bc8df7ff9cb8598b@SCL-EXCHMB-13.phoenix.com>
Date: Thu, 17 Oct 2019 09:55:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bruce Mitchell" <Bruce_Mitchell@phoenix.com>
Subject: =?UTF-8?Q?Re:_Recommendations_for_development_platforms_for_the_ASPEED_A?=
 =?UTF-8?Q?ST2500_&_AST2600=3F?=
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 17 Oct 2019, at 02:06, Bruce Mitchell wrote:
> Hello Andrew,
> 
> > Hi Bruce
> > 
> > On Wed, 16 Oct 2019, at 05:14, Bruce Mitchell wrote:
> > >  
> > > Hello,
> > > 
> > > 
> > > I am Bruce Mitchell and I work for Phoenix Technologies Ltd. as a BMC 
> > > firmware Engineer.
> > > 
> > > Phoenix Technologies Ltd. is developing an OpenBMC 
> > > (https://www.openbmc.org/ , not the Facebook flavor) product.
> > 
> > FYI, the projects have united (and the result lives under the Linux Foundation).
> 
> It seems the people at American Portwell Technology do not actually know that
> When I enquired about their Neptune Alpha OpenBMC development kit
> https://portwell.com/solutions/openBMC.php
> 
> > > 
> > > Our intent is also to be a valuable contributing member to the OpenBMC project.
> > 
> > Great! Looking forward to your contributions.
> > 
> > > 
> > > 
> > > We will be initially developing for the ASPEED Technology Inc. AST2500 
> > > followed by the AST2600 BMC SoC.
> > > 
> > > Do you have any suggestion of available hardware development platforms 
> > > for the ASPEED AST2500 & AST2600?
> > 
> > Unfortunately there isn't anything that is both cheap and easy to acquire that I'm aware of. Hopefully others can chime in if they know things that I don't, but this is an issue that's cropped up in the past and hasn't been resolved.
> > 
> > I think the cheapest anyone has found was a system (motherboard, cheap x86-64 CPU and RAM) that was about $800AU, but I'd have to dig out the details on what that was exactly (and it may have been AST2400-based).
> 
> Easily affordable is desirable, but easy to acquire is of more 
> importance presently.
>

Okay. Maybe browse through the list of supported machines then? Unfortunately
there's no canonical list, it's more a matter of looking through each OEM's meta
layer at what machines are supported that suit your needs. Currently we support
various x86-64, ARM and POWER hosts.

Hopefully others have better suggestions though :)

Andrew
