Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C01691E3EEF
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 12:27:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X6Tq4bJrzDqQx
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 20:27:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BLeLlacP; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X6T40yytzDqQx
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 20:27:02 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id nu7so1384025pjb.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bkGGbT3Q294szEkeg1GFeUKswaRPBKq6dORkihyWwVU=;
 b=BLeLlacPlYwgJoMsqlcDS+WUNhdOnRkao6dsZIWYVXCn0NPS00rmyRSIzOJCAr9Ok4
 CcpUcMBvWhgiycMbAjym+JDKK9JO2OiqX4WpPgzZnIG7BC0dow4Rmdf9WCFh0XR74mXd
 UQrKs3tB+WV/xsoPYp66WHvM3ytfWhUA4Lvz3caxHQvvvQSiq4a0GExFwtu6VGfLv/+k
 fv8ZExDTGhNA11ZkTbuGVdS2TK1YP2zlH+g3zmjcV7QLMYrTUSxDYujfX5bfZ8DLA3A/
 lw16fFXGGwG+MPvujm6rC852kqQ9dsyMoQelUTLmrOFXsMHHqU2gWD5vYN+W5wqxlBIm
 e8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bkGGbT3Q294szEkeg1GFeUKswaRPBKq6dORkihyWwVU=;
 b=sYF+Dxqtalc2ZhpvaHroTmYWOwqqvUDKyRiZC5/m7CI2F/8A12a/SKUKRpSydD1Eke
 YskH4QCZKUkpEwVmGDo/jok/GutqG8/aiZ8T0XS9UaQYUUVh3MTpb3aN1NqfTMftE3I6
 7gG08z+StWc09eJITANas5M4o7ilDlEjfEsglDIHMonXmQ/4O4JFynaQyC0pigIDn5CJ
 Xog79KdAfbPMYq3WRWD/DuI8TTxP7jAxB8d60JZxL3QqtL0OubnvNvIas5gh6426vyQK
 ffThX8YQZCi2xcg86yuITT5cyYfdpQ47j+9xZl6V8kxbCMKhZ5W790JUTYKyxMFEat3C
 JGcA==
X-Gm-Message-State: AOAM53231Yf2DY9np5gjRl5lrolc4dIBaUFataFGsa+h0evievfFd/rP
 XVoU96Ye6+SdzHpwEbRewA6xaK8FiOX2cLPs9iM=
X-Google-Smtp-Source: ABdhPJwmn80lWQ6Gd8SQA1SZVwktBv0iU2TdLUs0ZRTK+VCzlbjHnuTwBSgiXML+MuCAAhW8KTBk5LRgGIE/Qjam5i4=
X-Received: by 2002:a17:902:59db:: with SMTP id
 d27mr5210546plj.48.1590575218440; 
 Wed, 27 May 2020 03:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAB_SOc5KK9D5TGiJZ=LFBF4Y8_dibp1iRZbvenyfscW+gkVEYA@mail.gmail.com>
 <c5460be4-cd62-e913-09a3-a72fb0b63812@linux.intel.com>
In-Reply-To: <c5460be4-cd62-e913-09a3-a72fb0b63812@linux.intel.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Wed, 27 May 2020 12:26:47 +0200
Message-ID: <CAB_SOc7sP2PTVsoRxxPT+PYFyqkiUj1gP8vWwPp706kgrS8P8A@mail.gmail.com>
Subject: Re: power capping values on dbus
To: =?UTF-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

wt., 26 maj 2020 o 15:01 Adrian Ambro=C5=BCewicz
<adrian.ambrozewicz@linux.intel.com> napisa=C5=82(a):
>
> I don't think it's clear from your message what you are trying to achieve=
:
> a) ability to expose power capping information as dbus-sensor just as
> read-only information
> b) ability to set the cap through D-Bus interface
>
> I suspect it's the former (just exposing data). If that's so I don't
> think you need any new interface at all. You could just add a 'Cap'
> sensor, eg Cpu0PowerCap and all the values fits nicely.

Yes, that is exactly what I want to achieve :)
Your solution sound very good, it will allow me to expose power
capping information
without any modifications to dbus-interfaces at all.
I will soon push some implementation to review under dbus-sensor.
Thanks.

>
> For latter, there already exist interface for configuring power capping
> (https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Control/Power/Cap.interface.yaml),
> however it doesn't specify properties for Min and Max values.
>
> Regards,
> Adrian
>
> W dniu 5/26/2020 o 14:46, Zbyszek pisze:
> > Hi everyone!
> >
> > I would like to expose on dbus values like min and max power capping.
> > These values could be read from files provided by hwmon like:
> >     power[1-*]_cap_max,
> >     power[1-*]_cap_min
> > which are describe here:
> > https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
> >
> > I have noticed that this interface:
> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Sensor/Value.interface.yaml
> > is already exposing something like MinValue and MaxValue,
> > but current implementation in dbus-sensors always sets these
> > attributes to some const values.
> > My understanding of the power capping values is that they could be used=
 as these
> > MinValue and MaxValue if hwmon provides them otherwise some default
> > should be used as it is now.
> >
> >
> > My questions:
> > 1. Should I create a new interface for the capping readings?
> > 2. Or should I extend the existing Value.interface.yaml with new
> > attributes like MinCapValue, MaxCapValue?
> > 3  Or the correct approach would be to read the cap values if provided
> > and expose them under already existing MinValue, MaxValue?
> >
> >
> > Regards,
> > Zbigniew.
> >
