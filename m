Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED724FCE4A
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 06:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KctfJ1DC9z2yY1
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 14:53:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pgoC6E40;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=pgoC6E40; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kctdt5swMz2xBk
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 14:53:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E780C617D1;
 Tue, 12 Apr 2022 04:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1F8C385A1;
 Tue, 12 Apr 2022 04:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649739197;
 bh=T6n81gDCBDs0pRwEcnvqygbpEQ4ehkvySBtLn1e3Jxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pgoC6E40EjBaMDO74KQ3wKP0pqQK3npYB4Occ3NqOx7+6ONQNZtKNiKtIIu5Hl/o4
 wSR8OyghZVJl7IhkMgJB2hHoWcGIkYfFsHIMWvnqzr4UuH1gygdNq93RqiUD6eY1OC
 OPFKnNlbgirTp2j9EpqW9cHF20zVMT1Ui+k2lZjk=
Date: Tue, 12 Apr 2022 06:53:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YlUFuoFPveAYRQDm@kroah.com>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
 <YicAzSara5Sr3LQ7@kroah.com>
 <YicSj3ZuetRkYxH1@hatter.bewilderbeest.net>
 <YlSnMVVE63xqGSGa@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlSnMVVE63xqGSGa@hatter.bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 11, 2022 at 03:09:53PM -0700, Zev Weiss wrote:
> On Tue, Mar 08, 2022 at 12:23:44AM PST, Zev Weiss wrote:
> > On Mon, Mar 07, 2022 at 11:07:57PM PST, Greg Kroah-Hartman wrote:
> > 
> > > > +EFUSE_ERROR_ATTR(under_voltage, REGULATOR_ERROR_UNDER_VOLTAGE);
> > > > +EFUSE_ERROR_ATTR(over_current, REGULATOR_ERROR_OVER_CURRENT);
> > > > +EFUSE_ERROR_ATTR(regulation_out, REGULATOR_ERROR_REGULATION_OUT);
> > > > +EFUSE_ERROR_ATTR(fail, REGULATOR_ERROR_FAIL);
> > > > +EFUSE_ERROR_ATTR(over_temp, REGULATOR_ERROR_OVER_TEMP);
> > > > +EFUSE_ERROR_ATTR(under_voltage_warn, REGULATOR_ERROR_UNDER_VOLTAGE_WARN);
> > > > +EFUSE_ERROR_ATTR(over_current_warn, REGULATOR_ERROR_OVER_CURRENT_WARN);
> > > > +EFUSE_ERROR_ATTR(over_voltage_warn, REGULATOR_ERROR_OVER_VOLTAGE_WARN);
> > > > +EFUSE_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
> > > > +
> > > > +static struct attribute *efuse_attrs[] = {
> > > > +	&dev_attr_operstate.attr,
> > > > +	&dev_attr_under_voltage.attr,
> > > > +	&dev_attr_over_current.attr,
> > > > +	&dev_attr_regulation_out.attr,
> > > > +	&dev_attr_fail.attr,
> > > > +	&dev_attr_over_temp.attr,
> > > > +	&dev_attr_under_voltage_warn.attr,
> > > > +	&dev_attr_over_current_warn.attr,
> > > > +	&dev_attr_over_voltage_warn.attr,
> > > > +	&dev_attr_over_temp_warn.attr,
> > > > +	NULL,
> > > > +};
> > > > +ATTRIBUTE_GROUPS(efuse);
> > > 
> > > Shouldn't these all just be what all regulator drivers report?  Or power
> > > drivers?  I find it odd that this would be the first driver that would
> > > need to export these types of attributes.  Surely there's already a
> > > class for this?
> > > 
> > 
> > The attributes available from the underlying regulator device don't
> > include the error flags, and while they do include its state
> > ('operstate' here), it's a read-only attribute, and from previous
> > discussions with Mark I gathered that was unlikely to change (whereas it
> > being read-write is a critical part of this driver's functionality).
> > 
> > Given his input on the first stab at this I took a while back, I've been
> > hoping to hear from Mark as to whether this looked more like something
> > he'd find palatable; perhaps he could chime in on this too?  (And/or on
> > the regulator API question in the cover letter.)
> > 
> 
> Ping...Mark (or Liam?), any thoughts on an appropriate path forward on this?

Make it a regular regulator driver please.

thanks,

greg k-h
