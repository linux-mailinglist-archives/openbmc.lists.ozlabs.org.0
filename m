Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933C461CE0
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 18:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2t0s2Ft5z2yfZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 04:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sGxpNL6O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=sGxpNL6O; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2t0R2YVjz2yPN
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 04:40:05 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so17544057wme.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KjKETdSwrD2VD54+Qg1IN5fBtkWIwEkc86ShNPDKr4E=;
 b=sGxpNL6OsTgBhx/XPHvTAEJM+TQyvip0lhKIyEzlgIXx5IdlK9vBEROOPpJdFF8/Ym
 j49Hb3twp1dJtL/dIjGc+zp0qkCp8dvSQPQN0SWh3KZ67vdD1S2C8ieiYBuzWJ4hVplA
 11DDvJw+2tIpHX9xhWYiK/oQIVJbTens2s/kD0HxjHGZVWiJ+6nnTmRH0kCgdr61D/JA
 gmC/ClhapQJ5HoyHfQi53IAuhN0760U/CZgZIs/b4thVZGC/r4T6PKpj8N4MlCDftYPw
 aCH139uY2cr7KbyfdvXX6ntEHvS9xMCNiyd5zW1JB8R2NQiHdUI8z+unLNILhetYRFAO
 0T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KjKETdSwrD2VD54+Qg1IN5fBtkWIwEkc86ShNPDKr4E=;
 b=oKkR9b6gegmTgnyryQ758gXB4WmhYUznU7idlSZ+EclWHD2srNhtgKRE3Poc5LZa/S
 C/HLf18C1kSV9kRsuR/OSxESOp90eAgJ1F8NKIDA0t6G8Z2kqWxO1uArvWeJm9JQ7eqA
 JnpFxJBZrxxoZ7ZY0gHAPUMW+T2Hw9cEDnXXkR4tpojyzsvcrOog+B4A/+HAvqJ19EhA
 VRoe3yg6zG1UwK7p9MW71v4I4WbCgRbGU1ZAWAZ81LYdMQfOxJ8WxV02lPmKIJ5AbWt1
 rw4522gJuxxyySy1dfN012T96d99r/nY2HHf3cHCDesESXkQCgonalXSitj2+xjHHxh1
 vgEQ==
X-Gm-Message-State: AOAM532dzIlfcxcezz8297lVp8w+eLcKewNJXyRiBk4BJ50FsP2fXFJU
 pMviUQU3/eXrKFH4ArCz9RLWjZrG6t1hv2gPDHu0qF3Qye6/WFsf
X-Google-Smtp-Source: ABdhPJz6+ZKy3k0AmMwLwh3IX781UsDJmxtAPqDCegKsrNjtTEJrPvw+FmWlHplQCGOVkyqN03nig15SULK72v6KdLU=
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr38626370wmq.117.1638207600813; 
 Mon, 29 Nov 2021 09:40:00 -0800 (PST)
MIME-Version: 1.0
References: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
 <CAH2-KxDNqXZ3uWeeUyP=uE=e6FAvzYKZYJoJLaeG0wGZzXBwzw@mail.gmail.com>
 <CAA7Tbcuy-FE19ygYOivGxoSRZAoPu+r-B1uoSXNJ=R7CYXhh3A@mail.gmail.com>
In-Reply-To: <CAA7Tbcuy-FE19ygYOivGxoSRZAoPu+r-B1uoSXNJ=R7CYXhh3A@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 29 Nov 2021 09:39:49 -0800
Message-ID: <CAH2-KxD5G-+7F8d9xpCtE-ajdKyMiAUWy0zXvfk3=a+TFtrztw@mail.gmail.com>
Subject: Re: FRU Device type one byte or Two byte Validation
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Nov 25, 2021 at 1:06 AM Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Hi Ed,
>
>     Please find my response below.
>     Please search this mail thread "EEPROM Validation issue in Fru Device " for more information.
>
> Thanks,
> Kumar.
>
>
> On Thu, Nov 25, 2021 at 2:10 AM Ed Tanous <edtanous@google.com> wrote:
>>
>> On Wed, Nov 24, 2021 at 1:17 AM Kumar Thangavel
>> <kumarthangavel.hcl@gmail.com> wrote:
>> >
>> > Hi All,
>> >
>> >        We would like to validate our NIC FRU device type as 8 bit (one byte) or 16 bit(two byte).
>> >
>> >        This device type validation for our FRU is platform specific logic.
>>
>> Please include more details about what this logic is.  In the
>> entity-manager design, anything that's truly platform specific needs
>> to go into the entity-manager configuration, as all other components
>> are common.
>>
> The existing logic to get the device type is 8bit or 16bit is not working exactly for our platform.
> Also, writing some bytes and getting device type in eeprom is not safe and not suggested.
> So, we implemented the platform specific logic to get the eeprom device type in the machine layer.
>
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430
>>
>> >  This was implemented in the machine layer.
>>
>> Can you point to it?
>>
> The logic is, get the NIC card vendor info from ncsi-netlink command and based on NIC vendor,
> set the eeprom device type as 8bit or 16 bit.
>
> We wanted to interlink this logic in entity-manager.

If the NIC card can be identified over NCSI, you would create an
application that makes the card model information available on dbus,
rewrite your Probe statement to match on the NCSI property, then put
something like "Size" in the FRU exposes record, which FruDevice could
then pick up from dbus and use to parse the FRU properly.


>
>> >
>> >        We wanted to interlink this logic with entity-manager code to get the device type.
>> >
>> >        Could you please provide the suggestions on get the device type in entity-manager.
>>
>> Entity-manager provides the exposes records on dbus, for which
>> reactors can pick them up and use them.
>
>
> Is there any way to get the dynamic values (device type - 8bit/16bit ) from the machine layer
> to the entity-manager ?

EM config files.

>>
>>
>> >
>> >        Please refer below link for existing devicebit validation in entity-manager.
>> >        https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430
>>
>> I'm not quite following what this has to do with your above, given
>> that this isn't intended to be platform specific.
>>
>
> This existing logic to get the device type 8/16 bit may not work for all the devices.
> We need to find common logic for all the devices without any breakage. But it is very tricky.
>
> Alternatively, platform specific logic can be an option and interlink with EM at run time.
> We are trying this and requesting suggestions from MAINTAINERS.

As a general rule, anything that's truly platform specific (ie, would
cause conflicts if run on other systems) should be specified in the EM
config files.  That's what they're there for.

>
>> >
>> > Thanks,
>> > Kumar.
