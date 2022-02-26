Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A64C58BD
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 00:55:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K5k6822x3z30Ks
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 10:55:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YjpL3W8G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YjpL3W8G; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5k5j1bVpz30FM
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 10:54:47 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id j24so10456068oii.11
 for <openbmc@lists.ozlabs.org>; Sat, 26 Feb 2022 15:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=r6jKdM0HuBZeq4aVW6gFHo7REbACx5+xaWaSUSwuCIE=;
 b=YjpL3W8Gm2ES8UWk8biaFiX3NviQ9TP/VUQAELd79hKH40MKtJvObjSvqYQ4Gy7SMZ
 3p8nYpgEv/kl+Smrk1rOtOsperbt2/aRsIhLGF6CJsh0OlGywJHPnaq3hDD8clVI03/Z
 7XTrON/VDTjFLBy6pyf/XCkeEmH3TLrOcyCXZKetY13KT+06WP5UJ6xSq1at00bygFGr
 8OgVWDxSSkZXUpxQkS0ct75DXh2g4zZFk6LPNnGd86OOKenjPNnfzehQNQTaomGmdqMq
 2UVWsvA9DqR6KpQ4vxNykWoS4cU7DMuWvWBY1W7x4AwOL8YrKIXYfojZ1ZoGb26Rl5xv
 5Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=r6jKdM0HuBZeq4aVW6gFHo7REbACx5+xaWaSUSwuCIE=;
 b=dSRbQToOuoHenmWXeHJePPbSI/AvjxyGY0t6cYfAB62hX7MUhJwP/Q3C/5HznUODH9
 0UinlBogxcc3CBgDnpKUssqHX59UxkO7ff/bozCXsuq7NWOwMz4TucZ1wu5VTwxNt8Dn
 4P2H7F0pIrd3GsGIZD1PjUEg29VU/HG7B/VMeqUaXN4bfB+z1R0vYL32FJl8ZHVaLxL3
 eERnA1yM5IDifmBRQNjBToiEQPx/7j8gfyHJ5BgIStUxP0WdF4H1T/shb3v+omF0YEcm
 wd4MR7x3f7HmD2+NP6ZnM5sHx2tNT2kxu5/i5VXMIaR/Z9GGMsZDy/9NYd94f2mnynRx
 PiWA==
X-Gm-Message-State: AOAM531I5WpHeTsd6o0I7sF5JCZYcn4Y86m+K1j7g3g20PGwB0ppPcYG
 EG2jOf3+ndWE/k2vREU/Iro=
X-Google-Smtp-Source: ABdhPJxW32Wm9Kb2Ve6njs2WxIPAMc+9wvdedlSRWuJ0Z0ejOuL9+8Eb12Hp0VpDjaBHxirAI6yzHg==
X-Received: by 2002:a05:6808:ec3:b0:2d5:47c9:6661 with SMTP id
 q3-20020a0568080ec300b002d547c96661mr3969280oiv.28.1645919684834; 
 Sat, 26 Feb 2022 15:54:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s41-20020a05683043a900b005ad2328c137sm3147167otv.46.2022.02.26.15.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 15:54:44 -0800 (PST)
Message-ID: <bcb89a9c-62d0-15b8-b46a-d3181db9dbe7@roeck-us.net>
Date: Sat, 26 Feb 2022 15:54:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
In-Reply-To: <20220226133047.6226-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/26/22 05:30, Zev Weiss wrote:
> Hello,
> 
> This patch series augments the existing nct6775 driver with support
> for the hardware's i2c interface.
> 
> Thus far the nct6775 driver has only supported the LPC interface,
> which is the main interface by which the Super-I/O chip is typically
> connected to the host (x86) processor.
> 
> However, these chips also provide an i2c interface, which can provide
> a way for a BMC to also monitor sensor readings from them.  On some
> systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
> the only way for the BMC to monitor host CPU temperatures (e.g. to
> indirectly access a TSI interface); this functionality is thus an
> important component of enabling OpenBMC to support such systems.
> 
> In such an arrangement the Super-I/O chip is simultaneously controlled
> by two independent processors (the host and the BMC) which typically
> do not coordinate their accesses with each other.  In order to avoid
> conflicts between the two, the i2c driver avoids all writes to the
> device, since the BMC's needs with the hardware are merely that it be
> able to retrieve sensor readings.  This allows the host processor to
> remain ultimately in control of the chip and unaware of the BMC's use
> of it at all.
> 
> The sole exception to the "no writes" rule for the i2c driver is for
> the bank-select register -- while I haven't been able to find any
> explicit statement in the Nuvoton datasheets guaranteeing this, all
> experiments I've done have indicated that, as one might hope, the i2c
> interface has its own bank-select register independent of the one used
> by the LPC interface.
> 

That will a more detailed confirmation. Please explain in detail
the experiments you have done.

Other chips (specifically those served by the it87 driver) have the
same problem, and there it was never really solved. That resulted
in random crashes. I don't want to end up in the same situation.

> In terms of code structure, the approach taken in this series is to
> split the LPC-specific parts of the driver out into a separate module
> (called nct6775-platform), leaving the interface-independent parts in
> a generic driver (called nct6775-core).  The nct6775-i2c driver is
> then added as an additional consumer of the nct6775-core module's
> functionality.
> 

How about wmi ? Shouldn't that be separated as well ?

Guenter

> The first two patches make some relatively small infrastructural
> changes to the nct6775 driver; the bulk of the core/platform driver
> split is in the third patch.  The final two patches add DT bindings
> and the i2c driver itself.
> 
> I've tested the nct6775-platform and nct6775-i2c drivers with the
> NCT6779D in an ASRock ROMED8HM3 system (the latter driver on its
> AST2500 BMC); both seem to work as expected.  Broader testing would of
> course be welcome though, as is review feedback.
> 
