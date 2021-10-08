Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E0426433
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 07:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQccH05CPz301s
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 16:45:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lrh9ADDM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=lrh9ADDM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcbs1v9Mz2xtc;
 Fri,  8 Oct 2021 16:45:29 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6609610E5;
 Fri,  8 Oct 2021 05:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633671926;
 bh=hM+LEo6jq0sP4p14rwXKnhJUAnXreXijp/k9Sn8qwVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrh9ADDMfDgO+XapsVQdMVRnXrY8BIE5LKdZ6yUKCkAYaoI3jsMK8yGMPKTKmlUWK
 uIaGV774meo9+ScIbEyyEZlq9Y1h5SR0xThd/YS9MaUAigJOpmn4cSFyS0tuGwaar3
 w0azjLgyNDYW4wJUiJmnTiLjYn93wgDLlpmDltP4=
Date: Fri, 8 Oct 2021 07:45:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Message-ID: <YV/a8k2vI8TjJR2z@kroah.com>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
 <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
 <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xfowe6k8KOucveUd-O3vMC4n7qyF8uoowcpWj-Sugqhbw@mail.gmail.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 08, 2021 at 04:43:24AM +0000, Joel Stanley wrote:
> Hi Greg,
> 
> On Tue, 28 Sept 2021 at 18:57, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
> > >Hi Mauro,
> > >
> > >On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> > >> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
> > >> > enabled
> > >> >
> > >> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
> > >> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
> > >> > > garbage interrupts"), the ASpeed video engine sometimes asserts
> > >> > > interrupts that the driver hasn't enabled.  In addition to the
> > >> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
> > >> > > patch, COMP_READY has also been observed.  Instead of playing
> > >> > > whack-a-mole with each one individually, we can instead just blanket
> > >> > > ignore everything we haven't explicitly enabled.
> > >> >
> > >> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
> > >> > Change looks good, thanks!
> > >> >
> > >> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
> > >> >
> > >> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > >> > >
> > >> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > >
> > >I notice this wasn't merged in the pull request you sent for v5.15.
> > >Would you be able to ensure it makes it in the next pull request you
> > >send?
> > >
> > >It can have some fixes tags too:
> > >
> > >Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
> > >Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > >Acked-by: Joel Stanley <joel@jms.id.au>
> > >
> > >Cheers,
> > >
> > >Joel
> > >
> >
> > Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?
> 
> We're struggling to get a hold of the media maintainers to merge this
> fix. Have you heard from them recently?

I have seen them on the mailing list, yes.

good luck!

greg k-h
