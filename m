Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A5274708
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 18:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwnX34gx1zDqWl
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 02:56:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KuRmaiLd; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwnVf0XC0zDqRv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 02:55:17 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id k18so4588847ybh.1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WErDuv1r3jDkmwslUe7LGMMX69q68A9OK91ttlUL6ww=;
 b=KuRmaiLd71c+ZaMBsOScivrlCzDUMMlufiKqkh0oUkN3C3VEX8HAwZT60Jmh6eC9K4
 hD95c486rUBW1MljJ1sBj4SmTXIvUl5uimBP5AV8QYBy45tYfgTHM0cMlq1wtOv+TPZM
 Ww6jI9xswmI31r3HJFM8x5/Ii70s2cYsOmZ8jRqWygAdF5kh2wkvWG4+1ud1fI2zMRHx
 hA2uS8goqNXpcaP1/847o/cgTPTY2F5F3RkBm/fnzQaA/xuIdEb7Wy+Fm7Ol7RKpeNrR
 b6LsV69dRZIeOjxU8A2RT+sBsRJnvyQzilKgh4bSUdcz2W6dAeiYf/M51jkOfh1jaeXo
 WbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WErDuv1r3jDkmwslUe7LGMMX69q68A9OK91ttlUL6ww=;
 b=YKUpDxOmX1zThwdoeI0zn5tDNwWOEjIDxrunjQJN+X5UGRjOxro1CbyLeQcwfax7tV
 e52rbDW5nKk4sPtA8unBOFsEMR6s9ygn8BEusTiWE8GYudr9yVmhoSDy3aPXcmzEOK02
 +Q79EAtUTeRZbGlGpVTSY8l28NPeWVevydcVNzLsOb/3DtWSdGNT4oVNNFbkZWesE/JE
 1TigBVMKuc05O/kAzhfNfd40haI5/0lsdxnVQPbili7myIa9qiw4gPtSKKjqaZ0prBWF
 4Nr3BCWBVl9JNeyt4yLsaxK55R9EjtG+5HsxF50WPforM0PUy+5M4zNyAut+apZrb6Qp
 Xn7A==
X-Gm-Message-State: AOAM530pyABHCJfAPQA03jaZcqoqMYrvjJeiStOOkWlZnLd12keiFYY3
 0uihLrCHtRqqyJ+jUMrSwdkctRzvAghD3gsSAHz4RQ==
X-Google-Smtp-Source: ABdhPJzpn9AFegBGAc6hSHs32D/rICSKIg83d9kNX18pdHMv4sc+bNUGW8DxMPkHxippxThQxRCE+eYOOHGJ82XYPv4=
X-Received: by 2002:a25:6a41:: with SMTP id f62mr7682373ybc.225.1600793713189; 
 Tue, 22 Sep 2020 09:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <MWHPR11MB004670BBADCA48F5EE9BE9C7F13E0@MWHPR11MB0046.namprd11.prod.outlook.com>
 <CACWQX82k+zN8ZgE6Fm+wEQWS4Fsnndy7vTaV4K8ChQL2QR_THA@mail.gmail.com>
 <MWHPR11MB0046AE288AB542281C042D96F13B0@MWHPR11MB0046.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0046AE288AB542281C042D96F13B0@MWHPR11MB0046.namprd11.prod.outlook.com>
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 22 Sep 2020 09:54:36 -0700
Message-ID: <CADfYTpF8+g8Fpo7dgy1n88ZKODQxHY4HXCJM2NZ98+OStX+4pg@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: "Khetan, Sharad" <sharad.khetan@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a2a75c05afe9d4ec"
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a2a75c05afe9d4ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We've also found something like a minimal image useful in the early stages
of bringing up OpenBMC on a new system.

On Mon, Sep 21, 2020 at 7:04 PM Khetan, Sharad <sharad.khetan@intel.com>
wrote:

>
>
> -----Original Message-----
> From: Ed Tanous <ed@tanous.net>
> Sent: Monday, September 21, 2020 8:06 AM
> To: Khetan, Sharad <sharad.khetan@intel.com>
> Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> Subject: Re: interest in a minimal image recipe
>
> On Thu, Sep 17, 2020 at 3:22 PM Khetan, Sharad <sharad.khetan@intel.com>
> wrote:
> >
> > Ed, welcome back .
>
>
> Thanks!  Glad to be here.
>
> >
> >
> > -----Original Message-----
> > From: openbmc
> > <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.org> On Behalf
> > Of Ed Tanous
> > Sent: Thursday, September 17, 2020 1:57 PM
> > To: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: Re: interest in a minimal image recipe
> >
> > On Tue, Sep 15, 2020 at 1:31 PM Brad Bishop <bradleyb@fuzziesquirrel.co=
m>
> wrote:
> > >
> > > I've heard a handful of times that meta-phosphor users often have to
> > > remove the latest feature added by default to obmc-phosphor-image.
> > >
> > > I have an RFC for an empty image that these users could bbappend and
> > > opt-in to specific image features instead of having to repeatedly
> > > opt-out.
> > >
> > > If you like the opt-in approach, please drop a +1 and/or review my
> patch:
> > >
> > > https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36516
> > >
> > > I bring this up now because I, and others have been adding new image
> > > features to obmc-phosphor-image (e.g. turned on by default), and I
> > > would like to start a discussion about what it means for an
> > > application to be in the OpenBMC github organization.  I would
> > > propose that it means it is enabled and turned on by default in
> obmc-phosphor-image.
> > >
> > > Looking forward to your thoughts.
> > >
> > > -brad
> >
> > As a general description, this sounds great, but as always the devil is
> in the details.  The biggest obstacle to this I see is that we'd need a
> policy and design around supporting mix-and-match on features, which I
> don't think we really have today. Today, most features don't mix and matc=
h
> well, one example of this being entity-manager requiring intel-ipmi-oem.
> Thus far for that simple example, nobody has stepped up to make it a
> generic yocto feature and separate out the code, despite pretty widesprea=
d
> adoption.  I think the idea that we're suddenly going to just start doing=
 a
> better job of feature separation because of a single patch is a little
> naive, and I'd really like to see the project make steps forward toward
> that before we create a minimal image.
> >
> > If we want to do this going forward, my personal opinion is that:
> > 1. Someone needs to go figure out an example for one non-trival, cross
> application feature with multiple options, and get yocto sorted such that
> said "feature" enables the right component options.  Entity manager might
> be a good one, phosphor-webui vs webui-vue might be another good one (I'm
> looking into this currently), or individual Redfish resources in bmcweb
> might be another.  There are a bunch of examples of this you could start
> with.
> > 2. Document a policy around what it means to be a "feature" including
> some relevant examples.  Is Redfish a feature?  Is IPMI a feature?  or ar=
e
> those just interfaces to access other features?  Do we need a hierarchy o=
f
> features?  When/where should we use DBus to determine feature enablement,
> and when should it be a compile option?  We've been very inconsistent abo=
ut
> these questions in the past, and it's part of the reason that adding
> "features" properly is hard.
> > 3. Someone needs to go through the user-facing clients (phosphor-ipmi,
> bmcweb, ect) as well as the recipes, and make sure command handlers are
> organized in such a way that they're enabled or disabled by feature, and =
we
> can successfully enable one feature at a time.  This will likely expose
> some interesting dependencies (like how IPMI commands have to be
> enabled/disabled by library) that we'll likely need to tackle.
> >
> >> If the above tasks just fall onto the subsystem maintainers, who now
> have to field the "I enabled X on my minimal build and it doesn't work"
> type bugs, that seems like a non-starter, and likely to cause more
> confusion than the current status quo.  If someone or group of someones i=
s
> willing to go do the work, I think it'd be a great benefit to the project=
,
> and something that would help a lot of people.  I'm happy to pitch in as
> well where I'm able.
> >
>
> >> All the issues (and considerations to resolve), you bring up are great=
.
> It will need policies, definitions, and categorizations as you point out.=
 I
> think it will take quite some time to get there and its unlikely that we
> will achieve perfection. So we may have to start with basic, add a bunch =
of
> things to make it a minimum BMC (I think the first step will be agree wha=
t
> those minimum feature set is), and then be able to add from there. It may
> not be very granular (as there will be interdependencies), but even if we
> have a few such configurations/combination of feature it will be useful f=
or
> someone to start with. I realize this doesn=E2=80=99t solve the problem f=
ully, but
> I think it's much less effort and hence easier to start with.
> >
> >
>
> >I like to think that's what I proposed, starting small, with 1 example o=
f
> how to do it "right", then building on it.  I'm not looking for perfectio=
n,
> but I'm looking for commitment that we'll continue to push this forward i=
n
> places where we haven't been that successful in the past.  If not, I thin=
k
> it has the potential to confuse what is already a complex and bifurcated
> build environment even further.
>
> >One minor thing to clarify:  I had imagined Brads proposal of a "minimum=
"
> BMC would have essentially nothing added, and would just be a kernel that
> boots, with no interfaces, services, or handling.  Is that what you were
> thinking?  I had not imagined that we would never "add a bunch of things"=
.
> If so, maybe I misunderstood what Brad proposed?
>
> It's already hashed out between Brad and you. Yes I was thinking about th=
e
> "basic BMC with no features added" (actually Brad's idea) to start with. =
I
> also hope to get a minimum featured BMC (instead of no features) at some
> point of time will be useful. Defining such a configuration will involve
> some subjectivity, but will be useful for newcomers to get something usef=
ul
> without a lot of effort (and bulk).
>
>
>

--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000a2a75c05afe9d4ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;ve also found something like a minimal image useful=
 in the early stages of bringing up OpenBMC on a new system.</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21,=
 2020 at 7:04 PM Khetan, Sharad &lt;<a href=3D"mailto:sharad.khetan@intel.c=
om">sharad.khetan@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
<br>
-----Original Message-----<br>
From: Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@t=
anous.net</a>&gt; <br>
Sent: Monday, September 21, 2020 8:06 AM<br>
To: Khetan, Sharad &lt;<a href=3D"mailto:sharad.khetan@intel.com" target=3D=
"_blank">sharad.khetan@intel.com</a>&gt;<br>
Cc: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=
=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;; OpenBMC Maillist &lt;<a hr=
ef=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozla=
bs.org</a>&gt;<br>
Subject: Re: interest in a minimal image recipe<br>
<br>
On Thu, Sep 17, 2020 at 3:22 PM Khetan, Sharad &lt;<a href=3D"mailto:sharad=
.khetan@intel.com" target=3D"_blank">sharad.khetan@intel.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Ed, welcome back .<br>
<br>
<br>
Thanks!=C2=A0 Glad to be here.<br>
<br>
&gt;<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc <br>
&gt; &lt;openbmc-bounces+sharad.khetan=3D<a href=3D"mailto:intel.com@lists.=
ozlabs.org" target=3D"_blank">intel.com@lists.ozlabs.org</a>&gt; On Behalf =
<br>
&gt; Of Ed Tanous<br>
&gt; Sent: Thursday, September 17, 2020 1:57 PM<br>
&gt; To: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" tar=
get=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<br>
&gt; Cc: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; Subject: Re: interest in a minimal image recipe<br>
&gt;<br>
&gt; On Tue, Sep 15, 2020 at 1:31 PM Brad Bishop &lt;<a href=3D"mailto:brad=
leyb@fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve heard a handful of times that meta-phosphor users often =
have to <br>
&gt; &gt; remove the latest feature added by default to obmc-phosphor-image=
.<br>
&gt; &gt;<br>
&gt; &gt; I have an RFC for an empty image that these users could bbappend =
and <br>
&gt; &gt; opt-in to specific image features instead of having to repeatedly=
 <br>
&gt; &gt; opt-out.<br>
&gt; &gt;<br>
&gt; &gt; If you like the opt-in approach, please drop a +1 and/or review m=
y patch:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phos=
phor/+/36516" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/meta-phosphor/+/36516</a><br>
&gt; &gt;<br>
&gt; &gt; I bring this up now because I, and others have been adding new im=
age <br>
&gt; &gt; features to obmc-phosphor-image (e.g. turned on by default), and =
I <br>
&gt; &gt; would like to start a discussion about what it means for an <br>
&gt; &gt; application to be in the OpenBMC github organization.=C2=A0 I wou=
ld <br>
&gt; &gt; propose that it means it is enabled and turned on by default in o=
bmc-phosphor-image.<br>
&gt; &gt;<br>
&gt; &gt; Looking forward to your thoughts.<br>
&gt; &gt;<br>
&gt; &gt; -brad<br>
&gt;<br>
&gt; As a general description, this sounds great, but as always the devil i=
s in the details.=C2=A0 The biggest obstacle to this I see is that we&#39;d=
 need a policy and design around supporting mix-and-match on features, whic=
h I don&#39;t think we really have today. Today, most features don&#39;t mi=
x and match well, one example of this being entity-manager requiring intel-=
ipmi-oem.=C2=A0 Thus far for that simple example, nobody has stepped up to =
make it a generic yocto feature and separate out the code, despite pretty w=
idespread adoption.=C2=A0 I think the idea that we&#39;re suddenly going to=
 just start doing a better job of feature separation because of a single pa=
tch is a little naive, and I&#39;d really like to see the project make step=
s forward toward that before we create a minimal image.<br>
&gt;<br>
&gt; If we want to do this going forward, my personal opinion is that:<br>
&gt; 1. Someone needs to go figure out an example for one non-trival, cross=
 application feature with multiple options, and get yocto sorted such that =
said &quot;feature&quot; enables the right component options.=C2=A0 Entity =
manager might be a good one, phosphor-webui vs webui-vue might be another g=
ood one (I&#39;m looking into this currently), or individual Redfish resour=
ces in bmcweb might be another.=C2=A0 There are a bunch of examples of this=
 you could start with.<br>
&gt; 2. Document a policy around what it means to be a &quot;feature&quot; =
including some relevant examples.=C2=A0 Is Redfish a feature?=C2=A0 Is IPMI=
 a feature?=C2=A0 or are those just interfaces to access other features?=C2=
=A0 Do we need a hierarchy of features?=C2=A0 When/where should we use DBus=
 to determine feature enablement, and when should it be a compile option?=
=C2=A0 We&#39;ve been very inconsistent about these questions in the past, =
and it&#39;s part of the reason that adding &quot;features&quot; properly i=
s hard.<br>
&gt; 3. Someone needs to go through the user-facing clients (phosphor-ipmi,=
 bmcweb, ect) as well as the recipes, and make sure command handlers are or=
ganized in such a way that they&#39;re enabled or disabled by feature, and =
we can successfully enable one feature at a time.=C2=A0 This will likely ex=
pose some interesting dependencies (like how IPMI commands have to be enabl=
ed/disabled by library) that we&#39;ll likely need to tackle.<br>
&gt;<br>
&gt;&gt; If the above tasks just fall onto the subsystem maintainers, who n=
ow have to field the &quot;I enabled X on my minimal build and it doesn&#39=
;t work&quot; type bugs, that seems like a non-starter, and likely to cause=
 more confusion than the current status quo.=C2=A0 If someone or group of s=
omeones is willing to go do the work, I think it&#39;d be a great benefit t=
o the project, and something that would help a lot of people.=C2=A0 I&#39;m=
 happy to pitch in as well where I&#39;m able.<br>
&gt;<br>
<br>
&gt;&gt; All the issues (and considerations to resolve), you bring up are g=
reat. It will need policies, definitions, and categorizations as you point =
out. I think it will take quite some time to get there and its unlikely tha=
t we will achieve perfection. So we may have to start with basic, add a bun=
ch of things to make it a minimum BMC (I think the first step will be agree=
 what those minimum feature set is), and then be able to add from there. It=
 may not be very granular (as there will be interdependencies), but even if=
 we have a few such configurations/combination of feature it will be useful=
 for someone to start with. I realize this doesn=E2=80=99t solve the proble=
m fully, but I think it&#39;s much less effort and hence easier to start wi=
th.<br>
&gt;<br>
&gt;<br>
<br>
&gt;I like to think that&#39;s what I proposed, starting small, with 1 exam=
ple of how to do it &quot;right&quot;, then building on it.=C2=A0 I&#39;m n=
ot looking for perfection, but I&#39;m looking for commitment that we&#39;l=
l continue to push this forward in places where we haven&#39;t been that su=
ccessful in the past.=C2=A0 If not, I think it has the potential to confuse=
 what is already a complex and bifurcated build environment even further.<b=
r>
<br>
&gt;One minor thing to clarify:=C2=A0 I had imagined Brads proposal of a &q=
uot;minimum&quot; BMC would have essentially nothing added, and would just =
be a kernel that boots, with no interfaces, services, or handling.=C2=A0 Is=
 that what you were thinking?=C2=A0 I had not imagined that we would never =
&quot;add a bunch of things&quot;.=C2=A0 If so, maybe I misunderstood what =
Brad proposed?<br>
<br>
It&#39;s already hashed out between Brad and you. Yes I was thinking about =
the &quot;basic BMC with no features added&quot; (actually Brad&#39;s idea)=
 to start with. I also hope to get a minimum featured BMC (instead of no fe=
atures) at some point of time will be useful. Defining such a configuration=
 will involve some subjectivity, but will be useful for newcomers to get so=
mething useful without a lot of effort (and bulk).<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"73"><col width=3D"7"><col width=3D"111"=
><col width=3D"7"><col width=3D"122"><col width=3D"7"><col width=3D"71"></c=
olgroup><tbody><tr style=3D"height:15pt"><td style=3D"border-top:1.5pt soli=
d rgb(213,15,37);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,10=
2,102);background-color:transparent;font-weight:700;vertical-align:baseline=
;white-space:pre-wrap">Nancy Yuen</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(255,0,0)=
;background-color:transparent;font-weight:700;vertical-align:baseline;white=
-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt sol=
id rgb(51,105,232);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,=
102,102);background-color:transparent;font-weight:700;vertical-align:baseli=
ne;white-space:pre-wrap">Google Platforms=C2=A0</span></p></td><td style=3D=
"border-top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hid=
den"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(61,133,198);background-color:transparent;font-weight:700;vertical-ali=
gn:baseline;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"bor=
der-top:1.5pt solid rgb(0,153,57);vertical-align:middle;overflow:hidden"><p=
 dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif=
;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertic=
al-align:baseline;white-space:pre-wrap"><a href=3D"mailto:yuenn@google.com"=
 target=3D"_blank">yuenn@google.com</a></span></p></td><td style=3D"border-=
top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p =
dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
153,57);background-color:transparent;font-weight:700;vertical-align:baselin=
e;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(238,178,17);vertical-align:middle;overflow:hidden"><p dir=3D"=
ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:r=
gb(102,102,102);background-color:transparent;font-weight:700;vertical-align=
:baseline;white-space:pre-wrap">Google LLC</span></p></td></tr></tbody></ta=
ble></div></span></div></div>

--000000000000a2a75c05afe9d4ec--
