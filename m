Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEBB50F01C
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 07:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnVQY10bRz2x9J
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 15:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=mFeRPsc7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=yAxUJ0Zn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=mFeRPsc7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=yAxUJ0Zn; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnVQ33bFqz2xh0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 15:12:58 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 89F0C5C011D;
 Tue, 26 Apr 2022 01:12:55 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 26 Apr 2022 01:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650949975; x=1651036375; bh=bibN5mlBzn
 VXyWkFwEUjVfKpt/d6fGu57VxTbFhfoUA=; b=mFeRPsc75+2Acy3DokqUnRCC5J
 g+KAvKZOPO+VGm2HEMNiSv0+ERLUcmDlTaPCoqMC5L11Doq1MxxIHU5trGWNoVxO
 kInAyd5pTjoXUujKuBIs05jWuVxQbCOijru6nmQ3Me+rB3NRU1Q7tpRyvGTIvIOM
 0Xyv+RWW1mNVFVHe8prJP/7V+MCB1wUWvp6XSKcPHUlC/MCyC5OMi8HM7stRYRQ3
 S/H+z7J6ZGbFSHo7lFcneXCV+k++SP9MY3fvtotMzcTVtPvR+BkrL37P3uaR9KUW
 Fu+eP+FqxsEeQ3MTx4T4rBj0df6FSVIzEfzXQrpDe+eCDqdbVVVHj2i/a9LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650949975; x=
 1651036375; bh=bibN5mlBznVXyWkFwEUjVfKpt/d6fGu57VxTbFhfoUA=; b=y
 AxUJ0ZnPnIhPM1hW4u+fjU+18l00niHvE5F4zZUwowR8g+O/f7L+X9wW1BkS0ZOa
 xOKRfMxo2jnpHREq6LYE/lxRwep/nSmt//4hPfVLVGLBbEQ5Tr4t5xgCe2ITaXS8
 p6pw6gqAwqeMMOk3lbi0jIWsVswCgZwKJVt8SAwi3IErAc2/7a+ebaul+2B+59bo
 wctNXyww6e8gA56ZC8ghhYvlQEBD/yfTxy9pLbKOllokNrIQZsor5j3WBHCAxKia
 3RYQ3PO+Od1D1vFUNVhQKvGSRO228vqzaDqzpRixCo6mTpkwm04nVOEowPi98GoK
 CmsjGOKTXPiObFAPWwQdQ==
X-ME-Sender: <xms:Vn9nYme49oRM4aBEZSX9-uOW7DEAQ2Z2phoSEifelhD_-lHrUSEq8Q>
 <xme:Vn9nYgMqo98XnJ_R2_FtRB0XVSIHK-Xxi_NcabknXW8VZ3WDEoL97Ozu2Vk93cnDx
 uC50cWuKbpCmAA9Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnheptdehkeejleeljeeikefgjeelueevjeetjeduveefveetffeiteevtdei
 ffdttddunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphhhohhrohhnihigrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghn
 ughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Vn9nYnjtWxzXsLFYxJjO5d1256OHBFwDx2WTySsmmpBCPwEocU0Ifw>
 <xmx:Vn9nYj9YAeplC01UidW6_-p2Dw9J_BS6pC0FGcdqdDLzI6KoLNQ21g>
 <xmx:Vn9nYivxMhD4Bf6x9KuCNIaYcIRVMD3DV7fwdNvSyD2r9DB5cFCfBg>
 <xmx:V39nYkJjzCivz40YL6we2wgZ1WyKgyj_pWf2euQnFbq2IX5MswRfZg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 96F7A15A007A; Tue, 26 Apr 2022 01:12:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <dcf16c8d-0e63-4cc0-ba88-5e9433223165@www.fastmail.com>
In-Reply-To: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
References: <CALXuKJc_pYJv0xYWtN5mzbHwpbHshukg34BjSzhqmpTdUMXwXg@mail.gmail.com>
Date: Tue, 26 Apr 2022 14:42:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "sri d" <srid.11486@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Multi-led configuration in dts
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
Cc: Matt Spinler <spinler@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 24 Mar 2022, at 23:26, sri d wrote:
> Hi Team,
>
> I am working on implementing Power and system identification LEDs, in 
> which
> LEDs are connected to GPIO pins directly. I need to handle two colors 
> (blue
> & yellow) for LEDs in *.dts file.
> In phosphor-led-sysfs repo, whether multi-led configuration is handled ?
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

I did a quick grep in phosphor-led-sysfs and there's no support for the 
multicolor sysfs attributes that I saw.

>
> As far as I analyzed, multi-led seems to work for dedicated LED controllers
> and not for GPIO pins directly. Is there a way we can make it work for
> directly connected GPIOs ?
> https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.9-Multi-Color-LEDs

I'm not sure whether this should be handled in the kernel or in 
userspace. From a conceptual standpoint (and from some background 
discussion with Patrick) it sounds like you're using two LEDs as one, 
operating with a small, well-defined set of states across the two. It 
feels like it would be nice if this was exposed to userspace as a 
single thing, though whether that's an LED or not is another matter.

The alternative is to come up with some way to identify pairs of LEDs 
via the devicetree (the obvious, cheap-and-nasty approach is to use 
pairs of LED names) and do the work in userspace.

I don't know which is better (maybe someone should write a design 
document analysing the trade-offs?) but it would get kind of awkward 
with the current phosphor-led-sysfs design which exposes one process 
per LED. This doesn't give you much (any) abstraction in terms of the 
DBus objects/interfaces involved. I think it would be nice if we had 
something a bit more coherent for this specific use case. Something to 
consider is reworking phosphor-led-sysfs such that it exposes all the 
LEDs in a single process (but is still dynamic and driven by udev under 
the covers - e.g. make the udev rule do DBus calls to poke the one 
phosphor-led-sysfs instance). From there you can handle the pairing 
internally and expose a coherent interface that drives both LEDs once 
both are found by userspace.

Andrew
