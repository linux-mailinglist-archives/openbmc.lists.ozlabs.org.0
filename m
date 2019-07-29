Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A47838E
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 05:03:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xkyy2SHyzDqRt
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 13:03:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JDMrXQkN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NY1ScmpD"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xkyD0kD2zDqMf;
 Mon, 29 Jul 2019 13:02:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B21CA2213F;
 Sun, 28 Jul 2019 23:02:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 28 Jul 2019 23:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=N1hAFZXaRC7+kq+BHRoNAciRBTswSKT
 k1E9q8r0qyao=; b=JDMrXQkNsEzOmPSrbkMoxqP/YO90ilh1H92tAfWpDbyaIEb
 wXZsNzKX/2+7pignkDfjMAIQm/dIifCzxn7SQtiLCpcSRwdgvKQ8ZR0mCHI8o5Ac
 RamvoZLeIQwLtcTxxlmXXBHnZYMIzLan02G23a/Bz7DqkJzujFEkWgvkglHk+H+z
 Pyr3McrspYKCFd9a6j1uF66h1Gwp3p2a1Hd3Oc2M/jXu2Tt1VGjqfZsTiIswZo5t
 B7NyZYwiWmmCI5CyC07NaEVm0MCWzpaiaV1+ivucjwnj3wW6oJ0ss5vM8ckLAkS3
 VJVZ2GBqwl5hrZs4lm/TPa6/OvHOQU+orZRId3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N1hAFZ
 XaRC7+kq+BHRoNAciRBTswSKTk1E9q8r0qyao=; b=NY1ScmpD0p8wM0/C93ZmAS
 lfC0HerbnXdECUdGBCjfGtoGA53pe0RM2+1QfimNKT54of29Z4uBZmB4QmOkdNPH
 BFL0v2/z8kDnjAaqQcLfPFFr9GoQkTyL+fJzmbgGVTcDuPrLE7oUOSVWgJkcT4Nm
 Gil4d3IfJeRu2TbgxFZLENnYL9D/3rymNej7JuuVHFc/hCbge+h5fstk3Qo6lbxr
 TVx5w+w9qxeoqmqupCzS0LJ7zgkBzAYyONZ5t4p6qldB7m5hr7tw0rrYZ+fzTmN+
 Tz/5+eF82eX4BioALcVHpZe0PYcY3rzMJ+Gn30ef0vzhHqg3b5lzv92WCmllNxRw
 ==
X-ME-Sender: <xms:z2E-XSeA8e7aGyZMmk6FsKnr21NwjSR0uhMPUY4pC4aOKM3__CMy3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:z2E-XQeQD03_AcsbUWxOSOOc9Qgkj1INOk8Z35vt7EUzdanfxC3eUQ>
 <xmx:z2E-XeiJJWWKB9OjJgP6cD2OIKIMDt2ADw7tVPEaY7cLEjqr9lB5RQ>
 <xmx:z2E-XUQxwSsvbt4BocA3J5q3dvqnvZG6SHJj7nC1_UCNG3s7jyPwIw>
 <xmx:0GE-Xavr8Q_IXiZ_TBqGxeQQt2mDtDrZA_FJaYSLT4Ybqb_dnWBc8w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B7E0E00A5; Sun, 28 Jul 2019 23:02:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <53f2c3aa-9502-4989-9c22-1a7f1c74cf47@www.fastmail.com>
In-Reply-To: <CABoTLcS2Pepyfc8A-gzm+Nh2T5yCCmexCC94K8Pm=4mtM4JHBA@mail.gmail.com>
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
 <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
 <9855284dfa4c4d4a52441553691c7b4b08a9cc34.camel@ozlabs.org>
 <CABoTLcS2Pepyfc8A-gzm+Nh2T5yCCmexCC94K8Pm=4mtM4JHBA@mail.gmail.com>
Date: Mon, 29 Jul 2019 12:32:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Oskar Senft" <osk@google.com>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_drivers/tty/serial/8250:_Make_Aspeed_VUART_SIRQ_po?=
 =?UTF-8?Q?larity_configurable?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 29 Jul 2019, at 11:51, Oskar Senft wrote:
> 
> Hi Jeremy
> 
> > Somewhat offtopic, but are you sure you want to enable the SuperIO
> >  device?
> No :-D I'm aware of CVE-2019-6260. I just listed it as a potential 
> source of SIRQs.
> > > The VUART is covered by this code and we don't have a PUART driver
> >  > yet.
> >  > 
> >  > It might make sense to have this as a global setting which each driver
> >  > could read. But wouldn't this be an exercise for the future where we
> >  > actually have a second device? I don't think the Aspeed currently has
> >  > any other devices that could generate a SIRQ (except for the PUART for
> >  > which there's no driver).
> > 
> >  We have a bunch of SIRQ sources that we use (on OpenPOWER platforms) -
> >  the BT interface, the KCS interface, the UARTs, and the mbox hardware.
> >  It's not just the VUART/PUART :)
> Interesting. From what Aspeed explained, the SIRQ polarity for UARTs is 
> inverted to that for other devices. I haven't looked into how other 
> devices work, to be honest. Do we set the polarity there explicitly?
> > > Having said that, ideally I'd like the SIRQ polarity to be auto-
> >  > configured from the LPC/eSPI HW pin strap anyway. I have the code for
> >  > that almost done. Maybe we shouldn't even have the sysfs interface for
> >  > it and I should strip that out?
> > 
> >  Yeah, I think I agree with that. The only downside is that the 
> >  individual drivers will now need to poke at the SCU to query the
> >  LPC/eSPI configuration. If you can find a nice way to do that, then that
> >  sounds like the best approach. Can you query it through the parent bus
> >  perhaps?
> I'm experimenting with this:
> syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
> 
> I'll need to think on how to make this work on both ast2400 and 
> ast2500, though. I actually need to have a look at the ast2400 data 
> sheet wrt. VUART registers, too!
> 
> The structure is this:
> apb {
>  syscon {
>  ...
>  }
>  vuart {
>  ...
>  }
> }
> 
> So the vuart is a sibling of syscon, which holds the registers. I guess 
> I'll have to go with "by_compatible"?

It might be better to add a property to the UART DT node that references
the SCU syscon by phandle, that way you don't need to muck around
with compatible names for the SCU syscon.

Andrew
