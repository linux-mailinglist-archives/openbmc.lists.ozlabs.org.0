Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C485736
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 02:21:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463pvB6lqxzDqwN
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 10:21:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GEOhYghp"; 
 dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ptV1GD0zDqjd
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 10:20:32 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id t8so67351036qkt.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 17:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o5n2RKvg37hXhjfVuzAO5LXc9cOoGtFWhqui7h8L+yg=;
 b=GEOhYghpnuGM1aNmno3JzSsSV85Z1BJWiuTkCl0RmLUcv13zvcad/WG8habyf9FOkh
 0UMorRZ1nGJbI/ihjd6HxABdkfqdzgo75eREi6MPh9B6LlrQ9xY4l5UURmSgkPlMqCj8
 WTgr59kZzVygNW+Vx8f+gXGnWhcWaPCo7HA7rjm0PqU95e/WaxzS/0DkU6Y9JowvGALV
 MYgWyvIU7URtzM83xolLMIRY0Ad8Hc9tn+fB492eYGfhI5T/KdJpnqf0H2ePC4RzOUdf
 PpRdK5KtW1EbMb+/uOXoqsD3VqM8TJ6B0CIB2lxZb2nIAAzUri7C+XzDlurI8vycZJAi
 9nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o5n2RKvg37hXhjfVuzAO5LXc9cOoGtFWhqui7h8L+yg=;
 b=Ioz118fuxBDNgMwcqKVwdxbQQpxLMV72plyvI2teQU69j1Y0DMc96iAnQ+HHdpr4PP
 lVXo5lAUbtokFotG1Ni+OfhX0+R7Tyweb24ePVD/T3QmTrieIlj6FQWeI4wXcHOOBn99
 CVt54i5VIHDy34NmXe9CIi9q3arVHTjOKzmEz/kDka1u3DeHuOTvenVVcaVURJrg1jA6
 z+PQLYaLknALp3qwyrhLEtnY9YdLGdiuUzMfKDjYJcugDEjU5murKP+VVvxlY5ICRht5
 3fRjeTk94u3dqUMeJR2SmGpvmD5oAvhAgomYywKAcABB7a8kkZGmYgRUvarBZ/H8TlGu
 cJBQ==
X-Gm-Message-State: APjAAAWVL8+5L8hnd2OtTv57GhlU4TkWPihBcxuYXiOADBT2/mE3lRug
 1GxWEfrm++eTINzkcQeiMTDT2zxsVhinfcKmz/GxXw==
X-Google-Smtp-Source: APXvYqxy4dDFVj44ibLip16iyTFwkhgCSh9k5jd1G99jq+aCClrxeAkHMvR3466ddqpvNkVmZa/QTxivD6fZ0gU5UYA=
X-Received: by 2002:ae9:c108:: with SMTP id z8mr10548847qki.57.1565223628484; 
 Wed, 07 Aug 2019 17:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <932AC0A3-C535-4C66-B28B-350ECABBDA5E@fb.com>
 <396fed2a-f2d6-42ea-855b-4a36d4b38868@www.fastmail.com>
In-Reply-To: <396fed2a-f2d6-42ea-855b-4a36d4b38868@www.fastmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 7 Aug 2019 17:20:17 -0700
Message-ID: <CAJoAoZnpaumBPz27TUoC8PoeTY8gcPMncHBY_qjXMszGrb8Nmg@mail.gmail.com>
Subject: Re: Unit Tests, Documentation and Mocks (oh my!)
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="0000000000005f30bd058f9006c0"
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
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005f30bd058f9006c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2019 at 5:11 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Wilfred,
>
> On Thu, 8 Aug 2019, at 05:16, Wilfred Smith wrote:
> > Please pardon my ignorance, but I=E2=80=99ve searched and come up empty=
-handed.
> > A URL would be greatly appreciated.
> >
> > Where are the unit tests,
>
> Unit tests sit in the application repositories alongside the code. OpenBM=
C
> has historically been poor on unit testing, though this is improving.
>

I'll add that phosphor-host-ipmid has documentation on how to run unit
tests locally using Docker here:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/docs/testing.md

This setup likely applies to a few other areas of the project (although I
haven't tested it). It's very similar to the continuous integration test
suite.

 - Emily

--0000000000005f30bd058f9006c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 5:11 PM Andrew=
 Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Wilfred,<=
br>
<br>
On Thu, 8 Aug 2019, at 05:16, Wilfred Smith wrote:<br>
&gt; Please pardon my ignorance, but I=E2=80=99ve searched and come up empt=
y-handed. <br>
&gt; A URL would be greatly appreciated.<br>
&gt; <br>
&gt; Where are the unit tests,<br>
<br>
Unit tests sit in the application repositories alongside the code. OpenBMC<=
br>
has historically been poor on unit testing, though this is improving.<br></=
blockquote><div><br></div><div>I&#39;ll add that phosphor-host-ipmid has do=
cumentation on how to run unit tests locally using Docker here:<br><a href=
=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/master/docs/testing=
.md">https://github.com/openbmc/phosphor-host-ipmid/blob/master/docs/testin=
g.md</a><br><br>This setup likely applies to a few other areas of the proje=
ct (although I haven&#39;t tested it). It&#39;s very similar to the continu=
ous integration test suite.</div><div>=C2=A0</div><div>=C2=A0- Emily</div><=
/div></div>

--0000000000005f30bd058f9006c0--
