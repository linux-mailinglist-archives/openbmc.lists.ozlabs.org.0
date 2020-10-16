Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC147290D11
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 23:02:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCds75LzwzDqyh
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 08:02:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Es2M3hN2; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCdrN29XQzDqwr
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 08:02:11 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id n6so5508144ioc.12
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 14:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nXjbAe0wRBVxaETJ8WW5qkc61RZFAgGimAVxNiK/sSo=;
 b=Es2M3hN2aKXPn7A/wprCJma4QcgaPor+RwGD4yN91nw3R6Wh0UaakYNvq414vhzjv7
 UjwxGa6hADoqrhETbwHm/JKdCtwVDrBfb6mbkKejzCvhLaFNryrBxbiU9rwYaDjq8qjz
 SkyDLWPLanRtSQiVROHcbuRhIfb/M78g1F3uHBHpdNwxbfAUch5hM/6MmTVlFUCPbvmE
 j0IW8i/kEdi+C4WTtqLezk4++IkbcrcvvjKPI2xbaX9xKNR1tePu21k2Cz4KOW6BPdoW
 ouRCQhdc2QDlusU1Hbb6qn+5vDdGp+usX0WFlJzMkXhM/bkRY9vB+TXyYYDilkK85Jsk
 u4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nXjbAe0wRBVxaETJ8WW5qkc61RZFAgGimAVxNiK/sSo=;
 b=mxlbp8Vtxcw744Rpf7usM2jG22oxD5I1hbfz/Dn7vP13Gt/ShdawawGrthqCK1VODA
 WmS8gTrka/nDTYtdsEJGB/qMwwac3/wbDO0MGpYY079Hf9RP4Xcbta8NlV+vrghvHHv4
 gmsYJ8bvrkzEgeXmEec6HCidrLqMoxtVIbVi4Kbtglul6GhSe5dbsusExehnzMgFVhBr
 sKJ6vk6R/DYgjJ0OhQngu3IjpM+8OJI37uI53W8QzZalT00O54OpQ9jnakDC+Gb1hvWb
 HMaodgZOnfRTN8u2zqM3bZFgJyeYdG+kXvvfxTDDrq4pvBJ4g170cFnqA4pbMQ+hnsyU
 5iRg==
X-Gm-Message-State: AOAM531Z9JX++aTY28b+YE59xNwLXPe38HOTFp/iOy/NIxRUeQRyjtbm
 8LnOPIkLPfSnsK6fuDRN/4PzCadU/9kBgCldwGhzQg==
X-Google-Smtp-Source: ABdhPJxJKDnMco6q9BZQzCIuCkz5xw432huDVU+mHzpLaWfcGyP8mlDG2vDdMn9TYhc6IF0Cz6IzVqxEXH1xcNXt/nQ=
X-Received: by 2002:a6b:9156:: with SMTP id t83mr3799718iod.91.1602882127542; 
 Fri, 16 Oct 2020 14:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
 <20201016202542.GB3614@heinlein>
In-Reply-To: <20201016202542.GB3614@heinlein>
From: Anton Kachalov <rnouse@google.com>
Date: Fri, 16 Oct 2020 23:01:56 +0200
Message-ID: <CADVsX8_Z1GHkw0Z8-2jFGrFVVkMnMkK_rVdLJy8TQ=RiK13-dQ@mail.gmail.com>
Subject: Re: /etc/migration.d
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000d4a4b705b1d0138b"
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

--000000000000d4a4b705b1d0138b
Content-Type: text/plain; charset="UTF-8"

Hello, Patrick.

On Fri, 16 Oct 2020 at 22:25, Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Oct 14, 2020 at 08:47:57PM +0200, Anton Kachalov wrote:
> > With moving from root-only environment to unprivileged users' space, we
> > need to ensure a smooth transition. To achieve that we need a mechanism
> for
> > one-shot per-package scripts that would take care of migration. That's
> not
> > only about groups & owners, but a general approach. It's similar to
> > firstboot, but has a different purpose.
> >
> > I'm going to prototype a robust / naive solution to start a service
> before
> > everything else in the system with a condition (non-empty
> /etc/migration.d)
> > and iterate through all files. Each script has to run at list with "set
> -e"
> > to bail out on failures. If the script succeeded -- it will be removed.
> >
> > The tricky part is: what if the script fails? Keep it, ignore the failure
> > and proceed with others and then boot the system? Or proceed other
> scripts
> > as well and then enter some "failure state"?
>
> Hi Anton,
>
> I have some high-level questions / ideas about this.
>
> * Would these migrations be restricted to just useradd/groupadd
> operations?  Or
>   are you trying to create a general framework for "upgrade scripts"?
>

This might be a general framework.


>
> * Have you looked at any existing support by Yocto or systemd to provide
>   what you need?  Yocto has USERADD_PACKAGES, postinst_intercept.
>   Systemd has firstboot.  There might be other mechanisms I'm not
>   remembering as well.  (I guess you mentioned firstboot).  There is
>   hacky override to install a "@reboot" directive in the crontab.
>

afaik, systemd's firstboot is only about to run special units right after
installation. Once the system is configured, the firstboot units wouldn't
be executed anymore.
This thread I've started to find possible solutions.
The postinst chunks executed during the image formation (as a part of rpm /
deb packages' scripts).


>
> * How long would a "migration" be kept around for?  Are we expecting
>   that packages provide them forever?
>

That is a good question because we don't know how old the firmware is being
upgraded. I suppose, that like one-two-whatever release cycles. Then the
update process should be either using an intermediate firmware version or
forcing the non-volatile storage to be wiped. Regardless of the migration
scripts, we might have some incompatibilities between two releases that
will require NV (overlayfs back partition) cleanup.


>
> * How do we handle downgrades?  Some systems are set up with a "golden
>   image" which is locked at manufacturing.  Maybe simple
>   useradd/groupadd calls are innately backwards compatible but I worry
>   about a general framework falling apart.
>

In general, that's an issue. Golden-image downgrades should be allowed
within a compatible release branch (without wiping data). As above,
golden-images might be incompatible and wouldn't allow downgrades.

The particular migration from root-only users to unprivileged users should
be one way without wiping data. If the downgrade is requested, then it will
be required to wipe the data.


>
> * Is there some mechanism we should do to run the migrations as part of
>   the upgrade process instead of waiting to the next boot?  The
>   migrations could be included in the image tarball and thus be signed.
>   That would save time on reboots for checking if the migrations are
>   done.
>

Yes, it could be done as a set of scripts during the update process. That
is one of the possible approaches. This also could be an approach for
downgrades. I'm only worrying about the effort to support downgrades from
random version to random version. The least effort with incompatible
upgrades / downgrades is to keep special transition firmware allowing
downgrade from current Golden version to the previous Golden version from
incompatible branch. For upgrades the latest version of transition firmware
might not be golden. This will require a separate repo with an
auto-generated set of scripts to be used to build transition fws.



>
> * Rather than have a single migration script that runs before everything
>   else (and is thus serial), you might create a template service
>   (phosphor-migration-@.service) that can be depended on by the services
>   needing the migration results.  (ie. service foo depends on
>   migration-foo).
>

While migration is one-off, it might be safer to run serial one by one.


>
> * In a follow up email you mentioned something about hashing.  I was
>   going to ask how you know when a particular migration has been
>   executed.  Maybe there are some tricks of recording hash values in
>   the RWFS could prevent multiple executions.
>

We can track the succeeded scripts by touching some file in a directory
like /var/lib/migration (e.g. create a file named as sha-sum of the runned
script).


>
> --
> Patrick Williams
>

--000000000000d4a4b705b1d0138b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, Patrick.</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, 16 Oct 2020 at 22:25, Patrick =
Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
Oct 14, 2020 at 08:47:57PM +0200, Anton Kachalov wrote:<br>
&gt; With moving from root-only environment to unprivileged users&#39; spac=
e, we<br>
&gt; need to ensure a smooth transition. To achieve that we need a mechanis=
m for<br>
&gt; one-shot per-package scripts that would take care of migration. That&#=
39;s not<br>
&gt; only about groups &amp; owners, but a general approach. It&#39;s simil=
ar to<br>
&gt; firstboot, but has a different purpose.<br>
&gt; <br>
&gt; I&#39;m going to prototype a robust / naive solution to start a servic=
e before<br>
&gt; everything else in the system with a condition (non-empty /etc/migrati=
on.d)<br>
&gt; and iterate through all files. Each script has to run at list with &qu=
ot;set -e&quot;<br>
&gt; to bail out on failures. If the script succeeded -- it will be removed=
.<br>
&gt; <br>
&gt; The tricky part is: what if the script fails? Keep it, ignore the fail=
ure<br>
&gt; and proceed with others and then boot the system? Or proceed other scr=
ipts<br>
&gt; as well and then enter some &quot;failure state&quot;?<br>
<br>
Hi Anton,<br>
<br>
I have some high-level questions / ideas about this.<br>
<br>
* Would these migrations be restricted to just useradd/groupadd operations?=
=C2=A0 Or<br>
=C2=A0 are you trying to create a general framework for &quot;upgrade scrip=
ts&quot;?<br></blockquote><div><br></div><div>This might be a general frame=
work.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
* Have you looked at any existing support by Yocto or systemd to provide<br=
>
=C2=A0 what you need?=C2=A0 Yocto has USERADD_PACKAGES, postinst_intercept.=
<br>
=C2=A0 Systemd has firstboot.=C2=A0 There might be other mechanisms I&#39;m=
 not<br>
=C2=A0 remembering as well.=C2=A0 (I guess you mentioned firstboot).=C2=A0 =
There is<br>
=C2=A0 hacky override to install a &quot;@reboot&quot; directive in the cro=
ntab.<br></blockquote><div><br></div><div>afaik, systemd&#39;s firstboot is=
 only about to run special units right after installation. Once the system =
is configured, the firstboot units wouldn&#39;t be executed anymore.</div><=
div>This thread I&#39;ve started to find possible solutions.</div><div>The =
postinst chunks executed during the image formation (as a part of rpm / deb=
 packages&#39; scripts).</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
* How long would a &quot;migration&quot; be kept around for?=C2=A0 Are we e=
xpecting<br>
=C2=A0 that packages provide them forever?<br></blockquote><div><br></div><=
div>That is a good question because we don&#39;t know how old the firmware =
is being upgraded. I suppose, that like one-two-whatever release cycles. Th=
en the update process should be either using an intermediate firmware versi=
on or forcing the non-volatile storage to be wiped. Regardless of the migra=
tion scripts, we might have some incompatibilities between two releases tha=
t will require NV (overlayfs back partition) cleanup.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
* How do we handle downgrades?=C2=A0 Some systems are set up with a &quot;g=
olden<br>
=C2=A0 image&quot; which is locked at manufacturing.=C2=A0 Maybe simple<br>
=C2=A0 useradd/groupadd calls are innately backwards compatible but I worry=
<br>
=C2=A0 about a general framework falling apart.<br></blockquote><div><br></=
div><div>In general, that&#39;s an issue. Golden-image downgrades should be=
 allowed within a compatible release branch (without wiping data). As above=
, golden-images might be incompatible and wouldn&#39;t allow downgrades.</d=
iv><div><br></div><div>The particular migration from root-only users to unp=
rivileged users should be one way without wiping data. If the downgrade is =
requested, then it will be required to wipe the data.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
* Is there some mechanism we should do to run the migrations as part of<br>
=C2=A0 the upgrade process instead of waiting to the next boot?=C2=A0 The<b=
r>
=C2=A0 migrations could be included in the image tarball and thus be signed=
.<br>
=C2=A0 That would save time on reboots for checking if the migrations are<b=
r>
=C2=A0 done.<br></blockquote><div><br></div><div>Yes, it could be done as a=
 set of scripts during the update process. That is one of the possible appr=
oaches. This also could be an approach for downgrades. I&#39;m only worryin=
g about the effort to support downgrades from random version to random vers=
ion. The least effort with incompatible upgrades / downgrades is to keep sp=
ecial transition firmware allowing downgrade from current Golden version to=
 the previous Golden version from incompatible branch. For upgrades the lat=
est version of transition firmware might not be golden. This will require a=
 separate repo with an auto-generated set of scripts to be used to build tr=
ansition fws.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
* Rather than have a single migration script that runs before everything<br=
>
=C2=A0 else (and is thus serial), you might create a template service<br>
=C2=A0 (phosphor-migration-@.service) that can be depended on by the servic=
es<br>
=C2=A0 needing the migration results.=C2=A0 (ie. service foo depends on<br>
=C2=A0 migration-foo).<br></blockquote><div><br></div><div>While migration =
is one-off, it might be safer to run serial one by one.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
* In a follow up email you mentioned something about hashing.=C2=A0 I was<b=
r>
=C2=A0 going to ask how you know when a particular migration has been<br>
=C2=A0 executed.=C2=A0 Maybe there are some tricks of recording hash values=
 in<br>
=C2=A0 the RWFS could prevent multiple executions.<br></blockquote><div><br=
></div><div>We can track the succeeded scripts by touching some file in a d=
irectory like /var/lib/migration (e.g. create a file named as sha-sum of th=
e runned script).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000d4a4b705b1d0138b--
