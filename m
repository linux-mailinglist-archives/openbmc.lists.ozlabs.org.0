Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6453B94AD
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 18:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GG3Z81wBTz3bW0
	for <lists+openbmc@lfdr.de>; Fri,  2 Jul 2021 02:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Do849kF3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Do849kF3; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GG3Yq5pf3z301s
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jul 2021 02:28:45 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id u13so12919106lfk.2
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jul 2021 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q43R0lr/+z1lJkpOJLZU9uT0yHMcWRVqAxi4bM9A93I=;
 b=Do849kF3J0w+HzaBD3qobG5GPRCNiao2COFeYJMeLuMrnjrIPIuQtLt5QWg4nrvYCX
 neli1iA/ed55mhuV6IRdwJ5k9zpeJTtsdQk3oBCUuTeXkSTfouV2rbxgibmpK+Vy6uE4
 YzHe5IdgaCPRfNN9k7GbWTcSyuZ3X3xRtA3J9/Sa4szAUxGQeSv2Wp+3k0VlumJBSR8+
 ZzTYqb55VM/8gg7V6m02TwzLLMSdwTWJmTieJpk1aB3jhzoQwqSBcRneXuKUHqA8iuam
 5K+1oTdR07FYHoy3CzfEcpc2vJciHczldEnJ7+JGxIDaZaOYvz5urbzSe4DgzQSc1WL5
 AS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q43R0lr/+z1lJkpOJLZU9uT0yHMcWRVqAxi4bM9A93I=;
 b=DrECx7D4KBVlw9E0qstEW923BcRBW5xFxn8xvMdYix8nnHNirJYwwyJaq25nE8W6Fw
 uLRQv6BHQzljSDXxAbJu8EEf8BEwWjU62zWgPoMuntL1uQxbW5uJpwnl7amaPbYd2NuC
 S6pSnFrrJmUc+xEbmvX2Rv8JcAkATvG0krMrLpFTW6n6TzfIwhKFzCTn/8QigMIAUrd2
 /tUnmccXuGhONMBuHAiV1HBxJDo80eaPpBU1Gkuf8YCPOBw5uz8Y9m7/vymx5kL5gx3b
 rL6f4oqx8qvQNhDJwpvi9jqk+wjxKI//Vzfc5J/uUP4RGL7NoXh/5iqqi6O9MTqKzaeb
 Cm7w==
X-Gm-Message-State: AOAM5320lIlSj1kNjf/oOAv/YKHCAe+zNl+7gMj08ihwr1KjCbDhl/+t
 Axz85ZGjyRLtdYUN6tTYdXiAK9DbygSD5L7vF1UyNA==
X-Google-Smtp-Source: ABdhPJyf4da9NxUx/SP+eeZU5G6AJhT91EOcT0Vu0qJfOjJvGcjdgwanl/wvWkQWoc1+6tkk2doH60OlvleIXLFRPqc=
X-Received: by 2002:ac2:551b:: with SMTP id j27mr337367lfk.459.1625156921296; 
 Thu, 01 Jul 2021 09:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <B6A810CD-9610-4AFE-8921-EF490734C17D@fb.com>
In-Reply-To: <B6A810CD-9610-4AFE-8921-EF490734C17D@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 1 Jul 2021 09:28:30 -0700
Message-ID: <CACWQX82x5OPNu8SSbP1dK5=3rNRo0tqJYN2eW61qDurTOFFkgA@mail.gmail.com>
Subject: Re: Bmcweb redfish multiple host support
To: Naveen Moses S <naveenmoses@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 1, 2021 at 9:10 AM Naveen Moses S <naveenmoses@fb.com> wrote:
>
> Hello All,
>
> I need your suggestion on implementing support for  multiple computer sys=
tems or hosts under redfish implementation of BMCWEB.
>
> Redfish schema supports multiple computer systems under  redfish path "/r=
edfish/v1/Systems/"
>
> Currently in bmcweb redfish core Computer systems path are is configured =
for as singlehost
>
> The redfish path computer system is given below
> "/redfish/v1/Systems/system=E2=80=9D
>
> In case of multiple hosts can we use the following format.
>
> "/redfish/v1/Systems/system1=E2=80=9D
> "/redfish/v1/Systems/system2=E2=80=9D
> "/redfish/v1/Systems/system3=E2=80=9D
> "/redfish/v1/Systems/system4=E2=80=9D
>
> these paths should be populated based on the number of available hosts/co=
mputer systems
>
> Possible options to identify the host count are as given below:
> 1.pass the OBMC_HOST_INSTANCES as a macro definition to bmcweb

Please don't do this.  In general we only use configure options for
things that cannot be dynamically discovered on dbus or via the
mapper, or where different implementations of things exist that meet
the same API (like log service).  I don't think multi-host falls into
either of those categories, as it can be seen on dbus.

> 2.Query dbus objects which has individual instance available for each hos=
t using object mapper.

This would far and above be my preference, as it's similar to how the
rest of the bmcweb URIs function.

>
> Is there any other alternate way available for identifying host instances=
 at runtime under bmcweb?
>
>
> if we use the above format then can we change the computer system for sin=
gle host
>
> as given below
>
> "/redfish/v1/Systems/system0=E2=80=9D

I would much prefer these are just based on the dbus path names
instead of trying to explicitly pick a name.  That keeps bmcweb
consistent with other resources, and systems that only implement a
single host can choose to keep the same odata.id (system) if they
want.

>
> Code reference : https://github.com/openbmc/bmcweb/blob/master/redfish-co=
re/lib/systems.hpp
>
> method : requestRoutesSystemsCollection
>
>
>
> Thanks

Looking forward to seeing the patches.  Thanks for looking into this.

-Ed
