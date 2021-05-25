Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253E38F8F5
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 05:43:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fq0L913Vfz3066
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 13:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=EgHAIM2e;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=umrZGZO7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=EgHAIM2e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=umrZGZO7; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fq0Kp3tFSz2yZ2;
 Tue, 25 May 2021 13:43:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D975C581067;
 Mon, 24 May 2021 23:43:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 23:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=4OSDcQRIgeJvUR6YkXF9RW8Fj9oUfyB
 5OADbIA+ihAs=; b=EgHAIM2ewDKVBJ1eZkfW9zSEpyuTMtlv8fDo57x8cdsgwlO
 3QwFCvRGdsWx45rM3kJjoJdeqp2uP14BVWP9GrZBrcwKye8i7e2JpYNG0ApbcxJh
 Nu+2G6CuOIQ3OrApoe7gtYfXNOj/Hb5Cjw4Du+euTKL5TPfY4q3sQPMnoRck+seE
 m07DXGjW5OWZ1uqrAq0VInQhjrHTkqUKSY+M9QY5cpTrkIY/vR7j3LBntkNz/8bb
 JqNX1EWlVvtl0uqQAEpIf+kkABfmbFxeBmplGA+oc+tXSiKBqdb93JbQuP9PKjku
 qVi+Wz+RgbOgIDkunqszy/fQpONSsS+RdNb+BgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4OSDcQ
 RIgeJvUR6YkXF9RW8Fj9oUfyB5OADbIA+ihAs=; b=umrZGZO7KBuJyKjhTIF2op
 nql+kYOKgBkvUA1Wnd3MY1AjmWieu7KaenpItIRFu2UF5QfpD1SJsV2rJgbE1jUH
 1aWqsNc9Ucy9oV0rhp71OwqeJTX9jOHI3QAxaIRwa35oLpAvbsgasTUGUjpWMw6y
 zntj7UcmrXDq9BV6O3NEFTZpAHZj0Y8NWwJ0e1eTc0AZfocu2I4iT/EE4PJYAaek
 1KEGCC2YdVdJGoSqkC6HGUjikWDCtcoHS+d1arrRubRrTfu34t/XjeTbyIqRR96L
 /IRdUvL8iMcgAOwBs48+2UgCN7zzT/ZxzkjwOyPB6ZkX4WYVxdkmegOH8puYMjiQ
 ==
X-ME-Sender: <xms:WHKsYA9qwyxDlhhBiQboRhkSagcYygupj_dw4icwuoKz6cmzEuPJ9A>
 <xme:WHKsYIu-R7Du1sRdwvvwpWbFCQYWv5L7q4bVqTzxs8TlXKUswy4nussTQPzH0p-G-
 zcNOctDUznRg5Omfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:WHKsYGBbQa0-aYPcgH6s7QhYQA0bm0yWDmtow98-VmSoShrBgaJKOw>
 <xmx:WHKsYAeUTz4Q-ida5gyHzH6ZFcJ6QarFnWfFoFrz-IsSCPmn-DyhnQ>
 <xmx:WHKsYFMVmMta0paUoPgozmWpDRVTL-5p9sEdEwCKPesGWYX4B3C4-g>
 <xmx:WXKsYGGiyjuPSUEGhi0sE3yNiPYkYEcDm54VBMz3_4ij6sMO9LB2HA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2CE55A00079; Mon, 24 May 2021 23:43:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <b38cf7e0-6cce-4cb3-8bb7-d711b1fe6eb2@www.fastmail.com>
In-Reply-To: <20210525030254.GA23525@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-4-steven_lee@aspeedtech.com>
 <43b00f2e-4381-4899-b561-da9a24347f8b@www.fastmail.com>
 <20210525030254.GA23525@aspeedtech.com>
Date: Tue, 25 May 2021 13:12:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_3/3]_pinctrl:_pinctrl-aspeed-g6:_Add_sgpio_pinct?=
 =?UTF-8?Q?rl_settings?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 25 May 2021, at 12:32, Steven Lee wrote:
> The 05/25/2021 08:54, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> > > AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> > > Current pinctrl driver only define the first sgpio master and slave
> > > interfaces.
> > > The sencond SGPIO master and slave interfaces should be added in
> > > pinctrl driver as well.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++++++----
> > >  drivers/pinctrl/aspeed/pinmux-aspeed.h     |  9 ++++++++
> > >  2 files changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> > > b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > index 5c1a109842a7..d0e9ab9d1a9c 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > @@ -46,8 +46,10 @@
> > >  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
> > >  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
> > >  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
> > > +#define SCU690		0x690 /* Multi-function Pin Control #24 */
> > >  #define SCU694		0x694 /* Multi-function Pin Control #25 */
> > >  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
> > > +#define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
> > >  #define SCUC20		0xC20 /* PCIE configuration Setting Control */
> > >  
> > >  #define ASPEED_G6_NR_PINS 256
> > > @@ -81,13 +83,17 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
> > >  #define K26 4
> > >  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
> > >  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> > > -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> > > +SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
> > > +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
> > > +PIN_DECL_4(K26, GPIOA4, SGPM2CLK, SGPS2CK, MACLINK1, SCL13);
> > 
> > Is this the right priority order? Looking at the Multi-Function Pin 
> > Mapping and Control table, function 1 is MACLINK1,
> > function 2 is SCL13, function 3 is SGPS2CK, and I assume function 4 
> > would be SGPM2CLK, except it's not documented in the table in v9 of the 
> > datasheet (I hope it will be documented?).
> > 
> > If function 1 is the highest priority (which is what all the Aspeed 
> > pinctrl drivers assume), then this should be:
> > 
> > PIN_DECL_4(K26, GPIOA4, MACLINK1, SCL13, SGPS2CK, SGPM2CLK);
> > 
> > Anyway, one of several things could be at fault here:
> > 
> > 1. I've made a wrong assumption about the priority order in how I've 
> > implemented pinctrl support for Aspeed SoCs
> > 
> > 2. The Multi-Function Pin Mapping and Control table is out of date and 
> > needs to be fixed (which it already does as it doesn't list SGPM2CLK).
> > 
> > 3. The patch needs to align with the assumptions of the Aspeed pinctrl 
> > support.
> > 
> > I don't think it's 1 as I haven't heard of any issues where we are 
> > getting incorrect behaviour because of pinmux. I don't think it's 2 as 
> > this patch makes a non-linear change to the ordering. So my hunch is
> > the issue is 3, that the patch is putting the signals in the wrong order.
> > In this case, you want the PIN_DECL_4(...) I outlined above.
> > 
> 
> Yes, you are right. Per discussion with the designer, the priority order is
> MACLINK1 > SCL13 > SGPS2CK > SGPM2CLK
> 
> We will add the information in the v10 datasheet.

Great. Thanks Steven.

Andrew
