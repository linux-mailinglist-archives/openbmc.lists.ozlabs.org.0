Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F00296614
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 22:40:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHK4Q4qFVzDqvZ
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 07:40:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C7UaT06o; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHK3S1wvQzDqsy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 07:39:27 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id r9so3092723ioo.7
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fr9mNybr0drqAnau0hZK0DkHCOXH06tNSvlmxtkZUbo=;
 b=C7UaT06oAd3fpvhIlDB0Z44qaz9jNTQrsJXnpCsiG34LAB9dm6CJZo7i+klDKBbW3K
 Aeyvp6PX42qFY28ZdwrHfINtz7DrtqyEEaUMae5HUFoWFBc80q0rvc5p9GCi3/CzIz1e
 +9MJQvSOmCaN2+CLQgA8hRwY7lUbiROsH8skqFlTfrFl75iTXqI0EgYj1Bicvkfy0QtL
 TxneSh+VX3DxiOuT7VWS0c4z3ySi7GJc57xD1SCQZzDOQyQRhuMnZ8l1EydAUwb9CdXT
 hfdbMy0YNMcTchgRL2kiXoyllFBMLNCnKPKE5v01iXZu65tPEVHIVX20F5JoSgijjbuw
 V+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fr9mNybr0drqAnau0hZK0DkHCOXH06tNSvlmxtkZUbo=;
 b=RH/zjM9Oa2gjTWuvENWv9oxvjEdqpBaSV+yxn7QcdvsHJ1mCAzmJyGUisTddzYgWi7
 kTScOpuTVNGpYY3ap1qmcSEjsX+lITD6nTMrTQq9BcaDGDZKMoi3fZwgHBOgTNjIDow+
 yuRprsGIqpwfouPUmgDi/mUimiCV8azVkdzmNH/L6vDx+/83zSc6D/vyUenaoldjbT77
 uKJ35LmC/P7Q4MclbrsSCsj1ILdNiN+/AuXncvyPlqU9TzTVlA1Z/HNiR/MXokWoVgZl
 oirTu9G/mIyX4WVcDjIvsXsSQQlw9i3Xc2raavtE4wjDDTQ1L13b7Uz1lPm70z4YSfYh
 dt/A==
X-Gm-Message-State: AOAM531SmAeQG2cnukhDnhSCqTOzrUtQ2CDoIqtyWywXnneYi00h3yan
 M7leQToADBkxW1ytV1JbKcn7IC3NJ52UnO5G+/iDiw==
X-Google-Smtp-Source: ABdhPJxjplClaS4EMxu+OGT5wJCzgF1nk7pUZx1XUAfbA5B+LU0/yJfkM6HQXRtBMxKBXdFjZwdaAaypI8k0NU9Nyr0=
X-Received: by 2002:a6b:e716:: with SMTP id b22mr2849503ioh.98.1603399163457; 
 Thu, 22 Oct 2020 13:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
 <20201016202542.GB3614@heinlein>
 <CADVsX8_Z1GHkw0Z8-2jFGrFVVkMnMkK_rVdLJy8TQ=RiK13-dQ@mail.gmail.com>
 <CADVsX89sYGv6fKdDNTX7ER7hhSwJSidmQP9wWEqExs-K0CT7eg@mail.gmail.com>
 <CADVsX8_M4qcgYoVq1AC5WgMO598mWT6gfeyqrzScQQrt==uwoA@mail.gmail.com>
 <CAH2-KxA9cX49Kfp4SbRPdY1wRt3u8T7o-hUfkBORZNZ9yUXoSg@mail.gmail.com>
In-Reply-To: <CAH2-KxA9cX49Kfp4SbRPdY1wRt3u8T7o-hUfkBORZNZ9yUXoSg@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Thu, 22 Oct 2020 22:39:12 +0200
Message-ID: <CADVsX88EajC-xZuO2CwW_0B4x92u5ppYUG2pOr0RMEn8-EeduA@mail.gmail.com>
Subject: Re: [gbmc-team] Re: /etc/migration.d
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="00000000000092992705b24875a6"
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

--00000000000092992705b24875a6
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2020 at 21:35, Ed Tanous <edtanous@google.com> wrote:

> On Thu, Oct 22, 2020 at 9:19 AM Anton Kachalov <rnouse@google.com> wrote:
> >
> > Hello,
> >
> > any objections about distro feature flag to cover root Vs. non-root
> configs & code?
> >
>
> My only concern is whether or not it's needed.  If a particular daemon
> runs and functions as non-root, is there a reason why anyone would opt
> out of that?  Presumably as an intermediate step we could make it a
> distro flag, but in the long term, ideally, that would just be the
> default.
>

Sorry, I might not be clear. The flag is required while converting /
testing other platforms (that I've stated as "then iteratively enabled
across other platforms once they are ready"). Once everything is set, we
can just remove the flag and make behaviour default.


>
> Are there use cases where certain builds need daemons to run as root?
>

Only a fast way to switch back to root env if something would be broken for
a specific target running unprivileged users.

--00000000000092992705b24875a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Oct 2020 at 21:35, Ed Tano=
us &lt;<a href=3D"mailto:edtanous@google.com">edtanous@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Oc=
t 22, 2020 at 9:19 AM Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.co=
m" target=3D"_blank">rnouse@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; any objections about distro feature flag to cover root Vs. non-root co=
nfigs &amp; code?<br>
&gt;<br>
<br>
My only concern is whether or not it&#39;s needed.=C2=A0 If a particular da=
emon<br>
runs and functions as non-root, is there a reason why anyone would opt<br>
out of that?=C2=A0 Presumably as an intermediate step we could make it a<br=
>
distro flag, but in the long term, ideally, that would just be the<br>
default.<br></blockquote><div><br></div><div>Sorry, I might not be clear. T=
he flag is required while converting / testing other platforms (that I&#39;=
ve stated as &quot;then iteratively enabled across other platforms once the=
y are ready&quot;). Once everything is set, we can just remove the flag and=
 make behaviour default.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
Are there use cases where certain builds need daemons to run as root?<br></=
blockquote><div><br></div><div>Only a fast way to switch back to root env i=
f something would be broken for a specific target running unprivileged user=
s.=C2=A0</div></div></div>

--00000000000092992705b24875a6--
