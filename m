Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545A389897
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 23:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlmD56B7Wz2yxY
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 07:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=u6Z9TM6Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=u6Z9TM6Q; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlmCr1Wmzz2xZp
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 07:27:01 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id n83so9129990ybg.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ImZh2ow7Pv3AOqSLp+Os8wR5DfAX51HKmjCNtgKO00=;
 b=u6Z9TM6QP8m4SM7jOGK4rMMkQ9fPOoENv9IdenPlnbEpfEbhAucpI36t+9WXGeO/gz
 9YX0as7qKqDiekz7688weqKDIi4UIK+91gnURs/O7fQ8upEOuuEon55Bncrb15qRTJWK
 QVTKk0TfnRgeGjkaBGijjl7oVjeZz9HBlzceFArOoCq6oofR5eC0IVCkdIQMoawgwdQx
 mlT5Bv0cLhxwtqU8tFCnN1VF2K7N70zjW2BlkESP5tA+NghRY3DudzeMVusXGMxhiWdP
 aZy64gSjwbBkmz6P/KDtMFqsEDF2ogCicg3WB42xLumbPfLGTMc4JzgARSvhVc2eogD4
 iLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ImZh2ow7Pv3AOqSLp+Os8wR5DfAX51HKmjCNtgKO00=;
 b=F8D1PbgnjmbNDDLGcGzVYOOjvc4Bs1+HyPiZSvwIdHBmCgJWXS6I8z1U4eeJ1+I2cJ
 pA8sZcZoD7e500BpmRsSn+QKBIKnpytGHy/JPKlHO31XWst46LwMKc6GcIBgVddpCIYl
 VbsrX5Uhvl3HjZi0rRGEI9VFVLuYqIoYkdUm1V6qRgD3zZoft3nntAJjtSizWx4zuCko
 m/I72rzP+UonGrBbDUunnCMJUfFjt8+CAlK1QqsgiIknQTbntENgvFn4XNjmzn65m1wv
 pcsmOfbcRyWth3cKusw0/cPzN82zzQ68Ge2QvT1lyyXuHtKez5FIkUbdAv3kMdFwFlLn
 EMqA==
X-Gm-Message-State: AOAM531KM+HmHG+7AdmbId0laNrR/RIrRcHSNDYl+HEv+AFKpnKkI//A
 WrX5knyBIrL5c2TXTCEHjjrkPAn6Yk0wZzSBt4RiMNm5qignwQ==
X-Google-Smtp-Source: ABdhPJyRnYGHJLuTeC6UfjTRzKDuoxCS7evBVnLTopDw1coSUsYIfHdM3PzzXaAsApNsfcTUm9k6rWalyCz2dWAKa4s=
X-Received: by 2002:a25:bad0:: with SMTP id a16mr2333582ybk.441.1621459617909; 
 Wed, 19 May 2021 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
In-Reply-To: <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Wed, 19 May 2021 14:26:47 -0700
Message-ID: <CAOLfGj6ApsbrU9YKvQ4N_VFHkC1jZJ3WPDuLo1KwwSoOCp7HGw@mail.gmail.com>
Subject: Re: SimpleStorage proposals
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008b922105c2b57c01"
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
Cc: =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008b922105c2b57c01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your reply, Ed!


> You've also omitted what properties you're trying to target.  Could
> you walk through a little bit about what you're trying to accomplish
> with this?  (beyond just "implement the redfish schemas).  Are you
> trying to get smart data?  just inventory information?  Do you plan to
> represent connections?


As a first step, we are only going to implement three properties, Name,
Presence, and PowerStatus. We don't plan to represent connections at the
moment.

On Wed, May 19, 2021 at 1:43 PM Ed Tanous <ed@tanous.net> wrote:

> On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=
=96)
> <Jun-Lin.Chen@quantatw.com> wrote:
> >
> > Hi all,
> >
> >
> >
> > In order to implement the feature to view simple storage device status,
> such SATA HDD presence status.
> >
> > We propose to implement it on the Redfish SimpleStorage URI.
> >
> >
> >
> > As our proposal for Redfish SimpleStorage,
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352
> >
> > And an new daemon,
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43351
> >
> >
> >
> > There are two new dbus-interfaces to be proposed,
> >
> > xyz.openbmc_project.Inventory.Item.StorageDevice: here is an empty
> interface just mark the dbus path that SimpleStorage Manager should colle=
ct.
> >
> > xyz.openbmc_project.Inventory.Item.SimpleStorage: it should have the
> properties redfish needs, and can be parser by bmcweb.
>
>
> How does this differ from xyz.openbmc_project.Inventory.Item.Drive?
> They look fairly similar;  We generally don't name dbus interfaces
> after Redfish directly.  We should reuse what already exists where
> possible, and only invent new things where needed.
>
> You've also omitted what properties you're trying to target.  Could
> you walk through a little bit about what you're trying to accomplish
> with this?  (beyond just "implement the redfish schemas).  Are you
> trying to get smart data?  just inventory information?  Do you plan to
> represent connections?
>
> >
> >
> >
> > The details are in the proposal.
> >
> >
> >
> > Welcome and thank you for comments and suggestions
> >
> >
> >
> > Best regards,
> >
> > Jun-Lin Chen
> >
> >
>

--0000000000008b922105c2b57c01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Thanks for your reply, Ed!</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">You&#39;ve also omitted =
what properties you&#39;re trying to target.=C2=A0 Could<br>you walk throug=
h a little bit about what you&#39;re trying to accomplish<br>with this?=C2=
=A0 (beyond just &quot;implement the redfish schemas).=C2=A0 Are you<br>try=
ing to get smart data?=C2=A0 just inventory information?=C2=A0 Do you plan =
to<br>represent connections?</blockquote><div>=C2=A0</div></div>As a first =
step, we are only going to implement three properties, Name, Presence, and =
PowerStatus. We don&#39;t plan to represent connections at the moment.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, May 19, 2021 at 1:43 PM Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">e=
d@tanous.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=
=8A=E9=9C=96)<br>
&lt;<a href=3D"mailto:Jun-Lin.Chen@quantatw.com" target=3D"_blank">Jun-Lin.=
Chen@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; In order to implement the feature to view simple storage device status=
, such SATA HDD presence status.<br>
&gt;<br>
&gt; We propose to implement it on the Redfish SimpleStorage URI.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; As our proposal for Redfish SimpleStorage, <a href=3D"https://gerrit.o=
penbmc-project.xyz/c/openbmc/docs/+/43352" rel=3D"noreferrer" target=3D"_bl=
ank">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352</a><br>
&gt;<br>
&gt; And an new daemon, <a href=3D"https://gerrit.openbmc-project.xyz/c/ope=
nbmc/docs/+/43351" rel=3D"noreferrer" target=3D"_blank">https://gerrit.open=
bmc-project.xyz/c/openbmc/docs/+/43351</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; There are two new dbus-interfaces to be proposed,<br>
&gt;<br>
&gt; xyz.openbmc_project.Inventory.Item.StorageDevice: here is an empty int=
erface just mark the dbus path that SimpleStorage Manager should collect.<b=
r>
&gt;<br>
&gt; xyz.openbmc_project.Inventory.Item.SimpleStorage: it should have the p=
roperties redfish needs, and can be parser by bmcweb.<br>
<br>
<br>
How does this differ from xyz.openbmc_project.Inventory.Item.Drive?<br>
They look fairly similar;=C2=A0 We generally don&#39;t name dbus interfaces=
<br>
after Redfish directly.=C2=A0 We should reuse what already exists where<br>
possible, and only invent new things where needed.<br>
<br>
You&#39;ve also omitted what properties you&#39;re trying to target.=C2=A0 =
Could<br>
you walk through a little bit about what you&#39;re trying to accomplish<br=
>
with this?=C2=A0 (beyond just &quot;implement the redfish schemas).=C2=A0 A=
re you<br>
trying to get smart data?=C2=A0 just inventory information?=C2=A0 Do you pl=
an to<br>
represent connections?<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; The details are in the proposal.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Welcome and thank you for comments and suggestions<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jun-Lin Chen<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000008b922105c2b57c01--
