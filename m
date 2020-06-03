Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD9E1EC639
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 02:21:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c8hv6mLVzDqS6
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 10:21:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e;
 helo=mail-il1-x12e.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CjQdmLl7; dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c8gp6fmhzDqXl
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 10:20:16 +1000 (AEST)
Received: by mail-il1-x12e.google.com with SMTP id 18so700693iln.9
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJoDjZc2qB3qiJWSww3dfJgYkpAllNG8SpAs2xu+kwE=;
 b=CjQdmLl7WVrq/LIjj32C7WEqYOq/natSzec/SIX7QdEsrJTEgmrs8fSaWnJ93xlBlg
 zbS0y2dG/gM46BHaEbqNtn1OC6nY1G3YxDq4K7+wwdWglldigSKfGoIumTvUt/vTwtj7
 vuboAj9lj6VFkvr4WFJuNNLqeVIez4TTSlw03yA+XUpoIEmnQ5H87YO1b4Z/kkBR2hee
 2HVHLsUXcAWzeZq0ve6FnhMV17PBmvuzTPDqOmomPgWeqWk885LJsagDNPT2qaoTo8Ch
 b7/s4bxml5RVjinerur2I/HBdIvydr3g9smRFP6RQdfAQJM57Vke6gepYZ01P1bwrJre
 30BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJoDjZc2qB3qiJWSww3dfJgYkpAllNG8SpAs2xu+kwE=;
 b=NAgPP0nF4LDGAGGl/eoWPiFDKkX1CnfrzpwQDtiT9wwq3Ivj74hAXFcA5qZ2pClvmF
 2smvZKO/v4kLgr/O2cXQSDHPdBNACFlm/5mAHnJvP8gIaovCfMX9m20ErRRGBWhoQpfD
 ajYCoGFq4cXVgETW7MGbjs3vO9JjipCx0naOeBMeEcONFtwayifkwlxARDhYEW8UvkAr
 T38badzhniP9HpACkSI8jStMLHAiC+85aGMS3+/SZffMJPNX6uJlnoIJKdpXXpryS44o
 qMxrLAJm7OMLgY2DkOqdmpN2Q2F4ZvXwlftrRMnuNfjZb4y3104mTATm5OC/7ZB4Ig3K
 zDxQ==
X-Gm-Message-State: AOAM533GCndOvABQesXS8hs0VlrokjMoil1mHdUS3MNYtKUne/nqaiwF
 TWmflAIPjt89Dg1IirkpjX8pHp1EYIykts4J+GMVpg==
X-Google-Smtp-Source: ABdhPJw4FCp2p2y2v8HgvYzBX71sUt/2K+hET/BREju1oJx3rJx+FmWt7IoIPHpGe+JQ3Vdhv2ytHRXLRyT5v6vBOPs=
X-Received: by 2002:a92:dacf:: with SMTP id o15mr1606147ilq.36.1591143612722; 
 Tue, 02 Jun 2020 17:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
 <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
 <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
 <71a53f7f4b0a4024ae5021d7a380a9da@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxe0wZPEbqTpYpDX+ShSYdAk6EHsnLt-5KC1ybwwjeGhA@mail.gmail.com>
In-Reply-To: <CAO=notxe0wZPEbqTpYpDX+ShSYdAk6EHsnLt-5KC1ybwwjeGhA@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 2 Jun 2020 17:20:01 -0700
Message-ID: <CALGRKGOmC5s_S-Jc0NVo_bcB9-6bDcQRWresiT8s_2UssjEqOQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash state recovery
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000d2f40905a722fdfe"
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d2f40905a722fdfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Created https://github.com/openbmc/phosphor-ipmi-flash/issues/7 to track
this issue.

Thanks,
Brandon

On Tue, May 26, 2020 at 7:26 PM Patrick Venture <venture@google.com> wrote:

> On Tue, May 26, 2020 at 3:14 PM Patrick Voelker
> <Patrick_Voelker@phoenix.com> wrote:
> >
> >
> >
> > > > Internally, it looks like I need to get to abortProcess() but to do
> that I need
> > > to close the current session but I don=E2=80=99t have a way to obtain=
 the
> sessionID
> > > after the fact.  Also the stale session doesn=E2=80=99t seem to expir=
e (as
> mentioned
> > > in the readme.md) and I can=E2=80=99t find the support for that in th=
e code.
> > >
> > > https://github.com/openbmc/phosphor-ipmi-
> > > flash/blob/master/bmc/firmware_handler.cpp#L95
> > >
> > > You should be able to just delete any of the blob Id paths, such as
> > > the active blob path, and that should trigger what you want.
> >
> > As coded, that only works to abort when in in the verificationPending
> and updatePending states.  That won't work if it's stuck in the middle of
> an aborted transfer with a session that's still open.
>
> Right - because handlers don't control sessions, those are owned by
> the blob manager that's routing the commands. - then we'll need a
> patch to handle expiration, per the email chain - Sorry, I
> misunderstood the circumstance.
>

--000000000000d2f40905a722fdfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Created=C2=A0<a href=3D"https://github.com/openbmc/phospho=
r-ipmi-flash/issues/7">https://github.com/openbmc/phosphor-ipmi-flash/issue=
s/7</a>=C2=A0to track this issue.<div><br></div><div>Thanks,</div><div>Bran=
don</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, May 26, 2020 at 7:26 PM Patrick Venture &lt;<a href=3D"mai=
lto:venture@google.com">venture@google.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Tue, May 26, 2020 at 3:14 PM P=
atrick Voelker<br>
&lt;<a href=3D"mailto:Patrick_Voelker@phoenix.com" target=3D"_blank">Patric=
k_Voelker@phoenix.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; &gt; Internally, it looks like I need to get to abortProcess() bu=
t to do that I need<br>
&gt; &gt; to close the current session but I don=E2=80=99t have a way to ob=
tain the sessionID<br>
&gt; &gt; after the fact.=C2=A0 Also the stale session doesn=E2=80=99t seem=
 to expire (as mentioned<br>
&gt; &gt; in the readme.md) and I can=E2=80=99t find the support for that i=
n the code.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/openbmc/phosphor-ipmi-" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/phosphor-ipmi-</a><br>
&gt; &gt; flash/blob/master/bmc/firmware_handler.cpp#L95<br>
&gt; &gt;<br>
&gt; &gt; You should be able to just delete any of the blob Id paths, such =
as<br>
&gt; &gt; the active blob path, and that should trigger what you want.<br>
&gt;<br>
&gt; As coded, that only works to abort when in in the verificationPending =
and updatePending states.=C2=A0 That won&#39;t work if it&#39;s stuck in th=
e middle of an aborted transfer with a session that&#39;s still open.<br>
<br>
Right - because handlers don&#39;t control sessions, those are owned by<br>
the blob manager that&#39;s routing the commands. - then we&#39;ll need a<b=
r>
patch to handle expiration, per the email chain - Sorry, I<br>
misunderstood the circumstance.<br>
</blockquote></div>

--000000000000d2f40905a722fdfe--
