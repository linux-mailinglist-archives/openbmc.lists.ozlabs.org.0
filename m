Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD523F011
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 17:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNTxc2XQZzDqrM
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 01:37:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iPwAzX7t; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNTw66hqMzDqQL
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 01:35:50 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id h7so2071908qkk.7
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+O9HIA4XYgFHXtgk7fdlaSL7I4QLnS9HfRUgbi4/UEw=;
 b=iPwAzX7tQh7GZ9NA1zvzXC6A0ReTp2qZZFGbtrpRTJisTNg+BUanIjKT2SbS4A8OEi
 ihHlNNkub7t+yAtoznkdiWe1J5GVplR7xiX2R833QJk8yNTS3w5y57/sCuGEBI2suWun
 WOxU2u0jWXAlsE9YP51YVGIpM2tyjOW/TjPPgKu+iemT7stz+ALDikax/04WEGg2c3Du
 Z+F+0ggxV5sGOp7mSwmidHabYeqRfeBzcUNVTArBF3S8Ar7czzr5r2BncdXoMmOlTkO6
 mEWarM+TrTBIrgJxtzKjvPITazxOmiPFbnYYFmajwQY3ME/zlLfPySvgE6hEZ8kfHqu3
 JM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+O9HIA4XYgFHXtgk7fdlaSL7I4QLnS9HfRUgbi4/UEw=;
 b=hIbyuhnmuw3HaZYo6VgBIBzlAF2X7FZzWfMNnsMqU1CDZ58CefpL+FHQNKy8ohgFwS
 2slo2Q4Q8zblQBtL+XgUY5rTSho3emJOR7QVBUCvhz5Io0pPVvq+PNHeo4oZVS/tWLBz
 fxITD73XqxxYzYFG8uQwmqdBQKeb2DT/MJbqfbWgG6pE3sFuDBEs8i5536znsTi2XOeu
 TOX/SiE+mCIGJ+9KwrzPHnvOoS8H0jlizmN2ljqDUhpWrYeeXjX/r2sceOJ7pAXIE7+q
 LpiX/ogBtF96/79ihHCwNb8foQzwirFuzq5m6+oZFJV/L7Ike+tt3F1RMzFzmoPc9f+h
 SNXg==
X-Gm-Message-State: AOAM531He/Wxm4S4Uzpcb8g9ptH7k03jpuNHzJQG1uCa+HBDw9IcgS1o
 UiRvJV3F4dVFCpgBwTRba8EEi98bMphzwVypO+8uFg==
X-Google-Smtp-Source: ABdhPJy4AP6GS3vcTFDqxU6d+Qm6u16xQSNvJazWfl4DNs3X/PFCEUXIXpDJjfnirk9lcwUEKNPRzMBxMbUjmQL9RMo=
X-Received: by 2002:a37:64d7:: with SMTP id
 y206mr13732226qkb.133.1596814546445; 
 Fri, 07 Aug 2020 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <E27B8EFBB1796B4A8CF2A20BF59146F901AB3E@atlms1.us.megatrends.com>
 <CAO=notyMGd9XNFP99DBq+BC9G91h41omzDhw_oQYiyHnwkt8KA@mail.gmail.com>
 <E27B8EFBB1796B4A8CF2A20BF59146F901ADF4@atlms1.us.megatrends.com>
In-Reply-To: <E27B8EFBB1796B4A8CF2A20BF59146F901ADF4@atlms1.us.megatrends.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 7 Aug 2020 08:35:35 -0700
Message-ID: <CAO=notyfmoRgzBvOUOUP3skeV1m7oJbDBO_F4T1B6hGZ-hV6MA@mail.gmail.com>
Subject: Re: Query regarding the host LPC address in phosphor-ipmi-flash
To: Connie Yin <ConnieY@ami.com>, Benjamin Fair <benjaminfair@google.com>, 
 Brandon Kim <brandonkim@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 11:11 AM Connie Yin <ConnieY@ami.com> wrote:
>
> Hi, Patrick,
>
> Thanks a lot for the replay.
>
> I got an e820 map of this x86 system (with aspeed ast2500) as follows, an=
d chose the host-lpc address as 0xfe410000 (Unused) alongwith --length 0x10=
000
>
> +------------------------------------------------------------------------=
-+
>   | Size        | Start       | End         | Usage                      =
   |
>   | 16 MB       | 0xFD000000  | 0xFDFFFFFF  | SBREG                      =
   |
>   | 64 KB       | 0xFE000000  | 0xFE00FFFF  | PMC MBAR                   =
   |
>   | 4 KB        | 0xFE010000  | 0xFE010FFF  | SPI BAR0                   =
   |
>   | 88 KB       | 0xFE020000  | 0xFE035FFF  | SerialIo BAR in ACPI mode  =
   |
>   | 24 KB       | 0xFE036000  | 0xFE03BFFF  | Unused                     =
   |
>   | 4 KB        | 0xFE03C000  | 0xFE03CFFF  | Thermal Device in ACPI mode=
   |
>   | 524 KB      | 0xFE03D000  | 0xFE0BFFFF  | Unused                     =
   |
>   | 256 KB      | 0xFE0C0000  | 0xFE0FFFFF  | TraceHub FW BAR            =
   |
>   | 1 MB        | 0xFE100000  | 0xFE1FFFFF  | TraceHub MTB BAR           =
   |
>   | 2 MB        | 0xFE200000  | 0xFE3FFFFF  | TraceHub SW BAR            =
   |
>   | 64 KB       | 0xFE400000  | 0xFE40FFFF  | CIO2 MMIO BAR in ACPI mode =
   |
>   | 2 MB - 64KB | 0xFE410000  | 0xFE5FFFFF  | Unused                     =
   |
>   | 2 MB        | 0xFE600000  | 0xFE7FFFFF  | Temp address               =
   |
>   +----------------------------------------------------------------------=
---+
>
> And configured in BMC with these lines:
>
> PACKAGECONFIG_append_xxx =3D " static-bmc"
> PACKAGECONFIG_append_xxx =3D " aspeed-lpc"
> PACKAGECONFIG_append_xxx =3D " reboot-update"
> IPMI_FLASH_BMC_ADDRESS_xxx =3D "0x83000000"

What's your device tree have for the lpc address?  It should be
configured in there as well, see
https://github.com/openbmc/linux/blob/dev-5.7/arch/arm/boot/dts/aspeed-bmc-=
opp-zaius.dts#L27
and:

&lpc_ctrl {
status =3D "okay";
memory-region =3D <&flash_memory>;
flash =3D <&spi1>;
};

If this is configured as well, then it should work, although try
0x1000 instead of 0x10000 - even though you've set aside 64KiB.  Just
as something to try.

>
>
> And ran this app on host:
>
> ./burn_my_bmc
>  --command update \
>  --interface ipmilpc \
>  --image image-bmc \
>  --sig image-bmc.sig \
>  --type image \
>  --address 0xfe41000 \
>  --length 0x10000
>
>
> Sending over the firmware image.
> sending writeMeta
> writemeta sent
> Progress: 100.00%
> Sending over the hash file.
> sending writeMeta
> writemeta sent
> Progress: 100.00%
> Opening the verification file
> Committing to /flash/verify to trigger service
> Calling stat on /flash/verify session to check status
> running
> success
> Returned success
> succeeded

So this means whatever validation service returned success.  What is
your validation service?  I ask because this will be useful to address
early - so that while you're getting the wrong bytes, you don't
accidentally update your bmc.

> Opening the update file
> Committing to /flash/update to trigger service
> Calling stat on /flash/update session to check status
> running
> Opening the cleanup blob
> Exception received: blob exception received: Received IPMI_CC: 255
>
>
>
>
> I was able to see there was a 32M size of image-bmc had been uploaded und=
er /run/initramfs, but by using hexdump -C, finding this uploaded file was =
not the correct image data as expected.

Interesting, so

>
> Do you have any suggestions?
>
>
> Thanks,
> Connie
>
>
>
>
>
>
>
>
>
> -----Original Message-----
> From: Patrick Venture [mailto:venture@google.com]
> Sent: Friday, July 31, 2020 3:57 PM
> To: Connie Yin
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Query regarding the host LPC address in phosphor-ipmi-flash
>
> On Fri, Jul 31, 2020 at 11:21 AM Connie Yin <ConnieY@ami.com> wrote:
> >
> > Hi, Team,
> >
> >
> >
> > I am checking this OpemBMC firmware update interface on an x86 system, =
and wondering how to construct this host LPC address at which the chunk is =
to be mapped.
> >
> > I saw once when test on some platform,  0xfedc1000 was used as host LPC=
 address.
> >
> >
> >
> > Would anyone please elaborate a little bit more?  To get this host LPC =
address,  should I add/modify some drivers in BMC? What about host side?
>
> The host-side address is a region set aside in the BIOS that gets
> reserved in the e820 map.  The BiOS dev adds it manually for this
> purpose.
>
> >
> >
> >
> >
> >
> > Thanks a lot.
> >
> > Connie
> >
> > P Please consider the environment before printing this email
> >
> > The information contained in this message may be confidential and propr=
ietary to American Megatrends (AMI). This communication is intended to be r=
ead only by the individual or entity to whom it is addressed or by their de=
signee. If the reader of this message is not the intended recipient, you ar=
e on notice that any distribution of this message, in any form, is strictly=
 prohibited. Please promptly notify the sender by reply e-mail or by teleph=
one at 770-246-8600, and then delete or destroy all copies of the transmiss=
ion.
>
> Please consider the environment before printing this email.
>
> The information contained in this message may be confidential and proprie=
tary to American Megatrends (AMI).  This communication is intended to be re=
ad only by the individual or entity to whom it is addressed or by their des=
ignee. If the reader of this message is not the intended recipient, you are=
 on notice that any distribution of this message, in any form, is strictly =
prohibited.  Please promptly notify the sender by reply e-mail or by teleph=
one at 770-246-8600, and then delete or destroy all copies of the transmiss=
ion.
