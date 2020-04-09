Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304391A3C26
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 23:56:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yw2p3ZF1zDqZP
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 07:56:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tfV/cIng; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yw0y2JyHzDqfG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 07:54:58 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id s13so25281lfb.9
 for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2020 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=LsAsRk/cupjEQJewvC9rrIKuu/fEOFh3anzRpfk4M3E=;
 b=tfV/cIngVzYWxECLBn/2VpSsPrHdM0ELPlEQW3L4HBxINPN3lAe/u2u1pTQCw2jcnl
 O+fhRhMyFSFoED2Qov5sG5Pr6TaMx8fDJs5VoU113abx1JdExew7x8H4pZptSta/ZQo9
 GmpSHxsZy8aGYsIF6mzhLZos4iofqpyTF4G7bz9ZtT8vxaKpwuj3QKTFX+6OVy2II/wC
 sXrB7LAuGBuEayLuiWNrv5YQRiNs3/sQvlFkrEGw19B2Mkt1n6F9UyGlazR6FMDfN9xM
 ERCTTGOi5cmS9DPSkRXHDUIaIVijONxuCyhtvrAcxOOObTdD/5ERsQrQ/IldRcV6AHky
 eKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=LsAsRk/cupjEQJewvC9rrIKuu/fEOFh3anzRpfk4M3E=;
 b=mzxv6QJ6CLmDuiwAUogR/YTTS20dJhp5Hg+Hyn02Dj9fF9cGKE9I1cUBfz6y419/nf
 5HO3a6h85hxkwKC+Whagc7HRc/LbCiT5cEuUJXWB0KvEnjVI2yiEF8ZxSKMmZFfEGVTn
 oga2r8QsgZu4b0Zuz+/kBkDeEgNVDK/lJVJSc2nMDyGXXGl88ArMpMJCZMCLfV4qjwHH
 o27UH/c5GiEfLvZDUcbPihGVSRVbZupgdRUvEtmb3lDtARp4X1cgXCaZMUAJmNzt2MqO
 +75wJk/fc8v9QX93h2c4j4gFGR234l5a6VJRD5NYzq1ALCKsOqDfWiic3FKpQaWozmr0
 dUnQ==
X-Gm-Message-State: AGi0PuYIiYME14497Ki1Z4T8HKV2ObFVz2vvHo6TSHcAbNtulgKvC7px
 qvFqxJMn/P2csd5KVGikHbXMOtKGLYrg5FRyqUK+NknsnWA=
X-Google-Smtp-Source: APiQypJ2W5UATkrzojhD3tXkb/87b/9va6GazRSIVDw5fYDlHQP7gPK034bMBQ1u93jriWc4d5aZ8V3fSto/XRLiuEo=
X-Received: by 2002:a19:224e:: with SMTP id i75mr787531lfi.22.1586469293969;
 Thu, 09 Apr 2020 14:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
In-Reply-To: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 9 Apr 2020 14:54:42 -0700
Message-ID: <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
Subject: Re: Call for Gardening Tasks
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b7439805a2e2aa9d"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b7439805a2e2aa9d
Content-Type: text/plain; charset="UTF-8"

Here are some ideas I have as a wishlist for gardening/improvements.

*Client Models for DBus*
Right now sdbusplus does a pretty good job of making server development
easy.  However, I wish we had some more tooling on the client side. I see a
decent amount of repeated code around ObjectMapper.

One way to separate concerns and cut down on boilerplate is to have a model
library. A call to a model would spin off an async method call to manage
the data marshalling, which would then call a lambda with a fully reified
object.  This is similar in concept to the way models work in web
development.

*Unit Testing in bmcweb*
This is pretty easy to say, and harder to do. I've been thinking a bit
about how to add in unit tests without them being too fragile. (This was
also something that geissonator mentioned).

*DBus Virtualization and Playback*
One thing that I think makes unit testing in some modules hard is that
there is a high barrier around mocking DBus.  I'm not sure the best way to
build this sustainably, but it would help improve our CI testing.

*OpenAPI for Redfish*
So far the general impression I've seen with this is that the Swagger
output for OpenAPI isn't really good for C++.  Either the ergonomics aren't
really good, or there is a lot of code bloat.  I'd love to have some
OpenAPI bindings that work well in OpenBMC.

*RUST!?!?*
I'm betting a lot of people have thought about Rust. I'd love to hear what
people have tried and what are the sticking points.  Any thoughts on what
module/functionality could be a decent candidate for breaking ground here?

-Richard

On Thu, Apr 9, 2020 at 2:54 PM Richard Hanley <rhanley@google.com> wrote:

> Hi everyone,
>
> Last week I started a thread on Open BMC Gardening
> <https://lists.ozlabs.org/pipermail/openbmc/2020-April/021100.html>, and
> I wanted to kick off the process.
>
> The basic idea here is to get a survey of various improvement tasks
> throughout OpenBMC.  Some things might be small refactoring or changes that
> can be done incrementally (i.e. weeding the garden). Other tasks might be
> more research or structural (i.e. excavating the garden).
>
> Just getting these in writing can be helpful for others to gauge what they
> should focus on. It also helps leave breadcrumbs for any new developer
> interested in the subject.
>
> So here's how I see this working. Anyone who has some ideas can reply to
> this thread with a short to medium description.  Try to avoid new features,
> and instead look at ways we could improve the status quo. Think about
> changes and tools that would make your day to day life better.
>
> From there we can do a write up about what we know about the issue.  This
> can function as an early stage design doc that gives a broad overview on
> where the dev's head is at right now.
>
> Finally, we can do a quarterly review to keep the garden refreshed.
> Obviously, things can change between that time, but having a semi-regular
> cadence will hopefully give us a better chance of keeping this up to date.
>
> - Richard
>

--000000000000b7439805a2e2aa9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Here are some ideas I have as a wishlist for gardening/imp=
rovements.<div><br></div><div><b>Client Models for DBus</b></div><div>Right=
 now sdbusplus does a pretty good job of making server development easy.=C2=
=A0 However, I wish we had some more tooling on the client side. I see a de=
cent amount of repeated code around ObjectMapper.=C2=A0</div><div><br></div=
><div>One way to separate=C2=A0concerns and cut down on boilerplate is to h=
ave a model library. A call to a model would spin off an async method call =
to manage the data marshalling, which would then call a lambda with a fully=
 reified object.=C2=A0 This is similar in concept to the way models work in=
 web development.</div><div><br></div><div><b>Unit Testing in bmcweb</b></d=
iv><div>This is pretty easy to say, and harder to do. I&#39;ve been thinkin=
g a bit about how to add in unit tests without them being too fragile. (Thi=
s was also something that geissonator mentioned).</div><div><br></div><div>=
<b>DBus Virtualization and Playback</b></div><div>One thing that I think ma=
kes unit testing in some modules hard is that there is a high barrier aroun=
d mocking DBus.=C2=A0 I&#39;m not sure the best way to build this sustainab=
ly, but it would help improve our CI testing.</div><div><b><br></b></div><d=
iv><b>OpenAPI for Redfish</b></div><div>So far the general impression I&#39=
;ve seen with this is that the Swagger output for OpenAPI isn&#39;t really =
good for C++.=C2=A0 Either the ergonomics aren&#39;t really good, or there =
is a lot of code bloat.=C2=A0 I&#39;d love to have some OpenAPI bindings th=
at work well in OpenBMC.</div><div><br></div><div><b>RUST!?!?</b></div><div=
>I&#39;m betting a lot of people have thought about Rust. I&#39;d love to h=
ear what people have tried and what are the sticking points.=C2=A0 Any thou=
ghts on what module/functionality could be a decent candidate=C2=A0for brea=
king ground here?</div><div><br></div><div>-Richard</div><div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Apr 9, 2020 at 2:54 PM Richard Hanley &lt;<a href=3D"mailto:rhanley@google=
.com">rhanley@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">Hi everyone,<div><br></div><div>La=
st week I started a thread on <a href=3D"https://lists.ozlabs.org/pipermail=
/openbmc/2020-April/021100.html" target=3D"_blank">Open BMC Gardening</a>, =
and I wanted to kick off the process.</div><div><br></div><div>The basic id=
ea here is to get a survey=C2=A0of various improvement=C2=A0tasks throughou=
t OpenBMC.=C2=A0 Some things might be small refactoring or changes that can=
 be done incrementally (i.e. weeding the garden). Other tasks might be more=
 research or structural (i.e. excavating the garden).</div><div><br></div><=
div>Just getting these in writing can be helpful for others to gauge what t=
hey should focus on. It also helps leave breadcrumbs for any new developer =
interested in the subject.</div><div><br></div><div>So here&#39;s how I see=
 this working. Anyone who has some ideas can reply to this thread with a sh=
ort to medium description.=C2=A0 Try to avoid new features, and instead loo=
k at ways we could improve the status quo. Think about changes and tools th=
at would make your day to day life better.</div><div><br></div><div>From th=
ere we can do a write up about what we know about the issue.=C2=A0 This can=
 function as an early stage design doc that gives a broad overview on where=
 the dev&#39;s head is at right now.</div><div><br></div><div>Finally, we c=
an do a quarterly review to keep the garden refreshed. Obviously, things ca=
n change between that time, but having a semi-regular cadence will hopefull=
y give us a better chance of keeping this up to date.</div><div><br></div><=
div>- Richard</div></div>
</blockquote></div>

--000000000000b7439805a2e2aa9d--
