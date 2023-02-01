Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A0C685C99
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 02:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P642p4b1Dz3cFm
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 12:24:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nkzYHXDg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nkzYHXDg;
	dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P64296RY3z2xkm
	for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2023 12:24:00 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id k12so12419867qvj.5
        for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 17:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywwZHJPfcPXV878+4XlTEtzY+WC/YOLoUjJfdKx1J1M=;
        b=nkzYHXDgfGeTOloEO9u4RTB39TO4+Mr7O8OuQvX8ZVPMJU5MK3Csur8vpujAOtFevc
         OU0S13Fj5N+pV1q4UhpH2T53mzCMaoAd21CzgRGwBYnkL0vsNMKEKTamb03H/jKi5qm2
         /A6Ng2njmk5LA+50pC2IsyMjwUl58zwletB/8LbgxjPYUGDVRg/l1pkNouktWckHKAZC
         TBhzXDUxna0wGLIXQz/CZPNDVo1YJ5V4ksJwvVv+/d3qLMDVQhhNOQ2bVDWiYmjp/+Qz
         p5gG4lB0a9T3qnr5KuSnZmK6TbCBH1k2sg5GP1OH+QbPIngduvkzRjPvOJ/cTTjulgOx
         dUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywwZHJPfcPXV878+4XlTEtzY+WC/YOLoUjJfdKx1J1M=;
        b=I/iKmFVZNbBd3wXnABho/O5ew6BpAPdID7WrQJLPcHGmaWlzEBJccZjm7I86j45UfD
         nKNYiCtWeHBaykKy3MlcTWzxxBynJLgv6p4/uJ5TeXFd8OYNfIyJfi7pgkR7B2umAX4V
         Hd5vk1OfZEUlfInrkTI7Tiuw2xVYaQCQhwoDLsWAq736evGDxMCn6qXCcAhR710s3bSt
         mL9YFs2kGuuO4En28k/Rmtpk1/PZvZvkY2VgF2INNsV7ttLiVshrrT8EWnv+LO7M/fax
         mRB0CaAuHKHuOQd33A86jvEG4uoXiZ+ay81ry5C5YUVqkvlwssuAV6py9xk/4ZDs13Rg
         6/MA==
X-Gm-Message-State: AO0yUKU7Z97CE1fICg0zw0LIDkrw0Ph6IMsKxejkl5/Dwx4uwRA5KJla
	2VdXu60tSt/jJNi6rp4yNNMt0UZ/LnLHQXHiqH9ng9xdCMPDX10Y4VDnSA==
X-Google-Smtp-Source: AK7set+yREG+nPOgsLv65K5ohSjFnSGyoqZHkZ3CiDO6byKDmI3ykNGXpzBeylyZhJhxYSpd0Ts4HJu0qlUQYcOBbZg=
X-Received: by 2002:a05:6214:2b98:b0:53b:40cc:f67 with SMTP id
 kr24-20020a0562142b9800b0053b40cc0f67mr44608qvb.35.1675214635578; Tue, 31 Jan
 2023 17:23:55 -0800 (PST)
MIME-Version: 1.0
References: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net> <Y9hau8eAn3W6Tf13@heinlein.taila677.ts.net>
 <b23a1dc5-1aa6-c72e-0b1b-444b7ec9aeae@linux.intel.com>
In-Reply-To: <b23a1dc5-1aa6-c72e-0b1b-444b7ec9aeae@linux.intel.com>
From: William Kennington <wak@google.com>
Date: Tue, 31 Jan 2023 17:23:44 -0800
Message-ID: <CAPnigKk6VNkqX1uRBKSDWN6HqcZZNH_+pJLB9v_4-q1NLnfF=w@mail.gmail.com>
Subject: Re: TOF elections for 2023H1
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000047313c05f3994deb"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000047313c05f3994deb
Content-Type: text/plain; charset="UTF-8"

I'll also self-nominate to continue serving the community on the TOF.

On Tue, Jan 31, 2023 at 7:40 AM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

>
>
> On 1/30/2023 5:03 PM, Patrick Williams wrote:
> > On Mon, Jan 30, 2023 at 05:47:21PM -0600, Patrick Williams wrote:
> >
> >> B. We have 4 members who's 1 year term has ended, which means there are
> 4
> >>     positions up for election.  These members have an ending term and
> may
> >>     be renominated:
> >>          * Andrew Jeffery
> >>          * Jason Bills
> >>          * Patrick Williams
> >>          * William Kennington
> >>
> >> C. Nominations for (B) may be sent to the mailing list by replying to
> >>     this email.  Only those eligible to vote may be nominated.
> >
> > I'll self-nominate to continue serving the community on the TOF.
> >
> I'll also self-nominate to continue serving the community on the TOF.
>
> Jason
>

--00000000000047313c05f3994deb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll also self-nominate to continue serving the commun=
ity on the=C2=A0<span class=3D"gmail-il">TOF</span>.<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 31, 202=
3 at 7:40 AM Bills, Jason M &lt;<a href=3D"mailto:jason.m.bills@linux.intel=
.com">jason.m.bills@linux.intel.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/30/2023 5:03 PM, Patrick Williams wrote:<br>
&gt; On Mon, Jan 30, 2023 at 05:47:21PM -0600, Patrick Williams wrote:<br>
&gt; <br>
&gt;&gt; B. We have 4 members who&#39;s 1 year term has ended, which means =
there are 4<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0positions up for election.=C2=A0 These members =
have an ending term and may<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0be renominated:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Andrew Jeffery<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Jason Bills<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Patrick Williams<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * William Kennington<br>
&gt;&gt;<br>
&gt;&gt; C. Nominations for (B) may be sent to the mailing list by replying=
 to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0this email.=C2=A0 Only those eligible to vote m=
ay be nominated.<br>
&gt; <br>
&gt; I&#39;ll self-nominate to continue serving the community on the TOF.<b=
r>
&gt; <br>
I&#39;ll also self-nominate to continue serving the community on the TOF.<b=
r>
<br>
Jason<br>
</blockquote></div>

--00000000000047313c05f3994deb--
