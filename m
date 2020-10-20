Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B729436E
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 21:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG3xS2DRmzDqdx
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 06:45:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=p1WKaHKl; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG3wK6C5QzDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 06:44:01 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id b8so21109ioh.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIN+W6RSXJl5RwN2HZql9iuF00DhZjA2QZp3rrPXORY=;
 b=p1WKaHKlrpxdHQlQdMhIYfxxk5TktTWQsGhWb3ykGa7xIpAHJ42px6/fld/gA8u18Y
 ireLaNusG1I4Vu9/AsOAdmdTJEfCMLQXtVOFngvTTzVoubc+2YepYCEGeicRZ6q2Rhn+
 3R8hAwB5G78JLd6fyaxNMhcqL2BzEoZt6WEu2WQs4lEIuNb4OqgobrYnabzD97FAjKZ8
 JyojJAG9BIBjivwUp4xqTlJKf0z80fCFucjD0raCpiWTiY4NpxLUZvfoFNp2DrHDj8QV
 STRxfEUb+cHbrjbPC4zQNm08h38hNDdP10+3DFwhqF2B/ejcXI68qM6XUMt6jnkliUAd
 yoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIN+W6RSXJl5RwN2HZql9iuF00DhZjA2QZp3rrPXORY=;
 b=RbNR51TSSYdFintxx0bM7npgUKiOaWYVAMfTJBcqhjfVlHDOq7a7E+tPaGALR1Vzr2
 Xp6czy24TI6wIdYwwuHwnXuxg6tXXtObd/qq9NaWzZiokJ1n/8j/2YFOU1TC3Ret90cz
 r2LNF4X8MlQTSHzFax8BXjIHKIvXy1Lss6E7bJyGanRhwqR2j3N4/3sMRSVFD5M0NGcx
 EAIo4unBPpJiWtJ8bGRA3/bKsF4HJYQbbAcvinzwk0gCGFzmqOnF2jVFKMmmBbXmqkw7
 xvTVWUAlJhq9p5+jPdxrnkv+p3zPhlhgSAvYUqzuM7VJbV5LEdvBKC5llmpVjYCeFfSy
 bIOA==
X-Gm-Message-State: AOAM532vJ94mDl7k2wFltf2aLrG0mf5SYWM2L/9+qddPocsl5q6dhZHK
 /zXjJ+M9vgA8XKiEOZphuvl/L007aHMGrRzSDQl1yg==
X-Google-Smtp-Source: ABdhPJzTkvkwy+xPqio7tZtzdOkeZhcGh+KmXkiBIUXgdM1/6M3q6RtLr5Od4h4dwHnSZsO2fRFyloFQ3jSH2/kwCaQ=
X-Received: by 2002:a05:6638:d92:: with SMTP id
 l18mr3337654jaj.12.1603223037212; 
 Tue, 20 Oct 2020 12:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpFQoiQ6BcoVeT1Mi2oF+tORtjvbkmSkvyFB4FA_nR3p3Q@mail.gmail.com>
 <bb31004c-7f6a-e71e-c336-f75272e48913@gmail.com>
In-Reply-To: <bb31004c-7f6a-e71e-c336-f75272e48913@gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 20 Oct 2020 12:43:21 -0700
Message-ID: <CADfYTpE7UpvPfHugs-RRQkR5ni3k9Q5HvHkE6njaXwpkPAa=0Q@mail.gmail.com>
Subject: Re: OpenBMC Office Hours
To: krtaylor <kurt.r.taylor@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a1b57a05b21f73c8"
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

--000000000000a1b57a05b21f73c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks to all the volunteers who signed up and everyone else's support.

I would like to schedule one office hour for Nov, probably skip Dec and
resume in Jan.  I'll post when I finalize the Nov date.

On Wed, Sep 23, 2020 at 8:32 AM krtaylor <kurt.r.taylor@gmail.com> wrote:

> On 9/22/20 12:17 PM, Nancy Yuen wrote:
> > Hi Team OpenBMC,
> >
> > As Sai stated in his learning series post, OpenBMC can appear complex
> > to people learning or evaluating OpenBMC.
> >
> > I propose office hours, staffed by experienced volunteers where
> > newcomers can dial in and ask questions.  The reasoning is newcomers
> > aren't always sure what questions to ask and/or are intimidated by
> > IRC.  Office hours would be a more direct, 1:1 forum for newcomers to
> > get answers.  And of course volunteers would encourage the use of the
> > mailing list and IRC for follow up discussions.
>
> Thank you Nancy, this is great!
>
> Kurt Taylor (krtaylor)
>
> > I would like this to be low overhead for volunteers and I'm hoping to
> > have enough volunteers to do monthly office hours, in the volunteer's
> > local timezone.  Please sign up here if you're willing to volunteer.
> > Ideally we would have 6-12 volunteers so it would just be one hour
> > once or twice a year for everyone.  Please sign up by 10/16 @
> >
> https://docs.google.com/spreadsheets/d/1hOzYDq6kRl8RCj9Kk_kzpiUjt5bABxVRH=
87StK2oKnY/edit?usp=3Dsharing
> > if you're interested in volunteering!
> >
> > I'd also like each office hour to have signups, to make efficient use
> > of everyone's time.  If there are no signups within 24hrs, the office
> > hour would be canceled.
> >
> > Thanks,
> > Nancy
> >
>
>

--=20

Nancy Yuen

=E2=80=A2

Google Platforms

=E2=80=A2

yuenn@google.com

=E2=80=A2

Google LLC

--000000000000a1b57a05b21f73c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks to all the volunteers who signed up and everyone el=
se&#39;s support.<div><br></div><div>I would like to schedule=C2=A0one offi=
ce hour for Nov, probably skip Dec and resume in Jan.=C2=A0 I&#39;ll post w=
hen I finalize the Nov date.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 8:32 AM krtaylor =
&lt;<a href=3D"mailto:kurt.r.taylor@gmail.com">kurt.r.taylor@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 9/=
22/20 12:17 PM, Nancy Yuen wrote:<br>
&gt; Hi Team OpenBMC,<br>
&gt; <br>
&gt; As Sai stated in his learning series post, OpenBMC can appear complex<=
br>
&gt; to people learning or evaluating OpenBMC.<br>
&gt; <br>
&gt; I propose office hours, staffed by experienced volunteers where<br>
&gt; newcomers can dial in and ask questions.=C2=A0 The reasoning is newcom=
ers<br>
&gt; aren&#39;t always sure what questions to ask and/or are intimidated by=
<br>
&gt; IRC.=C2=A0 Office hours would be a more direct, 1:1 forum for newcomer=
s to<br>
&gt; get answers.=C2=A0 And of course volunteers would encourage the use of=
 the<br>
&gt; mailing list and IRC for follow up discussions.<br>
<br>
Thank you Nancy, this is great!<br>
<br>
Kurt Taylor (krtaylor)<br>
<br>
&gt; I would like this to be low overhead for volunteers and I&#39;m hoping=
 to<br>
&gt; have enough volunteers to do monthly office hours, in the volunteer&#3=
9;s<br>
&gt; local timezone.=C2=A0 Please sign up here if you&#39;re willing to vol=
unteer.<br>
&gt; Ideally we would have 6-12 volunteers so it would just be one hour<br>
&gt; once or twice a year for everyone.=C2=A0 Please sign up by 10/16 @<br>
&gt; <a href=3D"https://docs.google.com/spreadsheets/d/1hOzYDq6kRl8RCj9Kk_k=
zpiUjt5bABxVRH87StK2oKnY/edit?usp=3Dsharing" rel=3D"noreferrer" target=3D"_=
blank">https://docs.google.com/spreadsheets/d/1hOzYDq6kRl8RCj9Kk_kzpiUjt5bA=
BxVRH87StK2oKnY/edit?usp=3Dsharing</a><br>
&gt; if you&#39;re interested in volunteering!<br>
&gt; <br>
&gt; I&#39;d also like each office hour to have signups, to make efficient =
use<br>
&gt; of everyone&#39;s time.=C2=A0 If there are no signups within 24hrs, th=
e office<br>
&gt; hour would be canceled.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Nancy<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><span><div dir=3D"ltr" style=3D=
"margin-left:0pt" align=3D"left"><table style=3D"border:none;border-collaps=
e:collapse"><colgroup><col width=3D"73"><col width=3D"7"><col width=3D"111"=
><col width=3D"7"><col width=3D"122"><col width=3D"7"><col width=3D"71"></c=
olgroup><tbody><tr style=3D"height:15pt"><td style=3D"border-top:1.5pt soli=
d rgb(213,15,37);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,10=
2,102);background-color:transparent;font-weight:700;vertical-align:baseline=
;white-space:pre-wrap">Nancy Yuen</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(255,0,0)=
;background-color:transparent;font-weight:700;vertical-align:baseline;white=
-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.5pt sol=
id rgb(51,105,232);vertical-align:middle;overflow:hidden"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,=
102,102);background-color:transparent;font-weight:700;vertical-align:baseli=
ne;white-space:pre-wrap">Google Platforms=C2=A0</span></p></td><td style=3D=
"border-top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hid=
den"><p dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(61,133,198);background-color:transparent;font-weight:700;vertical-ali=
gn:baseline;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"bor=
der-top:1.5pt solid rgb(0,153,57);vertical-align:middle;overflow:hidden"><p=
 dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif=
;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertic=
al-align:baseline;white-space:pre-wrap"><a href=3D"mailto:yuenn@google.com"=
 target=3D"_blank">yuenn@google.com</a></span></p></td><td style=3D"border-=
top:1.5pt solid rgb(102,102,102);vertical-align:middle;overflow:hidden"><p =
dir=3D"ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
153,57);background-color:transparent;font-weight:700;vertical-align:baselin=
e;white-space:pre-wrap">=E2=80=A2</span></p></td><td style=3D"border-top:1.=
5pt solid rgb(238,178,17);vertical-align:middle;overflow:hidden"><p dir=3D"=
ltr" style=3D"line-height:1.38;text-align:center;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:Roboto,sans-serif;color:r=
gb(102,102,102);background-color:transparent;font-weight:700;vertical-align=
:baseline;white-space:pre-wrap">Google LLC</span></p></td></tr></tbody></ta=
ble></div></span></div></div>

--000000000000a1b57a05b21f73c8--
