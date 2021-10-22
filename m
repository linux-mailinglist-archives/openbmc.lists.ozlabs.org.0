Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C81437206
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 08:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbFDk4xVrz3c6j
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 17:43:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xCajnFiI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xCajnFiI; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbFDM6HPQz2yPy
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 17:43:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC1E360FE7;
 Fri, 22 Oct 2021 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634885007;
 bh=Ru/Z3TmyVyCg7ZOQGOOooZjIAeX9BcdeAuSHcNBwLjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xCajnFiIFvaf0JehoaKFyOeOIPbK7wIKSnevGwtvGQ7QvKLhOPjvvSWHMVnMixeBe
 wOB/fmXp8nXA8s0HpBYKQ0ZkArJ65IeVO7pmL2neiWxEAVhRZ7UmuYgjLgZL9Ks5k4
 6/9m0bKgnMu9AGGTdxKQoXjRdJuUv5nkL/5oRBuw=
Date: Fri, 22 Oct 2021 08:43:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 1/5] of: base: add function to check for status =
 "reserved"
Message-ID: <YXJdi3IBzaqmSZ9b@kroah.com>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022020032.26980-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 07:00:28PM -0700, Zev Weiss wrote:
> Per v0.3 of the Devicetree Specification [0]:
> 
>   Indicates that the device is operational, but should not be used.
>   Typically this is used for devices that are controlled by another
>   software component, such as platform firmware.
> 
> One use-case for this is in OpenBMC, where certain devices (such as a
> BIOS flash chip) may be shared by the host and the BMC, but cannot be
> accessed by the BMC during its usual boot-time device probing, because
> they require additional (potentially elaborate) coordination with the
> host to arbitrate which processor is controlling the device.
> 
> Devices marked with this status should thus be instantiated, but not
> have a driver bound to them or be otherwise touched.
> 
> [0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/of/base.c  | 56 +++++++++++++++++++++++++++++++++++++++-------
>  include/linux/of.h |  6 +++++
>  2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0ac17256258d..3bd7c5b8a2cc 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -580,14 +580,16 @@ int of_machine_is_compatible(const char *compat)
>  EXPORT_SYMBOL(of_machine_is_compatible);
>  
>  /**
> - *  __of_device_is_available - check if a device is available for use
> + * __of_device_check_status - check if a device's status matches a particular string
>   *
> - *  @device: Node to check for availability, with locks already held
> + * @device: Node to check status of, with locks already held
> + * @val: Status string to check for, or NULL for "okay"/"ok"
>   *
> - *  Return: True if the status property is absent or set to "okay" or "ok",
> - *  false otherwise
> + * Return: True if status property exists and matches @val, or either "okay"
> + * or "ok" if @val is NULL, or if status property is absent and @val is
> + * "okay", "ok", or NULL.  False otherwise.
>   */
> -static bool __of_device_is_available(const struct device_node *device)
> +static bool __of_device_check_status(const struct device_node *device, const char *val)
>  {
>  	const char *status;
>  	int statlen;
> @@ -596,17 +598,35 @@ static bool __of_device_is_available(const struct device_node *device)
>  		return false;
>  
>  	status = __of_get_property(device, "status", &statlen);
> -	if (status == NULL)
> -		return true;
> +	if (!status) {
> +		/* a missing status property is treated as "okay" */
> +		status = "okay";
> +		statlen = strlen(status) + 1; /* property lengths include the NUL terminator */
> +	}
>  
>  	if (statlen > 0) {
> -		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
> +		if (!val && (!strcmp(status, "okay") || !strcmp(status, "ok")))
> +			return true;
> +		else if (val && !strcmp(status, val))


Ick, where is this string coming from?  The kernel or userspace or a
device tree?  This feels very wrong, why is the kernel doing parsing
like this of different options that all mean the same thing?


>  			return true;
>  	}
>  
>  	return false;
>  }
>  
> +/**
> + * __of_device_is_available - check if a device is available for use
> + *
> + * @device: Node to check for availability, with locks already held
> + *
> + * Return: True if the status property is absent or set to "okay" or "ok",
> + * false otherwise
> + */
> +static bool __of_device_is_available(const struct device_node *device)
> +{
> +	return __of_device_check_status(device, NULL);
> +}
> +
>  /**
>   *  of_device_is_available - check if a device is available for use
>   *
> @@ -628,6 +648,26 @@ bool of_device_is_available(const struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_device_is_available);
>  
> +/**
> + * of_device_is_reserved - check if a device is marked as reserved
> + *
> + * @device: Node to check for reservation
> + *
> + * Return: True if the status property is set to "reserved", false otherwise
> + */
> +bool of_device_is_reserved(const struct device_node *device)
> +{
> +	unsigned long flags;
> +	bool res;
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	res = __of_device_check_status(device, "reserved");
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);

Why is this a "raw" spinlock?

Where is this status coming from?

> +
> +	return res;
> +}
> +EXPORT_SYMBOL(of_device_is_reserved);

EXPORT_SYMBOL_GPL()?

thanks,

greg k-h
