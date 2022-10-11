Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004F5FAB82
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 06:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmhvX6KTtz3bl0
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 15:02:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZZ13K51m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZZ13K51m;
	dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmhtx2ttTz2xsD
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 15:02:17 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id m6so2723870qkm.4
        for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2022 21:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8MOoJ/tC6nswN9FPhZaFRW4pvdLKEmpCYiS88Yn4SH4=;
        b=ZZ13K51mCJoB/cMZrQKa3UPSJFTizxLQonTFAaN+sSkyWTHPR2vFgoVpGMEiC/vqAG
         V9e1T0ld7AxBVY0XzOKIkw1Xcs05lacRp1F9OROYC96IffOTsuPJiYV0TWL/iPIJLCre
         sSK4Uli5Djp7bWWgs/0Cthc3wvcOLgbS2lPIcWZzdVkFFoJxpj1Qk91/8IHVcca3YRNf
         1VD4yCMG8LLBDJi9h/aw8JfXClOORm6l7uLx6ZWgSamj4yUFaQuMaf775wXN52LFgpso
         iD8df1OAot9Ldan0QK5KTcj+t/JKcLsooz8JbRRqSwLdDvQCeRWAqiiyf5B1nIu32xKJ
         ig3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MOoJ/tC6nswN9FPhZaFRW4pvdLKEmpCYiS88Yn4SH4=;
        b=Wd6GJLqgHiCsULFLzlZH0WIe3fLzq+MYURDVwZ2cASjPna0ca9GMch8S6W1ij61eoI
         as1Cm/KY3qqtDauXgZ6T1GSsXutAsJYw9vket40bzlgOcegihyadYd7rZkzEDVrxDRJv
         ZmOSvHgA5jf2rfUv6owX+aNgmi2MlKDXTkHHPJ1awEFZIQO/sW8GQmhkPRTdmaSxj1wW
         wE7oAHAk8G6R3c0HgZ7Sn6XQIq1g/sqtXRISJ6uZQX09fN1D7BeYPbHWnr+Yici7FLHI
         2qacVC7QBmiDqQ9u/vjDbj9ARkhkQL2DOk5jfhHCewA8sm93rjRYCNSS/JxPVs8kpX2u
         Tk1w==
X-Gm-Message-State: ACrzQf3KEYWo6Pta9fMgBYhl310hGK3it8OsG9n3frR9HoXdnvBmB3oW
	olISuPIhUhyTq6jNIYRJeSyA4yDPof1wnl2P5G8=
X-Google-Smtp-Source: AMsMyM7HD/awQ3vhB1JukuviliaJ1o+gkcC789qVRqrfABqEXbDXMoOCCiQHRQJtVGHtTSNIr6AYq65z7wwqbm9+/Mo=
X-Received: by 2002:a05:620a:2a09:b0:6ee:7d3e:687f with SMTP id
 o9-20020a05620a2a0900b006ee7d3e687fmr593005qkp.572.1665460933626; Mon, 10 Oct
 2022 21:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
 <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
In-Reply-To: <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 10 Oct 2022 21:01:37 -0700
Message-ID: <CADy_Pt3e=MfxBK72HkU0d8FCs_xdfFrH=2NVqMf1tntBr9CEHQ@mail.gmail.com>
Subject: Re: Unable to connect to a BMC Serial Console
To: Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: multipart/alternative; boundary="000000000000560dba05eaba57fe"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Shubhabrata Bose <shubhabrata.bose@tcs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000560dba05eaba57fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shubh,

Is your goal to replace the Intel BMC firmware stack with an OpenBMC
firmware image?

The Intel S2600GZ server (a.k.a., Grizzly Pass) is an older server with an
Emulex Pilot 2
BMC PSoC with a proprietary firmware stack. Furthermore, the Pilot series
of BMC is not
supported by OpenBMC. Whereas the S2600STP (a.k.a., Sawtooth Pass), that
Jeremy has
referenced, has the AST2500 BMC PSoC and is supported by OpenBMC.

To make things more challenging for hackers, Intel platforms don't have the
BMC serial port
normally accessible. Meaning that the hardware to connect to the BMC serial
port isn't
populated and logging into the BMC via the serial console is disabled.

Regards, James.

On Mon, Oct 10, 2022 at 6:16 PM Jeremy Kerr <jk@codeconstruct.com.au> wrote=
:

> Hi Shubh,
>
> > TCS Confidential
>
> Really? :)
>
> > I am new to OpenBMC and I need some help about how to access the BMC
> > console which I am not able to, after many tries.
>
> Just to confirm - you're referring to the console for the BMC system
> itself, right? As distinct from the host serial.
>
> > Currently, I have connected my Host Server (i.e., Thinkstation P510 =E2=
=80=93
> > Intel X86-64 CPU installed with OS: Ubuntu 18.04)
> > with Intel Server Board S2600GZ (OS :Ubuntu 14) which has a BMC chip
> > using aUSB-TTL Serial console cable
> > (=E2=80=9Cxcluma Usb To Ttl Serial Cable Debugger For Raspberry Pi Beag=
lebone
> > Cubietruck=E2=80=9D.)
> > The minicom is not showing me any prompt & it=E2=80=99s paused; nothing=
 is
> > going ahead.
>
> A few things to check:
>
>  - Where have you attached to the TTL signals? Are you sure that's a
>    BMC serial port?
>  - What are you expecting to see there? The BMC might only be
>    outputting console data during boot.
>  - Are you using the correct baud rate? (since there should be
>    activity on the TX line during boot, you can use this to find the
>    TX line and set your baud rate)
>
> I'm not familiar with the S2600GZ, but I have done a bit of OpenBMC
> development using a S2600STB platform, which may be similar. In that
> case, slides 25 and 28 of this might help:
>
>
> http://jk.ozlabs.org/docs/lca2021/lca2021%20-%20Server%20platforms%20-%20=
Jeremy%20Kerr.pdf
>
> Otherwise, maybe Intel folks here can provide better connection details
> for the GZ.
>
> Cheers,
>
>
> Jeremy
>
>

--000000000000560dba05eaba57fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Shubh,<br></div><div dir=3D"=
ltr"><br></div><div>Is your goal to replace the Intel BMC firmware stack wi=
th an OpenBMC firmware image?</div><div><br></div><div>The Intel S2600GZ se=
rver (a.k.a., Grizzly Pass) is an older server with an Emulex Pilot 2</div>=
<div>BMC PSoC with a proprietary firmware stack. Furthermore,=C2=A0the Pilo=
t series of BMC is not</div><div>supported by OpenBMC. Whereas the S2600STP=
 (a.k.a., Sawtooth Pass), that Jeremy has</div><div>referenced, has the AST=
2500 BMC PSoC and is supported by OpenBMC.</div><div><br></div><div>To make=
 things more challenging for=C2=A0hackers, Intel platforms don&#39;t have t=
he BMC serial port</div><div>normally accessible. Meaning that the hardware=
=C2=A0to connect to the BMC serial port isn&#39;t=C2=A0</div><div>populated=
 and logging into the BMC via the serial console is disabled.</div><div><br=
></div><div>Regards, James.<br></div></div></div></div></div></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Oct 10, 2022 at 6:16 PM Jeremy Kerr &lt;<a href=3D"mailto:jk@codeconstruct.=
com.au">jk@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Shubh,<br>
<br>
&gt; TCS Confidential<br>
<br>
Really? :)<br>
<br>
&gt; I am new to OpenBMC and I need some help about how to access the BMC<b=
r>
&gt; console which I am not able to, after many tries.<br>
<br>
Just to confirm - you&#39;re referring to the console for the BMC system<br=
>
itself, right? As distinct from the host serial.<br>
<br>
&gt; Currently, I have connected my Host Server (i.e., Thinkstation P510 =
=E2=80=93<br>
&gt; Intel X86-64 CPU installed with OS: Ubuntu 18.04)<br>
&gt; with Intel Server Board S2600GZ (OS :Ubuntu 14) which has a BMC chip<b=
r>
&gt; using aUSB-TTL Serial console cable <br>
&gt; (=E2=80=9Cxcluma Usb To Ttl Serial Cable Debugger For Raspberry Pi Bea=
glebone<br>
&gt; Cubietruck=E2=80=9D.)<br>
&gt; The minicom is not showing me any prompt &amp; it=E2=80=99s paused; no=
thing is<br>
&gt; going ahead.<br>
<br>
A few things to check:<br>
<br>
=C2=A0- Where have you attached to the TTL signals? Are you sure that&#39;s=
 a=C2=A0<br>
=C2=A0 =C2=A0BMC serial port?<br>
=C2=A0- What are you expecting to see there? The BMC might only be=C2=A0<br=
>
=C2=A0 =C2=A0outputting console data during boot.<br>
=C2=A0- Are you using the correct baud rate? (since there should be=C2=A0<b=
r>
=C2=A0 =C2=A0activity=C2=A0on the TX line during boot, you can use this to =
find the=C2=A0<br>
=C2=A0 =C2=A0TX=C2=A0line and set your baud rate)<br>
<br>
I&#39;m not familiar with the S2600GZ, but I have done a bit of OpenBMC<br>
development using a S2600STB platform, which may be similar. In that<br>
case, slides 25 and 28 of this might help:<br>
<br>
<a href=3D"http://jk.ozlabs.org/docs/lca2021/lca2021%20-%20Server%20platfor=
ms%20-%20Jeremy%20Kerr.pdf" rel=3D"noreferrer" target=3D"_blank">http://jk.=
ozlabs.org/docs/lca2021/lca2021%20-%20Server%20platforms%20-%20Jeremy%20Ker=
r.pdf</a><br>
<br>
Otherwise, maybe Intel folks here can provide better connection details<br>
for the GZ.<br>
<br>
Cheers,<br>
<br>
<br>
Jeremy<br>
<br>
</blockquote></div>

--000000000000560dba05eaba57fe--
