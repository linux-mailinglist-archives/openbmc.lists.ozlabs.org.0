Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87435731F
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 19:25:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFrrc0Mjtz3dV6
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 03:25:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EWg++h/Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=EWg++h/Z; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFrrC1sSlz3dXQ;
 Thu,  8 Apr 2021 03:25:15 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27C6361242;
 Wed,  7 Apr 2021 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617816312;
 bh=/I9GfmleSBbs7R0HF64rsoxW4s6GV91+HDAdvacr2Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EWg++h/ZHMHODvvZK/EKo/6Ulry09nDEMt4yEgv6l7BmhERFEnKYorXfN8IcJ3H7D
 Ada1H1MrYxAMneIu91RjTR+UGFClLJ3kwxIm2Gbm5KwHdh7PPcESFN6kd4Wg2ISaRj
 +qrTcWO5swVafSNM054/mTa6eoxgM6nIunJMKxHw=
Date: Wed, 7 Apr 2021 19:25:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 1/4] dt-bindings: serial: 8250: deprecate
 aspeed,sirq-polarity-sense
Message-ID: <YG3q9brKTC4pkQbs@kroah.com>
References: <20210402182724.20848-1-zev@bewilderbeest.net>
 <20210402182724.20848-2-zev@bewilderbeest.net>
 <YG3NR4bGRjIGZhgx@kroah.com>
 <YG3kJC+6gLC6RzzQ@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG3kJC+6gLC6RzzQ@hatter.bewilderbeest.net>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 11:56:04AM -0500, Zev Weiss wrote:
> On Wed, Apr 07, 2021 at 10:18:31AM CDT, Greg Kroah-Hartman wrote:
> > On Fri, Apr 02, 2021 at 01:27:21PM -0500, Zev Weiss wrote:
> > > This property ties SIRQ polarity to SCU register bits that don't
> > > necessarily have any direct relationship to it; the only use of it
> > > was removed in commit c82bf6e133d30e0f9172a20807814fa28aef0f67.
> > 
> > Please write that as:
> > 	c82bf6e133d3 ("ARM: aspeed: g5: Do not set sirq polarity")
> > 
> 
> Ack, will do.
> 
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > What changed from previous versions?  That always goes below the ---
> > line.
> > 
> 
> I included an overview of that in the cover letter (https://lore.kernel.org/openbmc/20210402182724.20848-1-zev@bewilderbeest.net/);
> is it desirable to also have that duplicated in the individual patches in
> the series?

Any reason why you didn't include all of the relevant people and mailing
lists in that cover letter?  I've never seen it before :)

But yes, if you do send it to the right group, putting it in 00/XX is
fine.

thanks,

greg k-h
