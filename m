Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E740EA22
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 20:43:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9QvD0gLwz2yQL
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 04:43:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UDKO1tuZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=UDKO1tuZ; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9Qtr1JNJz2xYX
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 04:42:42 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id x27so22366299lfu.5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 11:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSYPJaQe3Ds93PuwmMebSvF++QXOJ6TfRZBX8+XLi5A=;
 b=UDKO1tuZyXw05CFmQi1OjHBtLKSIXvH88Kku8mySRnULCM1jFRFLA80TN/yIRGL59R
 A+l3M32t5Yng4EHZqTPprJdMUZ3TtVpNHIV4uMoAhDLvx/+neP+5yt/U89a5+cqzlSuz
 /BxafpYfzk/JBylaM3iI0+dJOROdEkycNzkjTeaxl5NAp1MranEJDR9RJsEqhfqo77Qx
 FSxFkBuMwuiWfbomNNOeALkx/RrbH5ugBNve713p1kobYUiKRkVtC0oZncpbLYgbLACW
 va5DflSo6RJv8X3x10bDkybZouENKaaaJu29dif/bxujJ77GnM7Hlbo+W1yI7/DL/F86
 y//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSYPJaQe3Ds93PuwmMebSvF++QXOJ6TfRZBX8+XLi5A=;
 b=St1S/WOrppkLS1InamMU9UXzBuPZ2rKENW1YiiuOYETxlTIBooJlVLkAYOxEs7woV8
 Rg8vgLtIK8vHqyWJWdLHxlkkC2ZGLe+adBZeWu1igZBd9AmNiA7C25IcgVXUXrCXASiu
 aoM7455uAqcod/kUQJ3n6XRsy24BSwoS/1xFR0e/4CxThXD3qMDiTewmANMq8/fBwd32
 NuGa0xjwdlF70vsvkL45eNZPjkZjcYvdnbfL7xT8v2eYaqAuMWWh/fK5p3TVuSzmpUe2
 n9mPyT82HZRz8fcKlRAJJ7x6Qn92kiEtcgq8GYTfVW/Ni49yBlBJHcHYIxLiaaU4WskP
 e0Fg==
X-Gm-Message-State: AOAM533CLmL2KxZ6TBFfVxiwJC9U72Z/XYmNnBJUjiAv2imx/yGd8Jvx
 e2seKZIvo9t45yv7wSnTUM8CCwR9vXkUXh07/HfXAQ==
X-Google-Smtp-Source: ABdhPJz2h8Wa9aikdTeKFm5Q6hbACzikCf8JPzOns3Pv53Aws7C0m8hsvEMmcssI5RYfrNyNE4nF0QlWnF5jX5wbNgw=
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr6330918ljg.67.1631817754820; 
 Thu, 16 Sep 2021 11:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7BWedK3LNh4vy8uVN3Jk8GaG-GJ1BwMHDzpTv+kgzxc+Q@mail.gmail.com>
 <20210916122652.qi553jxvvvhtnkdn@cheese>
In-Reply-To: <20210916122652.qi553jxvvvhtnkdn@cheese>
From: John Broadbent <jebr@google.com>
Date: Thu, 16 Sep 2021 11:42:24 -0700
Message-ID: <CAPw1Ef86=cwAetwh-mM6YLdjdAe=p52vYH1sb+v7OyzTpowzyQ@mail.gmail.com>
Subject: Re: Question regarding phosphor-dbus-monitor repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="0000000000009dd7d005cc212dd2"
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009dd7d005cc212dd2
Content-Type: text/plain; charset="UTF-8"

A long time ago I made a proposal to unify the YAML template parsing code.

See:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37461/4/designs/ipmi-static-configs-refactor.md#24

Many repos have copy/pasted and slightly modified the parsing, I think they
could be unified again. But I have been busy lately

On Thu, Sep 16, 2021 at 5:27 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> Hi George
>
> On Thu, Sep 16, 2021 at 03:24:09PM +0800, George Liu wrote:
>
> >The current default configuration has the realization of `OCC`
> Hm.  That probably shouldn't be in the default configuration.
>
> >1. Today the architecture of openBmc is gradually discarding YAML
> >files right (because I think it requires templates and py paarsing to
> >support).
>
> And because this technique has proven to make it difficult to support
> multiple configurations or combinations of hardware in a single image.
> For example, supporting two different revisions of the same board with
> minor differences.
>
> >2. I think we can migrate the functions of this repo to the
> >corresponding repo
>
> Sounds fine on the surface.  Personally, I would like to see any and all
> configuration moved to entity manager, so it is all in the same place.
> Some system integrators are not software developers and do not want to
> hunt for configuration spread across different repositories or bitbake
> metadata layers.  But the community is split on this - there is a
> concern with making every application have a dependency on
> entity-manager, which is an understandable concern.
>
> >I suspect that the original design idea was to aggregate all D-Bus
> >monitoring into this repo
>
> Sort of.  The intent of the code was to provide a way to implement a
> wide variety of highly specific policy.  For example: shut down the
> system when more than 4 processor cores are hotter than 100 degrees C if
> the chassis is water cooled.  Policy that has broad applicability would
> be implemented closer to the application - so it wasn't really meant to
> aggregate _all_ policy in the system.  Just the really esoteric stuff.
> In hindsight, I think it is too abstract and enables too much
> logic implemented with data.
>
> >4. At present, most repos use D-Bus to monitor certain attributes,
> >objectPaths, etc, but they have not done YAML file adaptation in this
> >repo, but implemented in their respective repos (eg: PLDM,
> >phosphor-led-manager).
>
> For the led applications, again, I would like to see those get their
> configuration from entity-manager.  I don't think PLDM should have any
> configuration files at all.
>
> >So, my thoughts is: If we transplant `OCC` & `snmp` and other
> >functions to their respective repos one day in the future, can this
> >repo be discarded?
>
> Sure - my long term goal for IBM systems anyway is to not be using this
> application.  If noone else in the OpenBMC community is using it - sure
> we could discard it entirely.
>
> -brad
>

--0000000000009dd7d005cc212dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A long=C2=A0time ago I made a proposal to unify the YAML t=
emplate=C2=A0parsing code.<div><br></div><div>See:<br><div><a href=3D"https=
://gerrit.openbmc-project.xyz/c/openbmc/docs/+/37461/4/designs/ipmi-static-=
configs-refactor.md#24">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+=
/37461/4/designs/ipmi-static-configs-refactor.md#24</a><br></div></div><div=
><br></div><div>Many repos have copy/pasted and slightly=C2=A0modified the =
parsing, I think they could be unified again. But I have been busy lately=
=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Sep 16, 2021 at 5:27 AM Brad Bishop &lt;<a href=3D"mail=
to:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi George<br>
<br>
On Thu, Sep 16, 2021 at 03:24:09PM +0800, George Liu wrote:<br>
<br>
&gt;The current default configuration has the realization of `OCC` <br>
Hm.=C2=A0 That probably shouldn&#39;t be in the default configuration.<br>
<br>
&gt;1. Today the architecture of openBmc is gradually discarding YAML<br>
&gt;files right (because I think it requires templates and py paarsing to<b=
r>
&gt;support).<br>
<br>
And because this technique has proven to make it difficult to support <br>
multiple configurations or combinations of hardware in a single image.<br>
For example, supporting two different revisions of the same board with <br>
minor differences.<br>
<br>
&gt;2. I think we can migrate the functions of this repo to the<br>
&gt;corresponding repo<br>
<br>
Sounds fine on the surface.=C2=A0 Personally, I would like to see any and a=
ll <br>
configuration moved to entity manager, so it is all in the same place.=C2=
=A0 <br>
Some system integrators are not software developers and do not want to <br>
hunt for configuration spread across different repositories or bitbake <br>
metadata layers.=C2=A0 But the community is split on this - there is a <br>
concern with making every application have a dependency on <br>
entity-manager, which is an understandable concern.<br>
<br>
&gt;I suspect that the original design idea was to aggregate all D-Bus <br>
&gt;monitoring into this repo<br>
<br>
Sort of.=C2=A0 The intent of the code was to provide a way to implement a <=
br>
wide variety of highly specific policy.=C2=A0 For example: shut down the <b=
r>
system when more than 4 processor cores are hotter than 100 degrees C if <b=
r>
the chassis is water cooled.=C2=A0 Policy that has broad applicability woul=
d <br>
be implemented closer to the application - so it wasn&#39;t really meant to=
 <br>
aggregate _all_ policy in the system.=C2=A0 Just the really esoteric stuff.=
=C2=A0 <br>
In hindsight, I think it is too abstract and enables too much <br>
logic implemented with data.<br>
<br>
&gt;4. At present, most repos use D-Bus to monitor certain attributes,<br>
&gt;objectPaths, etc, but they have not done YAML file adaptation in this<b=
r>
&gt;repo, but implemented in their respective repos (eg: PLDM,<br>
&gt;phosphor-led-manager).<br>
<br>
For the led applications, again, I would like to see those get their <br>
configuration from entity-manager.=C2=A0 I don&#39;t think PLDM should have=
 any <br>
configuration files at all.<br>
<br>
&gt;So, my thoughts is: If we transplant `OCC` &amp; `snmp` and other<br>
&gt;functions to their respective repos one day in the future, can this<br>
&gt;repo be discarded?<br>
<br>
Sure - my long term goal for IBM systems anyway is to not be using this <br=
>
application.=C2=A0 If noone else in the OpenBMC community is using it - sur=
e <br>
we could discard it entirely.<br>
<br>
-brad<br>
</blockquote></div>

--0000000000009dd7d005cc212dd2--
