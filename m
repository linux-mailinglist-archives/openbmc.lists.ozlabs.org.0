Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781F19A242
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 01:12:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sQ885GQ1zDqvP
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 10:12:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LiskqSdK; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sQ7K4DfZzDqvH
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 10:11:24 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id q5so18779097lfb.13
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T6lZo7o1shAe1mlVPwzVAAAswyknJG90Z9YV8x802A4=;
 b=LiskqSdKIfUTIEcXx9V4mR7QtfxTeuQz9LAs+9H0b/tfkk5zOK1KNgBzS5bZNzqJJW
 ISXXq/0093gpDV1L1eaMhyil2l72H21Yz4ZU7CnlUwtOMgc921zUYP18uV9POoy8uMsi
 0+SUqC5iBxic4th5UwOVBuMzbutNxNWPPxwsjTE1k4jaYuGsshRygsy22dlFqqTnw/H0
 +B9H8/N+e7yyyV6Xu/ZECSdBe09Y1vzKRbYN5pyC6xFZnRCTUjes9ruHB9dfgVPdq4jp
 nTlxAPaj3ECIP1zibKnNjth5nkqlLye+KTbeFYzNDav1OSRHgagAT0wz8GbDqbprLAx7
 cqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6lZo7o1shAe1mlVPwzVAAAswyknJG90Z9YV8x802A4=;
 b=IdbZx3O8V0RAXBkjEQNM4CRbaxu58pP2/OKLZEvtaGoQkoJ6ksa7VAy6pvhMkNQ/6D
 XocT55lXqnb97SArsdsYK2xclP4Ius10NNy2c/1VDLMCJMBEli60/Bw/21zVzS2GLa/r
 JFMmVeiIuJlXifuDA5Q3jSolyhCWI29lvsdWV2P+P/qZwC4vMkMyxXXRfJWpgBz8T/68
 l2yZHPkG86Q1nBNDW61m/76dSZ0fWGX0kRZrTtrYwHQPeb5cG4CSATlnTihl3+dBpM9/
 WPQ47+K/qoWIpnbiIjGlrpyWDv2WiUtOieyW+UUJP5yarVQa98TeYJIXjKnLkavZwgDi
 72nA==
X-Gm-Message-State: AGi0PuZm4wRUx8Upz/9iibWu4jKG3b082uQzpeJPiWYRMT1eUfV/FrWa
 TPvJwGlXY54soIzDInXhqnRfC7hQVGa5abZ5uxHo1w==
X-Google-Smtp-Source: APiQypJqxRKuxI9ZymckjDSLSNbYxVuR5KZJVgH3CFr++XRk7+SYyuh9hw0MtWD+wZNW1hjwnHLytlzk6kW+tJJCt9Q=
X-Received: by 2002:ac2:4473:: with SMTP id y19mr2992477lfl.23.1585696277550; 
 Tue, 31 Mar 2020 16:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
 <4EA88F1E-3B2E-45FC-8135-0A91A4CF84D8@fb.com>
 <CAPnigKkwhidiMCxY9w6n=-s4gc9rk-Hnjz3YWiQPVX7r1dKCzA@mail.gmail.com>
 <286B2DEB-8444-4A97-BDE9-F34E60A1A0F9@fb.com>
In-Reply-To: <286B2DEB-8444-4A97-BDE9-F34E60A1A0F9@fb.com>
From: William Kennington <wak@google.com>
Date: Tue, 31 Mar 2020 16:11:06 -0700
Message-ID: <CAPnigK=mu=GJfnjQM=EVnHOoLbEcxp3NYUOTbOV2GwkecZ3FAg@mail.gmail.com>
Subject: Re: Chassis sled cycle
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="00000000000058b2a505a22eaf4a"
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

--00000000000058b2a505a22eaf4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You don't really want to implement that logic in the power daemon since it
has to find and unbind devices and whatnot. It's quite specific to a
platform and well tailored to be scripted.

On Tue, Mar 31, 2020 at 3:58 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> William,
>
> I am not worried by that I am just considering that one has to implement
> that unit file as well.
>
> Rather than triggering unit file why can=E2=80=99t we trigger gpio or i2c=
 command
> based on configuration
>
> Provided by each platform.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *William Kennington <wak@google.com>
> *Date: *Tuesday, March 31, 2020 at 1:37 PM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *Benjamin Fair <benjaminfair@google.com>, "
> jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>, James
> Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org" <
> openbmc@lists.ozlabs.org>
> *Subject: *Re: Chassis sled cycle
>
>
>
> The target is just that file. Platform specific services add themselves a=
s
> WantedBy. You shouldn't really need to worry about that part as triggerin=
g
> the service will cause them to run.
>
>
>
> On Tue, Mar 31, 2020 at 1:33 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> On 3/31/20, 10:53 AM, "Benjamin Fair" <benjaminfair@google.com> wrote:
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
> Ben, Can you please share content of
>
> https://github.com/openbmc/google-ipmi-sys/blob/master/gbmc-psu-hardreset=
.target
> as my assumption is each platform needs to provide this file but I
> couldn't find any platform
> using this. I only found reference in meta-quanta which is deleting this
> file. So please
> provide a reference to this file.
>
>

--00000000000058b2a505a22eaf4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You don&#39;t really want to implement that logic in the p=
ower daemon since it has to find and unbind devices and whatnot. It&#39;s q=
uite specific to a platform and well tailored to be scripted.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31=
, 2020 at 3:58 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vi=
jaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-5458205649521246665WordSection1">
<p class=3D"MsoNormal">William,<u></u><u></u></p>
<p class=3D"MsoNormal">I am not worried by that I am just considering that =
one has to implement that unit file as well.<u></u><u></u></p>
<p class=3D"MsoNormal">Rather than triggering unit file why can=E2=80=99t w=
e trigger gpio or i2c command based on configuration<u></u><u></u></p>
<p class=3D"MsoNormal">Provided by each platform.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">William Kennington &l=
t;<a href=3D"mailto:wak@google.com" target=3D"_blank">wak@google.com</a>&gt=
;<br>
<b>Date: </b>Tuesday, March 31, 2020 at 1:37 PM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.com" tar=
get=3D"_blank">benjaminfair@google.com</a>&gt;, &quot;<a href=3D"mailto:jas=
on.m.bills@linux.intel.com" target=3D"_blank">jason.m.bills@linux.intel.com=
</a>&quot; &lt;<a href=3D"mailto:jason.m.bills@linux.intel.com" target=3D"_=
blank">jason.m.bills@linux.intel.com</a>&gt;, James Feist &lt;<a href=3D"ma=
ilto:james.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel=
.com</a>&gt;, &quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_=
blank">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@lis=
ts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Chassis sled cycle<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The target is just=C2=A0that file. Platform specific=
 services add themselves as WantedBy. You shouldn&#39;t really need to worr=
y about that part as triggering the service will cause them to run.<u></u><=
u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Mar 31, 2020 at 1:33 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
<br>
On 3/31/20, 10:53 AM, &quot;Benjamin Fair&quot; &lt;<a href=3D"mailto:benja=
minfair@google.com" target=3D"_blank">benjaminfair@google.com</a>&gt; wrote=
:<br>
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
hardreset---subcommand-0x03" target=3D"_blank">
https://github.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-0x=
03</a><br>
<br>
=C2=A0 =C2=A0 It currently just activates the systemd target<br>
=C2=A0 =C2=A0 gbmc-psu-hardreset.target and lets you register services to d=
o the<br>
=C2=A0 =C2=A0 actual hotswap reset (usually by toggling a GPIO). Having a u=
nified<br>
=C2=A0 =C2=A0 solution in x86-power-control for this would be great!<br>
<br>
Ben, Can you please share content of<br>
=C2=A0<a href=3D"https://github.com/openbmc/google-ipmi-sys/blob/master/gbm=
c-psu-hardreset.target" target=3D"_blank">https://github.com/openbmc/google=
-ipmi-sys/blob/master/gbmc-psu-hardreset.target</a><br>
as my assumption is each platform needs to provide this file but I couldn&#=
39;t find any platform<br>
using this. I only found reference in meta-quanta which is deleting this fi=
le. So please<br>
provide a reference to this file.<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--00000000000058b2a505a22eaf4a--
