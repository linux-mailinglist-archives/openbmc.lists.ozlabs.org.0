Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A576C14DF2E
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 17:32:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487m8p328lzDqY1
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 03:32:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ahESMRof; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487m715q9ZzDqY1
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 03:30:31 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id cy15so4471808edb.4
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 08:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITUXlBUuMYDn96Sk2LauUFLE5WJ/8xk1hLrw/G5mDfo=;
 b=ahESMRofllzJAoMhC2dH8S8G5O5tkauQwfYdLAP1joaKCy+/C/VKSJPBhpmdhbD37l
 IHyk7M5NfjLIfIzg/J87MSCQxxMtX/8D3RQvFPmSU3gi16JaE0fHc/PQV46RD6dquQjD
 u6nq0wJV++lWntx91YuzkKKll9ANl6IDv/J9zMmvk/nwMyCg5l1b665Fy66jW8FtDIWV
 ldaBLHiCklxd0eB0mEchXw2nCQoKENHsdVTdNicLEkJa6CGLgK94/he9WwLd8fyyBvvi
 KViK8I9RPjbQYAsro8PtNSDNARHTaCujCq7SjhvSkdXLayTJZQT89A7Ec+bo5SvFCA0p
 eW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITUXlBUuMYDn96Sk2LauUFLE5WJ/8xk1hLrw/G5mDfo=;
 b=nev1VN39RHZ5BL8zvoY3Mg0CCn4R8nER+CaLX2695VNgoxMYBUj+q1CIpG8bFwwqii
 OoU+oyLnv/gWxZEBPavr6NSktFuXnskD3OdBqkT+s4BQzPUahDc469ZuYp3gRYpxJr0O
 ksq/xNY7/2Z10Avnf+VcHzs7DXoYp0ZpQAh8F3zFntqJ0Juar3hU6Yqq19Hyas4ZZ9O6
 TZn0JbgkrOgmmAO+KybO1XmozebFOTNxhwNvD7qt3C2QP5sJxM+9xFDkXiOfsEb3FGvS
 Votk9VbN4nEffeO1yarILMzlayq/iExl5Nygl1T+YC0Xz0HKOearmVvYMM3fNeoYdMOs
 SBzQ==
X-Gm-Message-State: APjAAAWmz5WU9CzpopJiDTkg+GYsmpyYY4s//B+4T4aCZJweFFxDBraG
 OgPxyyxGqlkeXjnRgPcFDWGERmTHWMiCgr/l3wZ32iv45JU=
X-Google-Smtp-Source: APXvYqzsJng+dSe4TPPMV0ffbmfWkNO6TdDUlMEyrMSksiMF0XFgPom7bvdWRHnaKPz6EqWQ8GxtsTkgp7qVVmg3ZGs=
X-Received: by 2002:a17:906:22cf:: with SMTP id
 q15mr4796611eja.77.1580401826264; 
 Thu, 30 Jan 2020 08:30:26 -0800 (PST)
MIME-Version: 1.0
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
 <20200121215056.GA59535@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200121215056.GA59535@patrickw3-mbp.dhcp.thefacebook.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 30 Jan 2020 11:30:10 -0500
Message-ID: <CABoTLcTnVhVeVZ3-7=g8ezd=keww7ufKSYy1Z4Wk-HRCeihpZw@mail.gmail.com>
Subject: Re: Bios upgrade from BMC
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000075613e059d5df931"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000075613e059d5df931
Content-Type: text/plain; charset="UTF-8"

Hi Patrick

Here some thoughts:

>   1.  Power off host server.
>
> I will admit I don't know the Intel architecture well enough yet, but is
> powering off the server prior to BIOS update actually required?  Is the
> BIOS NOR chip always mapped into a physical address and used, or is the
> BIOS at some point loaded and resident?  Are there stable points where
> it is safe to perform an update?  Can we monitor POST code to know when
> the BIOS is completed?
>
There are two issues:

   - The host may access the BIOS SPI flash at any time by making BIOS
   calls. UEFI variables are such an example. The problem is that the BIOS
   code that executes these requests does not handle cases at all where the
   BIOS SPI flash becomes inaccessible. This results in an immediate crash of
   the host.
   - With ME in operational mode, we cannot guarantee that ME would not
   attempt to read/write from the SPI flash while the host is running. I'm not
   sure if it's possible to put ME into recovery mode WHILE the host is
   running or if the host needs to be shut down for that.

My understanding is that the only way to safely write the BIOS SPI flash
from the BMC is to shut the host down and put ME into recovery mode.
Alternatively, hold the host in full reset via RSMRST.


> >   2.  Set ME/NM (Management engine or Node manager in x86) to recovery
> mode
>
> Is this specific to the BIOS update path or is this something we should
> do whenever the Host is powered off?  In either case I guess you can
> make it a dependency on the systemd unit file, but it seems like it
> would be nice if it were able to be generically applied to all power
> on/off paths.
>
This question opens a can of worms. There are people who say that ME should
always be run in recovery mode ...


> >   3.  Flip GPIO to access SPI flash used by host.
> >   4.  Bind spi driver to access flash
>
> This is another thing that seems like we could do generically on all
> power on / power off paths?  Any time the host isn't running we can hit
> the GPIO to put ownership at the BMC.  Is there any disadvantage to
> that?
>
Yes. You cannot turn the host on via a power button if the PCH cannot
access the SPI flash. You'd have to catch that signal in the BMC and do the
right thing.

What's the advantage of having the BIOS SPI flash always connected to the
BMC when the host is off? That seems to be making things more complicated
to me.



> Is the GPIO something unique to Facebook's machines or do most other
> Intel machines have the same requirements?
>

I'm not sure if it was explained what the GPIO does:
Since the SPI flash can only have one master, a "mux" (it's really a
digital switch, or a pair of digital switches) connect the SPI flash either
to the PCH for access by the ME / host or to the BMC. The GPIO or pair of
GPIOs is used to control the mux / bus switches.

If the SPI flash is connected to the BMC, the ME / host cannot access it at
all. As it turns out, the PCH needs to be able to read the SPI flash to be
able to "turn on" the host.


>
> >   5.  Flashcp image to device.
>
> I don't think `flashcp` is used today, or at least not in my
> recollection of the previous Witherspoon implementation.  Is there any
> advantage to it over `dd` to the raw mtdblock device?
>
I'm new to this, too, and found this explanation:
https://unix.stackexchange.com/questions/274217/how-is-erasing-mtd-with-dd-if-dev-zero-different-from-flash-eraseall

This question was asked in the context of erase, but it applies to writes,
too.


> >   9.  Power on server.
>
> Doesn't seem like "power on" should be a side-effect of a BIOS update.
> Is this intended to be "go back to the previous power state"?
>
+1

Having said all that, I was experimenting with pretty much the same flow
but ended up with unreliable writes with individual bit flips. I'm pretty
sure the HW is fine, since the original (AMI) stock firmware that comes
with the board can do it just fine. This is with an Aspeed AST2500, a C620
PCH and a Dediprog EM100 SPI flash emulator.

I had even tried to change the SPI flash clock from the Aspeed down to the
minimum, with no change :-/ I already hooked up a logic analyzer to see
what's going on but haven't had a chance to investigate yet. Any ideas?

Oskar.

--00000000000075613e059d5df931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Patrick<div><br></div><div>Here some t=
houghts:</div><div><br></div></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 =C2=A01.=C2=A0 Power off ho=
st server.<br>
<br>I will admit I don&#39;t know the Intel architecture well enough yet, b=
ut is<br>
powering off the server prior to BIOS update actually required?=C2=A0 Is th=
e<br>
BIOS NOR chip always mapped into a physical address and used, or is the<br>
BIOS at some point loaded and resident?=C2=A0 Are there stable points where=
<br>
it is safe to perform an update?=C2=A0 Can we monitor POST code to know whe=
n<br>
the BIOS is completed?<br></blockquote><div>There are two issues:</div><div=
><ul><li>The host may access the BIOS SPI flash at any time by making BIOS =
calls. UEFI variables are such an example. The problem is that the BIOS cod=
e that executes these requests does not handle cases at all where the BIOS =
SPI flash becomes inaccessible. This results in an immediate crash of the h=
ost.</li><li>With ME in operational mode, we cannot guarantee that ME would=
 not attempt to read/write from the SPI flash while the host is running. I&=
#39;m not sure if it&#39;s possible to put ME into recovery mode WHILE the =
host is running=C2=A0or if the host needs to be shut down for that.</li></u=
l></div><div>My understanding is that the only way to safely write the BIOS=
 SPI flash from the BMC is to shut the host down and put ME into recovery m=
ode. Alternatively, hold the host in full reset via RSMRST.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 =C2=
=A02.=C2=A0 Set ME/NM (Management engine or Node manager in x86) to recover=
y mode<br>
<br>
Is this specific to the BIOS update path or is this something we should<br>
do whenever the Host is powered off?=C2=A0 In either case I guess you can<b=
r>
make it a dependency on the systemd unit file, but it seems like it<br>
would be nice if it were able to be generically applied to all power<br>
on/off paths.<br></blockquote><div>This question opens a can of worms. Ther=
e are people who say that ME should always be run in recovery mode ...</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=
=A0 =C2=A03.=C2=A0 Flip GPIO to access SPI flash used by host.<br>
&gt;=C2=A0 =C2=A04.=C2=A0 Bind spi driver to access flash<br>
<br>
This is another thing that seems like we could do generically on all<br>
power on / power off paths?=C2=A0 Any time the host isn&#39;t running we ca=
n hit<br>
the GPIO to put ownership at the BMC.=C2=A0 Is there any disadvantage to<br=
>
that?<br></blockquote><div>Yes. You cannot turn the host on via a power but=
ton if the PCH cannot access the SPI flash. You&#39;d have to catch that si=
gnal in the BMC and do the right thing.</div><div><br></div><div>What&#39;s=
 the advantage of having the BIOS SPI flash always connected to the BMC whe=
n the host is off? That seems to be making things more complicated to me.</=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Is the GPIO something unique to Facebook&#39;s machines or do mo=
st other<br>
Intel machines have the same requirements?<br></blockquote><div><div><br></=
div><div>I&#39;m not sure if it was explained what the GPIO does:</div><div=
>Since the SPI flash can only have one master, a &quot;mux&quot; (it&#39;s =
really a digital switch, or a pair of digital switches) connect the SPI fla=
sh either to the PCH for access by the ME / host or to the BMC. The GPIO or=
 pair of GPIOs is used to control the mux / bus switches.</div><div><br></d=
iv><div>If the SPI flash is connected to the BMC, the ME / host cannot acce=
ss it at all. As it turns out, the PCH needs to be able to read the SPI fla=
sh to be able to &quot;turn on&quot; the host.</div><div></div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A05.=C2=A0 Flashcp image to device.<br>
<br>
I don&#39;t think `flashcp` is used today, or at least not in my<br>
recollection of the previous Witherspoon implementation.=C2=A0 Is there any=
<br>
advantage to it over `dd` to the raw mtdblock device?<br></blockquote><div>=
I&#39;m new to this, too, and found this explanation:=C2=A0<a href=3D"https=
://unix.stackexchange.com/questions/274217/how-is-erasing-mtd-with-dd-if-de=
v-zero-different-from-flash-eraseall">https://unix.stackexchange.com/questi=
ons/274217/how-is-erasing-mtd-with-dd-if-dev-zero-different-from-flash-eras=
eall</a></div><div><br></div><div>This question was asked in the context of=
 erase, but it applies to writes, too.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 =C2=A09.=C2=A0 Power on serv=
er.<br>
<br>
Doesn&#39;t seem like &quot;power on&quot; should be a side-effect of a BIO=
S update.<br>
Is this intended to be &quot;go back to the previous power state&quot;?<br>=
</blockquote><div>+1<br></div><div><br></div><div>Having said all that, I w=
as experimenting with pretty much the same flow but ended up with unreliabl=
e writes with individual bit flips. I&#39;m pretty sure the HW is fine, sin=
ce the original (AMI) stock firmware that comes with the board can do it ju=
st fine. This is with an Aspeed AST2500, a C620 PCH and a Dediprog EM100 SP=
I flash emulator.</div><div><br></div><div>I had even tried to change the S=
PI flash clock from the Aspeed down to the minimum, with no change :-/ I al=
ready hooked up a logic analyzer to see what&#39;s going on but haven&#39;t=
 had a chance to investigate yet. Any ideas?</div><div><br></div><div>Oskar=
.</div></div></div>

--00000000000075613e059d5df931--
