Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E7F0D01
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 04:26:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Blm35V3zF5N9
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 14:26:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C9tVecY9"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477BhS6VsVzF3Rk
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 14:23:52 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id g50so32214291qtb.4
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 19:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r4CBc+mI3m1GgK1OMAZXz7s6KsHvvz2Uu2ZE8oaKzB4=;
 b=C9tVecY9peRPf1Io+uLJCpJHlvU73PoQU8w5BEDhVZpjJioRJwHZ6c8Tw48O7O+k6K
 +7PGh/DuruMasnS9Ba2Rh7IGZdftE3mRduP27MSLeqjarpbv08eEJ6ZX4NZ6BM+OCwNh
 HxeO7pYnn4ZxFxedzOI/Ng1ogFRCK9fF5p/VPHFlmJB4Rg3oIrdWDNrfc8WCijZ43mO7
 6HeGzexPhIPds16xwhI2cc3v/o2Qs6OhjE8MXLjBHwVltpQH4PURMmpMTQObsBp0O7f2
 I9TaVA1JSgQVAXW6T7yPUeIgPjTSvUVSDaDrSGKe43ZvPb1ymP9KqbCgBz6wr81GXLEV
 reoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4CBc+mI3m1GgK1OMAZXz7s6KsHvvz2Uu2ZE8oaKzB4=;
 b=LVIt+5qZEYV0fSceOarFI+sroJbB9B555GPLJ+7XVSZUuN7PM7nRUo5MxRu7R5+Ids
 Ryq0bG7AhfZDEe9ZDVXbXF4PaNPRGmdWKP4x85gByrachn2eWuWqMZK7+3R84JylT4qQ
 5oQ8GKqqARsPOj86YqHXZxFXVWFL94gJvrPcm5kG0ga34UuTEAja/QJWWa5fssJD/CGH
 BFj/Z40RzkqodP8eMk1ZbdTAa+LvzqTISm1yHPLaO2Gp9jNpvYZIYB3AsMxeGiJWgVVp
 OROSS/9kmgYXvlRSDX4vf/0mEkLSQIMPcVFKSYVX2Ikx2nqZqdJbRGz85te5UaTZzqT9
 ilZw==
X-Gm-Message-State: APjAAAWtU0NK0FOmh6PsW46tCdJcuSTXX/XRJzr5XSmnQtH6I1JI35kl
 kw7tHJswhKr8O7FVA0K2qeUrYbuvxKyoCp682K4=
X-Google-Smtp-Source: APXvYqxTDTbcZTUuRQkdsBhB/e+tQHGCieNO4mC7fFi4szr1A01XT7J4pNh8BfhJkoy3NQ6oCZ3Ym+NlCcNGzr+QYug=
X-Received: by 2002:ac8:1871:: with SMTP id n46mr499629qtk.240.1573010626893; 
 Tue, 05 Nov 2019 19:23:46 -0800 (PST)
MIME-Version: 1.0
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
 <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
 <E7046336-11A9-4D82-9DDC-6DB7DF94C8C5@fuzziesquirrel.com>
 <953ff1d9-294a-025e-7c10-91ec80b81e9e@linux.intel.com>
 <CAARXrtmYykUAGr015qhRc5VAZB20_cc7pqRXmDGYag_7vZiSvA@mail.gmail.com>
In-Reply-To: <CAARXrtmYykUAGr015qhRc5VAZB20_cc7pqRXmDGYag_7vZiSvA@mail.gmail.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Wed, 6 Nov 2019 11:23:35 +0800
Message-ID: <CANFuQ7D07LrT4SZNWKwuQwj2rQGv+Qzn_cKWWHaqoHKdTyuG5g@mail.gmail.com>
Subject: Re: HTTP redirect to HTTPS for web UI
To: Lei YU <mine260309@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a4dceb0596a5134b"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a4dceb0596a5134b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lei YU <mine260309@gmail.com> =E4=BA=8E2019=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8810:02=E5=86=99=E9=81=93=EF=BC=9A

> On Wed, Nov 6, 2019 at 1:20 AM James Feist <james.feist@linux.intel.com>
> wrote:
> >
> > On 11/4/19 4:36 PM, Brad Bishop wrote:
> > >
> > >
> > >> On Oct 31, 2019, at 11:26 PM, Lei YU <mine260309@gmail.com> wrote:
> > >>
> > >> On Thu, Oct 31, 2019 at 9:48 PM George Liu <liuxiwei1013@gmail.com>
> wrote:
> > >>>
> > >>> Hi All:
> > >>> I'm working on http redirect to https task(
> https://github.com/ibm-openbmc/dev/issues/895).
> > >>> I took a cursory look at the design(
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173) and did some
> testing.
> > >>>
> > >>> In bmcweb, I find it the current communication logic can only liste=
n
> to one communication protocol (http or https). If you listen to both
> protocols at the same time, you need to change a lot of code and
> communication logic.
> > >>> If we are going to implement this feature in bmcweb, it costs extra
> effort and it's likely the implementation is no better than Nginx. so I
> prefer to use Nginx.
> > >>>
> > >>
> > >>>  From Ed's [mail in June][1], one approach is to use boost asio
> async_detect_ssl.
> > >>
> > >> But I agree with George here that it costs extra and unnecessary
> > >> effort, because with nginx it is so easy to config the http->https
> > >> redirection, and it is easy to get all the https related configs
> > >> right, including HSTS.
> > >> In other words, we got such features for free (except for a few bina=
ry
> > >> size), why bother re-write it?
> > >>
> > >> Considering the binary size, maybe it's worth the effort to check ho=
w
> > >> many bytes are increased compared between:
> > >> 1. Current implement that bmcweb handles https only
> > >> 2. Enable BMCWEB_INSECURE, opt-out all https related code in bmcweb,
> > >> adding a basic nginx and a configure file that does the https
> > >> redirect.
> > >>
> > >> We could check the binary size to see if it's acceptable. Be noted
> > >> that implementing this feature in bmcweb increases the binary size a=
s
> > >> well.
> > >>
> > >>
> > >> [1]: https://lists.ozlabs.org/pipermail/openbmc/2019-June/016557.htm=
l
> > >
> > > FWIW I generally support solutions that re-use existing software and
> have large communities behind them already but I do remember Ed having so=
me
> concerns about using bmcweb behind a proxy.
> > >
> > > James any chance you recall what those concerns were?  I don=E2=80=99=
t think I
> was ever able to wrap my head around them.  Do you share Ed=E2=80=99s con=
cerns?
> >
> > I think these were the main concerns:
> > https://security.stackexchange.com/a/107106
> >
> > Basically that since you're using HTTP, you leave yourself open for a
> > man-in-the-middle attack. bmcweb does do the header trick mentioned in
> > this post, so once you navigate to your bmc once, the browser remembers
> > to always use https. I think that, along with potential binary size
> > increases, were the biggest concerns. We also try to keep open the
> > minimum number of ports in general as a best practice.
> >
>
> As the answer indicates "A way to mitigate this is to use an HSTS HTTP
> header"
> It's easy to configure nginx to use HSTS header, so it's no big deal.
>
> The potential binary size increase is a valid concern, it's worthing
> comparing the binary size with and without nginx.
>

Just now, I did a test.

I completely copied the Nginx configuration of meta-ibm and compared the
rofs binary size after compilation.
with Nginx: 18509824
without Nginx: 18022400
refer to:
https://github.com/openbmc/openbmc/tree/837851ae37a67b84f0f8c0fd310d33b5a73=
1cc80/meta-ibm/recipes-httpd

>
> > >
> > > thx - brad
> > >
>

--000000000000a4dceb0596a5134b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:simhei,sans-serif"><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Lei YU &lt;<a href=3D"mailto:mine2603=
09@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; =E4=BA=8E2019=
=E5=B9=B411=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8810:02=E5=
=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Nov 6, 2019 at 1:20 AM James Feist &lt;<a href=3D"mailto=
:james.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On 11/4/19 4:36 PM, Brad Bishop wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Oct 31, 2019, at 11:26 PM, Lei YU &lt;<a href=3D"mailto:mi=
ne260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Oct 31, 2019 at 9:48 PM George Liu &lt;<a href=3D"mai=
lto:liuxiwei1013@gmail.com" target=3D"_blank">liuxiwei1013@gmail.com</a>&gt=
; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hi All:<br>
&gt; &gt;&gt;&gt; I&#39;m working on http redirect to https task(<a href=3D=
"https://github.com/ibm-openbmc/dev/issues/895" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/ibm-openbmc/dev/issues/895</a>).<br>
&gt; &gt;&gt;&gt; I took a cursory look at the design(<a href=3D"https://ge=
rrit.openbmc-project.xyz/c/openbmc/docs/+/24173" rel=3D"noreferrer" target=
=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173</a>) =
and did some testing.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; In bmcweb, I find it the current communication logic can =
only listen to one communication protocol (http or https). If you listen to=
 both protocols at the same time, you need to change a lot of code and comm=
unication logic.<br>
&gt; &gt;&gt;&gt; If we are going to implement this feature in bmcweb, it c=
osts extra effort and it&#39;s likely the implementation is no better than =
Nginx. so I prefer to use Nginx.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 From Ed&#39;s [mail in June][1], one approach is to=
 use boost asio async_detect_ssl.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; But I agree with George here that it costs extra and unnecess=
ary<br>
&gt; &gt;&gt; effort, because with nginx it is so easy to config the http-&=
gt;https<br>
&gt; &gt;&gt; redirection, and it is easy to get all the https related conf=
igs<br>
&gt; &gt;&gt; right, including HSTS.<br>
&gt; &gt;&gt; In other words, we got such features for free (except for a f=
ew binary<br>
&gt; &gt;&gt; size), why bother re-write it?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Considering the binary size, maybe it&#39;s worth the effort =
to check how<br>
&gt; &gt;&gt; many bytes are increased compared between:<br>
&gt; &gt;&gt; 1. Current implement that bmcweb handles https only<br>
&gt; &gt;&gt; 2. Enable BMCWEB_INSECURE, opt-out all https related code in =
bmcweb,<br>
&gt; &gt;&gt; adding a basic nginx and a configure file that does the https=
<br>
&gt; &gt;&gt; redirect.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We could check the binary size to see if it&#39;s acceptable.=
 Be noted<br>
&gt; &gt;&gt; that implementing this feature in bmcweb increases the binary=
 size as<br>
&gt; &gt;&gt; well.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [1]: <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/20=
19-June/016557.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozl=
abs.org/pipermail/openbmc/2019-June/016557.html</a><br>
&gt; &gt;<br>
&gt; &gt; FWIW I generally support solutions that re-use existing software =
and have large communities behind them already but I do remember Ed having =
some concerns about using bmcweb behind a proxy.<br>
&gt; &gt;<br>
&gt; &gt; James any chance you recall what those concerns were?=C2=A0 I don=
=E2=80=99t think I was ever able to wrap my head around them.=C2=A0 Do you =
share Ed=E2=80=99s concerns?<br>
&gt;<br>
&gt; I think these were the main concerns:<br>
&gt; <a href=3D"https://security.stackexchange.com/a/107106" rel=3D"norefer=
rer" target=3D"_blank">https://security.stackexchange.com/a/107106</a><br>
&gt;<br>
&gt; Basically that since you&#39;re using HTTP, you leave yourself open fo=
r a<br>
&gt; man-in-the-middle attack. bmcweb does do the header trick mentioned in=
<br>
&gt; this post, so once you navigate to your bmc once, the browser remember=
s<br>
&gt; to always use https. I think that, along with potential binary size<br=
>
&gt; increases, were the biggest concerns. We also try to keep open the<br>
&gt; minimum number of ports in general as a best practice.<br>
&gt;<br>
<br>
As the answer indicates &quot;A way to mitigate this is to use an HSTS HTTP=
 header&quot;<br>
It&#39;s easy to configure nginx to use HSTS header, so it&#39;s no big dea=
l.<br>
<br>
The potential binary size increase is a valid concern, it&#39;s worthing<br=
>
comparing the <span class=3D"gmail_default" style=3D"font-family:simhei,san=
s-serif"></span>binary size with and without nginx.<br></blockquote><div><b=
r></div><div class=3D"gmail_default" style=3D"font-family:simhei,sans-serif=
"><span style=3D"font-family:Arial,Helvetica,sans-serif">Just now, I did a =
test.</span></div><p>
I completely copied the <span class=3D"gmail_default" style=3D"font-family:=
simhei,sans-serif">N</span>ginx configuration of meta-ibm and compared the =
rofs binary size after compilation.<br>
with Nginx: 18509824<br>
without Nginx: 18022400<br></p><div class=3D"gmail_default" style=3D"font-f=
amily:simhei,sans-serif"><span style=3D"font-family:Arial,Helvetica,sans-se=
rif">refer to: </span><a href=3D"https://github.com/openbmc/openbmc/tree/83=
7851ae37a67b84f0f8c0fd310d33b5a731cc80/meta-ibm/recipes-httpd" title=3D"htt=
ps://github.com/openbmc/openbmc/tree/837851ae37a67b84f0f8c0fd310d33b5a731cc=
80/meta-ibm/recipes-httpd" style=3D"font-family:Arial,Helvetica,sans-serif"=
 target=3D"_blank">https://github.com/openbmc/openbmc/tree/837851ae37a67b84=
f0f8c0fd310d33b5a731cc80/meta-ibm/recipes-httpd</a></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; &gt;<br>
&gt; &gt; thx - brad<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000a4dceb0596a5134b--
