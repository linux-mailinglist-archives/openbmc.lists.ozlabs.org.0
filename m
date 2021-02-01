Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E364030A053
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 03:23:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTWvB1mDjzDrQj
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 13:23:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DEmvTgAp; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTWtK6RNKzDq8M
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 13:22:15 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id m13so17209268oig.8
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 18:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jqdzQY30PUiaNJb6D0LWA0wISPI3WLAg1si5wimTvI0=;
 b=DEmvTgAplYlY1Q/3TUP5IxHY6JejBIKQpYmA5Ca33yTjXDxAx1FT9fqFWvfFqt8FLw
 lONFinbXS0B/evwoEDxSBhY+NPqDToPNO9olkxEPzgWnDEGsimmXL68H+RcNyxPWv7+o
 RNCwIWNO05NI8cTeLgoviAJM2lFKAGXexLSQISSHzBsk9QsV+O66W7Jmz63MdrsqC5Mi
 R0oTgT8boHfFVzB459VehvQMAuQ+wNG2xP8OBuW81nqQpNoDPIhw8GpAQWQqaQQKbPzz
 DIPtbPEWVelt/BUqTiFLBBWayel3MKJuGAar3P+X1m42DbGk7ZjSzL7TWoMs0tGve1a+
 qQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqdzQY30PUiaNJb6D0LWA0wISPI3WLAg1si5wimTvI0=;
 b=I4T1EpaMC0ubtZ/ub01abZdeSkrKGGxBoJ++1+HR6Im13i0LxoVsdPT28L0diePkJS
 0vaZERTWbdaskYevP8SDXoSkGM3tVFpXx02aheF8aj7wn+zKnQjWVexXJ6fxo9LsWr5C
 QLOmxP+OqK1iQRoEeIxGYQEYyfQEJXK1a3StQ5NM2Zo/5/YdPDAmznrnd0ZNZSI2YVcc
 FatG/Uj0es6U7WzaR9TrVqWcyi3TaBZ+N0ODYejJ95x55WEBP8WcsA3akgYvzLDtsxBv
 rhvp/Ir+QZK8U4Uc491lAEASv4AZbL3P5eckCytNVwWc7w5tLX0KBD6KNuFypCbq16VX
 FZ8Q==
X-Gm-Message-State: AOAM533hRaxndEdCnXt3+W0qN0tYxLTsWu5KPVz2l8uKOikEIaLDu+Dc
 zb7rMYXVHDrkkeibqePAKblKy/SSNZ8ow3GhbYMX7Q==
X-Google-Smtp-Source: ABdhPJx1b0BNuJ6TjcP91FKqMB0QRuSnqQb7hsER5MYvilHwBHnWlYK2BZqghhkz568gLzp1hQiTAVYd448GdkXeVYM=
X-Received: by 2002:aca:56c8:: with SMTP id k191mr9506251oib.12.1612146131229; 
 Sun, 31 Jan 2021 18:22:11 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
 <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
 <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
 <20210130221921.wiug63hn326miwoh@thinkpad.fuzziesquirrel.com>
 <CAH2-KxDuADgU1+hfyLXzvfu5C7Z-rZp73HYDfyCHee01dSirrA@mail.gmail.com>
In-Reply-To: <CAH2-KxDuADgU1+hfyLXzvfu5C7Z-rZp73HYDfyCHee01dSirrA@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Sun, 31 Jan 2021 18:21:59 -0800
Message-ID: <CALGRKGMDR1=HmQDKu5iS3MaOmBSzLhVuwQxQJUOZAOWV6p3jDw@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000007ab84205ba3d05db"
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007ab84205ba3d05db
Content-Type: text/plain; charset="UTF-8"

Thank you Brad!

On Sat, Jan 30, 2021 at 2:23 PM Ed Tanous <edtanous@google.com> wrote:

> On Sat, Jan 30, 2021 at 2:19 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
> >
> > On Thu, Jan 14, 2021 at 03:17:57PM -0800, Brandon Kim wrote:
> > >Hi everyone,
> > >
> > >Wanted to ping this thread to see if there were more concerns on
> creating
> > >an openbmc/google-misc repository.
> >
> > I finally created this today.  Apologies to the Google team for the long
> > delay.
> >
> > -brad
>
> Awesome; Thanks for getting that done (especially on a Saturday).
>
> -Ed
>

--0000000000007ab84205ba3d05db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Brad!</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 30, 2021 at 2:23 PM Ed Tanous &=
lt;<a href=3D"mailto:edtanous@google.com">edtanous@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Jan 30=
, 2021 at 2:19 PM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel=
.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 14, 2021 at 03:17:57PM -0800, Brandon Kim wrote:<br>
&gt; &gt;Hi everyone,<br>
&gt; &gt;<br>
&gt; &gt;Wanted to ping this thread to see if there were more concerns on c=
reating<br>
&gt; &gt;an openbmc/google-misc repository.<br>
&gt;<br>
&gt; I finally created this today.=C2=A0 Apologies to the Google team for t=
he long<br>
&gt; delay.<br>
&gt;<br>
&gt; -brad<br>
<br>
Awesome; Thanks for getting that done (especially on a Saturday).<br>
<br>
-Ed<br>
</blockquote></div>

--0000000000007ab84205ba3d05db--
