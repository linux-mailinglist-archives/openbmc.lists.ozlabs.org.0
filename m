Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168D48F537
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 06:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbRwb3SGpz2yg5
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 16:45:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KlncH9xM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KlncH9xM; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbRwF3Nxhz2yLT
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 16:45:31 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id o6so41815471edc.4
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 21:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucj2Os/wRUr5WLRG1S7na21lS+mWLqNqv3mZLwumwDA=;
 b=KlncH9xMRTtQzHWpiNSpPA+s4cRJo6sspDGcM67skcvyn4rk3n3elqScWbroxSLiWT
 gRHz8i6fFJi14ZHSyD7XeyPfOPa28oZuqxUpO48DyltwzInqb4rFBB1FQhwd98OnNJLm
 AICAwyX499KSDDuKVd9Hj8l10yZ+oVYUUU18cbsIB6k5QhvKry7u6PT11CKWKIa5vw+8
 f75f2hkANVa4CfwHj1lvC5rI79BZf6LdMMaxau8iqRhRSV9OflurBziuW5HRXT2ddrHa
 2m/HVR0zXxfXiuAFXfZB1dn3nfuavhitwDqAsKKfl1RtsM+ZbsvNYhDLjAM1lXxmu8SI
 7ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucj2Os/wRUr5WLRG1S7na21lS+mWLqNqv3mZLwumwDA=;
 b=pHgIjYI8fUuTQtNkpURma1ZSYMe65z2cTFw6X4RofmBWN19a/62A1VAu3+A2lvevco
 4RVJiOe8R44NPo3gJm2gLKw+jArsUhlW81nTkZ50eYFOfgKaTxnu4+GSelCp9oQhSCGA
 bVfKPXw9GBDgKguoGGS1Zd/kgUgDQUKngV9pDYAqNp/nDjFTNtpBIfT5HN4m2FTA+jyA
 4eT27rrh1VD5BbSP16egZrQVkUHWd5f2320jbgr7Bj9c13J2tNu8XZV0/9YNVPL/HbXT
 rPdi4v2PqL8wTvt7kIau/mnUEnVvHpILlqaFD28MAGc7ajK1xV/7mLy4BWSvc2QGKanL
 L1TQ==
X-Gm-Message-State: AOAM530+GHV1QMvbhzumjS0+/EduFidoukfwHB9hrt4VPRRs1Lu/B9T/
 1uGjY0v+eUbT8/q9igamKWq/cjONZnzU/IL9wl0=
X-Google-Smtp-Source: ABdhPJy4yaAoYZg+v9/LnyJfvOwxFrol+ZSH90RzC/0Nqb+T1gjJgt4b+/tGPQggZrFHJEagbB491oDo/AlyGlIjhS0=
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr9719284ejk.651.1642225526336; 
 Fri, 14 Jan 2022 21:45:26 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
 <CACWQX80YTyuMYozJgpLx36X_7sbwdp2O+BGCdxJQXyMPA+VjxQ@mail.gmail.com>
 <CAA7TbcspNFo4UyfL-3iG9KWEHep4jfBhP=1U0KCegaNbvcWfmw@mail.gmail.com>
 <YeHGiLCArvqNCodq@heinlein>
In-Reply-To: <YeHGiLCArvqNCodq@heinlein>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Sat, 15 Jan 2022 11:15:15 +0530
Message-ID: <CAA7TbcuOC4oNCh2NO7nbyRZgu+UdSUNSdsoVXqewaChD4RfM4Q@mail.gmail.com>
Subject: Re: New repository request for platform specific Bridge IC code
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000236f9b05d5986d9b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 velumanit@hcl.com, patrickw3@fb.com, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000236f9b05d5986d9b
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

Thanks for the response. Sure. I will open an issue in TOF for requesting a
new repository.

Thanks,
Kumar.

On Sat, Jan 15, 2022 at 12:22 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Jan 05, 2022 at 07:53:18PM +0530, Kumar Thangavel wrote:
> > On Wed, Jan 5, 2022 at 1:20 AM Ed Tanous <ed@tanous.net> wrote:
> >
> > > On Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel
> > > <kumarthangavel.hcl@gmail.com> wrote:
> <<clipped>>
>
> We are initially supporting the non-open BIC implementation that we had on
> Yosemite v1,2, and 3, but we have recently started a fully open source
> implementation of the BIC side of this:
>
>     https://github.com/facebook/OpenBIC
>
> We'd certainly be interested in collaborating if anyone else is interested
> in
> designing a system using a uC like this.  Basically the BIC acts as an IO
> expander for the BMC so that we can manage multiple hosts and/or
> accelerator
> cards.
>
> At a high-level this is similar to the PLDM subsystem.  We have some IPMB
> events
> that the BIC push to the BMC and we already have those handled in the IPMI
> handlers, but there are other parts of the design where the BMC initiates
> activity.
>
> We could certainly spread the implementation out into various repositories,
> like dbus-sensors and phosphor-bmc-code-mgmt, but I suspect there are
> going to
> be challenges in a bug-free implementation in that regard.  There are cases
> where asking the BIC to do one activity, such as update itself, takes
> offline
> some other pieces of functionality, like sensors, and so there does need
> to be
> some state-awareness.  It seems less error prone to put all the various
> DBus
> objects related to the BIC into one daemon/repository in the same manner as
> PLDM is doing.
>
>
> Kumar, in order to get closure on this, I think you should open an issue to
> technical-oversight-forum requesting a repository.  Repository oversight is
> one of the primary functions of the TOF.
>
> --
> Patrick Williams
>

--000000000000236f9b05d5986d9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Patrick,</div><div><br></div><div>Thanks for the r=
esponse. Sure. I will open an issue in TOF for requesting a new repository.=
</div><div><br></div><div>Thanks,</div><div>Kumar.</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 15, 2022 at 1=
2:22 AM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@s=
twcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Jan 05, 2022 at 07:53:18PM +0530, Kumar Thangavel wrote:<br=
>
&gt; On Wed, Jan 5, 2022 at 1:20 AM Ed Tanous &lt;<a href=3D"mailto:ed@tano=
us.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel<br>
&gt; &gt; &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_bl=
ank">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br>
&lt;&lt;clipped&gt;&gt;<br>
<br>
We are initially supporting the non-open BIC implementation that we had on<=
br>
Yosemite v1,2, and 3, but we have recently started a fully open source<br>
implementation of the BIC side of this:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/facebook/OpenBIC" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/facebook/OpenBIC</a><br>
<br>
We&#39;d certainly be interested in collaborating if anyone else is interes=
ted in<br>
designing a system using a uC like this.=C2=A0 Basically the BIC acts as an=
 IO<br>
expander for the BMC so that we can manage multiple hosts and/or accelerato=
r<br>
cards.<br>
<br>
At a high-level this is similar to the PLDM subsystem.=C2=A0 We have some I=
PMB events<br>
that the BIC push to the BMC and we already have those handled in the IPMI<=
br>
handlers, but there are other parts of the design where the BMC initiates<b=
r>
activity.<br>
<br>
We could certainly spread the implementation out into various repositories,=
<br>
like dbus-sensors and phosphor-bmc-code-mgmt, but I suspect there are going=
 to<br>
be challenges in a bug-free implementation in that regard.=C2=A0 There are =
cases<br>
where asking the BIC to do one activity, such as update itself, takes offli=
ne<br>
some other pieces of functionality, like sensors, and so there does need to=
 be<br>
some state-awareness.=C2=A0 It seems less error prone to put all the variou=
s DBus<br>
objects related to the BIC into one daemon/repository in the same manner as=
<br>
PLDM is doing.<br>
<br>
<br>
Kumar, in order to get closure on this, I think you should open an issue to=
<br>
technical-oversight-forum requesting a repository.=C2=A0 Repository oversig=
ht is<br>
one of the primary functions of the TOF.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000236f9b05d5986d9b--
