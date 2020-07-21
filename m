Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D6A228A67
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 23:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBB9w28M1zDqlX
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 07:12:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YPIW2BuL; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBB8r3BXXzDqYB
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 07:11:06 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id y17so10659572ybm.12
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMuR1m07Bq7p3mSqUFdp0TiA09kLZ8jteoEm2sxzUno=;
 b=YPIW2BuL4WzE3yr9Y+kG+1aqdfNM0WcXnwOWQ4oJmevyITBb748S8pc1BbUm1OK/9W
 tjk5+NI68ws674UMMLVQK8LhPy4H6Z3AMdnhVdUcBYdm9bhEW8v4MGGypU4+EQHGXdvS
 gSScn+KcwdSrl1kw0AiJkscMduKz1I6/PhxtvQStV2IUSHvFrj0G5//CrQBrXwMMb8J8
 Y3ZUwr5fw/XpVykyDf/syjJtAJue3GVShcz31tT1BiU2lU1XYoEiWe7TnzhEPhzUqLJW
 p4IBiV8uDrJF8Hzo0KFkPq/mz7JzgzZwChk3zwtIZsvktZfI2PvPnS5IFZNVEYvIdy5P
 vveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMuR1m07Bq7p3mSqUFdp0TiA09kLZ8jteoEm2sxzUno=;
 b=kj/tlEEOuJAr8MFKwRXJBEEL0c94W6knnPJXmmSsAiRl6Yz57h28vQLusJtPNd8J8x
 F6/NHOUiI9AF4ctgyaZLJIngQs9pexFUgrgb4ivt7r2i6AQm1CAzoccOCI9d7YbM+v4K
 8XGayLuLwbHiPVvCtI95ZrGBHsDR5AB8VWa4MggarkYpGkzl06T0ouk9KgAdUS6l5orD
 GFokq8GIDEdYcYIMP45MFeS+H8jzOu6uU18UpadWbNqsBx29BVqRuj4rF79JQ+LuWr+q
 G2WSd1qDROD8vXPDoRbRFnCCBVEXc632QCiBqZZl4ne7/8YB3c36dfLh1bjShhtL/4dW
 4KDw==
X-Gm-Message-State: AOAM5330oFUi6z4xJxLBQb8Cca1F9iJYrkMdn+gpf/6Ls+RvR7GXwx8t
 53KxzS7596Ko/qtZKdBJ3d+gqA7qz0a+IEGGfGB1mw1HE4k=
X-Google-Smtp-Source: ABdhPJyekl/duzcDBMfXdNLI4v3RvP+BBX/4u+AzWZ/33yEZt5eRiDv46Lz2m5P+Ugi7aeMxbRpw17/1/SueLq8hFmI=
X-Received: by 2002:a25:3484:: with SMTP id
 b126mr43319322yba.225.1595365860571; 
 Tue, 21 Jul 2020 14:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
 <20200721151711.GK3922@heinlein>
In-Reply-To: <20200721151711.GK3922@heinlein>
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 21 Jul 2020 14:10:23 -0700
Message-ID: <CADfYTpF6k5ftS2NPQJPkfqV8dHGjhO6a3ga68p_EzBddBnk9+w@mail.gmail.com>
Subject: Re: What do you want in a package manager?
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000068671105aafa0f66"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000068671105aafa0f66
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 21, 2020 at 8:17 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Jul 21, 2020 at 12:57:00AM -0700, Nancy Yuen wrote:
> > I'm looking into package management for BMCs in our fleet.  I'm wondering
> > who else is interested in this, does it make sense for OpenBMC.  What
> kind
> > of features are important?  What kind of package format (rpm, deb,
> > something else)?
>
> We've similarly started playing with package management at Facebook.
> One of the reasons for us doing it is that we still have Python
> installed in the image and are running out of space, so we're moving
> some of the debug tools into packages that can be side-loaded as needed.
> We've also implemented 'ptest', which allows you to create packages
> containing your unit tests and run them on a real machine.
>

Our first use case is loading fw packages for other system components
managed by the BMC, so not code directly run by the BMC.  But I can see it
extending to other things, daemons we want to update independing etc.  We
are also running out of space, exploring secondary storage options.  I
think that's primarily where the package manager will be managing packages
in Google systems.  The BMC flash will have a basic core firmware image,
and load other packages from secondary storage.

How far have you gotten with package management?  What have you considered?


>
> We found that we had to switch to ipkg instead of rpm because the extra
> things rpm needed were too big to fit.  I recall it was on the order of
> 5MB of content needed to make rpm work and ipkg was almost free. [1]
>

Today Google has a custom package format but I want to see what other
options make sense in the wider OpenBMC community.  I'm not familiar with
ipkg so I'll take a look.


> One issue you'll want to be aware of, that many of our recipes have, is
> that they often are missing:
>
>     PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> This causes the package to be specified as relevant for a generic ARM
> system, matching the architecture revision of your underlying AST2xxx
> chip, rather than your particular machine.  Any package which can be
> customized for a particular machine (such as by machine-specific compile
> flags, or YAML/JSON files) should have the above variable set so that a
> package compiled for Witherspoon cannot be installed onto a Zaius.
>
> If you look under your Yocto build tree under `tmp/work` you'll see
> `arm1176jzs-openbmc-linux-gnueabi` and
> `witherspoon-openbmc-linux-gnueabi`.  I suspect at least most of the
> phosphor-* packages under the arm1176jzs subdirectory are likely candidates
> for having this PACKAGE_ARCH fixed.  We might want to simply add it to
> any '.bbappend' we do in a machine layer.
>

I wasn't aware of that, thanks!


>
> 1.
> https://github.com/facebook/openbmc/commit/43430d38dfd0e5557f96940547594e01373f863e
>
> --
> Patrick Williams
>


----------
Nancy

--00000000000068671105aafa0f66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21, 2020 at 8:17 AM Patri=
ck Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patr=
ick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, Jul 21, 2020 at 12:57:00AM -0700, Nancy Yuen wrote:<br=
>
&gt; I&#39;m looking into package management for BMCs in our fleet.=C2=A0 I=
&#39;m wondering<br>
&gt; who else is interested in this, does it make sense for OpenBMC.=C2=A0 =
What kind<br>
&gt; of features are important?=C2=A0 What kind of package format (rpm, deb=
,<br>
&gt; something else)?<br>
<br>
We&#39;ve similarly started playing with package management at Facebook.<br=
>
One of the reasons for us doing it is that we still have Python<br>
installed in the image and are running out of space, so we&#39;re moving<br=
>
some of the debug tools into packages that can be side-loaded as needed.<br=
>
We&#39;ve also implemented &#39;ptest&#39;, which allows you to create pack=
ages<br>
containing your unit tests and run them on a real machine.<br></blockquote>=
<div><br></div><div>Our first use case is loading fw packages for other sys=
tem components managed by the BMC, so not code directly run by the BMC.=C2=
=A0 But I can see it extending to other things, daemons we want to update i=
ndepending etc.=C2=A0 We are also running out of space, exploring secondary=
 storage options.=C2=A0 I think that&#39;s primarily where the package mana=
ger will be managing packages in Google systems.=C2=A0 The BMC flash will h=
ave a basic core firmware image, and load other packages from secondary sto=
rage.</div><div><br></div><div>How far have you gotten with package managem=
ent?=C2=A0 What have you considered?</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
We found that we had to switch to ipkg instead of rpm because the extra<br>
things rpm needed were too big to fit.=C2=A0 I recall it was on the order o=
f<br>
5MB of content needed to make rpm work and ipkg was almost free. [1]<br></b=
lockquote><div><br></div><div>Today Google has a custom package format but =
I want to see what other options make sense in the wider OpenBMC community.=
=C2=A0 I&#39;m not familiar with ipkg so I&#39;ll take a look.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
One issue you&#39;ll want to be aware of, that many of our recipes have, is=
<br>
that they often are missing:<br>
<br>
=C2=A0 =C2=A0 PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
This causes the package to be specified as relevant for a generic ARM<br>
system, matching the architecture revision of your underlying AST2xxx<br>
chip, rather than your particular machine.=C2=A0 Any package which can be<b=
r>
customized for a particular machine (such as by machine-specific compile<br=
>
flags, or YAML/JSON files) should have the above variable set so that a<br>
package compiled for Witherspoon cannot be installed onto a Zaius.<br>
<br>
If you look under your Yocto build tree under `tmp/work` you&#39;ll see<br>
`arm1176jzs-openbmc-linux-gnueabi` and<br>
`witherspoon-openbmc-linux-gnueabi`.=C2=A0 I suspect at least most of the<b=
r>
phosphor-* packages under the arm1176jzs subdirectory are likely candidates=
<br>
for having this PACKAGE_ARCH fixed.=C2=A0 We might want to simply add it to=
<br>
any &#39;.bbappend&#39; we do in a machine layer.<br></blockquote><div><br>=
</div><div>I wasn&#39;t aware of that, thanks!</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
1. <a href=3D"https://github.com/facebook/openbmc/commit/43430d38dfd0e5557f=
96940547594e01373f863e" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/facebook/openbmc/commit/43430d38dfd0e5557f96940547594e01373f863e</a><b=
r>
<br>
-- <br>
Patrick Williams<br></blockquote><div><br></div><br clear=3D"all"><div><div=
 dir=3D"ltr">----------<br></div></div><div>Nancy=C2=A0</div></div></div>

--00000000000068671105aafa0f66--
