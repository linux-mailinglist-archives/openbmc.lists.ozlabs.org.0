Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6C4FC761
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 00:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcjht5wX2z3bZN
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 08:10:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JhsieTFZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JhsieTFZ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcjhS4QtSz2x9X
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 08:10:00 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0A0D4180;
 Mon, 11 Apr 2022 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1649714997;
 bh=+BbLsGW2nbD0+iWxTnwzW8eOCpk29Z2Cld9MohScjRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhsieTFZmbRYLvmOF7JRiZjYSCJ63XCo6T5HrMJUC8hIwXhLE3QKL7zCD9oimNhWx
 +UNgQzE6L6tuQYcmH+SLNq7EAtqzO6BUNMu0h5KIoKA/kWwYOSK1+5QSHtr/W4ePcu
 YdXNwjGZDGEpYolYAcCpr/zKm1sIMajKbt3vcFB8=
Date: Mon, 11 Apr 2022 15:09:53 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YlSnMVVE63xqGSGa@hatter.bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
 <YicAzSara5Sr3LQ7@kroah.com>
 <YicSj3ZuetRkYxH1@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YicSj3ZuetRkYxH1@hatter.bewilderbeest.net>
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

On Tue, Mar 08, 2022 at 12:23:44AM PST, Zev Weiss wrote:
>On Mon, Mar 07, 2022 at 11:07:57PM PST, Greg Kroah-Hartman wrote:
>
>>>+EFUSE_ERROR_ATTR(under_voltage, REGULATOR_ERROR_UNDER_VOLTAGE);
>>>+EFUSE_ERROR_ATTR(over_current, REGULATOR_ERROR_OVER_CURRENT);
>>>+EFUSE_ERROR_ATTR(regulation_out, REGULATOR_ERROR_REGULATION_OUT);
>>>+EFUSE_ERROR_ATTR(fail, REGULATOR_ERROR_FAIL);
>>>+EFUSE_ERROR_ATTR(over_temp, REGULATOR_ERROR_OVER_TEMP);
>>>+EFUSE_ERROR_ATTR(under_voltage_warn, REGULATOR_ERROR_UNDER_VOLTAGE_WARN);
>>>+EFUSE_ERROR_ATTR(over_current_warn, REGULATOR_ERROR_OVER_CURRENT_WARN);
>>>+EFUSE_ERROR_ATTR(over_voltage_warn, REGULATOR_ERROR_OVER_VOLTAGE_WARN);
>>>+EFUSE_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
>>>+
>>>+static struct attribute *efuse_attrs[] = {
>>>+	&dev_attr_operstate.attr,
>>>+	&dev_attr_under_voltage.attr,
>>>+	&dev_attr_over_current.attr,
>>>+	&dev_attr_regulation_out.attr,
>>>+	&dev_attr_fail.attr,
>>>+	&dev_attr_over_temp.attr,
>>>+	&dev_attr_under_voltage_warn.attr,
>>>+	&dev_attr_over_current_warn.attr,
>>>+	&dev_attr_over_voltage_warn.attr,
>>>+	&dev_attr_over_temp_warn.attr,
>>>+	NULL,
>>>+};
>>>+ATTRIBUTE_GROUPS(efuse);
>>
>>Shouldn't these all just be what all regulator drivers report?  Or power
>>drivers?  I find it odd that this would be the first driver that would
>>need to export these types of attributes.  Surely there's already a
>>class for this?
>>
>
>The attributes available from the underlying regulator device don't 
>include the error flags, and while they do include its state 
>('operstate' here), it's a read-only attribute, and from previous 
>discussions with Mark I gathered that was unlikely to change (whereas 
>it being read-write is a critical part of this driver's 
>functionality).
>
>Given his input on the first stab at this I took a while back, I've 
>been hoping to hear from Mark as to whether this looked more like 
>something he'd find palatable; perhaps he could chime in on this too?  
>(And/or on the regulator API question in the cover letter.)
>

Ping...Mark (or Liam?), any thoughts on an appropriate path forward on 
this?


Thanks,
Zev

