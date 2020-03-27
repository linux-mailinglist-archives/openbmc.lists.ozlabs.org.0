Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75521194E21
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 01:38:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pNJ73DKWzDr3f
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 11:38:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Wqco4Vh8; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pNH762ZrzDr27
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 11:37:38 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id i20so8457845ljn.6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sVpXmZrSLQ83hsSsaBL3L/XXkiEGACe9OC/vMOjvnNE=;
 b=Wqco4Vh87iR0MCoFOlkAFwvzWjRum04Um4iWUEnf70w8xwTOw1zuS2b/KDkr5JCVQw
 KHDe9PDSWYj3Vj5bTxs/bqBosGFW/rtP2JnhqiV28nZp1pXuQMxYtrMfBn1AHkk0KMxQ
 XrH9m8tGGGIyCeGl//UtSXKWhDLp9QfLQYLqd49aqdESh0p0ODA0LbT4LXYO0p+gMR5T
 kLZLau38H6wWCBYigY3FhGz1+jqb8l94OlhUeOCJjbkUB8z3x4D/s9g+s9GjWasBYrgO
 jFfESXbrYEFX849Vn4W+bMZ1z6/0mCPlvIO0mufmgldfzjwxyIG8Z2WZcbLdc+q2rSMI
 BBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sVpXmZrSLQ83hsSsaBL3L/XXkiEGACe9OC/vMOjvnNE=;
 b=WbJ4vKYoN70JH2hKlVULUwecSU/p7S8EfvEoHBb9bX5WeGGJbVgaZ4uyGnaCT0URr3
 MTn0QRncbGZC93HO0mHMcTiSvOFB4mFFs+5mwEQjiItM7MSnegCksOjIh6iRoDvPR/1r
 d7x4dbj77YPlMgoARKZPsBpyqOyeOSKw+ceGVWxDnCxCIoQouTOWy71glO1hXeLFzAwj
 yQ3Awwi5nHqAiNjlghdDWkccO3Klm/R+0FgoEdcpmCZBR3ghXVf6nlR0SjXLzMEXUwbT
 XfTEnlluRijzkgqMsJtZp9IPq03KkX8JpucJ+RvegvxHDsQILeymgGLKdhqh6q4akEsu
 6gQw==
X-Gm-Message-State: ANhLgQ2XKCceaWkZW8LRfBEOLZKgSZYkMNgOwQaIooxvFqfxGGPA5sSg
 Qlj1ID04Ziv343EIJM8hrtLGBwyMR7HY+wuAXyHr8g==
X-Google-Smtp-Source: APiQypKb+cSHj0ve5U7P8NrErtcg7NxCfUpkPvLJLEFTybfB8Pw9c2hz1Skj9AXR4s5MllM/ewDoRgYNYNSk5sF48gY=
X-Received: by 2002:a05:651c:287:: with SMTP id
 b7mr6801376ljo.129.1585269451774; 
 Thu, 26 Mar 2020 17:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <AA561FEC-E514-41F1-800F-B1085C05D6C2@fuzziesquirrel.com>
 <20200324160659.GB23988@patrickw3-mbp>
 <318AF56E-3DC0-4B3E-9B41-E49C51A1F3B3@fuzziesquirrel.com>
In-Reply-To: <318AF56E-3DC0-4B3E-9B41-E49C51A1F3B3@fuzziesquirrel.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 26 Mar 2020 17:37:20 -0700
Message-ID: <CAH1kD+Yw2AcigiDcxpUfHB_M7C3u2s8RdqG3dbyHwuJXyS0gng@mail.gmail.com>
Subject: Re: corosync?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="0000000000008c614f05a1cb4e73"
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

--0000000000008c614f05a1cb4e73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We looked into getting Envoy as a proxy for a distributed BMC network.  The
idea was that Envoy could be used for discoverability and creating long
lived authenticated channels with HTTP/2.  That work got mostly shelved
because it was really hard to get the build system to work on 32-bit arm
(not to mention getting it to work with bitbake).

I'm not too familiar with corosync.  I remember reading a bit about it when
Vishwa mentioned aggregating BMCs a few months ago.  It looks like it
should be relatively easy to build (at least compared to envoy).

Unfortunately we never got a chance to see how much cpu usage is used when
Envoy is run on a Poleg.  In terms of sheer craziness, corosync isn't any
less crazy than what we were thinking about, and I was relatively
optimistic that it could work on current generation hardware.

- Richard

On Tue, Mar 24, 2020 at 9:22 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 12:06 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> > On Tue, Mar 24, 2020 at 11:33:23AM -0400, Brad Bishop wrote:
> >> Is anyone using corosync/pacemaker on a BMC?  Is that a crazy idea? :-=
)
> >>
> >> thx - brad
> >
> > Can you elaborate on what you'd be trying to accomplish?
>
> Thanks Patrick.  Yes I will definitely do that at some point.  I=E2=80=99=
m not
> ready to do this right now though simply because I myself am not sure
> what
> I am trying to accomplish.
>
> In this moment I=E2=80=99m just curious if anyone has any experience with=
 it, or
> similar tools or frameworks, in a "BMC-like" distributed system, and the
> sorts of problems that were solved with it/them.
>
> thx - brad
>

--0000000000008c614f05a1cb4e73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We looked into getting Envoy as a proxy for a distributed =
BMC network.=C2=A0 The idea was that Envoy could be used for discoverabilit=
y and creating long lived authenticated channels with HTTP/2.=C2=A0 That wo=
rk got mostly shelved because it was really hard to get the build system to=
 work on 32-bit arm (not to mention getting it to work with bitbake).<div><=
br></div><div>I&#39;m not too familiar with corosync.=C2=A0 I remember read=
ing a bit about it when Vishwa mentioned aggregating BMCs a few months ago.=
=C2=A0 It looks like it should be relatively easy to build (at least compar=
ed to envoy).</div><div><br></div><div>Unfortunately we never got a chance =
to see how much cpu usage is used when Envoy is=C2=A0run on a Poleg.=C2=A0 =
In terms of sheer craziness, corosync isn&#39;t any less crazy than what we=
 were thinking about, and I was relatively optimistic that it could work on=
 current generation hardware.=C2=A0=C2=A0</div><div><br></div><div>- Richar=
d</div><div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Mar 24, 2020 at 9:22 AM Brad Bishop &lt;<a href=
=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">at 12:06=
 PM, Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_b=
lank">patrick@stwcx.xyz</a>&gt; wrote:<br>
<br>
&gt; On Tue, Mar 24, 2020 at 11:33:23AM -0400, Brad Bishop wrote:<br>
&gt;&gt; Is anyone using corosync/pacemaker on a BMC?=C2=A0 Is that a crazy=
 idea? :-)<br>
&gt;&gt;<br>
&gt;&gt; thx - brad<br>
&gt;<br>
&gt; Can you elaborate on what you&#39;d be trying to accomplish?<br>
<br>
Thanks Patrick.=C2=A0 Yes I will definitely do that at some point.=C2=A0 I=
=E2=80=99m not=C2=A0 <br>
ready to do this right now though simply because I myself am not sure what=
=C2=A0 <br>
I am trying to accomplish.<br>
<br>
In this moment I=E2=80=99m just curious if anyone has any experience with i=
t, or=C2=A0 <br>
similar tools or frameworks, in a &quot;BMC-like&quot; distributed system, =
and the=C2=A0 <br>
sorts of problems that were solved with it/them.<br>
<br>
thx - brad<br>
</blockquote></div>

--0000000000008c614f05a1cb4e73--
