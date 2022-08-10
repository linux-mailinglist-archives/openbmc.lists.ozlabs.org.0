Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0858F3B3
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 23:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M32SC38pMz3bjX
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 07:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=sHXvCddg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=sNGW0wNj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=sHXvCddg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=sNGW0wNj;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M32Rh73zFz2yxF
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 07:01:35 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id EFADB2B059AA;
	Wed, 10 Aug 2022 17:01:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 10 Aug 2022 17:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660165289; x=1660168889; bh=woCdHi4Ccs
	FBjuRrTt+4tvaf0N4neNa50UEsL6VVZ+M=; b=sHXvCddgokMmrDBwKnI0pLRbus
	XKK26YpDbFvVuOXedon1FgWbeCOnQzQy4Sh24Xst1Frti6vUE7+riSQ4F/p2oNlh
	Xfm2ZMs55mXIvVciwyTPteKE1Ok0hnhlvrQwCuRgdHsl9a/WtwxuKqFS9Q1VvYxC
	0LMz31/OYaFRWWZnE9heVgEnPZTqFC49OwoVwB4Bh0fngDdI+wVRb9KYknjKu3P7
	jdDqURrr8Es2QGSm+8ZkmqADRFpDDS9gqU3KX/9ycJy3syjF/DNgwBga7+W4iGlW
	bGo5g9vdJn9vfug48wqvnxVCXIPotdj/yh29HJH6dn59mGT4YH++cprRonAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660165289; x=1660168889; bh=woCdHi4CcsFBjuRrTt+4tvaf0N4n
	eNa50UEsL6VVZ+M=; b=sNGW0wNjNgz66WD7hfb9IdlmHtZqttMcP4uilRLjbGtg
	k3PyI17a/aiLBrVOm51WGUON91xaz0nbf//6bwcjgvNzA1HrhOXM6Uxt9U2CTeB5
	Z7TOdZe0lef3cmk4jKTpjuHsrWZEPRVo+7u3qCu3ZHN7gFQLdhwpalf5OZe+uiLN
	pP+vAsjhbWSbsDbD6mG/GEs5ODUbxlziUcYzXDOjPBXbQKAWnePvPFpJ6jVk3BKm
	g385RUg4i1mM/ZiQj3Gka9qODhUV2gNnB8aeVYUlWVdvkzHShj7SX4q8iu1mbiey
	HzjcFnspuRQ/RyoXdZn9laNVVFNWJiitifTS6CBHMg==
X-ME-Sender: <xms:pBz0YnvWD_AJEIZvlvtBwn8lMlw5LgNJeyAwusD0MDJ00jHFpJUjag>
    <xme:pBz0YofwyhylnRisS-wjt8LOaE08f7PtMw-lxwF_POb3yBUYxw6BJR6FJ3vFP_jMf
    n-lKu-BL4CrI__W4OM>
X-ME-Received: <xmr:pBz0YqwLVlwKqK0WpSniqJKBVkXDy1GEpfbIgPfWpike82ROeyaPD-qEYv981ik5C4XG8jaJVjHeN0WCt0zi7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpeegvdethfejkedthfdttdefuddthfevtdejveeiudekgfevledvjeeukedv
    hfeuffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghr
    sehpjhgurdguvghv
X-ME-Proxy: <xmx:pBz0YmPsks4o_g1R5fR71b9Ooqy3H-lHjs1BS5Yd_ctJRHGBsS23fg>
    <xmx:pBz0Yn9cd_Zv8_HqhuE0GmuG-lfH3Z7o-0YRaHFVDboDIpmqP0e22Q>
    <xmx:pBz0YmUY5xUKRXuFuqvstHhAfEEBnZSU6L6wjoanAWAeb4wWR40p5Q>
    <xmx:pRz0YqZFMoIUa3Wz172oT1cnbE2EOgv-Hq41Cb1GNyIv53E5N6o2FzVLrQg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 17:01:23 -0400 (EDT)
Date: Wed, 10 Aug 2022 14:01:21 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/7] tpm: Pull tpm_tis_phy_ops and tpm_tis_i2c updates
Message-ID: <YvQcoXFzhOAHT00F@pdel-mbp.dhcp.thefacebook.com>
References: <20220808220839.1006341-1-peter@pjd.dev>
 <CACPK8Xe=_bMH0BSZTcgbfLYFhf_=rSuMJz0ZFRhErWQuUzzRYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe=_bMH0BSZTcgbfLYFhf_=rSuMJz0ZFRhErWQuUzzRYw@mail.gmail.com>
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
Cc: Alexander.Steffen@infineon.com, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 10, 2022 at 06:19:38AM +0000, Joel Stanley wrote:
> On Mon, 8 Aug 2022 at 22:08, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > OpenBMC's Linux dev-5.15 has an old tpm_tis_i2c driver from Nuvoton, but
> > it was never merged upstreamed and produces compilation warnings now.
> >
> > Infineon took that driver, modified it, and merged it upstream. Nuvoton
> > never merged theirs, so the first patch in this series reverts theirs.
> 
> Thanks Peter!
> 
> I've been testing this version of the driver (applied to v5.19 instead
> of our 5.15 tree, but it is the same code) and it doesn't work with
> the hardware we have:
> 
> [    1.571105] tpm tpm0: Operation Canceled
> [    1.576301] tpm_tis_i2c 1-002e: 1.2 TPM (device-id 0xFC, rev-id 1)
> [    1.610168] tpm tpm0: Operation Canceled
> [    1.615580] tpm tpm0: A TPM error (-125) occurred attempting to
> determine the timeouts
> [    1.685651] tpm_tis_i2c: probe of 1-002e failed with error -125
> 
> This appears to be detected as a "1.2 TPM", when I am pretty sure it's
> a 2.0 device. I suspect I'm missing something.
> 
> The tree I was testing with is here:
> 
> https://github.com/shenki/linux/commits/dev-5.19
> 
> I've cc'd Eddie as he also has access to this hardware, and perhaps
> can help with the debugging.
>

Oh, yikes, ok. That's not good. Maybe I can help debug this too. We have
some lab systems that connected to the TPM through I2C, but that might
have been a TPM 1.2 chip, not a TPM 2 chip. Thanks though.

> 
> Cheers,
> 
> Joel
> 
> 
> 
> >
> > Also, I included the "Remove read16, read32, write32" patch because
> > otherwise Alexander's patches don't apply cleanly. But, I could actually
> > resolve the merge conflicts. I figured it will be easier later to just
> > include more patches from upstream to make it clean.
> >
> > I also noticed there was one follow-up change submitted by alibaba to
> > remove one line, so I included that.
> >
> > Alexander didn't include the compatible strings from the old driver,
> > even though it should be compatible, so I've included a patch at the end
> > which fixes that. I did it as a separate patch so that we maintain a
> > patch series closer to what the upstream will be.
> >
> > cc'ing Alexander on this thread too to see if he has any suggestions, or
> > thinks I missed anything.
> >
> > I haven't cc'd the linux kernel mailing list aliases because I don't
> > think this is relevant to them. Only the patch including the compatible
> > strings will be relevant.
> >
> > checkpath.pl warns agains MAINTAINERS, but I'm pretty sure it's fine.
> > The upstream MAINTAINERS file hasn't been updated with these changes, so
> > we probably don't need to do anything there.
> >
> > This was a follow-up from the following OpenBMC mailing list thread:
> >
> > https://lore.kernel.org/openbmc/20220725225151.393384-1-peter@pjd.dev/
> >
> > Thanks,
> > Peter
> >
> > Alexander Steffen (3):
> >   dt-bindings: trivial-devices: Add Infineon SLB9673 TPM
> >   tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
> >   tpm: Add tpm_tis_i2c backend for tpm_tis_core
> >
> > Johannes Holland (1):
> >   tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
> >
> > Peter Delevoryas (2):
> >   Revert "tpm: tpm_tis: Add tpm_tis_i2c driver"
> >   tpm_tis_i2c: Add old compatible strings back
> >
> > Yang Li (1):
> >   tpm: fix platform_no_drv_owner.cocci warning
> >
> >  .../devicetree/bindings/trivial-devices.yaml  |   2 +
> >  drivers/char/tpm/Kconfig                      |  24 +-
> >  drivers/char/tpm/tpm_tis.c                    |  67 ++-
> >  drivers/char/tpm/tpm_tis_core.c               |  14 +
> >  drivers/char/tpm/tpm_tis_core.h               |  68 ++-
> >  drivers/char/tpm/tpm_tis_i2c.c                | 431 ++++++++++++------
> >  drivers/char/tpm/tpm_tis_spi.h                |   4 -
> >  drivers/char/tpm/tpm_tis_spi_cr50.c           |   7 +-
> >  drivers/char/tpm/tpm_tis_spi_main.c           |  45 +-
> >  drivers/char/tpm/tpm_tis_synquacer.c          |  98 ++--
> >  10 files changed, 436 insertions(+), 324 deletions(-)
> >
> > --
> > 2.37.1
> >
