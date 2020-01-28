Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C237114AD62
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:59:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4867Xz5FwQzDqF5
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:58:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Tq2VaKM5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UARyazNs; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4867XC08nhzDqDm
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:58:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2B37B513;
 Mon, 27 Jan 2020 19:58:16 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 27 Jan 2020 19:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=CRW1P4wul137iAWPT1Em3IMp+62S/Eo
 uNbrqZDTcrVA=; b=Tq2VaKM5KJjOT6izadIDL2WqSJ6FWBmliTEnlWW7QeMlqhi
 DJevCE+P6e8hmEI8OqE1EkwCSbzxj7cRo8J1w4uyxzURNPsuVaiaxEj4cSNzXvwx
 YTAuAIS6oXf5WfeEBSbrUa5MQmTzO7PT/PbImIYYN+IPJ4eM+ObaoC7njZVdbMj6
 3MXhqIsIIz+Fe4VuAVhlWNY2cFIAKsMa1D3859PthI0JDv7C56WnGNmYcd6R4WXB
 4IpeKkW6tef3fCxXjcBXUE1G/XAo872fuHbmV7ytYkCgiOFhreRFCj+RVQxZFdq8
 uYKOT8pagHnEqWwYhvRdH+AoXFhYJVoaCGOd1uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CRW1P4
 wul137iAWPT1Em3IMp+62S/EouNbrqZDTcrVA=; b=UARyazNsvKGBYAf+PIhpWe
 0eKr4P0ObUZg5J+bZ04dgi1zPk73mIR9SYXw338Gb11OqrYbYTgloWNcvBZRMarg
 eo2rznejnV9iUgkjOCwP7ppOV4kAGAVSgKKeuOvZZb70xaNISqIGI35QxjuZ1xAT
 vLeh+7Ma9U+++ORkNBULH78sFzdCVkW13YAMIK8z1aui/U6DAeMHPCXSofgvi8gR
 BPZ03SSTdyKkZ9wrMHPnrdPIULFf6BMYhFscRqp/Udqf76XT/UWxKQDbylTQZX1X
 X0aZyf6nJTRniGzoTfQncoNKroLNXrIAh1g6Vju9qCH660l9Gs1ilv2moErXCbAg
 ==
X-ME-Sender: <xms:JocvXidZk830VjXSMhcGW7nYUWet97sjRbz3JAZAoTLd1-Mk9Y9cvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:JocvXvf3K7kbTwYttlC0NpMamKCPN6WqJrDrDBFJAmGDsMkTevZmjg>
 <xmx:JocvXrBaV6bFI6nr9TJWW3AseuMYoaHp2IYjqAreMzOuRX9sNTWxqA>
 <xmx:JocvXtnPAIu3WUXHOXfQnZp6-tVovSKYb1DgZ5qQFpL-KHOi-RNvbg>
 <xmx:J4cvXjM7E1hfiZERnZg9DTaDISp9nnwjKtOV8wTnL4alz-d2bsMnVA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DACC3E00A2; Mon, 27 Jan 2020 19:58:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <1a456e8f-c708-4276-bec8-3b98cee43e47@www.fastmail.com>
In-Reply-To: <20200124012317.GA22665@taoren-ubuntu-R90MNF91>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-2-rentao.bupt@gmail.com>
 <3129984d-421a-42c9-bb5b-c3ee01ccd43e@www.fastmail.com>
 <20200124012317.GA22665@taoren-ubuntu-R90MNF91>
Date: Tue, 28 Jan 2020 11:27:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_v2_1/3]_usb:_gadget:_aspeed:_read_vhu?=
 =?UTF-8?Q?b_config_from_of=5Fdevice=5Fid?=
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 24 Jan 2020, at 11:53, Tao Ren wrote:
> On Fri, Jan 24, 2020 at 10:39:45AM +1030, Andrew Jeffery wrote:
> > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c 
> > > b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > index 19b3517e04c0..aa1c127e9f2f 100644
> > > --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > @@ -133,10 +133,9 @@ static const struct ast_vhub_full_cdesc {
> > >  
> > >  #define AST_VHUB_HUB_DESC_SIZE	(USB_DT_HUB_NONVAR_SIZE + 2)
> > >  
> > > -static const struct usb_hub_descriptor ast_vhub_hub_desc = {
> > > +static struct usb_hub_descriptor ast_vhub_hub_desc = {
> > 
> > This seems unfortunate, though we only have one on the SoC... is
> > it worth dynamically allocating it? Or adding a comment?
> > 
> > Andrew
> 
> According to the comment at the beginning of the file (line 39-47), we
> may customize more descriptors in the future. Adding comments involves
> little change in this case, because by allocating the descriptors, we
> will also need a function to free the descriptors when ast_vhub_remove
> is called. Anyways I'm fine with either way.
> 
> There is another option which is to fixup descriptors in request_desc
> callback, like ast_vhub_patch_dev_desc_usb1() in the file. But I don't
> like the approach personally.
> 
> Which way do you prefer?

I'm not wedded to doing anything different from what you've already got
in the patch - we don't have hardware that requires a different solution at
this point. We can always fix the driver if that changes. The approach just
felt a bit icky, but I can live with that :)

Andrew
