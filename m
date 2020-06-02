Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B11EC56A
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 01:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c6z43NJszDqMp
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 09:03:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mXDRKKR3; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c6yK5wlKzDqHV
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 09:02:49 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id b6so343867ljj.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ur1IHVfaSlXC+6CxvRXVc4paQ+IrexJlTPamDd64/xg=;
 b=mXDRKKR3FWCd4vuTRy1k/g8HroeW6KHq0qXHIqNR5g8F4/ENEcpsZAqCVQuMQOol9x
 2R/i8PyMkRh+m3BYWadi3moNZLKnLMCkmeeQQAO1xkjEA4rm5BVDCU2O8zOG6gfbvEV+
 f8P5jSPH6byAdANyCOAlLHcwhUTQQ4+5BgOyGPj3LL+o80Xva247qCqwXxaKB0crt/Ll
 uXMKt7p8LUQB/07YaPJ59JsPJRa8p93SxgiU+hnvg5SMcMi6wAeIBF1/RCfPCveL5lfy
 oGp1S2PlXvRvJFedUhVXtNuDbn5FuDzmQuqv0n+BFw0e6gGrqYuqmpmEZAiMD9UqlhXm
 9TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ur1IHVfaSlXC+6CxvRXVc4paQ+IrexJlTPamDd64/xg=;
 b=l7vyZ0sYx+oaRpGlNzZENXuKUWOaB1cdSXyPQPqUhvuAZHAkWX1D27mSON1D9Je3UR
 OkZjystyiyUP+h+6iq7pTJNIkuvuFvHVB6SETOaGx9LEpCUxBjrAREO9cpERgJUgdqyL
 fSs9ObQKCQ1SbNjKXYnZ3OcyF5cVyKZZKdacLeGcodZ6Cwn2KH4mrTZP9yK/E+AIYqLG
 621m5fI5oZJCIo63tXBzuEWmoL/PqZQP96/3sVCS9IVFM6us/lQCEV+Jw+a10N+BGRUL
 29MW0tv0Zsr65nRGa1qtl2wGTqSvlpLpu5rjUnh4jn/DEW6nmaVEQez1J7FWFGJNYm8l
 /aFw==
X-Gm-Message-State: AOAM533VOYnuTuDyQtEg8Mb7ERvSLGqPBIkrDzFwln0c+7daA448xC9+
 mMcecDEqkgrTFHWK0tOi2TYJw89HAG8v9tqmjSlIlw==
X-Google-Smtp-Source: ABdhPJytNfdZsITqjns+zjEdpPyoOPKEd1LKx/V/sWNMD6l3ygHVCx0Gjz4NwAFLM+uEAyDaQDcQIm6nYE5Zt6HFxuM=
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr643616ljk.379.1591138964516; 
 Tue, 02 Jun 2020 16:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
 <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
 <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <20200602200958.GI17541@heinlein>
 <CAH1kD+aCKNRY4sxPL0bwt0pzL+jW7QBmn7-_PTManZnn08kijg@mail.gmail.com>
 <20200602225501.GJ17541@heinlein>
In-Reply-To: <20200602225501.GJ17541@heinlein>
From: William Kennington <wak@google.com>
Date: Tue, 2 Jun 2020 16:02:33 -0700
Message-ID: <CAPnigKmMD6dGZRRxh4v5eH5sH4jYHii7vw4qm15+z17-rwujOQ@mail.gmail.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000c4f09605a721e84d"
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c4f09605a721e84d
Content-Type: text/plain; charset="UTF-8"

Yeah, I wrote some client binding code with async support a while back but
never wrote the generators for it. I can revive the lightweight futures and
sdeventplus changes that would make them more convenient to use for this
purpose.

https://gerrit.openbmc-project.xyz/q/topic:%22sdbus-client-types%22+(status:open%20OR%20status:merged)
https://gerrit.openbmc-project.xyz/q/topic:%22sdevent-async%22+(status:open%20OR%20status:merged)

On Tue, Jun 2, 2020 at 3:55 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Jun 02, 2020 at 03:12:32PM -0700, Richard Hanley wrote:
> > Does anyone have an idea of what a good test project would be? Something
> of
> > modest size that we can look for any hidden dragons that still need
> taming.
>
> I'm starting work on adding coroutine support to sdbusplus as an
> alternative to Boost::ASIO.  I think it would be also interesting to
> look at sdeventplus for adding coroutine support and hopefully some
> convergance between the two of them to facilitate coroutine reuse
> (especially in the top-level scheduling portions).
>
> My main motivations are:
>     - Simplifying / flattening the callback lambdas associated with ASIO
>       by using coroutines instead.
>
>     - Use sdbusplus-coroutines as the basis for generating client
>       bindings.  Since the project is moving towards async applications,
>       there isn't much value in investing in sync client bindings.
>
> --
> Patrick Williams
>

--000000000000c4f09605a721e84d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yeah, I wrote some client binding code with async support =
a while back but never wrote the generators for it. I can revive the lightw=
eight futures and sdeventplus changes that would make them more convenient =
to use for this purpose.<div><div><br></div><div><a href=3D"https://gerrit.=
openbmc-project.xyz/q/topic:%22sdbus-client-types%22+(status:open%20OR%20st=
atus:merged)">https://gerrit.openbmc-project.xyz/q/topic:%22sdbus-client-ty=
pes%22+(status:open%20OR%20status:merged)</a><br></div><div><a href=3D"http=
s://gerrit.openbmc-project.xyz/q/topic:%22sdevent-async%22+(status:open%20O=
R%20status:merged)">https://gerrit.openbmc-project.xyz/q/topic:%22sdevent-a=
sync%22+(status:open%20OR%20status:merged)</a><br></div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2=
, 2020 at 3:55 PM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz"=
>patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, Jun 02, 2020 at 03:12:32PM -0700, Richard Hanley =
wrote:<br>
&gt; Does anyone have an idea of what a good test project would be? Somethi=
ng of<br>
&gt; modest size that we can look for any hidden dragons that still need ta=
ming.<br>
<br>
I&#39;m starting work on adding coroutine support to sdbusplus as an<br>
alternative to Boost::ASIO.=C2=A0 I think it would be also interesting to<b=
r>
look at sdeventplus for adding coroutine support and hopefully some<br>
convergance between the two of them to facilitate coroutine reuse<br>
(especially in the top-level scheduling portions).<br>
<br>
My main motivations are:<br>
=C2=A0 =C2=A0 - Simplifying / flattening the callback lambdas associated wi=
th ASIO<br>
=C2=A0 =C2=A0 =C2=A0 by using coroutines instead.<br>
<br>
=C2=A0 =C2=A0 - Use sdbusplus-coroutines as the basis for generating client=
<br>
=C2=A0 =C2=A0 =C2=A0 bindings.=C2=A0 Since the project is moving towards as=
ync applications,<br>
=C2=A0 =C2=A0 =C2=A0 there isn&#39;t much value in investing in sync client=
 bindings.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000c4f09605a721e84d--
