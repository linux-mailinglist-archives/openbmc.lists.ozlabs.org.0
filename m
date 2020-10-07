Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991E2861D8
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5yTx2QfbzDqQq
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 02:11:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YOGVZYRP; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5ySk6pzMzDqNb
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 02:10:30 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 26so2785255ois.5
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WC5X4/6GPxTBgKrSCPhSdcA45Wd4F+hpC6lJSAn92w=;
 b=YOGVZYRP1QjD9d7TG6AUfMSriVqtinieX7yscv9aT4ou1J6PDMid1c1ax/ScEaJpgn
 motOzS7HFcBbr34wCWD2ZC4bifA8xg2ea8lr4NhytfC7679HOB1eebB77VUJhDV93Q4E
 jMdtGJtZaixSiisPVdUbAe/os3KFaLSrK057fKA779B+eh54UP0L71UamfmS5/2TcXCo
 /2EGEyrZpnCGWBVctjoUxgBYJj/gXC3zOj/TTsNWvxhyT17FdOiowevuRVnJwUYZUNXg
 7TXHgX1+ABIcdViKg31zK6Jwii1dlKdnfPWsSpSJzfNx3GzOjPTtKKWjq1wVMrRxcB0m
 0KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WC5X4/6GPxTBgKrSCPhSdcA45Wd4F+hpC6lJSAn92w=;
 b=k2TQkRMCc5UX5fTmIdk67R2974sxS3nzboWBogWpQAksxB6RJZ/olhbEQMrH9hGCwg
 I8sEEUlZ34NaQEewIahRIJNUyVGICYefriy6wx0tVaAF+mTywMYwFn2LOlLH2M7yoSb+
 uJ/KsXxLIXO0svt/t3IFmjGzXbvwb/Kzgm2yLfQ3bNCgx8OJdXk93xHjZFgbbGpcNsMS
 hNyISG+w1/XpArS/l+gC5vJn639qBffqzgiYx1I6+3qmGqA6qL3F8HMQqna+lLLp/QEk
 Pq151/S3Ntd9OR6LCytAizXxYJHpasNXGRpEsCW3CwvLoOgTPz6Qqu7vD6yGw2gKkG8J
 hFDg==
X-Gm-Message-State: AOAM530pmpMnbFaeMacPuI5a9gwKPL++F5LZPI74ovAlprSUO8YGfaxB
 ex7cBD2mtqyWmlVmLybEA0GeIFNo9xAeJUWb88M=
X-Google-Smtp-Source: ABdhPJw3HpaOsdbmREMaGm1z8bxYwr+mYs1aasdYxX+yXlhRx86dHokLXjgBdAqzYn16kPHgj+N9eTKFgebF3A32Q7E=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2050304oie.119.1602083425865; 
 Wed, 07 Oct 2020 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <CABbLDjM5R6DaGz1PKtMHwTiA4z++8Vos6caTD_=Uumoys477uA@mail.gmail.com>
 <FD04349F-923A-4F14-A17B-12E7075DF2B2@gmail.com>
In-Reply-To: <FD04349F-923A-4F14-A17B-12E7075DF2B2@gmail.com>
From: Anony Mous <obmc.developers@gmail.com>
Date: Wed, 7 Oct 2020 08:10:15 -0700
Message-ID: <CABbLDjNz4N+CvR0hro+Te-+2-_FMD_OsOOXXzOVPH01qpjFKHw@mail.gmail.com>
Subject: Re: LTC2991 Driver request
To: Mike <proclivis@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007fd2d705b1161da2"
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

--0000000000007fd2d705b1161da2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mike:

Thank you,  Would it be possible to have something within, say 2 weeks?
And is there anything you would need from me?  I know that there is a
driver for the LTC2990 (a quad monitor) as part of OpenBMC, perhaps that
could be used as a jumping off point.

Respectfully:


On Wed, Oct 7, 2020 at 6:38 AM Mike <proclivis@gmail.com> wrote:

> Anony,
>
> This part is supported by my team at ADI. I can write a driver if
> necessary.
>
> I=E2=80=99ll take a look at the DS and similar drivers this morning and r=
espond.
>
> What is your timeframe?
>
> Mike Jones
>
>
>
> Sent from my iPhone
>
> > On Oct 6, 2020, at 7:32 PM, Anony Mous <obmc.developers@gmail.com>
> wrote:
> >
> > =EF=BB=BF
> > Does anyone have a driver for the Linear Technology LTC2991 Octal
> monitor chip?
> >
> > Thank you!
> >
>

--0000000000007fd2d705b1161da2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Mike:</div><div><br></div><div>Thank you,=C2=A0 Would=
 it be possible to have something within, say 2 weeks?=C2=A0 And is there a=
nything you would need from me?=C2=A0 I know that there is a driver for the=
 LTC2990 (a quad monitor) as part of OpenBMC, perhaps that could be used as=
 a jumping off point.</div><div><br></div><div>Respectfully:</div><div><br>=
</div></div><br><div class=3D"gmail_quote"><div class=3D"gmail_attr" dir=3D=
"ltr">On Wed, Oct 7, 2020 at 6:38 AM Mike &lt;<a href=3D"mailto:proclivis@g=
mail.com">proclivis@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left=
-color:rgb(204,204,204);border-left-width:1px;border-left-style:solid">Anon=
y,<br>
<br>
This part is supported by my team at ADI. I can write a driver if necessary=
.<br>
<br>
I=E2=80=99ll take a look at the DS and similar drivers this morning and res=
pond.<br>
<br>
What is your timeframe?<br>
<br>
Mike Jones<br>
<br>
<br>
<br>
Sent from my iPhone<br>
<br>
&gt; On Oct 6, 2020, at 7:32 PM, Anony Mous &lt;<a href=3D"mailto:obmc.deve=
lopers@gmail.com" target=3D"_blank">obmc.developers@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; Does anyone have a driver for the Linear Technology LTC2991 Octal moni=
tor chip?<br>
&gt; <br>
&gt; Thank you!<br>
&gt; <br>
</blockquote></div>

--0000000000007fd2d705b1161da2--
