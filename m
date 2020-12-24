Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD122E2388
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 02:53:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Y541S2PzDqMd
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 12:53:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AqRvTyhV; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1Y4L0wNMzDqLp
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 12:52:46 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id x23so195008oop.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2020 17:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MoRtYi54eDCQwrfsVqkFKN0coZtFS+bELcbhG8hW3Ao=;
 b=AqRvTyhVSA+y8kuIAR/zwvdebGJe0MDYzNz6+wgeuaU/shMffGQ3HDnJS37adLp4Ld
 +N8gU9N2gW69nwOnDjMOYM4M9UwoCuKcTfDnXdloKRvf9hTXVa68CcJy+rVjo6KH0b3h
 S8fL2yR4n6pdOcwbtLkxJkjmHz8BReUec255p3y2mL5483CsU5JpM51MBNSJDCDlSb3d
 iaJjU1LwZ1QyFtmISTMYbHi+BLTyRE8akAHvpKgWI7zIGbEVC+tqFatbAoAueWQAe8PH
 K131WjAVekRZaLSx+WtwsGkohz7E71RTP8CxegCt3IbpIJPVKztLCfRybFpmuktxnL7R
 y8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MoRtYi54eDCQwrfsVqkFKN0coZtFS+bELcbhG8hW3Ao=;
 b=XOBUCVi9+AcgLOsSuQl2ATb1tkHeeQJFWVwaDcL7vVRzVm5QEGeJuGc63pLzkAW4qL
 XIFkOh1bqaRrpLZ9nOb8Pqay2KV0GtjZrPzFNCengD6YX/ZxD7r2nPK9QppgFdX4EDD8
 wP8dzMd2/JeuetX3AMiDW5Ko1SXzTU2H4YEUvkfMV3kKi3+B+IoSRY3zpprfKtj7LvAJ
 K1Augd+xYgW0CFEl0cucLrVAsdaaB3Jc4kpAsccop/QOvw4XnA1HX6RZnH6WAZoFtvuY
 UKx50YtYQkuu7Kqg6K2rgpe5PsqpQszbwQ+imyzw+xVYffnBzR9lXwUinDMwx5m9VD3s
 jGxQ==
X-Gm-Message-State: AOAM530eVzEN7Ppu41/LbXqScc8qFTayibV/Qi48Tw+drS+QdVyDllrz
 yqklcE/WbEo3hhnagRd39eyOFGolUy0JFHKZHTjSfxAAAIg=
X-Google-Smtp-Source: ABdhPJxYz553M+hOHe/6VZW4PkhfS6kUxUHtXO/leuyl01myVmxw3Ob1DZJH+MH0W8O0M4p5cqWk2BNBxZKThzhIArc=
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr20242372ooy.64.1608774760176; 
 Wed, 23 Dec 2020 17:52:40 -0800 (PST)
MIME-Version: 1.0
References: <44f90a87-391d-214e-0801-62e9429b3c34@amperemail.onmicrosoft.com>
 <933d55f5-5cd5-9b41-e0e1-50c0ee43b67c@amperemail.onmicrosoft.com>
In-Reply-To: <933d55f5-5cd5-9b41-e0e1-50c0ee43b67c@amperemail.onmicrosoft.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 24 Dec 2020 09:52:29 +0800
Message-ID: <CAGm54UEr=jX1jHFYG37BthZ0YoVeqcAtk3NrrFXf=ki7Vfzm5A@mail.gmail.com>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
 Nonfunctional.
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
<thu@amperemail.onmicrosoft.com> wrote:
>
> On 12/16/20 14:33, Thu Nguyen wrote:
> > Hi All,
> >
> >
> > I'm working with Fan sensors on Ampere MtJade platform.
> >
> > In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
> > FAN4_1, FAN4_2, FAN5_1...
> >
> > I added the configuration for those fans in phosphor-hwmon and I also
> > added option "--enable-update-functional-on-fail" in phosphor-hwmon
> > build flag. I'm trying to set fan functional to false when unplug fan.
> >
> > Flash new image to the board, read functional of fans. The time to
> > read dbus property is about 0.05->0.1 seconds:
> >
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m0.078s
> > user    0m0.002s
> > sys    0m0.032s
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> >
> > real    0m0.044s
> > user    0m0.001s
> > sys    0m0.034s
> >
> > After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
> > is set to false as expected. And functional of others fans keeps
> > true. But the time to get dbus properties of all fans have a huge
> > increasement event in the working fans.
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b false
> >
> > real    0m1.189s
> > user    0m0.001s
> > sys    0m0.036s
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m3.285s
> > user    0m0.010s
> > sys    0m0.028s
> >
> > The "ipmitool sdr type 0x4" commands is also failed because this
> > increasement.
> >
> > ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
> > type 0x4
> > FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
> > FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
> > FAN4_1           | 2Bh | ns  | 29.19 | No Reading
> > FAN4_2           | 2Eh | ns  | 29.22 | No Reading
> > FAN5_1           | 31h | ns  | 29.25 | No Reading
> > FAN5_2           | 34h | ns  | 29.28 | No Reading
> > FAN6_1           | 37h | ns  | 29.31 | No Reading
> > FAN6_2           | 3Ah | ns  | 29.34 | No Reading
> > FAN7_1           | 3Dh | ns  | 29.37 | No Reading
> > FAN7_2           | 40h | ns  | 29.40 | No Reading
> > FAN8_1           | 43h | ns  | 29.43 | No Reading
> > FAN8_2           | 46h | ns  | 29.46 | No Reading
> > PSU0_fan1        | F5h | ns  | 29.60 | No Reading
> > PSU1_fan1        | F6h | ns  | 29.61 | No Reading
> >
> > real    2m43.704s
> > user    0m0.046s
> > sys    0m0.057s
> >
> > The cause of this increasement is when it failed to read one sensor
> > phosphor-hwmon keep trying to read the sensors with the retry is 10
> > and the 100ms delays between retry times.
> >
> > Should we reduce the retry for non-functional sensors?

When a fan is unplugged, its "Present" property should be false as well.
Maybe you could check that property and skip such fans?

> >
> >
> > Regards.
> >
> > Thu Nguyen
> Hi All,
>
> Any feed back on this?
>
> Thu Nguyen,
>


-- 
BRs,
Lei YU
