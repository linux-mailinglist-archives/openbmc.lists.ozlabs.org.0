Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18E4476C1
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 00:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnW5y2K0Mz2yWN
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 10:43:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=cg/olrAc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=clVyKuFz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=cg/olrAc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=clVyKuFz; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnW5N2Fwhz2xSH;
 Mon,  8 Nov 2021 10:43:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8B2365807D9;
 Sun,  7 Nov 2021 18:42:59 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 07 Nov 2021 18:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=hbglKme3vaas4sAGDC3hQO7l8i5Rd5g
 igqzNWaFWDOk=; b=cg/olrAcD9tCJS1i8M23c2flw8WZk1wp4xkWGoML32//6N1
 qpzOO+o7dMA8eWLFE6rAsFHsKng+Si7yzX4kDg4aQo7L4qrTvx5MClQ7yQM5fpg+
 UOecU3cxTvQ14n90S68RZDuQT/clgf03ZdWu2qOCwhW243IOELSvWBwto2XrJXUL
 8Va2qo9ggNRRA2TzvjUKPWPyJi3XXkmQBo9a+p9RQqY4PCKaT9D8mTP/DJarhvYY
 Ap+Ry5N3Rik+IwlzLY4asm9rCLX3eDrxVLQK58sRR7hD/En0mSU4zUdKWkPZt8P4
 gY+YKRZMdJQWlyPPsvNkHYdlk9Ro6vNptu8A47A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hbglKm
 e3vaas4sAGDC3hQO7l8i5Rd5gigqzNWaFWDOk=; b=clVyKuFzr3sg/qW8emnEu/
 uSflp/Th4kX9QtyLi140V7rgiZSGXP4DNrqqUKTLsq6zHVgEjOztoS7ow26ULuHW
 kooIkJ6cOXyFxd1cxdxoRGglACdZu4pU8dnH4vbEI3xgVupAQ6zQSl1mJ0/eYsa2
 N3Xd8E/756QBt8wVuPf/U0jPmnb8QIplCzch5nl2cLM0zuHtJo6LwWhSe3YywUji
 aCcBatQcHXMX8qn8jFVd+G70nnvrT6tOQ/ivmUhYxb+L4yCu3fV19GA8gYcB44+b
 WOOQUw3v5E7SiCAwqAwcjKajlkP8yW1NdCA7T/n0yPa0ukWyRP+auHDVX53mkbxQ
 ==
X-ME-Sender: <xms:gmSIYVV48Zc_p8rEM4c1-RxjTzWWSB6DcAoRwdCYz34CWL7ZKYpBhg>
 <xme:gmSIYVm2PpDK1898gZkl54CQOOTJWnWsgop22UlTPzJrjXM7004d7syE9whn8i0fS
 ZFAG6tYksF0auBjCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddugddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:gmSIYRby8wH-M10d5xd46mb2XA-KsRM9kSzjrKm3MZhAae3Y-bxwMg>
 <xmx:gmSIYYVDiYUEwzGrBmKRvEmbtW2MUh3-fU7psPgkOfKNJGLcrPg22w>
 <xmx:gmSIYfkB-_5-upg3pYFdtkozb-Spxbl7x_uXiindt5Hrxltdis-Ekg>
 <xmx:g2SIYS_cH4wiws1VbSozUnvd8Oz25lZ88Z4y9K30-2oJZYetRAQLVQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7E8C5AC0DD1; Sun,  7 Nov 2021 18:42:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <30748da1-0fdb-40c1-bf28-8682d3a89c73@www.fastmail.com>
In-Reply-To: <HK0PR06MB2786C1ED2463764EAAEA7166B28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-6-chin-ting_kuo@aspeedtech.com>
 <95669b37-d512-4439-86cb-418ab085118f@www.fastmail.com>
 <HK0PR06MB2786C1ED2463764EAAEA7166B28F9@HK0PR06MB2786.apcprd06.prod.outlook.com>
Date: Mon, 08 Nov 2021 10:12:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 05/10] mmc: aspeed: Adjust delay taps calculation method
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chin-Ting,

I've had another think about this, see my comments below.

On Sat, 6 Nov 2021, at 20:35, Chin-Ting Kuo wrote:
> Hi Andrew,
>> >  struct aspeed_sdhci_pdata {
>> > @@ -158,43 +160,60 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc
>> > *sdc,  }
>> >
>> >  #define PICOSECONDS_PER_SECOND		1000000000000ULL
>> > -#define ASPEED_SDHCI_NR_TAPS		15
>> > -/* Measured value with *handwave* environmentals and static loading */
>> > -#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
>> > +#define ASPEED_SDHCI_MAX_TAPS		15
>> 
>> Why are we renaming this? It looks to cause a bit of noise in the diff.
>> 
>
> Okay, it can be changed back to the original one in the next patch version.

Well, maybe it makes sense, but I think we have to take into account 
how we describe the taps in the discussion below.

>> > -	if (phase_deg >= 180) {
>> > -		inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
>> > -		phase_deg -= 180;
>> > -		dev_dbg(dev,
>> > -			"Inverting clock to reduce phase correction from %d to %d
>> degrees\n",
>> > -			phase_deg + 180, phase_deg);
>> > -	} else {
>> > -		inverted = 0;
>> > +	prop_delay_ps = sdc->max_tap_delay_ps / nr_taps;
>> > +	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
>> > +
>> > +	/*
>> > +	 * For ast2600, if clock phase degree is negative, clock signal is
>> > +	 * output from falling edge first by default. Namely, clock signal
>> > +	 * is leading to data signal by 90 degrees at least.
>> > +	 */
>> 
>> Have I missed something about a asymmetric clock timings? Otherwise the
>> falling edge is 180 degrees away from the rising edge? I'm still not clear on
>> why 90 degrees is used here.
>> 
>
> Oh, you are right. It should be 180 degrees.
>
>> > +	if (invert) {
>> > +		if (phase_deg >= 90)
>> > +			phase_deg -= 90;
>> > +		else
>> > +			phase_deg = 0;
>> 
>> Why are we throwing away information?
>> 
>
> With the above correction, it should be modified as below.
> If the "invert" is needed, we expect that its value should be greater than 180
> degrees. We clear "phase_deg" if its value is unexpected. Maybe, a warning
> should be shown and -EINVAL can be returned.
>
> if (invert) {
> 	if (phase_deg >= 180)
> 		phase_deg -= 180;
> 	else
> 		phase_deg = 0;

Though we want this to return the EINVAL right?

\>> > +		/*
>> > +		 * There are 15 taps recorded in AST2600 datasheet.
>> > +		 * But, actually, the time period of the first tap
>> > +		 * is two times of others. Thus, 16 tap is used to
>> > +		 * emulate this situation.
>> > +		 */
>> > +		.nr_taps = 16,
>> 
>> I think this is a very indirect way to communicate the problem. The only time
>> we look at nr_taps is in a test that explicitly compensates for the non-uniform
>> delay. I think we should just have a boolean struct member called
>> 'non_uniform_delay' rather than 'nr_taps', as the number of taps isn't what's
>> changing. But also see the discussion below about a potential
>> aspeed,tap-delays property.
>> 
>
> A new property may be the better choice.

I think I'm changing my mind on this sorry.

I'm think that aiming for fewer custom devicetree properties is better.

Using SoC-specific and device-specific compatibles (i.e. to 
differentiate between the eMMC and SD controllers in the 2600) we can 
just encode this data straight in the driver using the OF match data.

Rob and/or Joel: Thoughts?

>
>> Something further to consider is whether we
>> separate the compatibles or add e.g. an aspeed,tap-delays property that
>> specifies the specific delay of each logic element. This might take the place of
>> e.g. the max-tap-delay property?
>> 
>
> Yes, an additional property may be better.

Again, flip-flopping on this a bit, the aspeed,ast2600-emmc compatible 
is probably fine, and we add the tap delays in the OF match data for 
the compatible. This means we get rid of any aspeed-specific devictree 
properties with respect to the delays.

Andrew
