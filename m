Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C45277610
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:59:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By08m2pvwzDqbt
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:59:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=twitter.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=msinger@twitter.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=twitter.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=twitter.com header.i=@twitter.com header.a=rsa-sha256
 header.s=google header.b=as1ntVp6; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4By03Y6yNLzDqWM
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:54:30 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 197so920227pge.8
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=twitter.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s+xI8qWTUZSNxS81JFI/OJ5eDXQKsvuI4Yzr0vCp+vo=;
 b=as1ntVp6JxZvTI+ZewelRgDyZd0eGayda7dylDzb44twOGGAGuZ46poAVdkHevYHze
 vOGBbRkXNft9cq/cUlbjWNGvDngKnOCYLDwVyGNF5NptOc7CPdy/bZdZ5lekq2bn4Eeq
 wlOcA5t7TkKuS8uZJYVORLgcK12EcsccEt5U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s+xI8qWTUZSNxS81JFI/OJ5eDXQKsvuI4Yzr0vCp+vo=;
 b=pOAX1ZR5si+0J1mWiCrlAdSA5CCWixgsDJoLYkJHuqwnrSU1SQx3DS7xDu3APbMk49
 r7lf/JWIEnPdDjsav1+SMRHXgeNzTwQPwKc4j7H4koKI6H1MKLYTcq6UhXzQNpR1V6Cm
 uE+GnjOajjsUXqpQcxuRbb14EVfvlabmhW9IomdWPz1fXuYvOXnMKDGxqGGiG4AoQETz
 jedvJrFy8TVcCAgjRRwwJnVvMFV9DVFfGFF2SYKXesvmPGhRhvv+shEYNlNI0+p2r6sH
 I3vIZaxx4BB/2yS7QnwncCs1a4sqAsBIyGJWmQ22Guh5PJeGzPbX1dP8Eqdw8UhThccr
 VLmw==
X-Gm-Message-State: AOAM531WXOWXkpqSM9PFSYPQ7GzCoEUEkSX9MNQ/R/5qyw80nj2OYrPP
 Zbp0zk+sRHTcZnqMNH/i3jkzA4EpVSp+9eVSBOGwqQ==
X-Google-Smtp-Source: ABdhPJy2cjAKeEOqG+7/D9L4q3dojeTyVd9Oo0BEboM6yNU8hQ2KQwVedW2EMo2Bim3idPPyDx3AG7Tzb7V9XZrBuCc=
X-Received: by 2002:a63:440e:: with SMTP id r14mr216035pga.277.1600962866073; 
 Thu, 24 Sep 2020 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
 <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
 <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
In-Reply-To: <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
From: Matthew Singer <msinger@twitter.com>
Date: Thu, 24 Sep 2020 08:54:14 -0700
Message-ID: <CAK6+DXTFbiD-xmD65qJAwib-qu1KPnHcEYe1k2j29zLHtyEm1w@mail.gmail.com>
Subject: Re: Action: OpenBMC community messaging survey
To: krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ee8c2305b01136cc"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ee8c2305b01136cc
Content-Type: text/plain; charset="UTF-8"

Hi Kurt,

I had similar feelings about the survey, it didn't quite capture my
sentiment.  For me, it's more that I have set up IRC, but the OpenBMC
project is my only use case for IRC.  With so many communication channels,
IRC seems to fall to the background.  It's also hard to review past
activity in IRC, other tools like slack make it much easier to look at
threads retrospectively.

Thanks!


On Thu, Sep 24, 2020 at 6:45 AM krtaylor <kurt.r.taylor@gmail.com> wrote:

> On 9/23/20 9:58 PM, Joseph Reynolds wrote:
> > On 9/23/20 2:48 PM, krtaylor wrote:
> >> Hello everyone,
> >>
> >> I am doing a survey. If you DO NOT use IRC, would you start
> >> communicating regularly with the community if we used a different
> >> messaging platform? Maybe some other reason?
> >>
> >> I am not suggesting anything at the moment, just looking at ways to
> >> remove any communication barriers and improve open designs and
> >> development.
> >>
> >> If you DO NOT USE IRC regularly, please follow this link for a short
> >> survey. It is completely anonymous and will remain open until 12:00pm
> >> Central, Monday September 28th.
> >
> > Hi Kurt.  Thanks for trying to improve communication within the OpenBMC
> > community.
> >
> > I was confused by the survey and did not submit my answers.  I use the
> > IRC (per [1]) but sometimes go days without reading, and rarely
>
> Thanks for the question - I could have been more clear about "regular
> use", and in the survey I do say that a bit better.
>
>  From your description, I would say that you are not a regular user of
> IRC. That is, you do your work without periodically discussing it in
> IRC, and are not actively participating in others work and design
> discussions. Absolutely no judgement here, this is a common situation
> that we can hopefully address and facilitate for other developers.
>
> Please feel free to take the survey, the feedback will be very much
> appreciated.
>
> Kurt Taylor (krtaylor)
>
> > respond.  I find IRC setup confusing, but easy enough to use.  And I
> > would prefer to use slack features such as a full conversation history
> > and threaded conversations.
> >
> > - Joseph
> >
> > [1]: https://github.com/openbmc/openbmc#contact
> >
> >> https://www.surveymonkey.com/r/33BVDR6
> >>
> >> THANKS!
> >>
> >> Kurt Taylor (krtaylor)
> >
>
>

--000000000000ee8c2305b01136cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kurt,<div><br></div><div>I had similar feelings about t=
he survey, it didn&#39;t quite capture my sentiment.=C2=A0 For me, it&#39;s=
 more that I have set up IRC, but the OpenBMC project is my only use case f=
or IRC.=C2=A0 With so many communication channels, IRC seems to fall to the=
 background.=C2=A0 It&#39;s also hard to review past activity in IRC, other=
 tools like slack make it much easier to look at threads retrospectively.</=
div><div><br></div><div>Thanks!</div><div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 24, 2020 at=
 6:45 AM krtaylor &lt;<a href=3D"mailto:kurt.r.taylor@gmail.com">kurt.r.tay=
lor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 9/23/20 9:58 PM, Joseph Reynolds wrote:<br>
&gt; On 9/23/20 2:48 PM, krtaylor wrote:<br>
&gt;&gt; Hello everyone,<br>
&gt;&gt;<br>
&gt;&gt; I am doing a survey. If you DO NOT use IRC, would you start <br>
&gt;&gt; communicating regularly with the community if we used a different =
<br>
&gt;&gt; messaging platform? Maybe some other reason?<br>
&gt;&gt;<br>
&gt;&gt; I am not suggesting anything at the moment, just looking at ways t=
o <br>
&gt;&gt; remove any communication barriers and improve open designs and <br=
>
&gt;&gt; development.<br>
&gt;&gt;<br>
&gt;&gt; If you DO NOT USE IRC regularly, please follow this link for a sho=
rt <br>
&gt;&gt; survey. It is completely anonymous and will remain open until 12:0=
0pm <br>
&gt;&gt; Central, Monday September 28th.<br>
&gt; <br>
&gt; Hi Kurt.=C2=A0 Thanks for trying to improve communication within the O=
penBMC <br>
&gt; community.<br>
&gt; <br>
&gt; I was confused by the survey and did not submit my answers.=C2=A0 I us=
e the <br>
&gt; IRC (per [1]) but sometimes go days without reading, and rarely <br>
<br>
Thanks for the question - I could have been more clear about &quot;regular =
<br>
use&quot;, and in the survey I do say that a bit better.<br>
<br>
=C2=A0From your description, I would say that you are not a regular user of=
 <br>
IRC. That is, you do your work without periodically discussing it in <br>
IRC, and are not actively participating in others work and design <br>
discussions. Absolutely no judgement here, this is a common situation <br>
that we can hopefully address and facilitate for other developers.<br>
<br>
Please feel free to take the survey, the feedback will be very much <br>
appreciated.<br>
<br>
Kurt Taylor (krtaylor)<br>
<br>
&gt; respond.=C2=A0 I find IRC setup confusing, but easy enough to use.=C2=
=A0 And I <br>
&gt; would prefer to use slack features such as a full conversation history=
 <br>
&gt; and threaded conversations.<br>
&gt; <br>
&gt; - Joseph<br>
&gt; <br>
&gt; [1]: <a href=3D"https://github.com/openbmc/openbmc#contact" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/openbmc/openbmc#contact</a><b=
r>
&gt; <br>
&gt;&gt; <a href=3D"https://www.surveymonkey.com/r/33BVDR6" rel=3D"noreferr=
er" target=3D"_blank">https://www.surveymonkey.com/r/33BVDR6</a><br>
&gt;&gt;<br>
&gt;&gt; THANKS!<br>
&gt;&gt;<br>
&gt;&gt; Kurt Taylor (krtaylor)<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000ee8c2305b01136cc--
