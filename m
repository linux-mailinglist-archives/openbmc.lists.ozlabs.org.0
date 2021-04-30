Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2814C36FCE4
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWwNX0s1tz301t
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:53:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=lV65Nxhg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lV65Nxhg; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWwNH3XXbz2xVt
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:53:16 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id b131so7964986ybg.5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TU/LS0QHk3/LipRPY9l7ILdbA9MZJSbYEE363VvF+iE=;
 b=lV65Nxhg4VOEOFJ13mEShjVVKDDoRbtkLbxC+GvpgWL+K9gi/Ct1vIHJbK72HMwF0a
 /Vr7YZga/lJ3pUqjPSxHQXhNoZyaGI+MuOoTzQi3L5ggTmYz3yZtHmtsP3LSymVsnuMf
 4Fe2R2UeCLWRhKD4Fn56Oe8CSQT4qugk8zJXuFkHdKpxMi7MdTm5AUPxyBDSzmcQalAj
 tvcaN0zKPU4bfx+wiLUOfbfzGoAjP247HiYk/BfV4/s3UK7aQMs3j3FHBz3eOVWQ/YmS
 OqKk+NPiyAL+v96vxU9K0qfXi9FHCr6aF2cOdsqezPCEutpQGVmXbjuoelBIMz3pN5IF
 67Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU/LS0QHk3/LipRPY9l7ILdbA9MZJSbYEE363VvF+iE=;
 b=KK+q6VmJ6bL4stc/GH8ig15HWuL1NcPWMRJ+ecGftfGCr3Ok+qiqaQepEpyivbnuNV
 qyAiDqWlXVxdbiUn0U5++4mQdvOFtdXSyyHVv2L0Qou6JA8PPUv0BiRqWj8LW/qVd4g+
 +o/OfmLSAvHRdPAgy7tkFruZVFScIn/zfdUsBjUbr7EK0P43vl3xFJz/caULyqP/08Xw
 P6eT8K0e0dTZGF+ccA40X//kPziGhJ7nx/YJv/H9Wzq2b9FP2EmFUL6RDkwvVOpPQe9w
 SEVfH0FF3agUJOY4+6VKk8EKoc2Oy1qrLK5ODIVi6GtHJFfWHNWGI8UxFdinKIPcPJR/
 I+2g==
X-Gm-Message-State: AOAM533uqTmhZFCodVERNVtTatktK3y5rigy6bWCm44BeuGum5SfsRZy
 yFPs3jqftfXLOlYtq/8nTMLVdfGG9y+FxybM2+6O/8LkHn6HCA==
X-Google-Smtp-Source: ABdhPJwtWFUFgiT5gP0rOukGL9COz36GYBfqKZzstfyww8cUNw8SXGaByr61GuBoTW9wYPssZwNQlku6eNP4z2eb4VM=
X-Received: by 2002:a25:8143:: with SMTP id j3mr7282774ybm.237.1619794392913; 
 Fri, 30 Apr 2021 07:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
In-Reply-To: <YIwRqzb/50Yk9hZa@heinlein>
From: Jason Ling <jasonling@google.com>
Date: Fri, 30 Apr 2021 07:52:36 -0700
Message-ID: <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000066720705c131c5a6"
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

--00000000000066720705c131c5a6
Content-Type: text/plain; charset="UTF-8"

>
> I assume you mean "internal to Google applications"?

Yes
I have two questions that come to mind:

    1. Why was the library provided by i2c-tools not good enough?
>        (ie. What are you bringing to the table that should make people
>        want to use your library rather than a widely used existing
>        library?)

i2c-tools are functionally fine; the initial motivation of this library was
to improve testability of the code that uses it. As a result C++ i2c-tools
bindings that themselves are unit tested and mockable (so applications that
interact with i2c could also be unit tested).


    2. How does the availability (and potential recommendation of usage
>        by our community) affect the effort to ensure that all i2c and
>        pmbus drivers are upstreamed?

Well, this library is meant for userspace usage. So i2c (hwmon?) and pmbus
drivers would continue to be upstreamed as per usual.
Motivating use case for userspace i2c transactions are pmbus firmware
updates. With adm1266 we tried to upstream sequencer configuration update
via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
userspace.

       To further clarify this question, we've generally said we want to
>        see code using and contributing to upstream Linux subsystems when
>        those subsystems already exist.  We don't want a reimplementation
>        of the i2c and pmbus subsystem in userspace when those are
>        already well-supported upstream by the kernel.

Agreed, but some things just get rejected when you try to push them
upstream. Like updating sequencer firmware, or updating some other non
pmbus device via i2c. We've tried, patches were rejected.

       What is it that makes you want to write your code using low-level
>        i2c and PMBus APIs directly in userspace instead of writing or
>        updating drivers and using the various high-level user APIs
>        provided by kernel subsystems?

I speak in the context of hwmon/pmbus but these patches were simply
rejected. A lot of times the device you want to upgrade is also the device
you're gathering telemetry from.

       I see you mentioned "pmbus device upgrades" and I know the PMBus
>        subsystem doesn't currently support firmware upgrade paths.  But,
>        there has been LKML threads about it and what I recollect was
>        that it wasn't "not allowed" but just "not implemented".
>        Shouldn't we be focusing our efforts on enhancing features for
>        the whole OSS community rather than building our own different
>        library?

Fair point but I don't see them as mutually exclusive, use hwmon/pmbus
drivers where they make sense and work for you. Switch to userspace for
stuff that gets strong pushback from hwmon/pmbus maintainer or stuff that
just doesn't make sense to put into a driver.



On Fri, Apr 30, 2021 at 7:18 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, Apr 23, 2021 at 03:22:35PM -0700, Jason Ling wrote:
> > Hi all,
> >
> > What started as an attempt to create a simple command line tool to
> perform
> > pmbus device upgrades over i2c has turned into the start of a user-space
> > i2c library (with some pmbus support).
> >
> > I've already reused this library in some other obmc applications and it's
> > been fairly well unit-tested. It also comes with all the public
> interfaces
> > mocked (so you can unit test your own code).
>
> I assume you mean "internal to Google applications"?
>
> > The idea is that more and more classes get added that will support
> > different pmbus devices.
> > General idea is that each device that gets support can expose methods to
> > allow device upgrade, black box retrieval, etc..
>
> I have two questions that come to mind:
>
>     1. Why was the library provided by i2c-tools not good enough?
>        (ie. What are you bringing to the table that should make people
>        want to use your library rather than a widely used existing
>        library?)
>
>     2. How does the availability (and potential recommendation of usage
>        by our community) affect the effort to ensure that all i2c and
>        pmbus drivers are upstreamed?
>
>        To further clarify this question, we've generally said we want to
>        see code using and contributing to upstream Linux subsystems when
>        those subsystems already exist.  We don't want a reimplementation
>        of the i2c and pmbus subsystem in userspace when those are
>        already well-supported upstream by the kernel.
>
>        What is it that makes you want to write your code using low-level
>        i2c and PMBus APIs directly in userspace instead of writing or
>        updating drivers and using the various high-level user APIs
>        provided by kernel subsystems?
>
>        I see you mentioned "pmbus device upgrades" and I know the PMBus
>        subsystem doesn't currently support firmware upgrade paths.  But,
>        there has been LKML threads about it and what I recollect was
>        that it wasn't "not allowed" but just "not implemented".
>        Shouldn't we be focusing our efforts on enhancing features for
>        the whole OSS community rather than building our own different
>        library?
>
> --
> Patrick Williams
>

--00000000000066720705c131c5a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I assume=
 you mean &quot;internal to Google applications&quot;?</blockquote><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">Yes<br></span>I have two ques=
tions that come to mind:<br><br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">=C2=A0 =C2=A0 1. Why was the library provided by i2c-tools not good =
enough?<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0(ie. What are you bringing to the tab=
le that should make people<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0want to use your l=
ibrary rather than a widely used existing<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0lib=
rary?)</blockquote>i2c-tools are functionally fine; the initial motivation =
of this library was to improve testability of the code that uses it. As a r=
esult C++ i2c-tools bindings that themselves are unit tested and mockable (=
so applications that interact with i2c could also be unit tested).<div><br>=
</div><div><br><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0 =C2=A0 2. How does the availability (and potential recommendation of us=
age<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0by our community) affect the effort to en=
sure that all i2c and<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0pmbus drivers are upstr=
eamed?</blockquote><div>Well, this library is meant for userspace usage. So=
 i2c (hwmon?) and pmbus drivers would continue to be upstreamed as per usua=
l.</div><div>Motivating use case for userspace i2c transactions are pmbus f=
irmware updates. With adm1266 we tried to upstream sequencer configuration =
update via the hwmon/pmbus driver, it failed spectacularly. So we have to d=
o it userspace.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=A0To further clarify this question, we&=
#39;ve generally said we want to<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0see code usi=
ng and contributing to upstream Linux subsystems when<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0those subsystems already exist.=C2=A0 We don&#39;t want a reimple=
mentation<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0of the i2c and pmbus subsystem in u=
serspace when those are<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0already well-supporte=
d upstream by the kernel.</blockquote>Agreed, but some things just get reje=
cted when you try to push them upstream. Like updating sequencer firmware, =
or updating some other non pmbus device via i2c. We&#39;ve tried, patches w=
ere rejected.</div><div><br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">=C2=A0 =C2=A0 =C2=A0 =C2=A0What is it that makes you want to write your =
code using low-level<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c and PMBus APIs direc=
tly in userspace instead of writing or<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0updati=
ng drivers and using the various high-level user APIs<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0provided by kernel subsystems?</blockquote>I speak in the context=
 of hwmon/pmbus but these patches were simply rejected. A lot of times the =
device you want to upgrade is also the device you&#39;re gathering telemetr=
y from.</div><div><br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0I see you mentioned &quot;pmbus device upgrades&quo=
t; and I know the PMBus<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0subsystem doesn&#39;t=
 currently support firmware upgrade paths.=C2=A0 But,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0there has been LKML threads about it and what I recollect was<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0that it wasn&#39;t &quot;not allowed&quot; but j=
ust &quot;not implemented&quot;.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0Shouldn&#39;=
t we be focusing our efforts on enhancing features for<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0the whole OSS community rather than building our own different<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0library?</blockquote><div>Fair point but I don&=
#39;t see them as mutually exclusive, use hwmon/pmbus drivers where they ma=
ke sense and work for you. Switch to userspace for stuff that gets strong p=
ushback from hwmon/pmbus maintainer or stuff that just doesn&#39;t make sen=
se to put into a driver.</div></div></div><div><br></div><div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Apr 30, 2021 at 7:18 AM Patrick Williams &lt;<a href=3D"mailto:patrick=
@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Fri, Apr 23, 2021 at 03:22:35PM -0700, Jaso=
n Ling wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; What started as an attempt to create a simple command line tool to per=
form<br>
&gt; pmbus device upgrades over i2c has turned into the start of a user-spa=
ce<br>
&gt; i2c library (with some pmbus support).<br>
&gt; <br>
&gt; I&#39;ve already reused this library in some other obmc applications a=
nd it&#39;s<br>
&gt; been fairly well unit-tested. It also comes with all the public interf=
aces<br>
&gt; mocked (so you can unit test your own code).<br>
<br>
I assume you mean &quot;internal to Google applications&quot;?<br>
<br>
&gt; The idea is that more and more classes get added that will support<br>
&gt; different pmbus devices.<br>
&gt; General idea is that each device that gets support can expose methods =
to<br>
&gt; allow device upgrade, black box retrieval, etc..<br>
<br>
I have two questions that come to mind:<br>
<br>
=C2=A0 =C2=A0 1. Why was the library provided by i2c-tools not good enough?=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0(ie. What are you bringing to the table that sho=
uld make people<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0want to use your library rather than a widely us=
ed existing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0library?)<br>
<br>
=C2=A0 =C2=A0 2. How does the availability (and potential recommendation of=
 usage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0by our community) affect the effort to ensure th=
at all i2c and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0pmbus drivers are upstreamed?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0To further clarify this question, we&#39;ve gene=
rally said we want to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0see code using and contributing to upstream Linu=
x subsystems when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0those subsystems already exist.=C2=A0 We don&#39=
;t want a reimplementation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0of the i2c and pmbus subsystem in userspace when=
 those are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0already well-supported upstream by the kernel.<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0What is it that makes you want to write your cod=
e using low-level<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c and PMBus APIs directly in userspace instead=
 of writing or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0updating drivers and using the various high-leve=
l user APIs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0provided by kernel subsystems?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0I see you mentioned &quot;pmbus device upgrades&=
quot; and I know the PMBus<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0subsystem doesn&#39;t currently support firmware=
 upgrade paths.=C2=A0 But,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0there has been LKML threads about it and what I =
recollect was<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0that it wasn&#39;t &quot;not allowed&quot; but j=
ust &quot;not implemented&quot;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shouldn&#39;t we be focusing our efforts on enha=
ncing features for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the whole OSS community rather than building our=
 own different<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0library?<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000066720705c131c5a6--
