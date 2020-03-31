Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2D19A033
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 22:53:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sM4g5rlZzDqw4
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 07:53:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eK4Ptoac; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sM3r64H2zDqf1
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 07:53:11 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id t17so23544103ljc.12
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 13:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vV38qJFwTBPBJ24r2I7UpSErf3SDYLBKfRJwtv034yk=;
 b=eK4PtoacWFtcK/ODoI3Z28Grp+W3vfj1i2emUeOqWdSqijB41vvzvAKKh+BuYBt0Hm
 E7D6mugYBJ+4dziFGMwEuV0Nutv4Bb2Fj/+nihPkEuu4e9XcCJXZ4IxhDD66BW35nb02
 yOvLTwxQ4qEGdJ8cnf5C6+ItWH/UL2yHj3AzrdvqWvcsqJ6NRSScsqkbm1FomZu1nyA9
 MYsc1JfixEnLrTlx8yTW5ubfHGAX7lzfjycmlZkjuwRLVAEKJwaSDVuKOCG7qY7l1qsa
 8k7w+BVew/6eIf56D/mhGNxGanFk0yLJz+NlfiWAY+xpE4tElXEtyoR87TY+YSbPBdYK
 ad+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vV38qJFwTBPBJ24r2I7UpSErf3SDYLBKfRJwtv034yk=;
 b=m2JqSDEeUIhhk0/Ni5cDLecvH+eHf6qvtHhRr0uSg81NB2ceFEYCGB8+z+vY6afxg/
 xoq4B/ikLuHvpvzZkdzcRad/sopF3QFuUjxLiif1FsFELTjeri9SElYg+HD/WO59jb2Z
 UbhlTYh0Uaa3uNZSD2nPZN64tkuRdOekabPqckyBtI91ChJTJ3DJ7NnX50DOTJoHAnRw
 hsBHIwgQoYmumsma+hPtgpVEd5ueFqE4l5o/Q9eElSGVDJGjFMfXJd0WV+i1KJrYiqSN
 RoyN56XybVJ/sG918kzXC5ZIF+SOB/StK9T8XAgE9wnm1BysG5aT645xHQNXEdZI7dMu
 XkKA==
X-Gm-Message-State: AGi0PuYdvuwHI4wT0ZsN82UWyqwedqmOp8oxVVS6p6wDvZfvlulRsO6V
 14w8dojKAjMKzMCY8izMpIfoyZf8TdQe/TIxQeTzJw==
X-Google-Smtp-Source: APiQypIaKZCm7IWDrtopDtSN0NznFhfMNtm2kTi1G/vsPcrExsPgnxhSEiijyfUwlXDK7V+aKj6wpFdx0CZgGe2yHSM=
X-Received: by 2002:a2e:8109:: with SMTP id d9mr11375027ljg.31.1585687988067; 
 Tue, 31 Mar 2020 13:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
 <40F2216B-79C3-409E-BBBA-C10D5347DCFC@fb.com>
In-Reply-To: <40F2216B-79C3-409E-BBBA-C10D5347DCFC@fb.com>
From: William Kennington <wak@google.com>
Date: Tue, 31 Mar 2020 13:52:57 -0700
Message-ID: <CAPnigKnFwVdp7G4PpFcFHHjdJsPBdgD8n6SBTkf1E6kAzHUH0g@mail.gmail.com>
Subject: Re: Chassis sled cycle
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000413c0c05a22cc1fd"
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
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 Benjamin Fair <benjaminfair@google.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000413c0c05a22cc1fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It could be a GPIO on some systems or it could be I2C on others. It just
depends on the hotswap controller used for the platforms. That's why it is
a systemd target with arbitrary scripting provided by the platform.

On Tue, Mar 31, 2020 at 1:49 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

>
>
> =EF=BB=BFOn 3/31/20, 10:53 AM, "Benjamin Fair" <benjaminfair@google.com> =
wrote:
>
>     On Mon, 30 Mar 2020 at 13:00, Vijay Khemka <vijaykhemka@fb.com> wrote=
:
>     >
>     > Hi Jason,
>     >
>     > We have a requirement of Chassis sled cycle and it can be achieved
> by sending an i2c command to hotswap controller. Is there any plan to add
> this feature in x86-power-control. It should take i2c bus address from
> configuration file.
>     >
>     >
>     >
>     > Regards
>     >
>     > -Vijay
>
>     This feature is implemented on some systems using an IPMI OEM command=
:
>
> https://github.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-=
0x03
>
>     It currently just activates the systemd target
>     gbmc-psu-hardreset.target and lets you register services to do the
>     actual hotswap reset (usually by toggling a GPIO). Having a unified
>     solution in x86-power-control for this would be great!
>
> Ben, please clarify if this is same as power reset or different from powe=
r
> reset. As HSC reset
> is being triggered by i2c command not through GPIO at least in our system=
.
> Power reset is
>  being triggered though POWER_RESET gpio pin and it is supported by
> x86-power-control.
>
> Regards
> -Vijay
>
>

--000000000000413c0c05a22cc1fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It could be a GPIO on some systems or it could be I2C on o=
thers. It just depends on the hotswap controller used for the platforms. Th=
at&#39;s why it is a systemd target with arbitrary scripting provided by th=
e platform.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Mar 31, 2020 at 1:49 PM Vijay Khemka &lt;<a href=3D"mail=
to:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
=EF=BB=BFOn 3/31/20, 10:53 AM, &quot;Benjamin Fair&quot; &lt;<a href=3D"mai=
lto:benjaminfair@google.com" target=3D"_blank">benjaminfair@google.com</a>&=
gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Mon, 30 Mar 2020 at 13:00, Vijay Khemka &lt;<a href=3D"mai=
lto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt; wrote:=
<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Hi Jason,<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; We have a requirement of Chassis sled cycle and it can b=
e achieved by sending an i2c command to hotswap controller. Is there any pl=
an to add this feature in x86-power-control. It should take i2c bus address=
 from configuration file.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Regards<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; -Vijay<br>
<br>
=C2=A0 =C2=A0 This feature is implemented on some systems using an IPMI OEM=
 command:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/google-ipmi-sys#delayed=
hardreset---subcommand-0x03" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-0x03</a><br=
>
<br>
=C2=A0 =C2=A0 It currently just activates the systemd target<br>
=C2=A0 =C2=A0 gbmc-psu-hardreset.target and lets you register services to d=
o the<br>
=C2=A0 =C2=A0 actual hotswap reset (usually by toggling a GPIO). Having a u=
nified<br>
=C2=A0 =C2=A0 solution in x86-power-control for this would be great!<br>
<br>
Ben, please clarify if this is same as power reset or different from power =
reset. As HSC reset<br>
is being triggered by i2c command not through GPIO at least in our system. =
Power reset is <br>
=C2=A0being triggered though POWER_RESET gpio pin and it is supported by x8=
6-power-control.<br>
<br>
Regards<br>
-Vijay=C2=A0 =C2=A0<br>
<br>
</blockquote></div>

--000000000000413c0c05a22cc1fd--
