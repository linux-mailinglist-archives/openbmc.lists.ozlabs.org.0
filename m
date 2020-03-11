Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E5181A25
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 14:51:38 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ctfX0zL3zDqP6
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 00:51:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=209.85.208.170;
 helo=mail-lj1-f170.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ctdc0SLQzDqMM
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 00:50:36 +1100 (AEDT)
Received: by mail-lj1-f170.google.com with SMTP id w1so2417511ljh.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoFtr2i4GBL14lG8x+0wS2jl32/69qb8luapHZGJd7c=;
 b=AtLEz6zHvjb0BnOjdQ/Tz1LnumXos2EbTVzxWasqJ4fO/ygZ83qyVF6slGn/P+S9Kr
 W9nRDyBJMP5YiXnBCniRhl+82qu3WDnIDAp4VjgWxtJ7u995gM2xnptd8StFIr+YN0Ri
 jUiTHvSbRlgsfKbxu3BnywgkPagLavq8aAlBi3k0+FLfY5QxS8iiLivnGRE/xFxuieYt
 hxlkKvkJ4rWBq4hiMIhtodLvvhEniUPX3PzAo0YPVWVWPe4V21Od5OQTsqmZ3k7uKKXX
 GV+b1tTa9fVOoZONACV0Pf37xFchivK+PBwdELQHDtR+u2BHAuxXPiEV8JFVuCYYAWzM
 phvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoFtr2i4GBL14lG8x+0wS2jl32/69qb8luapHZGJd7c=;
 b=t9s5Cg1fF2FXZaiJaH6DyyJZWEhGZumE3bUFln/DtbP7rLpCqXOJT+7awhz1XP84Pd
 lVeJeBprOVdCbcW69aDa/rIA7yD5slclD1s3Bz2EQ5+QmcxwOOhcmom6vcyJYi6GO6w3
 eFPBEfQz2s6R5CWiI/mj++wPesnPzZsY9hw64cTrp7oQ3wL5hwrAPdun1cWO7GRoDcYJ
 XTuptnchfadA2RRKnGuYP/YHtvlbUP1BudECoi5tvcm4f2si7pD4ABIxWfl8qZFf6G4e
 gEZcBlVvBXZTomd0EynB1WAEjJG+iZFD+wkvt/OaIzmWJ012gAVQAzuf+do/64iHS2vU
 GlbQ==
X-Gm-Message-State: ANhLgQ1GaTgyN4hkoHlhRP0Zi6XAHmypibjLCuC87Ga3WmX6ObY6AG8s
 n2zlrzUvsk/RBNg1BRL0GBsAGtVdYymzIiM7RBKnxw==
X-Google-Smtp-Source: ADFU+vtV+PjNDgUKaBIrtwmcrzqqy6ld2uOq8lqg5i5W1XSidGnIwMqWtEDIgSABF95dviHXuTgh52zj8y1FrxrXQHY=
X-Received: by 2002:a05:651c:104f:: with SMTP id
 x15mr2219811ljm.284.1583934630723; 
 Wed, 11 Mar 2020 06:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
 <20200121215056.GA59535@patrickw3-mbp.dhcp.thefacebook.com>
 <CABoTLcTnVhVeVZ3-7=g8ezd=keww7ufKSYy1Z4Wk-HRCeihpZw@mail.gmail.com>
 <20200131002218.GC92818@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200131002218.GC92818@patrickw3-mbp.dhcp.thefacebook.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 11 Mar 2020 09:50:14 -0400
Message-ID: <CABoTLcS6iLXSMWhebaKbX6=3Rum+xuAkNtNgDU2s24Re3NOpqg@mail.gmail.com>
Subject: Re: Bios upgrade from BMC
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000003533205a0948581"
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

--00000000000003533205a0948581
Content-Type: text/plain; charset="UTF-8"

Hi everyone

I finally figured it out. And with "it" I mean the problem
that reading/writing to the BIOS flash ROM from an AST2500 was unreliable.
The problem was that Linux on the BMC didn't like when I changed the flash
image while the BMC was running. I was using a Dediprog EM100 flash
emulator, which allows to do that safely. The fix is to either not do that
(which wouldn't happen in production anyway), or to explicitly unbind +
bind the mtd before using it again after changing the flash contents. Yeah!

Oskar.

On Thu, Jan 30, 2020 at 7:22 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Jan 30, 2020 at 11:30:10AM -0500, Oskar Senft wrote:
> > Hi Patrick
> >
> > Here some thoughts:
> >
> > >   1.  Power off host server.
> > >
> > > I will admit I don't know the Intel architecture well enough yet, but
> is
> > > powering off the server prior to BIOS update actually required?  Is the
> > > BIOS NOR chip always mapped into a physical address and used, or is the
> > > BIOS at some point loaded and resident?  Are there stable points where
> > > it is safe to perform an update?  Can we monitor POST code to know when
> > > the BIOS is completed?
> > >
> > There are two issues:
> >
> >    - The host may access the BIOS SPI flash at any time by making BIOS
> >    calls. UEFI variables are such an example. The problem is that the
> BIOS
> >    code that executes these requests does not handle cases at all where
> the
> >    BIOS SPI flash becomes inaccessible. This results in an immediate
> crash of
> >    the host.
> >    - With ME in operational mode, we cannot guarantee that ME would not
> >    attempt to read/write from the SPI flash while the host is running.
> I'm not
> >    sure if it's possible to put ME into recovery mode WHILE the host is
> >    running or if the host needs to be shut down for that.
> >
> > My understanding is that the only way to safely write the BIOS SPI flash
> > from the BMC is to shut the host down and put ME into recovery mode.
> > Alternatively, hold the host in full reset via RSMRST.
>
> Good to know, thanks.
>
> > > >   2.  Set ME/NM (Management engine or Node manager in x86) to
> recovery
> > > mode
> > >
> > > Is this specific to the BIOS update path or is this something we should
> > > do whenever the Host is powered off?  In either case I guess you can
> > > make it a dependency on the systemd unit file, but it seems like it
> > > would be nice if it were able to be generically applied to all power
> > > on/off paths.
> > >
> > This question opens a can of worms. There are people who say that ME
> should
> > always be run in recovery mode ...
>
> Hah.  I think it is worth answering if the ME provides any useful
> function when the server is powered off though.  I don't know, but it
> would potentially simplify the BIOS update flow if Host Off => ME in
> Recovery.
>
> > > >   3.  Flip GPIO to access SPI flash used by host.
> > > >   4.  Bind spi driver to access flash
> > >
> > > This is another thing that seems like we could do generically on all
> > > power on / power off paths?  Any time the host isn't running we can hit
> > > the GPIO to put ownership at the BMC.  Is there any disadvantage to
> > > that?
> > >
> > Yes. You cannot turn the host on via a power button if the PCH cannot
> > access the SPI flash. You'd have to catch that signal in the BMC and do
> the
> > right thing.
> >
> > What's the advantage of having the BIOS SPI flash always connected to the
> > BMC when the host is off? That seems to be making things more complicated
> > to me.
>
> It was just another simplification.  Usually we have special user
> utilities to steal the flash to the BMC and we have this logic in BIOS
> update path.  Again, if Host Off => BIOS SPI owned by BMC, it simplifies
> / eliminates logic.
>
> > > Is the GPIO something unique to Facebook's machines or do most other
> > > Intel machines have the same requirements?
> > >
> >
> > I'm not sure if it was explained what the GPIO does:
> > Since the SPI flash can only have one master, a "mux" (it's really a
> > digital switch, or a pair of digital switches) connect the SPI flash
> either
> > to the PCH for access by the ME / host or to the BMC. The GPIO or pair of
> > GPIOs is used to control the mux / bus switches.
> >
> > If the SPI flash is connected to the BMC, the ME / host cannot access it
> at
> > all. As it turns out, the PCH needs to be able to read the SPI flash to
> be
> > able to "turn on" the host.
>
> Yep, I'm aware of the mux (on Facebook systems).  I wasn't sure if this
> was common or typical Intel architecture feature or something we
> specifically had on our Facebook systems.
>
> > >
> > > >   5.  Flashcp image to device.
> > >
> > > I don't think `flashcp` is used today, or at least not in my
> > > recollection of the previous Witherspoon implementation.  Is there any
> > > advantage to it over `dd` to the raw mtdblock device?
> > >
> > I'm new to this, too, and found this explanation:
> >
> https://unix.stackexchange.com/questions/274217/how-is-erasing-mtd-with-dd-if-dev-zero-different-from-flash-eraseall
> >
> > This question was asked in the context of erase, but it applies to
> writes,
> > too.
>
> The stackexchange here is referring to /dev/mtdN devices and not
> /dev/mtdblockN devices (and I agree for plain-mtd).  mtdblock
> specifically has the extra logic to deal with erasing and writing in
> pages as appropriate.
>
> > > >   9.  Power on server.
> > >
> > > Doesn't seem like "power on" should be a side-effect of a BIOS update.
> > > Is this intended to be "go back to the previous power state"?
> > >
> > +1
> >
> > Having said all that, I was experimenting with pretty much the same flow
> > but ended up with unreliable writes with individual bit flips. I'm pretty
> > sure the HW is fine, since the original (AMI) stock firmware that comes
> > with the board can do it just fine. This is with an Aspeed AST2500, a
> C620
> > PCH and a Dediprog EM100 SPI flash emulator.
> >
> > I had even tried to change the SPI flash clock from the Aspeed down to
> the
> > minimum, with no change :-/ I already hooked up a logic analyzer to see
> > what's going on but haven't had a chance to investigate yet. Any ideas?
>
> Sorry, I've got nothing except maybe the original code retries a bunch
> to get past random flips?  If you are seeing bit-flips even with the
> Dediprog, are you sure the bus is any good?  Did you solder on headers
> to be able to affix the Dediprog?  That might have changed the
> capacitance enough to affect SPI activity.
>
> > Oskar.
>
> --
> Patrick Williams
>

--00000000000003533205a0948581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone<div><br></div><div>I finally figured it out. A=
nd with &quot;it&quot; I mean the problem that=C2=A0reading/writing to the =
BIOS flash ROM from an AST2500 was unreliable. The problem was that Linux o=
n the BMC didn&#39;t like when I changed the flash image while the BMC was =
running. I was using a Dediprog EM100 flash emulator, which allows to do th=
at safely. The fix is to either not do that (which wouldn&#39;t happen in p=
roduction anyway), or to explicitly unbind=C2=A0+ bind the mtd before using=
 it again after changing the flash contents. Yeah!</div><div><br></div><div=
>Oskar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Jan 30, 2020 at 7:22 PM Patrick Williams &lt;<a href=
=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 30, 2020 at 11:3=
0:10AM -0500, Oskar Senft wrote:<br>
&gt; Hi Patrick<br>
&gt; <br>
&gt; Here some thoughts:<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A01.=C2=A0 Power off host server.<br>
&gt; &gt;<br>
&gt; &gt; I will admit I don&#39;t know the Intel architecture well enough =
yet, but is<br>
&gt; &gt; powering off the server prior to BIOS update actually required?=
=C2=A0 Is the<br>
&gt; &gt; BIOS NOR chip always mapped into a physical address and used, or =
is the<br>
&gt; &gt; BIOS at some point loaded and resident?=C2=A0 Are there stable po=
ints where<br>
&gt; &gt; it is safe to perform an update?=C2=A0 Can we monitor POST code t=
o know when<br>
&gt; &gt; the BIOS is completed?<br>
&gt; &gt;<br>
&gt; There are two issues:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - The host may access the BIOS SPI flash at any time by m=
aking BIOS<br>
&gt;=C2=A0 =C2=A0 calls. UEFI variables are such an example. The problem is=
 that the BIOS<br>
&gt;=C2=A0 =C2=A0 code that executes these requests does not handle cases a=
t all where the<br>
&gt;=C2=A0 =C2=A0 BIOS SPI flash becomes inaccessible. This results in an i=
mmediate crash of<br>
&gt;=C2=A0 =C2=A0 the host.<br>
&gt;=C2=A0 =C2=A0 - With ME in operational mode, we cannot guarantee that M=
E would not<br>
&gt;=C2=A0 =C2=A0 attempt to read/write from the SPI flash while the host i=
s running. I&#39;m not<br>
&gt;=C2=A0 =C2=A0 sure if it&#39;s possible to put ME into recovery mode WH=
ILE the host is<br>
&gt;=C2=A0 =C2=A0 running or if the host needs to be shut down for that.<br=
>
&gt; <br>
&gt; My understanding is that the only way to safely write the BIOS SPI fla=
sh<br>
&gt; from the BMC is to shut the host down and put ME into recovery mode.<b=
r>
&gt; Alternatively, hold the host in full reset via RSMRST.<br>
<br>
Good to know, thanks.<br>
<br>
&gt; &gt; &gt;=C2=A0 =C2=A02.=C2=A0 Set ME/NM (Management engine or Node ma=
nager in x86) to recovery<br>
&gt; &gt; mode<br>
&gt; &gt;<br>
&gt; &gt; Is this specific to the BIOS update path or is this something we =
should<br>
&gt; &gt; do whenever the Host is powered off?=C2=A0 In either case I guess=
 you can<br>
&gt; &gt; make it a dependency on the systemd unit file, but it seems like =
it<br>
&gt; &gt; would be nice if it were able to be generically applied to all po=
wer<br>
&gt; &gt; on/off paths.<br>
&gt; &gt;<br>
&gt; This question opens a can of worms. There are people who say that ME s=
hould<br>
&gt; always be run in recovery mode ...<br>
<br>
Hah.=C2=A0 I think it is worth answering if the ME provides any useful<br>
function when the server is powered off though.=C2=A0 I don&#39;t know, but=
 it<br>
would potentially simplify the BIOS update flow if Host Off =3D&gt; ME in<b=
r>
Recovery.<br>
<br>
&gt; &gt; &gt;=C2=A0 =C2=A03.=C2=A0 Flip GPIO to access SPI flash used by h=
ost.<br>
&gt; &gt; &gt;=C2=A0 =C2=A04.=C2=A0 Bind spi driver to access flash<br>
&gt; &gt;<br>
&gt; &gt; This is another thing that seems like we could do generically on =
all<br>
&gt; &gt; power on / power off paths?=C2=A0 Any time the host isn&#39;t run=
ning we can hit<br>
&gt; &gt; the GPIO to put ownership at the BMC.=C2=A0 Is there any disadvan=
tage to<br>
&gt; &gt; that?<br>
&gt; &gt;<br>
&gt; Yes. You cannot turn the host on via a power button if the PCH cannot<=
br>
&gt; access the SPI flash. You&#39;d have to catch that signal in the BMC a=
nd do the<br>
&gt; right thing.<br>
&gt; <br>
&gt; What&#39;s the advantage of having the BIOS SPI flash always connected=
 to the<br>
&gt; BMC when the host is off? That seems to be making things more complica=
ted<br>
&gt; to me.<br>
<br>
It was just another simplification.=C2=A0 Usually we have special user<br>
utilities to steal the flash to the BMC and we have this logic in BIOS<br>
update path.=C2=A0 Again, if Host Off =3D&gt; BIOS SPI owned by BMC, it sim=
plifies<br>
/ eliminates logic.<br>
<br>
&gt; &gt; Is the GPIO something unique to Facebook&#39;s machines or do mos=
t other<br>
&gt; &gt; Intel machines have the same requirements?<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m not sure if it was explained what the GPIO does:<br>
&gt; Since the SPI flash can only have one master, a &quot;mux&quot; (it&#3=
9;s really a<br>
&gt; digital switch, or a pair of digital switches) connect the SPI flash e=
ither<br>
&gt; to the PCH for access by the ME / host or to the BMC. The GPIO or pair=
 of<br>
&gt; GPIOs is used to control the mux / bus switches.<br>
&gt; <br>
&gt; If the SPI flash is connected to the BMC, the ME / host cannot access =
it at<br>
&gt; all. As it turns out, the PCH needs to be able to read the SPI flash t=
o be<br>
&gt; able to &quot;turn on&quot; the host.<br>
<br>
Yep, I&#39;m aware of the mux (on Facebook systems).=C2=A0 I wasn&#39;t sur=
e if this<br>
was common or typical Intel architecture feature or something we<br>
specifically had on our Facebook systems.<br>
<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A05.=C2=A0 Flashcp image to device.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think `flashcp` is used today, or at least not in my<=
br>
&gt; &gt; recollection of the previous Witherspoon implementation.=C2=A0 Is=
 there any<br>
&gt; &gt; advantage to it over `dd` to the raw mtdblock device?<br>
&gt; &gt;<br>
&gt; I&#39;m new to this, too, and found this explanation:<br>
&gt; <a href=3D"https://unix.stackexchange.com/questions/274217/how-is-eras=
ing-mtd-with-dd-if-dev-zero-different-from-flash-eraseall" rel=3D"noreferre=
r" target=3D"_blank">https://unix.stackexchange.com/questions/274217/how-is=
-erasing-mtd-with-dd-if-dev-zero-different-from-flash-eraseall</a><br>
&gt; <br>
&gt; This question was asked in the context of erase, but it applies to wri=
tes,<br>
&gt; too.<br>
<br>
The stackexchange here is referring to /dev/mtdN devices and not<br>
/dev/mtdblockN devices (and I agree for plain-mtd).=C2=A0 mtdblock<br>
specifically has the extra logic to deal with erasing and writing in<br>
pages as appropriate.<br>
<br>
&gt; &gt; &gt;=C2=A0 =C2=A09.=C2=A0 Power on server.<br>
&gt; &gt;<br>
&gt; &gt; Doesn&#39;t seem like &quot;power on&quot; should be a side-effec=
t of a BIOS update.<br>
&gt; &gt; Is this intended to be &quot;go back to the previous power state&=
quot;?<br>
&gt; &gt;<br>
&gt; +1<br>
&gt; <br>
&gt; Having said all that, I was experimenting with pretty much the same fl=
ow<br>
&gt; but ended up with unreliable writes with individual bit flips. I&#39;m=
 pretty<br>
&gt; sure the HW is fine, since the original (AMI) stock firmware that come=
s<br>
&gt; with the board can do it just fine. This is with an Aspeed AST2500, a =
C620<br>
&gt; PCH and a Dediprog EM100 SPI flash emulator.<br>
&gt; <br>
&gt; I had even tried to change the SPI flash clock from the Aspeed down to=
 the<br>
&gt; minimum, with no change :-/ I already hooked up a logic analyzer to se=
e<br>
&gt; what&#39;s going on but haven&#39;t had a chance to investigate yet. A=
ny ideas?<br>
<br>
Sorry, I&#39;ve got nothing except maybe the original code retries a bunch<=
br>
to get past random flips?=C2=A0 If you are seeing bit-flips even with the<b=
r>
Dediprog, are you sure the bus is any good?=C2=A0 Did you solder on headers=
<br>
to be able to affix the Dediprog?=C2=A0 That might have changed the<br>
capacitance enough to affect SPI activity.<br>
<br>
&gt; Oskar.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000003533205a0948581--
