Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4215B64B
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 02:01:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HyrS6Fs9zDqBX
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 12:01:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=UDW8jybL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=I3yYMJOj; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hyhy1qljzDqTp;
 Thu, 13 Feb 2020 11:54:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 967B9EB3;
 Wed, 12 Feb 2020 19:54:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 12 Feb 2020 19:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=kvIcpzMnZDBTrKFTCocK1+6gG8eemWb
 Co4P6LYqLFvs=; b=UDW8jybLIIdDBBt9Ku/iP0HlGSMGGALp9ncys+sWCqk9rIu
 z8z14n2X3kds4Jen2mHXJvHiY8wXI57LdB1vdI2Zrf51g7VhVnaVKg/zmxl7FOCk
 URzgO8f/f7OsRbaxvKjhGN/dLZMKYIH90g83pBr6F6+FYay7MdI3i18K1thyor0S
 vgitlZFPD5KQ/I7EjW1hylmtElfuZ5UQ23hq8yAjuncEDV99TiDYw7Ka/ScKXOt5
 JwgTKrD24wt0ea4VkH6JviGjE7wEX51KbG4WVKUTYftSdmhr4up+zIRSFDf7BvJe
 SBR6ot6ROmM5+zLXfQo5oSa6zp4N1QqCM7BFM3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kvIcpz
 MnZDBTrKFTCocK1+6gG8eemWbCo4P6LYqLFvs=; b=I3yYMJOj1MN3yYFnfM0cx1
 RcbLzFg3aKsvsWTCDkMm1yPaly/2WKE4wm5JUWjoGJN8C0Vs+onpJfxwH24AVE8z
 cgQ+1hMpI8J+BxMoOjlQZ6GgU1cEmw3wLJXZPYBUe+3YDQLyU4/z3H/Y/avphF8V
 mRKGoylgYXVXn2LGN+Gdt1S45/GlG0jYY8p4RXzLddWoEKskcaLOZmRYmMXxskyE
 I2TUqIXlUZgEucs3NTxRWJXNWIQrr68EJfF2UzJtdcPHw84Ht1wjksg84wklpVOT
 8UCakDbMVO+/SDT3NIhE5bz7aRrqhFPZ+X2s2iEckqJDZVwwgJoHsp9Wx5jG71sQ
 ==
X-ME-Sender: <xms:V55EXkAzRdV4rAbWN03GGELs2jHu3cs-01UwlblbWiYJoOgPXIrvpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:V55EXitAfaithfdZSxrv88Msl9bhCOoJmXkykQyPueu75xmPlVwuwg>
 <xmx:V55EXqeqPTGQoKHodorareVjiqYA8HOLTpOiIWw9CxYW_twfnSqy5g>
 <xmx:V55EXpa1i15G_s792VwBSjznbgXfEnso0YAI-Mir6eD5GF57kUnqTA>
 <xmx:XJ5EXjdH7gkCb21m1W2jjnwGtewnUIkhfZxrbk93jpDtiNPh0k1oIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F3F98E00A2; Wed, 12 Feb 2020 19:54:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <288ba2d7-77dc-40a7-90e8-f2781b3fe067@www.fastmail.com>
In-Reply-To: <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
References: <20200206170234.84288-1-geissonator@gmail.com>
 <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
Date: Thu, 13 Feb 2020 11:24:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Andrew Geissler" <geissonator@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@yahoo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 10 Feb 2020, at 12:59, Joel Stanley wrote:
> On Thu, 6 Feb 2020 at 17:03, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > From: Andrew Geissler <geissonator@yahoo.com>
> >
> > Name the GPIOs to help userspace work with them. The names describe the
> > functionality the lines provide, not the net or ball name. This makes it
> > easier to share userspace code across different systems and makes the
> > use of the lines more obvious.
> >
> > Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I will wait for  Andrew before merging, but this looks good to me.

To the best of my knowledge this is the only supported approach.

I haven't checked the mapping of gpio lines to functions, but for
the concept:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Andrew
