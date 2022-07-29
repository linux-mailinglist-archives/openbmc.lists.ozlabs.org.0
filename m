Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE05849E8
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 04:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvBnp0nY2z2xkc
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 12:50:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=rX62mcnW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=u3nztMBs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=rX62mcnW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=u3nztMBs;
	dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvBnK0GV8z2x9d
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 12:49:39 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id BCF0F580981;
	Thu, 28 Jul 2022 22:49:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Jul 2022 22:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1659062976; x=
	1659066576; bh=1+e9ZMFNrtpPNaA9JLCNU1bzaKyVAAQNJCaf430RzLc=; b=r
	X62mcnWE8A5dSoiVbpX8Wjj1mgH4jz/9xF2v4FKcZYfa1/xwS0dPNyuKvf6UL4Ti
	+EfGtVh+PrfS9BAArMrvMHT5VJmCRPujviyuduAFjAbNE2nWwPizZaPEpYUyfFtE
	AW3MvTtStYksUj1XNjB9v5/leV6Qu428SNLVTZ9iGvggKQkiatYJDOSbRSkMnFgS
	ZNZuF1kz+nC3SDkcFyGNpBHN6KThutSgIrw3N6/936eoimaFmBrmq4liKPhizWjE
	5jv0DkdXbHCEVkwxKCgIEoKM/leYHNdZ2F0tVvrt9b82rBekNYa+ZDrB6COvHrH7
	ChE2C2Zvm+LBWh+rDQleQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659062976; x=
	1659066576; bh=1+e9ZMFNrtpPNaA9JLCNU1bzaKyVAAQNJCaf430RzLc=; b=u
	3nztMBs2Sg8SBgTwjLwYQQuOMay5wajSbUTy6xEYME2sqNLvtJICIcFvJgN+7dY9
	UjiQ+mNDMmo2Zhn+cWo8/h2BM7pA1a9q+4t5mEJbvxXf4pSlgfu6JgeoZkgHmOMl
	HFdqpxMHHkMkcR/3T/exAU5j2l3gZ2gPHzZ1wpiv8Gxue+rgczanv6GGmGzTYNqI
	M+f1RSNmyuxuXOL31dfJfbkOPUhCPqlu5S+4koMe1fEOGCFoZ9MKiuQif37r2NCz
	IP/cZYHZb/OwtjrTFBnkILmNrMjREbg4E1/K3/mZbQHRqNZU7tt3XUjiuy4FTKbo
	7vNuKH6jUVMN3wKc0Aa2g==
X-ME-Sender: <xms:wErjYhJ5XmX7B-TnOkxxYIpZbN8B6vHTJozkwkdmOBTJML8b7EK09A>
    <xme:wErjYtLUjYo9Mt6aI834oDHvLjhkNRRwKJnJbOpJnKThXL7OHoqMB-mVnfcUgpoP6
    KBaCf_peJapiH3ZuyI>
X-ME-Received: <xmr:wErjYpuhkLDuhu2erreaZp475_mq3tV-sDsC6JqBcwvws-8Oqhj3tEABw6wB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpefhgeeigefhuedutedvlefgheegffegteettdeileevffehfffhgedtgeef
    ieevieenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghr
    sehpjhgurdguvghv
X-ME-Proxy: <xmx:wErjYiZ9jchOJjvKfax627-OmyVAfhbw0TMMtPDmqLdzyPzUw__ccQ>
    <xmx:wErjYoYx-hHKEaP3Rv0kP8y0KQx4TNQAErxLMuvgCOgWBN4uwve0bA>
    <xmx:wErjYmAWdMz1X3VM-wPYu3tAIsEHOdCGtVa9Avi_RWPot3MguA3lZw>
    <xmx:wErjYjzHzIZ5Xo_vW2HIrznQ0vt0ns2z7KjjYWNIw228W97XF75Mlw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 22:49:35 -0400 (EDT)
Date: Thu, 28 Jul 2022 19:49:34 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/1] tpm_tis_i2c: Fix -Wdeclaration-after-statement
Message-ID: <YuNEo1KvNFCdaNoF@devvm1684.prn0.facebook.com>
References: <20220725225151.393384-1-peter@pjd.dev>
 <CACPK8XeM-foqPGD5yF4r_a9ZmdJRCwOC7yvY3eUAH0zsrkUheA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8XeM-foqPGD5yF4r_a9ZmdJRCwOC7yvY3eUAH0zsrkUheA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 29, 2022 at 12:21:31AM +0000, Joel Stanley wrote:
> Hi Peter,
> 
> On Mon, 25 Jul 2022 at 22:51, Peter Delevoryas <peter@pjd.dev> wrote:
> >
> > Hey Joel,
> >
> > I've been trying to build fby35 from https://github.com/openbmc/openbmc, and I
> > noticed that the TPM TIS I2C file seems to emit a warning that causes a
> > compilation error:
> >
> > ../drivers/char/tpm/tpm_tis_i2c.c: In function ‘tpm_tis_i2c_write_bytes’:
> > ../drivers/char/tpm/tpm_tis_i2c.c:114:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
> >   114 |                 struct i2c_msg msgs[] = {
> >       |                 ^~~~~~
> >
> > I'm sending this patch as a fix for the warning, to avoid the compilation error.
> 
> Thanks for trying to fix this.
> 
> >
> > Normally I think I would send this to the upstream kernel mailing list, but
> > this file doesn't actually seem to be in the upstream at any point:
> >
> >     drivers/char/tpm/tpm_tis_i2c.c
> >
> > It looks like it was added by Nuvoton and never upstreamed successfully? Perhaps
> > we should get rid of it at this point? fby35 doesn't actually use the TPM TIS
> > I2C interface, it uses the SPI one. Bletchley doesn't use the I2C one either.
> > Only older FB platforms did.
> 
> The i2c driver was added for the IBM P10 platforms.

I see, thanks for pointing that out, I didn't do a proper survey.

> 
> > Actually, doing a quick search on lore.kernel.org: It looks like maybe there's
> > a new version submitted by Infineon in June:
> >
> >     https://lore.kernel.org/all/20220608173113.9232-1-Alexander.Steffen@infineon.com/
> >
> > If fby35 wants to avoid this error, should we fix the driver, remove it from the
> > kernel, pull in the new driver from upstream, or maybe just disable it in the
> > linux-aspeed tpm2 distro feature Kconfig?
> 
> The upstream maintainer has been reluctant to merge this code. Nuvoton
> told me off-list they had abandoned plans to upstream it. Since then
> Infineon have picked it up and made some submissions. It looks like
> it's been queued for merging in v5.20.

Oh great, nice that Infineon did that.

> 
> I'd be happy moving to the latest version of the patch in the openbmc
> tree. Either as a revert+new driver, or as a diff, whichever you think
> makes sense. They inexplicably removed the compatible strings in the
> latest submission, so we would need to add them back:

That's great! I think revert + new driver would make most sense to me,
are you planning on just pulling the diffs from that mailing list thread
and applying the compatible string change on top of that? Let me know if
I can help somehow.

Thanks,
Peter

> 
>  static const struct of_device_id of_tis_i2c_match[] = {
> -       { .compatible = "nuvoton,npct75x", },
> -       { .compatible = "tcg,tpm-tis-i2c", },
> +       { .compatible = "infineon,slb9673", },
> 
> 
> Cheers,
> 
> Joel
