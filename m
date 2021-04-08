Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E88357CAC
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 08:37:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGBQL4gkHz30Cw
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 16:37:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PHeSY1cX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=PHeSY1cX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGBQ70pr3z2xdN;
 Thu,  8 Apr 2021 16:37:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5785E610A5;
 Thu,  8 Apr 2021 06:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617863834;
 bh=hdn0RucHG6wQm39zVXEr9bkiyYJ1su7yvPXnXwKhJ88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PHeSY1cXFiZaeAbp1jIO5q2YjnT5HhmrOUKbPC7gM99Oj+kBBZMyZqLmAkaCbqdO+
 baK5JT4ByT1MLYDY1y2e38tskVEwXDFHpyNtqxSRXQ51/8Pd0TKZvfmI8hbJ96AtEe
 dvig75abgvOnmYC5rbIVhdmRP9M+KsXW4dQFmmas=
Date: Thu, 8 Apr 2021 08:37:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 1/4] dt-bindings: serial: 8250: deprecate
 aspeed,sirq-polarity-sense
Message-ID: <YG6kmNBhGhe0JGwA@kroah.com>
References: <20210402182724.20848-1-zev@bewilderbeest.net>
 <20210402182724.20848-2-zev@bewilderbeest.net>
 <YG3NR4bGRjIGZhgx@kroah.com>
 <YG3kJC+6gLC6RzzQ@hatter.bewilderbeest.net>
 <YG3q9brKTC4pkQbs@kroah.com>
 <YG3yEeIRKgTjnDxz@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG3yEeIRKgTjnDxz@hatter.bewilderbeest.net>
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

On Wed, Apr 07, 2021 at 12:55:29PM -0500, Zev Weiss wrote:
> On Wed, Apr 07, 2021 at 12:25:09PM CDT, Greg Kroah-Hartman wrote:
> > On Wed, Apr 07, 2021 at 11:56:04AM -0500, Zev Weiss wrote:
> > > On Wed, Apr 07, 2021 at 10:18:31AM CDT, Greg Kroah-Hartman wrote:
> > > > On Fri, Apr 02, 2021 at 01:27:21PM -0500, Zev Weiss wrote:
> > > > > This property ties SIRQ polarity to SCU register bits that don't
> > > > > necessarily have any direct relationship to it; the only use of it
> > > > > was removed in commit c82bf6e133d30e0f9172a20807814fa28aef0f67.
> > > >
> > > > Please write that as:
> > > > 	c82bf6e133d3 ("ARM: aspeed: g5: Do not set sirq polarity")
> > > >
> > > 
> > > Ack, will do.
> > > 
> > > > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > >
> > > > What changed from previous versions?  That always goes below the ---
> > > > line.
> > > >
> > > 
> > > I included an overview of that in the cover letter (https://lore.kernel.org/openbmc/20210402182724.20848-1-zev@bewilderbeest.net/);
> > > is it desirable to also have that duplicated in the individual patches in
> > > the series?
> > 
> > Any reason why you didn't include all of the relevant people and mailing
> > lists in that cover letter?  I've never seen it before :)
> > 
> 
> Ah -- is there a good rule of thumb (or git send-email trick) for that?
> Set-union of get_maintainer.pl over all the patches in the series?

There might be a git send-email trick, but I don't know it :(
