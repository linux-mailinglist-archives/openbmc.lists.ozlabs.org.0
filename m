Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59282529E01
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2W5T1PWyz3bxH
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=INKIPYW2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=INKIPYW2; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W5425dHz3bbp
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:28:23 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6036248B;
 Tue, 17 May 2022 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652779701;
 bh=nDy2BSOi6y8qqBGNi8u2fObDZksI9AXZU+tiOGkGDWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INKIPYW2Yi/4JiM8SEm0IDjZIT7FJeWijiq6iikhi5Vvw3B7apw7AG8sMlrIhT69T
 WL1MxZ4I+O8Mm8IlWDN1HA1ukED7ZGbNddhk7luL/K5WiR5pS6mocO/WuJJMTyVzjr
 mLjUT1Xjo5a5tqtRqaJyMjBBc0mzk2SCusPXmnJE=
Date: Tue, 17 May 2022 02:28:17 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ftgmac100: use bus name in mdio error messages
Message-ID: <YoNqse+81EdwcguP@hatter.bewilderbeest.net>
References: <20220517043825.26893-1-zev@bewilderbeest.net>
 <YoMpw1WrKC+RBez4@hatter.bewilderbeest.net>
 <CACPK8Xca-07ZnYjCUmxEA3H-WQLohD-JYVEp+hM+XaHPNGfmUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8Xca-07ZnYjCUmxEA3H-WQLohD-JYVEp+hM+XaHPNGfmUQ@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 09:54:35PM PDT, Joel Stanley wrote:
> On Tue, 17 May 2022 at 04:51, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > On Mon, May 16, 2022 at 09:38:25PM PDT, Zev Weiss wrote:
> > > Previously we'd been using a device name retrieved via
> > > ftgmac100_data->phydev, but the mdio read/write functions may be
> > > called before that member is initialized in ftgmac100_phy_init(),
> > > leading to a NULL pointer dereference while printing the error message
> > > issued if the mdio access fails.  We can instead use bus->name, which
> > > is already available at that point.
> > >
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib support")
> > > ---
> > >  drivers/net/ftgmac100.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> >
> > Sorry, forgot the subject-prefix tag on this one -- this is for u-boot
> > v2019.04-aspeed-openbmc in case it wasn't clear.
> 
> Thanks, I figured that out :)
> 
> How do you reproduce this one?
> 

I'm in the process of trying to transition e3c246d4i off of the 2016 
branch, and with the 2019 branch I'm finding u-boot spewing a bunch of 
output like

  : mdio read failed (phy:0 reg:2)
  : mdio read failed (phy:1 reg:2)
  : mdio read failed (phy:2 reg:2)
  ...

(sometimes with some amount of garbage before the colon at the start of 
the line, and with "eth1" instead after this patch.)

I'm currently experimenting with various Kconfig settings and dts tweaks 
(on two different variants of the hardware) to try to narrow down the 
underlying cause and hopefully eliminate the error spew entirely, but in 
the meantime I figured we might as well get that error-reporting path 
smoothed out a bit.

> I didn't realise we had downstream changes for this driver, we should
> ask aspeed to submit their downstream changes to u-boot mainline.

That sounds appropriate -- though as Cédric pointed out, since the 
relevant parts for this particular patch are already in mainline u-boot 
I should probably send this upstream as well.

