Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67B290A51
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 19:11:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCXjl5vPwzDqr6
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 04:11:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C1yr6eQe; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCXhs0DxxzDqmX
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 04:10:19 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id y20so4760735iod.5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+skr2htq7b6Ma/hc6+Hl4tn6/eZsRFrtBeP6KUvp+BU=;
 b=C1yr6eQe8HiPs5YVPH3ndKP0vITJ+bu3B473ZFxL6MXejZYlKxyLipTeTHKlOXJczf
 efPNOb1mgFGntOICI8sY+W1ZE34C7zC0fersE7keq7R3Gxg8cH2scljUWogHrNILwmFc
 Y6WzkCTBIZXn/QIla5NKHud/1fqsCTIrFK0zudjJH+63GYRc6HLVaTrXVLoHCbW7JMBY
 MXE4NpZeo/4+WS6hvi7fdfr3DQUgwtarkOa3Cl9TWBOfd5pVngBvcwZdSxWgYCOm7N1t
 HquY6sbkisIlQtp0Dx3fQgRHqSbvTlUDPjOBnjhdTHopPc3ZHxytnvWxoqezrSTzSMsQ
 OiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+skr2htq7b6Ma/hc6+Hl4tn6/eZsRFrtBeP6KUvp+BU=;
 b=tkzJvnNU4jiWOpN/dor+zrXgmxgg9G8sbt0isSL9b/grnVo/FFxW55l36qXwBYsOzc
 NWO+BPlXpKdc2aPoMeoJAratsAChdz9AaJOglegxeK0uo6UrZ5dUmFtiOqbS9JA3Jor3
 vbEfwYnLN3LzyhB8slF3zc7Do5NtQnuxz6074VjhZaFpg0QhlDb4QsFsHjpF9Vwog5tG
 lD7tXmNmH8lvq148bkUTB/pUJDxkmNBpWFJGBR4LwtBIYeANTsEBwlHPW02AewEBLII5
 Vi66WfunjOVQglZIdN1g5TDQjqQ3FXNlxDgNd4D7uWFqGYCcK/tGOuGNjF3NP0ryJhV/
 KOvQ==
X-Gm-Message-State: AOAM530fE/cGGBTS3w6a8BwD04bw1GYJVIIl/JKZlneqX+749WgORlZY
 lgjXzopKjpPSyiju4GwV2cntz0jec346q7FfRsStsg==
X-Google-Smtp-Source: ABdhPJwk1gm0t7u+REGANywJONkunLoeq0AQ22mA0N8/4z+NzR5R3lXhQkG80r0smhTI4nkLMdy5SCaUyCnWVVCFKwk=
X-Received: by 2002:a02:1349:: with SMTP id 70mr3609392jaz.130.1602868214965; 
 Fri, 16 Oct 2020 10:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
 <CACWQX80Bm1W0Y8JT+n3rf3qmWLeDi1pGTLSmr_piQQtuJMOdpw@mail.gmail.com>
In-Reply-To: <CACWQX80Bm1W0Y8JT+n3rf3qmWLeDi1pGTLSmr_piQQtuJMOdpw@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Fri, 16 Oct 2020 19:10:04 +0200
Message-ID: <CADVsX88gap3t+P2L_hM7KUNcz-jPN1vMBV2XTRTsPRVpn-o5mA@mail.gmail.com>
Subject: Re: /etc/migration.d
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000093c0c405b1ccd675"
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

--00000000000093c0c405b1ccd675
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2020 at 18:50, Ed Tanous <ed@tanous.net> wrote:

> On Wed, Oct 14, 2020 at 11:49 AM Anton Kachalov <rnouse@google.com> wrote:
> >
> > With moving from root-only environment to unprivileged users' space, we
> need to ensure a smooth transition. To achieve that we need a mechanism for
> one-shot per-package scripts that would take care of migration. That's not
> only about groups & owners, but a general approach.
>
> Are there other use cases that necessitate a general approach?  I'm
> not against it, but owners and groups seems unique in the regard that
> the migration has to run as root.  Most (all?) other migrations don't
> seem to, or haven't in the past, and therefore can be run as a
> pre-init, or as part of the service itself.  If the service itself
> does the migration, the startup dependencies are a lot easier to track
> as a maintainer, and running your migrations in a compiled language
> likely has a positive effect on boot time, which has been a problem in
> the past (still is depending on who you ask).
>

For instance, the bmcweb has some internal logic for migration of some
files. The problem with "in-service" compiled code is that the service will
be run with least privileges and could be sandboxed, thus, wouldn't be able
to modify filesystem.

The migration scripts have to be part of the corresponding package, thus,
it will be easy to track & maintain.

The one-time run scripts wouldn't make too much overhead if they run once.

Pre-init like StartExecPre= option in the service file isn't a good choice
because it will run every time and really increase the boot time.


>
> It should be noted, several apps have done simple migrations of config
> file formats in the past, so there's some precedent for it, just not
> in a generalist solution.
>
> >  It's similar to firstboot, but has a different purpose.
> >
> > I'm going to prototype a robust / naive solution to start a service
> before everything else in the system with a condition (non-empty
> /etc/migration.d) and iterate through all files. Each script has to run at
> list with "set -e" to bail out on failures. If the script succeeded -- it
> will be removed.
>
> The script itself will be removed?  Presumably that means you're
> executing the script out of non-volatile?  That seems like a security
> gap in that an attacker could inject migration scripts that did
> anything, and have the system run them for them.  Maybe just keeping
> some kind of external log of "these scripts have completed" or,
> preferably, enforcing that migration scripts are idempotent would be
> better, and would reduce the possibility of a bad actor getting
> permanent execution privileges if they somehow overwrote the scripts?
>

Basically, we can have a SHA-sum with a list of approved scripts to run.
Such lists have to be placed on the read-only part. The way how to mark the
succeeded scripts may vary. We can have scripts available on the same
read-only partition and touch files somewhere under /var/lib for the
succeeded ones. As well as make the scripts re-entrant in case of
losing state files.


>
> >
> > The tricky part is: what if the script fails? Keep it, ignore the
> failure and proceed with others and then boot the system? Or proceed other
> scripts as well and then enter some "failure state"?
>
> Assuming you can have migrations that are interlinked, have to be run
> in order, and sometimes can fail, maybe the "best" thing to do is to
> simply stop on the failing one, and try to boot the system as well as
> it's able to in the degraded state.  This would mean that flakey
> scripts would be rerun on the next boot, and hopefully succeed, and
> consistently failing scripts could be replaced on a subsequent
> firmware update with more robust versions, and rerun.
>

Are there any read-to-use API / scripts to make the system boot in degraded
mode? Otherwise, we can just add this functionality later.

--00000000000093c0c405b1ccd675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 16 Oct 2020 at 18:50, Ed Tano=
us &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 14, 2020 a=
t 11:49 AM Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com" target=
=3D"_blank">rnouse@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; With moving from root-only environment to unprivileged users&#39; spac=
e, we need to ensure a smooth transition. To achieve that we need a mechani=
sm for one-shot per-package scripts that would take care of migration. That=
&#39;s not only about groups &amp; owners, but a general approach.<br>
<br>
Are there other use cases that necessitate a general approach?=C2=A0 I&#39;=
m<br>
not against it, but owners and groups seems unique in the regard that<br>
the migration has to run as root.=C2=A0 Most (all?) other migrations don&#3=
9;t<br>
seem to, or haven&#39;t in the past, and therefore can be run as a<br>
pre-init, or as part of the service itself.=C2=A0 If the service itself<br>
does the migration, the startup dependencies are a lot easier to track<br>
as a maintainer, and running your migrations in a compiled language<br>
likely has a positive effect on boot time, which has been a problem in<br>
the past (still is depending on who you ask).<br></blockquote><div><br></di=
v><div>For instance, the bmcweb has some internal logic for migration of so=
me files. The problem with &quot;in-service&quot; compiled code is that the=
 service will be run with least privileges and could be sandboxed, thus, wo=
uldn&#39;t be able to modify filesystem.</div><div><br></div><div>The migra=
tion scripts have to be part of the corresponding package, thus, it will be=
 easy to track &amp; maintain.</div><div><br></div><div>The one-time run sc=
ripts wouldn&#39;t make too much overhead if they run once.</div><div><br><=
/div><div>Pre-init like StartExecPre=3D option in the service file=C2=A0isn=
&#39;t a good choice because it will run every time and really increase the=
 boot time.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
It should be noted, several apps have done simple migrations of config<br>
file formats in the past, so there&#39;s some precedent for it, just not<br=
>
in a generalist solution.<br>
<br>
&gt;=C2=A0 It&#39;s similar to firstboot, but has a different purpose.<br>
&gt;<br>
&gt; I&#39;m going to prototype a robust / naive solution to start a servic=
e before everything else in the system with a condition (non-empty /etc/mig=
ration.d) and iterate through all files. Each script has to run at list wit=
h &quot;set -e&quot; to bail out on failures. If the script succeeded -- it=
 will be removed.<br>
<br>
The script itself will be removed?=C2=A0 Presumably that means you&#39;re<b=
r>
executing the script out of non-volatile?=C2=A0 That seems like a security<=
br>
gap in that an attacker could inject migration scripts that did<br>
anything, and have the system run them for them.=C2=A0 Maybe just keeping<b=
r>
some kind of external log of &quot;these scripts have completed&quot; or,<b=
r>
preferably, enforcing that migration scripts are idempotent would be<br>
better, and would reduce the possibility of a bad actor getting<br>
permanent execution privileges if they somehow overwrote the scripts?<br></=
blockquote><div><br></div><div>Basically, we can have a SHA-sum with a list=
 of approved scripts to run. Such lists have to be placed on the read-only =
part. The way how to mark the succeeded scripts may vary. We can have scrip=
ts available on the same read-only partition and touch files somewhere unde=
r /var/lib for the succeeded ones. As well as make the scripts re-entrant i=
n case of losing=C2=A0state files.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; The tricky part is: what if the script fails? Keep it, ignore the fail=
ure and proceed with others and then boot the system? Or proceed other scri=
pts as well and then enter some &quot;failure state&quot;?<br>
<br>
Assuming you can have migrations that are interlinked, have to be run<br>
in order, and sometimes can fail, maybe the &quot;best&quot; thing to do is=
 to<br>
simply stop on the failing one, and try to boot the system as well as<br>
it&#39;s able to in the degraded state.=C2=A0 This would mean that flakey<b=
r>
scripts would be rerun on the next boot, and hopefully succeed, and<br>
consistently failing scripts could be replaced on a subsequent<br>
firmware update with more robust versions, and rerun.<br></blockquote><div>=
<br></div><div>Are there any read-to-use API / scripts to make the system b=
oot in degraded mode? Otherwise, we can just add this functionality later.<=
/div></div></div>

--00000000000093c0c405b1ccd675--
