Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6969D3073
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 23:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtJwr3vkNz3c86
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 09:25:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732055145;
	cv=none; b=VAA+oF9AZatvUDlc++irL1R/uSEby6bI0tpj2tD+uxOlA11Zy4+oWJ4/xIoSMcVGl6aGD5SXB7WW2Ha9xlZNtVpZqulrG8s0/OTZsOihN0aIbw1xWKKju16gu9jUnGWYttrEFYU+K9+InBRnWZMV6MAWVAWG2nBajflWwfWLwj1rAOs4ou/1LxrKPHWNthB3udLQCdsAL2hDLCescYFnFbbEy2Ij617PoV5bgtJdBw5zQhhvq/yVNgV2c7Bac3ttmEgNGOJCJP979iCn+u8H2JkygYuvjVsc7YaHEXNMDC2QIZv7nJ7kqBHKown5EopGdg1Ppdqgg7N3LRDg7JjULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732055145; c=relaxed/relaxed;
	bh=8sJWl9WCXTMDen5KlpkZ+arIbizvkuiRNGG9/Eilnp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0hawnJIzx5DoNghBwR2rq1TAfuup5Ys0JfV5TRDOR8fAydKeElTbDnMlPTVytf0lif0hisseXMSEBp/1mxTlu+D600mhTb1IUvUUMfkgqchQwPok6pRe81hyGpteSxRCqdcYtiMo3Ulf74gA4/sMUbtOS7D8/0nsZ7dKLBb3vNf8lJnC1w7dtXPT2/T+NL0AWzKcgk0sTErAvR/jIJxG63+pquusIFEgnYsScBnxOGWnkoFMdtV5TYbCqio9ZTF0YEbQTNNHL+tCijVsGGnoM0afRR38SiE4DYO+lTR1P1fOC6Wy+XokbBuaFOl4kI4tglapr8qsO+HRBTqCV7j8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ua+b4vnB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ua+b4vnB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtJwm5LF2z2xr4
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 09:25:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8233FA42EF5;
	Tue, 19 Nov 2024 22:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C3FC4CECF;
	Tue, 19 Nov 2024 22:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732055141;
	bh=GwmZWQf0EKA5yMqqR2Doj7yJmnSw6NoJj8hw2zIWZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua+b4vnBVOQ6rjIkKahdcOMBBQnrvNv44eh0rm8tQApLDs1AfRPfOz4jIjLA+0DjA
	 wa/COT5zm9CdTQK3lOYW2Ccpqn0ilofgU2qTRQhbwoPEQyxn0mp1CGhzbbECaxCW3+
	 ydE4+x/DScZ+uSSZqEM67+z1haNo/t9fD2s2mSILauQ4sf5maS7bYroiWCn+gSWMVk
	 Cvv5SMXE2BUYKJTOC67ruvKHUF8/5oMl0Nkr1Pj2mOTINMoAc1GJAlPTtiGpMu/fUt
	 ei4kl1ePs0OJxO9giKMf6ocPNk+/yx8pRBYj8ZHbnXbmesWofK9/HBkcte1ySji2iP
	 HoLhjddDE4N1g==
Date: Tue, 19 Nov 2024 23:25:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
Message-ID: <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
 <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

...

> > > -     /* 100KHz and below: */
> > > -     if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> > > -             sclfrq = src_clk_khz / (bus_freq_khz * 4);
> > > -
> > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > -                     return -EDOM;
> > > -
> > > -             if (src_clk_khz >= 40000)
> > > -                     hldt = 17;
> > > -             else if (src_clk_khz >= 12500)
> > > -                     hldt = 15;
> > > -             else
> > > -                     hldt = 7;
> > > -     }
> > > -
> > > -     /* 400KHz: */
> > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> > > -             sclfrq = 0;
> > > +     switch (bus_freq_hz) {
> > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > +             smb_timing = smb_timing_100khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_100khz);
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > +             smb_timing = smb_timing_400khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_400khz);
> > >               fast_mode = I2CCTL3_400K_MODE;
> > > -
> > > -             if (src_clk_khz < 7500)
> > > -                     /* 400KHZ cannot be supported for core clock < 7.5MHz */
> > > -                     return -EDOM;
> > > -
> > > -             else if (src_clk_khz >= 50000) {
> > > -                     k1 = 80;
> > > -                     k2 = 48;
> > > -                     hldt = 12;
> > > -                     dbnct = 7;
> > > -             }
> > > -
> > > -             /* Master or Slave with frequency > 25MHz */
> > > -             else if (src_clk_khz > 25000) {
> > > -                     hldt = clk_coef(src_clk_khz, 300) + 7;
> > > -                     k1 = clk_coef(src_clk_khz, 1600);
> > > -                     k2 = clk_coef(src_clk_khz, 900);
> > > -             }
> > > -     }
> > > -
> > > -     /* 1MHz: */
> > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > -             sclfrq = 0;
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > +             smb_timing = smb_timing_1000khz;
> > > +             table_size = ARRAY_SIZE(smb_timing_1000khz);
> > >               fast_mode = I2CCTL3_400K_MODE;
> > > -
> > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > -             if (src_clk_khz < 24000)
> > > -                     return -EDOM;
> > > -
> > > -             k1 = clk_coef(src_clk_khz, 620);
> > > -             k2 = clk_coef(src_clk_khz, 380);
> > > -
> > > -             /* Core clk > 40 MHz */
> > > -             if (src_clk_khz > 40000) {
> > > -                     /*
> > > -                      * Set HLDT:
> > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> > > -                      * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> > > -                      */
> > > -                     hldt = clk_coef(src_clk_khz, 120) + 7;
> > > -             } else {
> > > -                     hldt = 7;
> > > -                     dbnct = 2;
> > > -             }
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> >
> > There is here a slight change of behaiour which is not mentioned
> > in the commit log. Before the user could set a bus_freq_hz which
> > had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
> > precisely that.
> >
> > Do we want to check what the user has set in the DTS?
> 
> The driver checks the bus frequency the user sets in the DTS.

yes, but before it was checking the value within a range, while
now it's checking the exact value.

The difference is that now if you don't set the exact value you
get EINVAL, not before.

Andi
