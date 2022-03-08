Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D14D10B7
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 08:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCRHr35s7z3bVK
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jbWkLbJN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=jbWkLbJN; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCRHR6YHnz2xDD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 18:08:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E13661607;
 Tue,  8 Mar 2022 07:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD64EC340EB;
 Tue,  8 Mar 2022 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646723281;
 bh=806RbM3GSl0lCzZ1Vh8RXqDEQY0njqRzw1M3TDJbdJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jbWkLbJN5YaU+/wzIwi1t8uEr+9F0Ep/q+qp10uSiees/swR2uXzT1RVnhI5Q00Ud
 H0ay5vpHFYZ8ixwlmVo32nvmbRPMZnECjiyXkS2m6Jn50/q8XPhkJX+IwjR6xqiltU
 eHImxUp4yKsOHqFZ0CxpUhz2pii0e5HVGcm37hEQ=
Date: Tue, 8 Mar 2022 08:07:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YicAzSara5Sr3LQ7@kroah.com>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308011811.10353-3-zev@bewilderbeest.net>
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

On Mon, Mar 07, 2022 at 05:18:10PM -0800, Zev Weiss wrote:
> +static DEVICE_ATTR(operstate, 0644, efuse_show_operstate, efuse_set_operstate);

DEVICE_ATTR_RW()?

> +
> +#define EFUSE_ERROR_ATTR(name, bit)							    \
> +	static ssize_t efuse_show_##name(struct device *dev, struct device_attribute *attr, \
> +					 char *buf)                                         \
> +	{                                                                                   \
> +		struct efuse *efuse = dev_get_drvdata(dev);                                 \
> +		int status = efuse_update_error_flags(efuse);                               \
> +		if (status)                                                                 \
> +			return status;                                                      \
> +		return sysfs_emit(buf, "%d\n", !!(efuse->error_flags.cache & bit));         \
> +	}                                                                                   \
> +	static DEVICE_ATTR(name, 0444, efuse_show_##name, NULL)

DEVICE_ATTR_RO()?

> +EFUSE_ERROR_ATTR(under_voltage, REGULATOR_ERROR_UNDER_VOLTAGE);
> +EFUSE_ERROR_ATTR(over_current, REGULATOR_ERROR_OVER_CURRENT);
> +EFUSE_ERROR_ATTR(regulation_out, REGULATOR_ERROR_REGULATION_OUT);
> +EFUSE_ERROR_ATTR(fail, REGULATOR_ERROR_FAIL);
> +EFUSE_ERROR_ATTR(over_temp, REGULATOR_ERROR_OVER_TEMP);
> +EFUSE_ERROR_ATTR(under_voltage_warn, REGULATOR_ERROR_UNDER_VOLTAGE_WARN);
> +EFUSE_ERROR_ATTR(over_current_warn, REGULATOR_ERROR_OVER_CURRENT_WARN);
> +EFUSE_ERROR_ATTR(over_voltage_warn, REGULATOR_ERROR_OVER_VOLTAGE_WARN);
> +EFUSE_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
> +
> +static struct attribute *efuse_attrs[] = {
> +	&dev_attr_operstate.attr,
> +	&dev_attr_under_voltage.attr,
> +	&dev_attr_over_current.attr,
> +	&dev_attr_regulation_out.attr,
> +	&dev_attr_fail.attr,
> +	&dev_attr_over_temp.attr,
> +	&dev_attr_under_voltage_warn.attr,
> +	&dev_attr_over_current_warn.attr,
> +	&dev_attr_over_voltage_warn.attr,
> +	&dev_attr_over_temp_warn.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(efuse);

Shouldn't these all just be what all regulator drivers report?  Or power
drivers?  I find it odd that this would be the first driver that would
need to export these types of attributes.  Surely there's already a
class for this?

thanks,

greg k-h
