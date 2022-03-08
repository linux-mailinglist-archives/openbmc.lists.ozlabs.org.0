Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846C44D1224
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 09:24:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCSzC2Ckkz3bTQ
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 19:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=P7/5TLXw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=P7/5TLXw; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCSyn5T63z2yph
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 19:23:45 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 93415D5;
 Tue,  8 Mar 2022 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646727824;
 bh=nCIeA+pD7UIkhYfAGPyqv1fA/V0MCCLPp3PnFFH4JuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7/5TLXwWe+M9EPD48wklgkHZzEuUAzzU8pHSUXPUTwPljH/I2Jb+HIPgiAShEl/S
 QHok6BwBnjEb0t8XNWoG7Y8fTyrX5JdHvWFSrZ0CnJ9YYmC5DBkwg/Y4rKfRN/8VgN
 gGw9SE2mRFLF2JU6VlYa+IOMM3Wjs6weHhN2laI8=
Date: Tue, 8 Mar 2022 00:23:43 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YicSj3ZuetRkYxH1@hatter.bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
 <YicAzSara5Sr3LQ7@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YicAzSara5Sr3LQ7@kroah.com>
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

On Mon, Mar 07, 2022 at 11:07:57PM PST, Greg Kroah-Hartman wrote:
>On Mon, Mar 07, 2022 at 05:18:10PM -0800, Zev Weiss wrote:
>> +static DEVICE_ATTR(operstate, 0644, efuse_show_operstate, efuse_set_operstate);
>
>DEVICE_ATTR_RW()?
>

Ack.

>> +
>> +#define EFUSE_ERROR_ATTR(name, bit)							    \
>> +	static ssize_t efuse_show_##name(struct device *dev, struct device_attribute *attr, \
>> +					 char *buf)                                         \
>> +	{                                                                                   \
>> +		struct efuse *efuse = dev_get_drvdata(dev);                                 \
>> +		int status = efuse_update_error_flags(efuse);                               \
>> +		if (status)                                                                 \
>> +			return status;                                                      \
>> +		return sysfs_emit(buf, "%d\n", !!(efuse->error_flags.cache & bit));         \
>> +	}                                                                                   \
>> +	static DEVICE_ATTR(name, 0444, efuse_show_##name, NULL)
>
>DEVICE_ATTR_RO()?
>

Ack.

>> +EFUSE_ERROR_ATTR(under_voltage, REGULATOR_ERROR_UNDER_VOLTAGE);
>> +EFUSE_ERROR_ATTR(over_current, REGULATOR_ERROR_OVER_CURRENT);
>> +EFUSE_ERROR_ATTR(regulation_out, REGULATOR_ERROR_REGULATION_OUT);
>> +EFUSE_ERROR_ATTR(fail, REGULATOR_ERROR_FAIL);
>> +EFUSE_ERROR_ATTR(over_temp, REGULATOR_ERROR_OVER_TEMP);
>> +EFUSE_ERROR_ATTR(under_voltage_warn, REGULATOR_ERROR_UNDER_VOLTAGE_WARN);
>> +EFUSE_ERROR_ATTR(over_current_warn, REGULATOR_ERROR_OVER_CURRENT_WARN);
>> +EFUSE_ERROR_ATTR(over_voltage_warn, REGULATOR_ERROR_OVER_VOLTAGE_WARN);
>> +EFUSE_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
>> +
>> +static struct attribute *efuse_attrs[] = {
>> +	&dev_attr_operstate.attr,
>> +	&dev_attr_under_voltage.attr,
>> +	&dev_attr_over_current.attr,
>> +	&dev_attr_regulation_out.attr,
>> +	&dev_attr_fail.attr,
>> +	&dev_attr_over_temp.attr,
>> +	&dev_attr_under_voltage_warn.attr,
>> +	&dev_attr_over_current_warn.attr,
>> +	&dev_attr_over_voltage_warn.attr,
>> +	&dev_attr_over_temp_warn.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(efuse);
>
>Shouldn't these all just be what all regulator drivers report?  Or power
>drivers?  I find it odd that this would be the first driver that would
>need to export these types of attributes.  Surely there's already a
>class for this?
>

The attributes available from the underlying regulator device don't 
include the error flags, and while they do include its state 
('operstate' here), it's a read-only attribute, and from previous 
discussions with Mark I gathered that was unlikely to change (whereas it 
being read-write is a critical part of this driver's functionality).

Given his input on the first stab at this I took a while back, I've been 
hoping to hear from Mark as to whether this looked more like something 
he'd find palatable; perhaps he could chime in on this too?  (And/or on 
the regulator API question in the cover letter.)


Thanks,
Zev

