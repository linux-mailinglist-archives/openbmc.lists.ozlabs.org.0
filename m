Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 546991EC4D0
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 00:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c5sd5BRczDqXJ
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 08:13:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=n9hlI3Pm; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c5rn48dczDqJR
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 08:12:50 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id m18so200968ljo.5
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptg090scJM1aY3e8c6WIA/rfwx8vXX2muhuh8xcVEUg=;
 b=n9hlI3Pm+7T4HlCDcK9zUD7/IZc6QSafPLzds/hqdOn9QdV1bl9NwoPONa573MEA/6
 iJWCdd9x0MbrlJLKNJEmT88AMEuyjtDTda/Tifa+v7kNfnxmx7QtNYVdolJEt3FeU2J9
 OkAlvY+z2JSdF21DXurUsoRQ8EqLPlu57+vilymsF5vcR/8XxilB/5IM6WtnZCf2LxHs
 M54q2gRIqJ0YcevQZziXgoaegeUS0+dnn0ElDJuxHWZqnE8mUAvPjXGyxjyy9Xm3geqC
 EKYTRSLn+OqPEoPFj0DzNmXv3eKdlmly3NeiL25KcszIoRajNHMoTfeceD7b1bOkOsri
 TpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptg090scJM1aY3e8c6WIA/rfwx8vXX2muhuh8xcVEUg=;
 b=uUKhmzqH4bM71XEtLakQ8Sh38hP8kCzh0yd7tmJdpWA6rG9kMCv2qEXRYa9ipKP1Zx
 r808h38LPUMNx3T1wY+imc0IrgEEC8lAJbwPiLSwCtjlIp6cvsm48U6212RdWyBTT3V0
 v6JObV+1YEDAREg0ETB2btIitvpfSxHlSAHKl0P6T6FhbSGyM2I0rShimmE61Wd287Ef
 cfSEChC3ujVPuz8lufa7fn5K/brKQRxPDhb5eEvF2tKRZt1I0IMZ+9GqQLD4fFzfb5Xc
 IWD2eDtYrI/bU73QB6MdG/i41M7SJtEoQxy8VWZMr1mk41PnGds4WCudlg8t2nrcy9Ft
 YV1Q==
X-Gm-Message-State: AOAM5310aB4k9oIP3e8QewuVKfOzydG+W1ysPzyJffvy1J8hGTPfn/68
 lTY8SifN8LhECGtDDfNY5lZmzW2axk6jYp4jXNrD7w==
X-Google-Smtp-Source: ABdhPJx8ONGCApGObpJaZuMaj3XccBgfE6pbVTHQCkbVFgppXD8VqnSz4Oj7UAWYiNBNXwQy2B1iGZn4EPUNcwXMWjM=
X-Received: by 2002:a2e:45d6:: with SMTP id s205mr598837lja.101.1591135963958; 
 Tue, 02 Jun 2020 15:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
 <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
 <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <20200602200958.GI17541@heinlein>
In-Reply-To: <20200602200958.GI17541@heinlein>
From: Richard Hanley <rhanley@google.com>
Date: Tue, 2 Jun 2020 15:12:32 -0700
Message-ID: <CAH1kD+aCKNRY4sxPL0bwt0pzL+jW7QBmn7-_PTManZnn08kijg@mail.gmail.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000ec4cfe05a72135bf"
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
 =?UTF-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ec4cfe05a72135bf
Content-Type: text/plain; charset="UTF-8"

I found this thread on the gcc mailing list associated with the patches to
support coroutines
https://gcc.gnu.org/legacy-ml/gcc-patches/2020-01/msg01096.html

It sounds like the main parts that are experimental are:
1) There is some debate in the standards bodies about how to handle
allocation and how to disable exceptions.
2) There isn't an agreed upon way to handle ABI differences for calling
coroutines built by another compiler

I don't expect either of those issues to be particularly relevant to
OpenBMC, which makes me more amenable to playing around with it at this
stage.

Does anyone have an idea of what a good test project would be? Something of
modest size that we can look for any hidden dragons that still need taming.

- Richard

On Tue, Jun 2, 2020 at 1:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Jun 02, 2020 at 06:32:34PM +0000, Khetan, Sharad wrote:
> > From: openbmc <openbmc-bounces+sharad.khetan=intel.com@lists.ozlabs.org>
> On Behalf Of Adrian Ambrozewicz
> > Sent: Tuesday, June 02, 2020 1:19 AM
> > W dniu 5/26/2020 o 17:57, Patrick Williams pisze:
>
> > >I can imagine some companies or communities might choose to be careful
> in that matter. I was just wondering if there is some 'BKM' which states
> 'experimental (unstable?) implementations are prohibited from use until
> marked by software vendor as stable'. Maybe that's my problem - I could be
> confusing 'experimental' with 'unstable' after all:)
> >
> > If experimental means potentially unstable, I would say we avoid such
> implementation in the OpenBMC. We need to keep OpenBMC stable and such new
> language / compiler features may be pretty gnarly to debug by the users.
>
> Just a few thoughts:
>
> 1. We've not historically had this distinction / restriction.  We've
>    tended to use the latest C++ standard soon after it is available in our
>    Yocto compiler toolchain and even used std::experimental pieces.
>     * Yocto supported GCC7 (C++17 support) in April 2018 and we enabled
>       it in October 2018.
>     * We used mapbox::variant with C++14, which was a C++14
>     * implementation of the proposed C++17 API, and then used std::variant
>       when it was available.
>     * We still have code referring to std::experimental::filesystem
>       which has almost identical API as std::filesystem.
>
> 2. "Vendors" don't really give us an indication of stability, so we'd
>    need to define one.  Today, GCC's C++20 status is a simple "no
>    support" (red), "partial support" (yellow), "done" (green).  Most of
>    the C++20 support is in GCC-10 which we are now using.
>     * https://gcc.gnu.org/projects/cxx-status.html
>
> 3. I suspect most of our locally written code is "less stable" than
>    anything coming out of GCC simply by nature of how many users and tests
>    they have.  Most of the C++ features accepted by the standard
>    committees have an implementation in at least 1 of the big 3
>    compilers (MS-VS, GCC, Clang) and so there is code around to use for
>    test suites.
>
> --
> Patrick Williams
>

--000000000000ec4cfe05a72135bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I found this thread on the gcc mailing list associated wit=
h the patches to support coroutines<div><a href=3D"https://gcc.gnu.org/lega=
cy-ml/gcc-patches/2020-01/msg01096.html">https://gcc.gnu.org/legacy-ml/gcc-=
patches/2020-01/msg01096.html</a><br></div><div><br></div><div>It sounds li=
ke the main parts that are experimental are:</div><div>1) There is some deb=
ate in the standards bodies about how to handle allocation and how to disab=
le exceptions.</div><div>2) There isn&#39;t an agreed upon way to handle AB=
I differences for calling coroutines built by another compiler</div><div><b=
r></div><div>I don&#39;t expect either of those issues to be particularly r=
elevant to OpenBMC, which makes me more amenable to playing around with it =
at this stage.</div><div><br></div><div>Does anyone have an idea of what a =
good test project would be? Something of modest size that we can look for a=
ny hidden dragons that still need taming.</div><div><br></div><div>- Richar=
d</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 2, 2020 at 1:11 PM Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, Jun 02, 2020 at 06:32:34PM +0=
000, Khetan, Sharad wrote:<br>
&gt; From: openbmc &lt;openbmc-bounces+sharad.khetan=3D<a href=3D"mailto:in=
tel.com@lists.ozlabs.org" target=3D"_blank">intel.com@lists.ozlabs.org</a>&=
gt; On Behalf Of Adrian Ambrozewicz<br>
&gt; Sent: Tuesday, June 02, 2020 1:19 AM<br>
&gt; W dniu 5/26/2020 o=C2=A017:57, Patrick Williams pisze:<br>
<br>
&gt; &gt;I can imagine some companies or communities might choose to be car=
eful in that matter. I was just wondering if there is some &#39;BKM&#39; wh=
ich states &#39;experimental (unstable?) implementations are prohibited fro=
m use until marked by software vendor as stable&#39;. Maybe that&#39;s my p=
roblem - I could be confusing &#39;experimental&#39; with &#39;unstable&#39=
; after all:)<br>
&gt; <br>
&gt; If experimental means potentially unstable, I would say we avoid such =
implementation in the OpenBMC. We need to keep OpenBMC stable and such new =
language / compiler features may be pretty gnarly to debug by the users.<br=
>
<br>
Just a few thoughts:<br>
<br>
1. We&#39;ve not historically had this distinction / restriction.=C2=A0 We&=
#39;ve<br>
=C2=A0 =C2=A0tended to use the latest C++ standard soon after it is availab=
le in our<br>
=C2=A0 =C2=A0Yocto compiler toolchain and even used std::experimental piece=
s.<br>
=C2=A0 =C2=A0 * Yocto supported GCC7 (C++17 support) in April 2018 and we e=
nabled<br>
=C2=A0 =C2=A0 =C2=A0 it in October 2018.<br>
=C2=A0 =C2=A0 * We used mapbox::variant with C++14, which was a C++14<br>
=C2=A0 =C2=A0 * implementation of the proposed C++17 API, and then used std=
::variant<br>
=C2=A0 =C2=A0 =C2=A0 when it was available.<br>
=C2=A0 =C2=A0 * We still have code referring to std::experimental::filesyst=
em<br>
=C2=A0 =C2=A0 =C2=A0 which has almost identical API as std::filesystem.<br>
<br>
2. &quot;Vendors&quot; don&#39;t really give us an indication of stability,=
 so we&#39;d<br>
=C2=A0 =C2=A0need to define one.=C2=A0 Today, GCC&#39;s C++20 status is a s=
imple &quot;no<br>
=C2=A0 =C2=A0support&quot; (red), &quot;partial support&quot; (yellow), &qu=
ot;done&quot; (green).=C2=A0 Most of<br>
=C2=A0 =C2=A0the C++20 support is in GCC-10 which we are now using.<br>
=C2=A0 =C2=A0 * <a href=3D"https://gcc.gnu.org/projects/cxx-status.html" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/projects/cxx-status.=
html</a><br>
<br>
3. I suspect most of our locally written code is &quot;less stable&quot; th=
an<br>
=C2=A0 =C2=A0anything coming out of GCC simply by nature of how many users =
and tests<br>
=C2=A0 =C2=A0they have.=C2=A0 Most of the C++ features accepted by the stan=
dard<br>
=C2=A0 =C2=A0committees have an implementation in at least 1 of the big 3<b=
r>
=C2=A0 =C2=A0compilers (MS-VS, GCC, Clang) and so there is code around to u=
se for<br>
=C2=A0 =C2=A0test suites.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000ec4cfe05a72135bf--
