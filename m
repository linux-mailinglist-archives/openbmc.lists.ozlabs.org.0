Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BA5350E77
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 07:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9sMB3z5mz309l
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 16:34:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=KHgCmq7r;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VSfHcHZh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=KHgCmq7r; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VSfHcHZh; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9sLs72ynz2yYy;
 Thu,  1 Apr 2021 16:34:29 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 018CD5C00D9;
 Thu,  1 Apr 2021 01:34:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 01:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=9vKqXNuVW2sNfrpwmB91XPRLRceRc4r
 OnwIZoL9sNT8=; b=KHgCmq7rWjtgBmiKrElfYzSjdJ2o2GFxZc5YxAwPY7qeXcp
 8nI6Sz/fYyNcLb+Rq5TxmNTvG9/EeQgOoefSiPP9CQ0568q2xEZnnfWJ0P3n0V/1
 ru2PpVE2j/wsReoDc4xQUC043i8P2AxrEhPuZ4nhGV5st3knF0/OmNuHlVMXwVks
 33twoi0v08MJEYLICbA6j3U2tbpAYtsgIFbZYjikNycGNgn4yWV9n8Q8ka87RGJE
 BNchfVzFc4rEp3tG5I8h6d85Ac9TvSto3CVwCZ4mMRhGgJlfu3JZ0dPbPaCunVih
 riBxLul5XBiV9dB5F/EnAeFG4wozjz0VmD/l6Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9vKqXN
 uVW2sNfrpwmB91XPRLRceRc4rOnwIZoL9sNT8=; b=VSfHcHZh77AjwkSnRixOBR
 QX0ws7PNYr4T4YCqSM0MaOsOb/PwhCvX9houD1bqYqKDAJ43dh1OAHcc7Ni3tG8p
 Dr1B49TKYpCcDUJpRYSyhSvg/WT8Y7PfilQN/5zXl2rLOLCVVlQ9MyDfGdltotBa
 6pcrmjro8mQpdccxaOu+MlKPswZFAS55Fcsppp/6x79Kr+Q4bqGpBiFYJ1/byInB
 D7ISqtbv3avPYrJxr1FwTYZx0E338eSXbImxFuJp5iRgr9VGG6aayfJvlF8pYTfV
 o20aFG7FGh5F5/StNX6een34G/yrmKNS1nzt5E+TACT4oZtspHKWcRCWyx76bO9Q
 ==
X-ME-Sender: <xms:YFtlYMnM9V-8AWzw9Ao2cLZkl0q856CNv1tnMKnBUITUyjkn0r03iQ>
 <xme:YFtlYL3j5hB3Eo3UVccnCLeAovyuEiHwws1LZ4ZT_4clG5FpjE_Nej8I_SvbncHkG
 NAHnXbmvtP27Aqbag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:YFtlYKodh3KN0o7R2m7T939xFTWv-CC30aA9gM5oTe_FQzP_YgJ6YA>
 <xmx:YFtlYInJyTETxZo_6Ff8o-NJ3Oin3kRGxSNzE829n_IDHuYd5z9XPw>
 <xmx:YFtlYK2pi1LYaZ3pFGRl1ShsOT9wnFWD5JHmIvDaEVec20Zg93Xvsw>
 <xmx:YVtlYDnXdBzvghG3ibyNBUIDJKFEbu4mtucLN3L6ssJSTYfSWeofNg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 73257A00073; Thu,  1 Apr 2021 01:34:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <06aee58f-819b-4486-a5ea-22e6d45e2be5@beta.fastmail.com>
In-Reply-To: <YGVXuyqOyxc8kcQz@hatter.bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-3-zev@bewilderbeest.net>
 <CACPK8XdPVf1WMmo8C8RJtd-1cH5qV9odEDhDUHWRiMOk=dQNtg@mail.gmail.com>
 <YGVXuyqOyxc8kcQz@hatter.bewilderbeest.net>
Date: Thu, 01 Apr 2021 16:04:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/3]_drivers/tty/serial/8250:_add_DT_property_fo?=
 =?UTF-8?Q?r_aspeed_vuart_sirq_polarity?=
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 1 Apr 2021, at 15:48, Zev Weiss wrote:
> On Wed, Mar 31, 2021 at 11:15:44PM CDT, Joel Stanley wrote:
> >On Thu, 1 Apr 2021 at 00:57, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> This provides a simple boolean to use instead of the deprecated
> >> aspeed,sirq-polarity-sense property.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >> ---
> >>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> index c33e02cbde93..e5ef9f957f9a 100644
> >> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> >> @@ -482,6 +482,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> >>                 of_node_put(sirq_polarity_sense_args.np);
> >>         }
> >>
> >> +       if (of_property_read_bool(np, "aspeed,sirq-active-high"))
> >> +               aspeed_vuart_set_sirq_polarity(vuart, 1);
> >
> >This assumes the default is always low, so we don't need a property to
> >set it to that state?
> >
> >Would it make more sense to have the property describe if it's high or
> >low? (I'm happy for the answer to be "no", as we've gotten by for the
> >past few years without it).
> >
> 
> Yeah, that sounds like better way to approach it -- I think I'll 
> rearrange as Andrew suggested in 
> https://lore.kernel.org/openbmc/d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com/
> 
> >This brings up another point. We already have the sysfs file for
> >setting the lpc address, from userspace. In OpenBMC land this can be
> >set with obmc-console-client (/etc/obmc-console.conf). Should we add
> >support to that application for setting the irq polarity too, and do
> >away with device tree descriptions?
> >
> 
> I guess I might lean slightly toward keeping the DT description so that 
> if for whatever reason obmc-console-server flakes out and doesn't start 
> you're better positioned to try banging on /dev/ttyS* manually if you're 
> desperate.  Though I suppose that in turn might imply that I'm arguing 
> for adding DT properties for lpc_address and sirq too,

Why not just adopt exactly what I've done with KCS, where we have aspeed,lpc-io-reg and aspeed,lpc-interrupts?

Andrew
