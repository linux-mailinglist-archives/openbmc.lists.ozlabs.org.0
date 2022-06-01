Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA7153A083
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 11:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCkVw5kmmz3bkD
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 19:34:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bGGzdgsl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bGGzdgsl;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCkVW6FYWz3bYG
	for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2022 19:33:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 021CFB8185D;
	Wed,  1 Jun 2022 09:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7B4C385A5;
	Wed,  1 Jun 2022 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654076029;
	bh=5T6DOvFw902lROs1sSAyrJ/DZ8vBhIwjqturHxstVd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGGzdgsl0yWRtC4tWhYShHmsSXAkbeeoS1eRaWgAuHlUB8ydG6LiQgI9ENIJpxdvi
	 lI2Zh0dsTLjglJKNtjG3AJsMHdauUUCWmZMnJDlDaUW6FNuR9a/bnbZ2OsY9rYdlzs
	 1s/mzxOUsVKKevlFm5kdHfOHd2SOWfgorHG4Rtuw=
Date: Wed, 1 Jun 2022 11:33:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YpcyaTqqsfDJx7HG@kroah.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
 <4f5d7746-3747-4a4d-525a-4fb69e706cd0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f5d7746-3747-4a4d-525a-4fb69e706cd0@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 03:21:47PM +0700, Quan Nguyen wrote:
> > > +	if (err_type & BIT(2)) {
> > > +		/* Error with data type */
> > > +		ret = regmap_read(errmon->regmap, err_info->err_data_low, &data_lo);
> > > +		if (ret)
> > > +			goto done;
> > > +
> > > +		ret = regmap_read(errmon->regmap, err_info->err_data_high, &data_hi);
> > > +		if (ret)
> > > +			goto done;
> > > +
> > > +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> > > +				   4, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> > > +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> > > +		/* clear the read errors */
> > > +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(2));
> > > +
> > > +	} else if (err_type & BIT(1)) {
> > > +		/* Error type */
> > > +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> > > +				   2, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> > > +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> > > +		/* clear the read errors */
> > > +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(1));
> > > +
> > > +	} else if (err_type & BIT(0)) {
> > > +		/* Warning type */
> > > +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
> > > +				   1, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
> > > +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
> 
> Hi Greg,
> 
> Since the internal representation of the internal error is split into high
> low chunks of the info and data values which need to be communicated
> atomicly, I'm treating them as "one value" here.

That is a huge "one value", that's not what this really is, it needs to
be parsed by userspace, right?

And why does this have to be atomic?  What happens if the values change
right after you read them?  What is userspace going to do with them?

> I could dump them in a
> temporary array and print that, but it seems like additional complexity for
> the same result. Can we consider this concatenated encoding as "an array of
> the same type" for the purposes of this driver?"

That's really not a good idea as sysfs files should never need to be
"parsed" like this.

Again, what are you trying to do here, and why does it have to be
atomic?

thanks,

greg k-h
