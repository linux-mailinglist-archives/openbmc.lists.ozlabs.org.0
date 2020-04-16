Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CC1AD261
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 23:56:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Cjj35ZJzDrPN
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 07:56:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fNcp8rMt; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493CfT0nxhzDrfV
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 07:53:52 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id h25so9492139lja.10
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 14:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgJIivIXNthxjV3Oe2d6vUH4/hPy6hgJ+jStmZm5PCE=;
 b=fNcp8rMtiYV4vMq4/F1zrIGTKHSNmLBLGyicni0WCrk63VS7e6D5OCUKjs737ls41E
 bWBnsasXMq3lUz+wmbQcliGK4ZetF906AMYQhptyVG3npfa5rKdsJ1LJhXOxnlysCAwN
 7wt5C3gruZnlf8Oa6uW+2ml3IQDFtDo+Ox5SnXwqrMZg98vMyi6vRdmb+lfPTYAKADVL
 DhHayc3SMEv33PVjsax4n0XHeS5h9sLhJz+TKZeWW0sM0k+YZKa/hd/5arZv2uxxz/bX
 /TX601lA7THPHlZMHT/ojr4ECIUJB0K2NKHnaKIuhmGcdsgmcKqZ+74xBiCdDXF1nLIg
 Q2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgJIivIXNthxjV3Oe2d6vUH4/hPy6hgJ+jStmZm5PCE=;
 b=jL5vzDAatcHwCg9XmitWa1Dxn/JTcw4jNW1/Q8xpRuMp+rltLgtnObnzCTxliE1Aue
 XJBRPS1YWsm74cRSMflEzlK39dDrms/IHL5tj+ZKD9k5FDjHd9MoFPhcmcnd9WpzojkZ
 8lh0LbboRQrl3lBmBAsfDsnjCAOwas+xxP6hDPmyeqYwFZDF24vZJkTm2OrCntvJ6DGA
 aHByTS37sup6fenN1CFBNdwZdy06EVuaxlBT1U1htxrINKSa54SDSxIQzaRmbowdWD7q
 YmXIFO2hxg/h4UylF1YO6zVKXmQSm5D5sv7X2xqsUCzsK1BoiP/mGhNG0ZAQbmMMUlqB
 X6qA==
X-Gm-Message-State: AGi0PuZUR5bvjpPhuYf44zBpmhxkY3xPBOOGxzGW191+7Ii0ALsBcblB
 JA94Hq+9b1AWM97pFhSar4tTobQi5SPiQJ1wvGs3cg==
X-Google-Smtp-Source: APiQypLWDLQ2YVKDEENpc1GrCetmJIQV0d75gAEsRNDiPoJrUDDqokHKujV8o8VJ+hZ23GiN2iNXvQMSGFW7MniRU+o=
X-Received: by 2002:a2e:8884:: with SMTP id k4mr106924lji.267.1587074025261;
 Thu, 16 Apr 2020 14:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <e77335c2-97a8-42aa-ad93-394fe6f9b420@www.fastmail.com>
In-Reply-To: <e77335c2-97a8-42aa-ad93-394fe6f9b420@www.fastmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 16 Apr 2020 14:53:33 -0700
Message-ID: <CAH1kD+YQ+Am_uwb0vo0mReq8FvBLuxKnxoZi7x_Xfap3SYQFzg@mail.gmail.com>
Subject: Re: Proposal: how to make incompatible changes
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000826e3805a36f77d8"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000826e3805a36f77d8
Content-Type: text/plain; charset="UTF-8"

Thank you for bringing this up.  I really think that some policy discussion
is useful here.  I also 100% agree that forward compatibility should be our
goal here.

When I think about incompatible changes I tend to group them into one of
two categories:
1) A design change goes in the opposite direction than what previous
versions offered, and the old feature needs to be shut off.
2) New features/designs are made, and supporting several different options
at the same time is difficult

Security changes are often in the former category. I remember a few months
back there was a thread about removing the DBus rest interface as a default
service for security reasons.  Brad's point at the time was (I may be
paraphrasing here) that we need to maintain support for any currently
supported use case or be able to support their migration.

Now another point in that thread was that some users are going to care more
about security than compatibility, and vice versa. One possible solution is
to create a second secure phosphor reference implementation.

Here is the thread I'm talking about:
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html

Having two reference implementations (profiles, tracks, or whatever we want
to call it) isn't without risk.  If things ever diverge too far, then the
overhead might be larger than supporting forward compatibility.  However, I
would like to get to a place where changes of that sort can be made
accessible to early adopters, combined with a clearly communicated
deprecation/migration plan.


On Wed, Apr 15, 2020 at 10:01 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> > Applicability.
> >
> > These guidelines are for the BMC's "intended external user interfaces".
> > For example, its management interfaces including its web server and all
> > REST APIs.  I haven't given much thought to the BMC/host interfaces or
> > interfaces internal to the BMC.  IMHO, it is less important to maintain
> > compatibility in these areas.
>
> Lets split this. My feelings are
>
> 1. Inband (BMC/Host) interfaces are in the same class as "intended
> external user interfaces" and therefore should not have incompatible
> changes unless _absolutely_ necessary. What we implement here should
> have passed through a specification process under e.g. DMTF.
>
> 2. Interfaces between applications on the BMC (e.g. D-Bus interfaces)
> is the class where compatibility is less critical, on systems that do not
> expose the D-Bus interfaces via REST. However, while any system exists
> that exposes the D-Bus interfaces via REST we must constrain changes
> to these interfaces as well.
>
> > For example, if you need an incompatible
> > change in an internal interface, you have a smaller set of users who
> > ought to be active in the project, and can give you feedback and adapt
> > within a release cycle.
> >
>
> This is true for interfaces between BMC components, it's not true of the
> host firmware interfaces, hence my split above.
>
> When we remove the ability to directly access the D-Bus interfaces via
> REST we will gain a lot more freedom as the D-Bus interfaces then truly
> become internal.
>
> Andrew
>

--000000000000826e3805a36f77d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for bringing this up.=C2=A0 I really think that =
some policy discussion is useful here.=C2=A0 I also 100% agree that forward=
=C2=A0compatibility=C2=A0should be our goal here.<div><br></div><div>When I=
 think about incompatible changes I tend to group them into one of two cate=
gories:</div><div><div>1) A design change goes in the opposite direction th=
an what previous versions offered, and the old feature needs to be shut off=
.</div><div></div></div><div>2) New features/designs are made, and supporti=
ng several different options at the same time is difficult</div><div><br></=
div><div>Security changes are often in the former category. I remember a fe=
w months back there was a thread about removing the DBus rest interface as =
a default service for security reasons.=C2=A0 Brad&#39;s point at the time =
was (I may be paraphrasing here) that we need to maintain support for any c=
urrently supported use case or be able to support their=C2=A0migration.</di=
v><div><br></div><div>Now another point in that thread was that some users =
are going to care more about security than compatibility, and vice versa. O=
ne possible solution is to create a second secure phosphor reference implem=
entation.</div><div><br></div><div>Here is the thread I&#39;m talking about=
:=C2=A0<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-February/=
020491.html">https://lists.ozlabs.org/pipermail/openbmc/2020-February/02049=
1.html</a></div><div><br></div><div>Having two reference implementations (p=
rofiles, tracks, or whatever we want to call it) isn&#39;t without risk.=C2=
=A0 If things ever diverge too far, then the overhead might be larger than =
supporting forward compatibility.=C2=A0 However, I would like to get to a p=
lace where changes of that sort can be made accessible to early adopters, c=
ombined with a clearly communicated deprecation/migration plan.</div><div><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Apr 15, 2020 at 10:01 PM Andrew Jeffery &lt;<a href=3D"mai=
lto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; Applicability.<b=
r>
&gt; <br>
&gt; These guidelines are for the BMC&#39;s &quot;intended external user in=
terfaces&quot;.=C2=A0 <br>
&gt; For example, its management interfaces including its web server and al=
l <br>
&gt; REST APIs.=C2=A0 I haven&#39;t given much thought to the BMC/host inte=
rfaces or <br>
&gt; interfaces internal to the BMC.=C2=A0 IMHO, it is less important to ma=
intain <br>
&gt; compatibility in these areas.=C2=A0<br>
<br>
Lets split this. My feelings are<br>
<br>
1. Inband (BMC/Host) interfaces are in the same class as &quot;intended<br>
external user interfaces&quot; and therefore should not have incompatible<b=
r>
changes unless _absolutely_ necessary. What we implement here should<br>
have passed through a specification process under e.g. DMTF.<br>
<br>
2. Interfaces between applications on the BMC (e.g. D-Bus interfaces)<br>
is the class where compatibility is less critical, on systems that do not<b=
r>
expose the D-Bus interfaces via REST. However, while any system exists<br>
that exposes the D-Bus interfaces via REST we must constrain changes<br>
to these interfaces as well.<br>
<br>
&gt; For example, if you need an incompatible <br>
&gt; change in an internal interface, you have a smaller set of users who <=
br>
&gt; ought to be active in the project, and can give you feedback and adapt=
 <br>
&gt; within a release cycle.<br>
&gt; <br>
<br>
This is true for interfaces between BMC components, it&#39;s not true of th=
e<br>
host firmware interfaces, hence my split above.<br>
<br>
When we remove the ability to directly access the D-Bus interfaces via<br>
REST we will gain a lot more freedom as the D-Bus interfaces then truly<br>
become internal.<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000826e3805a36f77d8--
