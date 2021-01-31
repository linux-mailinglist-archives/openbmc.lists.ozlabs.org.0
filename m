Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A60309F6B
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 00:20:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTRrm4WYDzDrQ3
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 10:20:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=XlpJWkZc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HnEbehQd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTRqq59dczDr8q
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 10:19:51 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B1F0F5C00A4;
 Sun, 31 Jan 2021 18:19:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 31 Jan 2021 18:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=mUB2CuH+nhabt4PwDHe5zbWlfFOhcvk
 z40heJVJ0Fs0=; b=XlpJWkZcHJZCi9Ou2cxLhLHAc1ZZ7kG/KY5LpGzxKSOmt2I
 oXXpctsApwoxPQ6l9DKx8A8z8fkVu0QY0TcTzLc/8UKKfczafXieMsGvPuGsV8rE
 Ig/k6ZNqScZUFhUSy5QbsYUnWk0E8sS0u+cf5OgHLd0xEJzaa419o/D0luM/pUop
 x2c+fH28vCNKsQ9160eOK5GzhE94qqlf2daTiFxwbuq6GA9Te2Itb5KzXuiF96Lo
 sbaKjpUIkm0GWDjMi4KgY/rlt8eZDU8GlabqHOyy5rLsqwJwT7CD05OIPfOJcpVY
 5uhQzABv6zDCKUtRlwdPMWE4voXoeCgFLIqEFgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mUB2Cu
 H+nhabt4PwDHe5zbWlfFOhcvkz40heJVJ0Fs0=; b=HnEbehQdB21F9bKP6dh5L9
 rB2RGSZnowDt6l7r2xiDA7RhSFDQ40xeV0rQVGqdinb+GD9gJlyDnhjuuga5yhqv
 fcamRWQyQBQ0yp8YYPQf0WoyThBzS+asbdZaezVP6/q3MQmvp79anntPI1SM8zkQ
 rrMpcdCLXVj8QwmIYa6NIe6i3VFKFnqwLa27eMlsUwvW3r1ybMjCeC2g+tOY915G
 7gDjsJAn5LVLNSSKYtrMKQmniowYoaIZxw2Eeo42r+gI6jzGNDYS8r7qkaNEqy87
 wJINO7TsQongTyyTZRuRBkMdpZKdmaNZa9aTNl1Kl5p7nvmtktxr5UDdPHcRLaCA
 ==
X-ME-Sender: <xms:EjsXYOsO9MXqYLjZAJOnPaIQYIHnkJ3MGIzItbdhSXZ7xOvuwPoBfg>
 <xme:EjsXYDeY62DcL3naJaLkeRV8sTWWTsbJMXOwkbODCAgWdv1W7zeCcOj8VQrYmHwZI
 ONp75ihD7zdQFcVAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:EjsXYJyRJeubeKy54p9JcsL7aZiagQ99vwwGt1X7A5l0XzKGFfYPEA>
 <xmx:EjsXYJOThKgQRVeconYOUR_ZConxgBRBIhqWrVLs6r6NHLCyGB9aKA>
 <xmx:EjsXYO-r0J4n5fh9o_gg6WjipJ1e8hfsItv0rFwRb4sHglp43u42Ww>
 <xmx:EzsXYPL6n2puK2YNQJ9pQbSgkgwoKvIyzdXR5lECnc4Bwe3kIdeyAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D9534A0005D; Sun, 31 Jan 2021 18:19:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
In-Reply-To: <20210128072947.GB2594588@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
 <20210128072947.GB2594588@aspeedtech.com>
Date: Mon, 01 Feb 2021 09:49:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
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



On Thu, 28 Jan 2021, at 17:59, Troy Lee wrote:
> Hi Andrew,
> 
> The 01/28/2021 07:14, Andrew Jeffery wrote:
> > 
> > 
> > On Wed, 27 Jan 2021, at 20:13, Troy Lee wrote:
> > > Hi team,
> > > 
> > > For security consideration, user might want to disable AST2500/AST2600 
> > > P2A functionality by default. To compensate the effect to 
> > > phosphor-ipmi-flash, we're planning to support two alternative in-band 
> > > firmware upgrade over PCIe for AST2500/AST2600 (AST2520 and AST2620 are 
> > > excluded):
> > >  - Through a reserved **VGA** memory on BAR[0], or
> > >  - Through a reserved **PCIe** shared memory on BAR[1]
> > > 
> > > The usage pretty much the same as P2A, but it runs on different BAR, 
> > > offset and length.
> > > This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I 
> > > create new **interfaces**, e.g. astpcie/astvga?
> > > 
> > 
> > This is the HOST2BMC functionality in the 2600 datasheet?
> > 
> > It would be great to have more detail on how it works.
> > 
> > Andrew
> 
> No, it doesn't use HOST2BMC interface, it uses VGA controller's mmio.
> Perhaps HOST2BMC is also a possible solution, too.
> 
> 02:00.0 0300: 1a03:2000 (rev 51) (prog-if 00 [VGA controller])
>         Subsystem: 1a03:2000
>         Flags: bus master, medium devsel, latency 0, IRQ 16
>         Memory at f6000000 (32-bit, non-prefetchable) [size=16M]  <--- Option 1
>         Memory at f7040000 (32-bit, non-prefetchable) [size=128K] <--- Option 2
>         I/O ports at e000 [size=128]
>         Expansion ROM at 000c0000 [disabled] [size=128K]
>         Capabilities: [40] Power Management version 3
>         Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
>         Kernel driver in use: ast
>         Kernel modules: ast
> 
> Option 1 allocates a 1MB memory from the end of VGA memory, so it will
> need some change to VBIOS.
> 
> Option 2 allocates a 4K memory from BMC memory space. Since the buffer
> is smaller, the ipmi-blob protocol overhead will be greater.
> 

Okay. So for Option 2 we need to coordinate on the BMC by reserving memory in 
the devicetree. What's the plan there? Where's that going to be documented?

Andrew
