Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242E487331
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 07:52:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVYms6dx9z30NS
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 17:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qI5sapod;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qI5sapod; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVYmQ3QK2z2yZY
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 17:51:48 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id t23so7143411oiw.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jan 2022 22:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aKW6i7L/KiXcGe0mBryP3Lln0MiSYuWRZ+PY+FscunU=;
 b=qI5sapod05fC7J99VLmlrPGsk/ZNBX7CXb2a39XsGFxRIlxj77/eHiy1fKH7Jxc8xk
 Npf1YqfwJ8q9kOgQb1RFwhpAjZyaqBN3slVHCpdnS+xeydtrTV7FQvW/rA4SwtcJ4IAW
 cFWdmD4azLsh2UkKhg/i15o7LXpTRdvuKJcw1galEzoo/mJvkhT2Z9lwk4G0MISiHVfL
 r60BoLEeWrelsJKDKQ/ANAr/9a503vA9mJEfpYjL0utxO+LZSz/o2HnVLgmHN4ggkAQX
 1GiXGC/wxdMApUCmQaFcLT1L4ZDXZJOErBwKiwbs9sgTDrF+IQjNnySanT2tiCzSwvkd
 SH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aKW6i7L/KiXcGe0mBryP3Lln0MiSYuWRZ+PY+FscunU=;
 b=aGUdcy+tFWPigijdPYygcf15p1gisDnI4fdPidK7NeLi+noJEgaFyhtZMLtH46975D
 zktt9+4tO9652Exx8kfHZIazkHZBtvC/a/w/R6LmHwYOkbJLfHkk6/0+4uyRzaVz+tL2
 sQbXWfSg6xY+NR48VKZdzZzZBKkpDFTZbpegpjMT6CLYu1AuwifFDuyupIIvV5MqPJ00
 5Onm1V+UC8AeQiEFNBY2TwnDq0MwncmkhkXS+fM7KhA4SGtJyfCngxcOHtPK7boy1zHy
 sBmQOyAk3lTr4gsMGbnwjJixhED3d6CfjritpN7VthROemAvOooFuPUowFTjA586+hhJ
 Im7Q==
X-Gm-Message-State: AOAM532MUKqD4EVITg3Vf7vyMfaoa+jx34PKPbD212bI2PRU5VebX08c
 aG4y7qOs7cSrWRiNE1vsOfJRYeNbnuVn6dWNHC0=
X-Google-Smtp-Source: ABdhPJwMhqvpy7iqqVWvzoewt/p5k4fVCES9fk7pwXnaSoCLbrvo57KIKO6bFw/BPJQo44/H/R1jzbP9rbxvXe65l9I=
X-Received: by 2002:aca:ac0b:: with SMTP id v11mr8787034oie.172.1641538305688; 
 Thu, 06 Jan 2022 22:51:45 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
 <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
 <CAO=notzZOjCQdTiAXmve9ce5h-xNTH0L+dBQFTnOxNRkEe+5Yg@mail.gmail.com>
 <1e9d57e3-873a-be84-e702-fcc0c4397602@kaod.org>
 <CAO=noty9h088o+r02BHEqhj3n4YdDtPydbKBD_ziSyVzGMMrLQ@mail.gmail.com>
In-Reply-To: <CAO=noty9h088o+r02BHEqhj3n4YdDtPydbKBD_ziSyVzGMMrLQ@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Fri, 7 Jan 2022 14:51:38 +0800
Message-ID: <CAN9Jwz3-NkH2o3Uy5RLPmN+W=nVXcfY2kn63mF3Qm2LY1hO+eA@mail.gmail.com>
Subject: Re: i3c on Qemu
To: Patrick Venture <venture@google.com>
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
Cc: Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,
On Wed, Jan 5, 2022 at 5:30 AM Patrick Venture <venture@google.com> wrote:
>
>
>
> On Mon, Jan 3, 2022 at 1:47 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>>
>> Hello Patrick,
>>
>>
>> On 1/2/22 21:17, Patrick Venture wrote:
>> > Hi Troy,
>> >
>> >
>> >
>> > On Wed, Dec 22, 2021 at 2:13 AM Troy Lee <leetroy@gmail.com <mailto:le=
etroy@gmail.com>> wrote:
>> >
>> >     Hi Patrick,
>> >
>> >     On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture <venture@google.com=
 <mailto:venture@google.com>> wrote:
>> >      >
>> >      > Hi all;
>> >      >
>> >      > With ast2600 and the nuvoton 8xx, we're seeing the introduction=
 of i3c and I was curious if anyone on this list was already working on it =
for Aspeed or Qemu in general.
>> >      >
>> >      > Patrick
>> >
>> >     I have submitted an initial commit for I3C with ast2600.
>> >     However, this isn't a real I3C model, and it is just good enough t=
o
>> >     bring Aspeed SDK image up.
>> >
>> >     https://patchwork.kernel.org/project/qemu-devel/list/?series=3D599=
257 <https://patchwork.kernel.org/project/qemu-devel/list/?series=3D599257>
>> >
>> >     Thanks,
>> >     Troy Lee
>> >
>> >
>> > Thanks, I saw that and I think it probably fixes our bootloop issue wh=
en i3c is enabled.  My team will be working actively on real i3c support in=
 the coming months as we continue building support for the next Nuvoton SoC=
 and the ast2600.
>>
>> What kind of devices are you using ?
>
>
> In terms of what i3c devices are going to be attached?  We are hooking up=
 something more complex, that I'm not sure I can describe or upstream.  Pre=
sumably we'll be able to find some device that can be upstreamed with the s=
upport, beyond just the SoC IP blocks.
>

Please let us know if you need some help on ast2600-i3c.

Thanks,
Troy Lee

>>
>>
>> Thanks,
>>
>> C.
