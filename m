Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7B34E585
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 12:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8m650tWyz30Gk
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 21:34:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oa6CXcZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oa6CXcZ9; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8m5q6KjXz302T
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 21:34:23 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id w70so16079624oie.0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I2t0XJ2lc0H9u915HEvnhQtWR0pGaixnG20LdM71wb0=;
 b=oa6CXcZ9XauhK7h6wBzxnv1o1GqbxgTFKQ/89wm8MJF98Casyt3cwuyN9/TdGomJXM
 x+ovYbMvGZFVyA1PJOsJp1asBGjz1152Zf3DDj4e/xTAJIiQu3pMqiIBgDCuOH9jB677
 jWOWbQJfzJoFg1Rx6ctumR2nrid9o1Dy0AxoI/ONbpbns3OZZgbLHbnHoGpt8PejMbxh
 Z52d73lPizXmCOgFuyP8JumptCdYQjP3ggBMzkJr23mqqhkIM+1FLx6UcWtYy4N88uGv
 50V2Fu8Q9dThoAwsjZmKPJNaz6oOQWdPU7uqLklmqs3BrZJqDdivCY/BjknRZESe1wtE
 eZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I2t0XJ2lc0H9u915HEvnhQtWR0pGaixnG20LdM71wb0=;
 b=aF7itWTGRUT1f41g4dSAm55YMpzuwJJLs/RpmH0OEAxlDY5vozRbKk4e9+ZpCOG+GG
 wbSPn1AnDOO59Fn3+BXpscmP+9v+E2GntwrcuN0ivV3U/HptxPaUm/dAW43DjgiYHCo8
 YMOF10G0u4epDub0tCOpGzhiV4Qo01qyJmBxdri6dfQoZCwRzkeQAXZsTitC+be/iHKQ
 Yycf8dI5Q4OBoELkAF1wHOYJYN6LlfnMyfbFGJSEX7FVD6t+qQAROkMbdBXLziA7V3K2
 vzJUe8sCgdGE/VPWWQypM0lCPVpEOp+kODQ77VPXR9e89Js1uvewQMy8NqCu+sP6WRhq
 i+TA==
X-Gm-Message-State: AOAM5334Gp/vH3plRLvWE17fb1ikuviZZvAdtUyXO2ZwMs6nD3mJn+TC
 JNcPqaH7kd4tg9rF8yXuc8O1lSSOvJE=
X-Google-Smtp-Source: ABdhPJw0B9mU/6W/9fwKE2UmUOzPCX+4Iobr/yfDqBLmU+jBh0U6njx3tbTnqSMxGHCKQk88EDbQhg==
X-Received: by 2002:a05:6808:907:: with SMTP id
 w7mr2656064oih.148.1617100459154; 
 Tue, 30 Mar 2021 03:34:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d24sm4925782otf.12.2021.03.30.03.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:34:18 -0700 (PDT)
Subject: Re: Enabling pmbus power control
To: Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
Date: Tue, 30 Mar 2021 03:34:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/30/21 1:17 AM, Zev Weiss wrote:
> 
> Hello,
> 
> I'm working on a board that has a handful of LM25066 PMICs controlling
> the power supply to various devices, and I'd like to have both the
> existing hwmon sensor functionality as well as userspace power on/off
> control, which does not currently seem to be available (other than via
> 'i2cset -f', which I'd of course prefer to avoid).  I've drafted up a
> couple possible versions of this, and was hoping to get some opinions
> on the appropriate overall approach.
> 
> One option is to add a read-write sysfs attribute to the existing
> hwmon directory (current incarnation of the patch:
> https://thorn.bewilderbeest.net/~zev/patches/pmbus-statectl.patch).
> This bears a vague resemblance to a patch that was rejected a couple
> years ago
> (https://lore.kernel.org/linux-hwmon/20190417161817.GA13109@roeck-us.net/),
> but is different enough that I wonder if it might potentially be
> tolerable?  (It exposes significantly less, for one thing.)
> 

This is a no-go. We are not going to replicate regulator functionality
in the hwmon subsystem, no matter by what means.

> The other approach involves layering a regulator device over the pmbus
> device as is done in the LTC2978 driver, and then putting a
> reg-userspace-consumer on top of that (current patch:
> https://thorn.bewilderbeest.net/~zev/patches/pmbus-ureg.patch).  My

This is the way to go, but the regulator descriptor (what is currently
CONFIG_PMBUS_USERSPACE_REGULATOR_CONSUMER) should be in the lm25066
driver. I don't want to pollute the pmbus core with that at this point
(and I don't know if the userspace consumer code is appropriate - you
might want to check with the regulator maintainer on that).

> first attempt at this ran into problems with all the
> reg-userspace-consumer instances getting attached to the first
> regulator device, I think due to all of the regulators ending up under
> the same name in the global namespace of regulator_map_list.  I worked
> around that by adding an ID counter to produce a unique name for each,
> though that changes device names in userspace-visible ways that I'm
> not sure would be considered OK for backwards compatibility.  (I'm not
> familiar enough with the regulator code to know if there's a better
> way of fixing that problem.)  The #if-ing to keep it behind a Kconfig

Maybe ask that question on the regulator mailing list.

Guenter

> option is also kind of ugly as it stands.
> 
> The first version seems simpler to me (and avoids the rather more
> cumbersome sysfs paths the second one produces, for what that's
> worth).  I think the second is (at least structurally) perhaps more
> aligned with what Guenter was saying in the previous discussion linked
> above, though.  Does anyone have any advice on the best way to proceed
> with this?  If the reg-userspace-consumer approach is the preferred
> route, suggestions on a better fix for the name collision problem
> would be welcome.
> 
> 
> Thanks,
> Zev
> 

