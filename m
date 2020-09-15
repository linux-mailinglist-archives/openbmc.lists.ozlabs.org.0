Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C326AF91
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 23:28:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrbvV1f48zDqTZ
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 07:28:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ramkrishna.me
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=sri@ramkrishna.me; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ramkrishna.me
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ramkrishna-me.20150623.gappssmtp.com
 header.i=@ramkrishna-me.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vVjorztV; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrbtY0nkrzDqMk
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 07:28:00 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id u25so4685680otq.6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ramkrishna-me.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3k/SVNBMfYMBpx4Xkk6LwSVlFLAhH/7h0JznZ7iAvU=;
 b=vVjorztVKtN+AqY226un02fj4EezjwTVhETQr+8XBaVuDottY1gqerXjyv1ABCvF80
 GGN06LWpRgGWud9Dqp/vbDyMwGt92OQh/xL3Lbwzfl0y8uwGzrPmonLi/Dv1D8O9X2p9
 bnBUp0b/JPb8UfhsgHVF9V2nvQwyeics6C/f3+ieAXG5jT7egilrUJ8MbFOH9+iApu29
 FGGuiL7uLZn+FBRaji5IZqNGZ92Ef8bN9qjVQMFvAqW+Bq0WYn6vbxOaXp5fstPmuGuv
 DFL3gfGklh9ck+7QYgIXAYXdPHLZ5PMsrdKbuKHK/WS6f4kB2F14CywmcU8JJQO/1IwT
 Eaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3k/SVNBMfYMBpx4Xkk6LwSVlFLAhH/7h0JznZ7iAvU=;
 b=fbKVEI5FtPF1qEwj/F8iqQ8Pd+RcLJuqY5yofXebyLy0pV3CvxzInGW9poYf2lIJKX
 8niLwWx6VHetW6/XLSFE5E4O2HsUEKQVctdyX6vGiOYW64ot5tJRwk4tZXt8TEURCWfE
 HeB2pCnDxw0RE/Drw+dYSw7cLcjQ28W0nofzDk2exgQ3Mx6yaZul1M26cPw6IEEfD1np
 nHWjjBYCnloWgcIECBWuzresASwWfvXa5ae7JDE87M0oIN9Di1of+jkMqYzvK7ziHmNq
 Go3pp4ox4Wsf9JKUdIAKXoDJOugsn5d53gMTZlx2V3bTRUsA45+VH0M633VB6RwkFEKD
 Re+g==
X-Gm-Message-State: AOAM530+nJXmbjxDHEh5vkrUo/dr2+nfOh6QBOPfhGcoN1qALJIj30+w
 IhPnm44pSONv1FInLP89wzkBQnHCe6IAaRqf24s3zQ==
X-Google-Smtp-Source: ABdhPJwzUJ6Mq0MSjWmCaGlUsnbQxn8egb6vYau9oEqvy9f6+tmCK/MehBQBHmzYCwfTkuCILXUdshDkdnily4HhVt4=
X-Received: by 2002:a05:6830:1616:: with SMTP id
 g22mr13921981otr.289.1600205276841; 
 Tue, 15 Sep 2020 14:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <MWHPR11MB00461129AA7BB38E7D2C80E1F1200@MWHPR11MB0046.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00461129AA7BB38E7D2C80E1F1200@MWHPR11MB0046.namprd11.prod.outlook.com>
From: Sriram Ramkrishna <sri@ramkrishna.me>
Date: Tue, 15 Sep 2020 14:27:46 -0700
Message-ID: <CADWtFEnfXzS8onBZjDxUNx2z7h9vYrmmWTs5Qi4-8AvbPjmE4g@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: "Khetan, Sharad" <sharad.khetan@intel.com>
Content-Type: multipart/alternative; boundary="0000000000001828dd05af60d375"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001828dd05af60d375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 1:59 PM Khetan, Sharad <sharad.khetan@intel.com>
wrote:

> Hi Brad,
>
> +1
>
> I like the idea. We have a increasing number of repos and it will be good
> to have a model where users can pick the features/repos they want. I gues=
s
> it will make OpenBMC offer a microservices model =F0=9F=98=8A. The challe=
nge will of
> course be finding that right base / minimum configuration. That may chang=
e
> depending on device, usage, architecture.
> It=E2=80=99s a good idea to start with the empty list and add from there.
>
>
Actually great for debugging as well.

sri

Thanks,
> -Sharad
>
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.org=
>
> On Behalf Of Brad Bishop
> Sent: Tuesday, September 15, 2020 1:29 PM
> To: openbmc@lists.ozlabs.org
> Subject: interest in a minimal image recipe
>
> I've heard a handful of times that meta-phosphor users often have to
> remove the latest feature added by default to obmc-phosphor-image.
>
> I have an RFC for an empty image that these users could bbappend and
> opt-in to specific image features instead of having to repeatedly opt-out=
.
>
> If you like the opt-in approach, please drop a +1 and/or review my patch:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36516
>
> I bring this up now because I, and others have been adding new image
> features to obmc-phosphor-image (e.g. turned on by default), and I would
> like to start a discussion about what it means for an application to be i=
n
> the OpenBMC github organization.  I would propose that it means it is
> enabled and turned on by default in obmc-phosphor-image.
>
> Looking forward to your thoughts.
>
> -brad
>

--0000000000001828dd05af60d375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2020 at 1:59 PM Kheta=
n, Sharad &lt;<a href=3D"mailto:sharad.khetan@intel.com">sharad.khetan@inte=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Brad,<br>
<br>
+1<br>
<br>
I like the idea. We have a increasing number of repos and it will be good t=
o have a model where users can pick the features/repos they want. I guess i=
t will make OpenBMC offer a microservices model =F0=9F=98=8A. The challenge=
 will of course be finding that right base / minimum configuration. That ma=
y change depending on device, usage, architecture.<br>
It=E2=80=99s a good idea to start with the empty list and add from there.<b=
r>
<br></blockquote><div><br></div><div>Actually great for debugging as well.<=
/div><div><br></div><div>sri</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Thanks,<br>
-Sharad<br>
<br>
<br>
-----Original Message-----<br>
From: openbmc &lt;openbmc-bounces+sharad.khetan=3D<a href=3D"mailto:intel.c=
om@lists.ozlabs.org" target=3D"_blank">intel.com@lists.ozlabs.org</a>&gt; O=
n Behalf Of Brad Bishop<br>
Sent: Tuesday, September 15, 2020 1:29 PM<br>
To: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
Subject: interest in a minimal image recipe<br>
<br>
I&#39;ve heard a handful of times that meta-phosphor users often have to re=
move the latest feature added by default to obmc-phosphor-image.<br>
<br>
I have an RFC for an empty image that these users could bbappend and opt-in=
 to specific image features instead of having to repeatedly opt-out.<br>
<br>
If you like the opt-in approach, please drop a +1 and/or review my patch:<b=
r>
<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/365=
16" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz=
/c/openbmc/meta-phosphor/+/36516</a><br>
<br>
I bring this up now because I, and others have been adding new image featur=
es to obmc-phosphor-image (e.g. turned on by default), and I would like to =
start a discussion about what it means for an application to be in the Open=
BMC github organization.=C2=A0 I would propose that it means it is enabled =
and turned on by default in obmc-phosphor-image.<br>
<br>
Looking forward to your thoughts.<br>
<br>
-brad<br>
</blockquote></div></div>

--0000000000001828dd05af60d375--
