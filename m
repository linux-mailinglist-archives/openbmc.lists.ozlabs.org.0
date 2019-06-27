Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BAA57A5D
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:59:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5kz3DkxzDqfV
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 13:59:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XzMOM0/r"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cOiSDPN6"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z5hc71rczDqJq;
 Thu, 27 Jun 2019 13:57:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E81FA12EC;
 Wed, 26 Jun 2019 23:57:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 23:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=rg0MvOjGGvyE/jBUfl7d7PqyJK1OGHx
 niXZ/0dvFPZw=; b=XzMOM0/rxccQ96fc86NdijBflRai0T1+PxCH9qaL3Sryjrw
 nj/UpEtQP/UzQsGY8fgJDnhpiCZ4g5PKxAFVv8clb9SdA8LzyaWe3dUotdPgpr0z
 G+JWDrgXHh6BFTck+mFh2x58zXQUksUUA9HoIo2NO1lksrZW1etKIfegcBCg9IVm
 Ks7AfdUDbl35GslFSCM4M74kv9Y/0fBcdhYT0hcn626UDRSP3DS4z4YSlSyUXdBQ
 GTUCC8no7rKNgfhjiC4SB+U9tYx5+z+ygw4+F0FIiOQ/1hARiReCbo3Q125db2B5
 RxEGsH1fKh8Pjbdx0WhITmwhk+XcDT3sKukOQCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rg0MvO
 jGGvyE/jBUfl7d7PqyJK1OGHxniXZ/0dvFPZw=; b=cOiSDPN6EEDQPKa7O3gae8
 lusEHXgnu4k/9H+I2TcJhlUhAEz2+crNkkAzW9vAulDzh5969LYLk5zroCpNMMLX
 9N1frUxLs5V9LWpM47DkpAzihRu1aXp0s/0vb8MrlcvFWxyfVOyU0BCrpS3oW8Si
 E0L77ATGh0A6J7Q7pOYZ6g/AoYz+zRk7n72RDR4nxdq2cs7EJVbu2sLPggFZq5YH
 2A1fORbPRT1bNrmwUApDoKHYGJn4KmOwNsyLa9FWgtE4VfzJk+E9c6b2EL0+TSLd
 vUm6tsiXd4Jy5GyKjxJS2UBU+FnPwX+L4GL+q6RQbKIoIUAQkjw+mqSoUeSgqdsw
 ==
X-ME-Sender: <xms:vT4UXRp2MSuLxXQ-ITuvd9B7INIxJ1ed3uVe2NGSAquykYboA1IenA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:vT4UXYtzJC0GJKHqspDMd3VbjFBNdrZWw32FOnTyS-Oem1uJSTqvog>
 <xmx:vT4UXbNZnvGiTu5AJiZZYW8Ejpqsyqa7EmhdNAoSgkzu215cKLw8Bw>
 <xmx:vT4UXamkNYXRw3iXICIJ2khXi9n8IP0ba-Pd7XLwIBhloCztRxSFJg>
 <xmx:vT4UXXevahKZNWtBkhHAopfLZyZhUVcd73y5CdDGD6apGkgIe0e0cQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9C47CE00A2; Wed, 26 Jun 2019 23:57:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <835ac4e3-6ee4-4c3f-913b-93629d7e8080@www.fastmail.com>
In-Reply-To: <CACPK8XcPxJAOBAnKMKxtiG4Fkz8BPf8KtW1Kc3A9tU_emQviVg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-6-andrew@aj.id.au>
 <CACPK8XcPxJAOBAnKMKxtiG4Fkz8BPf8KtW1Kc3A9tU_emQviVg@mail.gmail.com>
Date: Thu, 27 Jun 2019 13:27:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_5/8]_pinctrl:_aspeed:_Correct_comment_that_is_no_lo?=
 =?UTF-8?Q?nger_true?=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 27 Jun 2019, at 13:00, Joel Stanley wrote:
> On Wed, 26 Jun 2019 at 07:16, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > We have handled the GFX register case for quite some time now.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > index 4b06ddbc6aec..c5918c4a087c 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> > @@ -240,8 +240,7 @@
> >   * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
> >   * reference registers beyond those dedicated to pinmux, such as the system
> >   * reset control and MAC clock configuration registers. The AST2500 goes a step
> 
> AST2600 too?

No mention of the GFX block in the pinctrl table for the 2600, it appears the pinmux
state is entirely determined by SCU registers.

> 
> Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Andrew

> 
> > - * further and references registers in the graphics IP block, but that isn't
> > - * handled yet.
> > + * further and references registers in the graphics IP block.
> >   */
> >  #define SCU2C           0x2C /* Misc. Control Register */
> >  #define SCU3C           0x3C /* System Reset Control/Status Register */
> > --
> > 2.20.1
> >
>
