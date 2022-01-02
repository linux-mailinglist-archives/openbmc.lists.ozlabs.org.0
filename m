Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40149482CAB
	for <lists+openbmc@lfdr.de>; Sun,  2 Jan 2022 21:17:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JRqtq17Rdz2yn9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 07:17:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=j+URcDdg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a34;
 helo=mail-vk1-xa34.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=j+URcDdg; dkim-atps=neutral
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JRqtM69Plz2xRn
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 07:17:29 +1100 (AEDT)
Received: by mail-vk1-xa34.google.com with SMTP id o2so17821582vkn.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jan 2022 12:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBvwX4k70d0A9Id9dVzWbxfxx8OIfvxFOb8lkqCmxtQ=;
 b=j+URcDdgCfSJvJ3PXmtIaXBO5SiwtAH3qIP4oouEtzO5pghjxyMA2QcxGgiykRNJ9d
 G23+3HW8NLr76CdbDnuFdhIG53gCseQYQt98MIfn5IPIuWTRGZ92hT1iambxvfouQJac
 z4TN/VkTKj5QLhOMp28hsQuS7y3645AvhOrMibdtw4fRKaXULrqIDGc1+B+BQomeOcOM
 viC7PXmXem8QQwmGkN5HmID02jmE9tnhRMG84inhblYc+xsS5a4RR2WtraPVaQf9nGFf
 xZlkzGaHniHeePLbx6Jl/8CjRt9XVpEjEWz//0qXHyYhus0eJY049855AEHBb1bXpDwx
 JN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBvwX4k70d0A9Id9dVzWbxfxx8OIfvxFOb8lkqCmxtQ=;
 b=S0wDMd2DObF6Z3ae82/XIMcBwO129pXtmAyw5HZoAmVkgYoMtsUwi89uTY7k9qTEi1
 jV1oJJHd4KTrv/efXROuVIRIHXpKahSqgaaYe3DL/5RlcF/1c6SFO46/qDI54TDb6v2T
 j4O+LBIXZS3GJC7TeDBpPW4GxHYu1u9l1c/73UxmT30ppJ6KKDN2WtZXZQq4GXgTyKa+
 Zh9jE/abRKEJpysYwQn08vLErfxzkUH9Q8SPD3DJvSCP1Ca6Jc36Hh5lJjiA8Ts1tYyV
 sMbFanu8a0R83uE5Ibc/Q3iOL4f3o33D9e6wPJn1NsRgyZA+NEG0nXVNXtOdhSy9gR0M
 KgGA==
X-Gm-Message-State: AOAM532GfLhTjzm4ER4Gv5Iyrp4lvGdcARCuNVHXAERQrU6SMJxhFVOY
 kqxtQ4QhMEw4IOF6trU4W7ohuoNHSqxhNudWfinnFHK5OwM=
X-Google-Smtp-Source: ABdhPJw20E7RyE63z8bkKbKF5z/XZnBvY6ajM7bL1tjHCzfy/cMJUP3DwIlpXwJce6h6EU/WsprDK63zHsp2epVb8mA=
X-Received: by 2002:a05:6122:221d:: with SMTP id
 bb29mr2119245vkb.30.1641154644744; 
 Sun, 02 Jan 2022 12:17:24 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
 <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
In-Reply-To: <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 2 Jan 2022 12:17:13 -0800
Message-ID: <CAO=notzZOjCQdTiAXmve9ce5h-xNTH0L+dBQFTnOxNRkEe+5Yg@mail.gmail.com>
Subject: Re: i3c on Qemu
To: Troy Lee <leetroy@gmail.com>, Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="0000000000009f8c8705d49f1773"
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
Cc: Hao Wu <wuhaotsh@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009f8c8705d49f1773
Content-Type: text/plain; charset="UTF-8"

Hi Troy,



On Wed, Dec 22, 2021 at 2:13 AM Troy Lee <leetroy@gmail.com> wrote:

> Hi Patrick,
>
> On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture <venture@google.com> wrote:
> >
> > Hi all;
> >
> > With ast2600 and the nuvoton 8xx, we're seeing the introduction of i3c
> and I was curious if anyone on this list was already working on it for
> Aspeed or Qemu in general.
> >
> > Patrick
>
> I have submitted an initial commit for I3C with ast2600.
> However, this isn't a real I3C model, and it is just good enough to
> bring Aspeed SDK image up.
>
> https://patchwork.kernel.org/project/qemu-devel/list/?series=599257
>
> Thanks,
> Troy Lee
>

Thanks, I saw that and I think it probably fixes our bootloop issue when
i3c is enabled.  My team will be working actively on real i3c support in
the coming months as we continue building support for the next Nuvoton SoC
and the ast2600.

Patrick

--0000000000009f8c8705d49f1773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Troy,<div><br></div><div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Dec 22, 2021 at 2:13 AM Troy Lee &lt;<a href=3D"mailto:leetroy@gmail.c=
om">leetroy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Patrick,<br>
<br>
On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture &lt;<a href=3D"mailto:ventur=
e@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all;<br>
&gt;<br>
&gt; With ast2600 and the nuvoton 8xx, we&#39;re seeing the introduction of=
 i3c and I was curious if anyone on this list was already working on it for=
 Aspeed or Qemu in general.<br>
&gt;<br>
&gt; Patrick<br>
<br>
I have submitted an initial commit for I3C with ast2600.<br>
However, this isn&#39;t a real I3C model, and it is just good enough to<br>
bring Aspeed SDK image up.<br>
<br>
<a href=3D"https://patchwork.kernel.org/project/qemu-devel/list/?series=3D5=
99257" rel=3D"noreferrer" target=3D"_blank">https://patchwork.kernel.org/pr=
oject/qemu-devel/list/?series=3D599257</a><br>
<br>
Thanks,<br>
Troy Lee<br></blockquote><div><br></div><div>Thanks, I saw that and I think=
 it probably fixes our bootloop issue when i3c is enabled.=C2=A0 My team wi=
ll be working actively on real i3c support in the coming months as we conti=
nue building support for the next Nuvoton SoC and the ast2600.</div><div><b=
r></div><div>Patrick</div></div></div>

--0000000000009f8c8705d49f1773--
