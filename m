Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9E23B8D54
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 07:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFmV62PmSz2yhk
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 15:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=DhkT3nLZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NYPWWtQ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=DhkT3nLZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NYPWWtQ0; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFmTj5L3nz2xtl;
 Thu,  1 Jul 2021 15:09:13 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DB91C5C00CF;
 Thu,  1 Jul 2021 01:09:09 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 01 Jul 2021 01:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Af3Co6FyFp9gkhQ3NUa2r1lZjjLS0lS
 MsBIkx1twd4M=; b=DhkT3nLZ4lDulCckp3cTnT1kZ1l3pTYTsnXokfS+ZhfH7K1
 GXxevbWyH/87hCnnsqlv697uHBgrEZgQIMX2p7JnGMTloynuGi8gO7RnrvwVg1s7
 7IiZayuCl8xyocra5lvpVGZqNe9kaCNftASlBa20ol3niCeKIKAxoZsvvbWM5C7D
 lB48aOeu1tRh6Oo8FrMucsOH6FpeQIZI0aEd9K2oUn37VDE6nTgzmMUqgXmavxp0
 KDm52WYJmZnyGvDxX8KQP1FmC3mSxmEhyDlxCtrM02XS8YwkLUZTOWdOmuRJoOYl
 qIbTHJlbPgYf+WBXqhepwGnzYvc3u5LVDGqqGyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Af3Co6
 FyFp9gkhQ3NUa2r1lZjjLS0lSMsBIkx1twd4M=; b=NYPWWtQ0oHClSW7O5cLZ/7
 OhN3LwE03b/SZT4N+9POnqtE+ApWFZRWXeNeIr8tOmn4OFtBlEJlBUdyL58UeJCD
 bzjSM5ga1EW+3MKlOes7E6ivFMGx6sue+uaWDrr70yaoZzsKXiOrRuZLoLATMNlk
 FXrQlopx+16Lv3xoFMRKYNXWCuvEzrA4Op7IUJ2QkvKxFkiNN/zhSIq6Lk43oTG9
 vvdKLPQeN6f3pm3BS0D6qJPCSz8FOt2QjeSzxR8TE95xviJP/m1ExPWmKDPVbSQc
 /8X5ACYBNwGe1HT0E9ioTYJG+pjZsZO9CguejDFQcgvwnPdI0T0rmweq+zxM4/gQ
 ==
X-ME-Sender: <xms:9E3dYNRQuWN7yW3RgmXQF8ewQTxiA0I6rLEdKW7gF1ZrTET4tjPpAg>
 <xme:9E3dYGz-65eix5NO3Bn9j5ivXLMXvGX93EAuwZ_SOd8nK46XjBg0xoDjt4gTTqEsh
 D1707FZjFk2XZOLOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeihedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9E3dYC20AOGkdlFbLFlefFuPZvRxO8UPQCVme-g1RLAg0PaIP2FvHA>
 <xmx:9E3dYFCRjNNytUKi_TX5qpzcJQuDiWhLCOD0yJZrqbCiim6atL5Jkw>
 <xmx:9E3dYGiDa--Z9hRClydmgXUlZBUpfnw5dGsFQVuVN2jbd6PqtW9Yrg>
 <xmx:9U3dYOd7Yb2hwts6sDP7SV6t0lEyuU3DZx84FpT2aQ6hk-zh1zqSeA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77075AC0073; Thu,  1 Jul 2021 01:09:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <f13125b1-3af6-4cd4-895b-4d98bf78b568@www.fastmail.com>
In-Reply-To: <CACPK8Xd9tsMJaQ9BQSGL0Vfi4UpJ1iuOtMVmfKneydd-zYBhsw@mail.gmail.com>
References: <20210625061017.1149942-1-andrew@aj.id.au>
 <CACPK8Xd9tsMJaQ9BQSGL0Vfi4UpJ1iuOtMVmfKneydd-zYBhsw@mail.gmail.com>
Date: Thu, 01 Jul 2021 14:38:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: tacoma: Add phase corrections for eMMC
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
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 1 Jul 2021, at 13:10, Joel Stanley wrote:
> On Fri, 25 Jun 2021 at 06:10, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The degree values were reversed out from the magic tap values of 7 (in)
> > and 15 + inversion (out) initially suggested by Aspeed.
> >
> > With the patch tacoma survives several gigabytes of reads and writes
> > using dd while without it locks up randomly during the boot process.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Thanks for the fix. Is this required due to "mmc: sdhci-of-aspeed: Add
> AST2600 bus clock support" or "mmc: sdhci-of-aspeed: Expose clock
> phase controls"?

Sort of neither, it's really a bug with the devicetrees.

> 
> On the topic of those patches, it would be good if we could operate
> the devices (with the slower speed?) when the device tree does not
> provide the phase values. Think about system bringup, or where you
> need the system booting in order to determine the phase calculations.

You can use the maximum-frequency binding to make things go slow enough 
to paper over phase issues. This helped us limp along early on.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mmc/mmc-controller.yaml?h=v5.13#n90

But really it depends on how bad the issues are at a given speed.

> 
> What changes would be required to the host driver for it to work out of the box?

Maybe the above is enough of a crutch?

Andrew
