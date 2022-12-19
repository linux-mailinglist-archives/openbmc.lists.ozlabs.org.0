Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554AB651155
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 18:44:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbRsj1wPwz2xvF
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 04:44:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mtEMD+AK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mtEMD+AK;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbRs831wsz304s
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 04:43:55 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id h12so9421317wrv.10
        for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HkWKDtUQ65Os/I7a7IDVfYnQVUhMSY436v3tFXzN8Fg=;
        b=mtEMD+AKafTpeA5foZdHSEJ8fovVBUhFa3kFiAdl+ZvDJluV5jKKaFh8emTvA2qx9i
         TjrH2/AfzBmMcmTz+5mmSXNky3MQx8JqRSy543ZR4o3VbWwB81+UxTqao9mAbt8Wx1f4
         MYAOKVlTp0msKRN9vtPjgQh7tNjpMZmnzOIyIn3ilAQFFzfvzUGl4mkYrcd42xnQhesB
         MKiG+a6W87lfZrGMd4joVGWYjPjwlRg/C6Ay5Pup2+BmbT67FtzeN0TLL+EZW/yx4+0o
         L0mXAEgzTvJtA1LxN9+csEZs1EbA7YiVOKiBJTXbMUGdV8cH0uW6qWi8kjG/WB3zJtAQ
         o0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkWKDtUQ65Os/I7a7IDVfYnQVUhMSY436v3tFXzN8Fg=;
        b=0fJ0kmScqKOQuXoLRjgUO+h4z/OosUYhLCyVUsm0DtbcsLN+ZAw8L8EjFbYyLgFpFI
         XepQKVRPDreXrBrSlTIh1pR82uLzF9vFJUH+e92hb9oUlajCTKGNflJUR+hHnrikxPs8
         eEFNG+Gcg2Csx9l7an08ODsXwkZKWIaRGnctXEBalrMjjGdRxP56vwv8fYi8gvdL/MDv
         vmZfBg8yEztET24P7NuURXMWsM4GC2aM2Ho3mct4gGXNTu7SFIEfvIS7/+lzJ/x1+rM6
         XxCLs5otaWguVfgvUPkd5UM5xaXNUhX5xjMWtRZk6trbjOTJMvfcRjn92iiG9cCCb9eo
         ay8A==
X-Gm-Message-State: ANoB5pkPAgSfAgeDGQPEb4ITtUvx6Rq6ZyLf4lJx8EhSVy2/pMhtQcMt
	vEEMWWyzTqj27o1oc+KiTUfUw2rFubumB1qSkwo2Ig==
X-Google-Smtp-Source: AA0mqf6fnoysAVbjTJiAna6a+JThmbiwMMRlByIEfZDdYMcQ+YXf4V7ggR8wlF7nY7834Mj0MaGNePcimZKI4N1HQlw=
X-Received: by 2002:a5d:6f0a:0:b0:242:87f3:1de9 with SMTP id
 ay10-20020a5d6f0a000000b0024287f31de9mr4010673wrb.40.1671471829254; Mon, 19
 Dec 2022 09:43:49 -0800 (PST)
MIME-Version: 1.0
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein> <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein> <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com> <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
 <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com> <4ab2d31e-4433-5987-c2ad-8f3d4ce50090@linux.intel.com>
 <8a15e91f-a8a1-0a70-1006-d07dafdd7b34@linux.intel.com>
In-Reply-To: <8a15e91f-a8a1-0a70-1006-d07dafdd7b34@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 19 Dec 2022 09:43:39 -0800
Message-ID: <CAH2-KxBprAwGjurmJC6b4EJ_TjZo9KcWFeLw57YMJbMBwJya_Q@mail.gmail.com>
Subject: Re: Virtual Media repository request
To: "Czarnowski, Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000a316a105f031dccf"
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

--000000000000a316a105f031dccf
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 19, 2022 at 6:02 AM Czarnowski, Przemyslaw <
przemyslaw.hawrylewicz.czarnowski@linux.intel.com> wrote:

> On 23.12.2021 02:01, Czarnowski, Przemyslaw wrote:
> > On 20.12.2021 13:54, Czarnowski, Przemyslaw wrote:
> >>
> >> I plan to start pushing changes here this week.
> >>
> > Replying to myself, but just pushed a series of first 4 patches to
> review.
> >
> > It is just a skeleton (infrastructure to build main flows on) but wanted
> > to get the first reviews for initial changes (transition from old
> > content to the new one in particular).
> >
>
> I would like to rise the request for new service of Virtual Media
> repository once again.
>
> Recently I've made an attempt to push VM service patches once again
> after UT has been added. In the meantime, I've noticed that in order to
> make a graceful transition between old and new solution the final switch
> between the old and new code should be made at the moment when the last
> patch is accepted.
>
> There are two main reason why I would like to recall the discussion.
> First is the voice of the maintainer of the old service.


What does "voice" mean in the above?  Can you elaborate on the problem, and
give some specific examples (ideally links to the gerrit reviews)?


> Second -
> problems with linting and CI which wants to build and test both projects
> simultaneously.
>

Same thing here, can you give specific examples?  The linting is just
enforcing the coding standard, and testing two executables at the same time
is something many other repositories do.


>
> Of course the decision does not belong to me. I just do not want mess
> with current CI to support this transitional state.
>

My opinion still remains the same, let's keep everything in one
repository.  If you need help in CI to do that, let's talk about the
specific things that are blocking, and we can go from there.


>
> --
> Best regards,
> Przemyslaw Czarnowski
>
>

--000000000000a316a105f031dccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 19, 2022 at 6:02 AM Czarn=
owski, Przemyslaw &lt;<a href=3D"mailto:przemyslaw.hawrylewicz.czarnowski@l=
inux.intel.com">przemyslaw.hawrylewicz.czarnowski@linux.intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 23.12.2=
021 02:01, Czarnowski, Przemyslaw wrote:<br>
&gt; On 20.12.2021 13:54, Czarnowski, Przemyslaw wrote:<br>
&gt;&gt;<br>
&gt;&gt; I plan to start pushing changes here this week.<br>
&gt;&gt;<br>
&gt; Replying to myself, but just pushed a series of first 4 patches to rev=
iew.<br>
&gt; <br>
&gt; It is just a skeleton (infrastructure to build main flows on) but want=
ed <br>
&gt; to get the first reviews for initial changes (transition from old <br>
&gt; content to the new one in particular).<br>
&gt; <br>
<br>
I would like to rise the request for new service of Virtual Media <br>
repository once again.<br>
<br>
Recently I&#39;ve made an attempt to push VM service patches once again <br=
>
after UT has been added. In the meantime, I&#39;ve noticed that in order to=
 <br>
make a graceful transition between old and new solution the final switch <b=
r>
between the old and new code should be made at the moment when the last <br=
>
patch is accepted.<br>
<br>
There are two main reason why I would like to recall the discussion.<br>
First is the voice of the maintainer of the old service.</blockquote><div><=
br></div><div>What does &quot;voice&quot; mean in the above?=C2=A0 Can you =
elaborate on the problem, and give some specific examples (ideally links to=
 the gerrit reviews)?</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"> Second - <br>
problems with linting and CI which wants to build and test both projects <b=
r>
simultaneously.<br></blockquote><div><br></div><div>Same thing here, can yo=
u give specific examples?=C2=A0 The linting is just enforcing the coding st=
andard, and testing two executables at the same time is something many othe=
r repositories do.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Of course the decision does not belong to me. I just do not want mess <br>
with current CI to support this transitional state.<br></blockquote><div><b=
r></div><div>My opinion still remains the same, let&#39;s keep everything i=
n one repository.=C2=A0 If you need help in CI to do that, let&#39;s talk a=
bout the specific things that are blocking, and we can go from there.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Best regards,<br>
Przemyslaw Czarnowski<br>
<br>
</blockquote></div></div>

--000000000000a316a105f031dccf--
