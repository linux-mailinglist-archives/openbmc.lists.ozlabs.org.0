Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82795173F42
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 19:15:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Td4T3TcYzDrNM
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 05:15:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=orX7bj1o; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Td1Z5R9PzDrN1
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 05:12:49 +1100 (AEDT)
Received: by mail-vs1-xe29.google.com with SMTP id a2so2539127vso.3
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XMpqnMUxy9E2Dv1ouaAaFqcWwkh2S6tDXCCiUjBMgk=;
 b=orX7bj1oTGzIgkspMLJ48TyQUc4Yi/0SliLykO+zUtXHL48r4WNNeaUt1HFawGtgJQ
 M261vFqk1jr3AFkntzhzIjyQzpP+FHO6YheFFrB8xGd4plqL4WarA+VpkF1rWlgBoHWK
 2nkCgk5T+arDGxC+BvGNvYCZLf8WG5kYOFz0m4LsSpUltxOkUugFOlPeuvXmW/OZ03m0
 pgeJ6tifN4P1Y/GQkoQU+SSBxFjltfEwwpyQ3tSFVc4Em1cg7HIS3MOr1gqaHL5y7qMK
 U3/B0R9aVwq6EjOM1udtDz8LiYuSUwWiHpfWQtfcwtnbZDokMWQJ5rNGBUG0shyTWw31
 WV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XMpqnMUxy9E2Dv1ouaAaFqcWwkh2S6tDXCCiUjBMgk=;
 b=CroQ/fM6U3jIKjK93CTIhspCSY7vLB2ObtPz2OT02SqXjEUBFCbL0ir8AIxqmztc75
 2cncCDBoGzS49KLE3/Oc0MdjOoKcyZl6P31koQ+lhmsMcbq63HeE2ft36fw3lKi091hl
 vqKoGgcKrwcxjvMXONPeT14Q1OiSD7LWYl/U5EPEJdlMtJRDDWlblFeg1wtiJqlR6JL5
 b1VNUE8dHpbGS0h4TPmw9x/Crb1i8sTooCE0Ag975/m/kBcADldfqprTqnIP+4NzikIv
 29BIRNqwzwNLyt1uCduuLmMMcCbaNLS0OIlPIkxfkmyKkkNH0Uid5pF6XjS2NUe2TT4Q
 JgfA==
X-Gm-Message-State: ANhLgQ1BA1OAaZwrtqxWgBJjansReVxven6SlWLOIB2CUgRwD9Hxfh6v
 AoDiqoVn0XxSFIjCBSru/yubFIT/PNTUj53hJppvEA==
X-Google-Smtp-Source: ADFU+vut78i6LqrQjx+QcZxTOfOkywVWISC/8SNKjpPvVHNAyfvPWuhuhSYuN/g8Qzo34uHLWhGQoT1TDr0sxMDrzBU=
X-Received: by 2002:a67:ec4a:: with SMTP id z10mr3229384vso.73.1582913565082; 
 Fri, 28 Feb 2020 10:12:45 -0800 (PST)
MIME-Version: 1.0
References: <ABE45DC2-0C5E-42B6-AE1F-60C5F608D1F1@fuzziesquirrel.com>
 <OFD4A6FC95.990EBF4E-ON0025851C.005B2BE8-0025851C.005B78ED@notes.na.collabserv.com>
In-Reply-To: <OFD4A6FC95.990EBF4E-ON0025851C.005B2BE8-0025851C.005B78ED@notes.na.collabserv.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 28 Feb 2020 10:12:09 -0800
Message-ID: <CADfYTpGWnKgxwq0m=G=dqc39afgxk_EpppdKLoxrmQbDW-qDKg@mail.gmail.com>
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000c218a9059fa6c84d"
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c218a9059fa6c84d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is great information! Thank
----------
Nancy


On Fri, Feb 28, 2020 at 8:40 AM Lakshminarayana R Kammath <
lkammath@in.ibm.com> wrote:

> Yes, We can do that. Just need to figure out the API's
>
> Thanks & Regards,
> Lakshminarayana Kamath
>
>
>
> ----- Original message -----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: [EXTERNAL] Re: [OpenBMC]: Unit test coverage analysis on openbmc
> repositories
> Date: Fri, Feb 28, 2020 10:01 PM
>
> at 11:30 AM, Lakshminarayana R Kammath <lkammath@in.ibm.com> wrote:
>
> > sure Brad!
> >
> > If Some one can confirm the list of repo's that can be ignored we can
> put
> > them to blacklist
>
> Is it possible to use the GitHub api to query this?  Then we don=E2=80=99=
t need to
>
> maintain a blacklist.  How are you building the list of repos?
>
>
>
>
>

--000000000000c218a9059fa6c84d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is great information! Thank<br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
----------<br>Nancy</div></div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 8:40 AM Lakshmin=
arayana R Kammath &lt;<a href=3D"mailto:lkammath@in.ibm.com">lkammath@in.ib=
m.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif;font-=
size:10pt"><div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif=
;font-size:10pt"><div dir=3D"ltr">Yes, We can do that. Just need to figure =
out the API&#39;s</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr"><div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans=
-serif;font-size:10pt"><div dir=3D"ltr" style=3D"font-family:Arial,Helvetic=
a,sans-serif;font-size:10.5pt"><div dir=3D"ltr" style=3D"font-family:Arial,=
Helvetica,sans-serif;font-size:10.5pt"><div dir=3D"ltr">Thanks &amp; Regard=
s,<br>Lakshminarayana Kamath</div></div></div></div></div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">=C2=A0</div>
<blockquote dir=3D"ltr" style=3D"border-left:2px solid rgb(170,170,170);mar=
gin-left:5px;padding-left:5px;direction:ltr;margin-right:0px">----- Origina=
l message -----<br>From: Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzzies=
quirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<br>To: L=
akshminarayana R Kammath &lt;<a href=3D"mailto:lkammath@in.ibm.com" target=
=3D"_blank">lkammath@in.ibm.com</a>&gt;<br>Cc: <a href=3D"mailto:openbmc@li=
sts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>Subject: =
[EXTERNAL] Re: [OpenBMC]: Unit test coverage analysis on openbmc repositori=
es<br>Date: Fri, Feb 28, 2020 10:01 PM<br>=C2=A0
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce">at 11:30 AM, Lakshminarayana R Kammath &lt;<a href=3D"mailto:lkammath@i=
n.ibm.com" target=3D"_blank">lkammath@in.ibm.com</a>&gt; wrote:<br><br>&gt;=
 sure Brad!<br>&gt;<br>&gt; If Some one can confirm the list of repo&#39;s =
that can be ignored we can put =C2=A0<br>&gt; them to blacklist<br><br>Is i=
t possible to use the GitHub api to query this?=C2=A0 Then we don=E2=80=99t=
 need to =C2=A0<br>maintain a blacklist.=C2=A0 How are you building the lis=
t of repos?</font><br>=C2=A0</div></blockquote>
<div dir=3D"ltr">=C2=A0</div></div></div><br>

</blockquote></div>

--000000000000c218a9059fa6c84d--
