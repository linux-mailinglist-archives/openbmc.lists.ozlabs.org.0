Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26425B2B7
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 19:09:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhVmL1pX2zDqpM
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 03:09:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SRZ0PYwW; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhVfk0ZmdzDqf5
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 03:04:45 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id z22so7683608ejl.7
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+w/U3nPs2FqQESeLNtxcX+iW+jVtvByIffEudZcrsk=;
 b=SRZ0PYwWgEEDYWE9fyOW5q7h1uKym7AycdfVbej7DV2cq1Z06yogF/vyojYGzGRG/x
 ux5LibJ581Nj3Gh6fYmnOWenY4f2P5gprRdLcB0GTTrTWPBworJC5QR+wOtxYdys4Tzz
 pjOdrpwiOb6i4oysNOIrAglmN/dOBdclS9X0wSSDRAUHa+J0PBpgucWGlJUyUrCbQxYj
 kTOTCtz0iXqHyXPL6RJpn+CXGF7INCa1V+mjFjyk2QlZRcZcsQ+ZLcZM/i0mSMW9uF/J
 DNgqt9gYiA5fhflFJGzHGkjj7L7HTkCHjKM4v3BZRVZRoIExnUMw553XSjaDG55eCIlo
 tbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+w/U3nPs2FqQESeLNtxcX+iW+jVtvByIffEudZcrsk=;
 b=uekMBMjvompCJ8auZ7BiRcrr1oalY8Lik7cGZof5XkBdVfv7yoeLT1qhheHqaUn8ws
 H119nqCWVWNGaedQLYqpXhDVjlhfuzIwFLt4YjwevrZ91ey3PDpYx42nyFZ/tfDnk0Tv
 1nVlpJb7U8SdkCJcBBRfAVh2wByhLNbZq7qViG8Sq2VYuh80B6Ez4ha8izjN/Eh+oOhK
 gOZ5GCLJ3pNB3rmVFgK0XmPpa1TIpmfpXWXFng8Tzn1M1aJOSoBqWcfGcqjZUCS4qsx1
 dZa5sg2LWtO8AVSvqOIe182b1yQpGpG2cMYPWz7UNIRXmbI3DnbDbGkYX11Gc3hvlH41
 dS+A==
X-Gm-Message-State: AOAM530xDHCIwIh+MJGgLrJvLDKdC5Febo6yKGHwrwyO5BbanKX+ahiS
 3hAfDYzxln6M0IQKrDhDpG85+iUsyPITG5xrBwGNlVH2aLg=
X-Google-Smtp-Source: ABdhPJws9b/wAjh//JEijb2njyrpOKG1m07g/UHmwCxmWve/gOBo9nTRElxqchw/v0XZXDFiC5+LEm8lT3dSdXHYqq8=
X-Received: by 2002:a2e:5857:: with SMTP id x23mr3854472ljd.360.1599065834711; 
 Wed, 02 Sep 2020 09:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <98b9d39aa9004df78f8072ee6bdf4901@quantatw.com>
 <CACWQX82NP+SPyHoPhkri=3eT+7jJYqmuTdwcTy2qDV0mTzrWkw@mail.gmail.com>
In-Reply-To: <CACWQX82NP+SPyHoPhkri=3eT+7jJYqmuTdwcTy2qDV0mTzrWkw@mail.gmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Wed, 2 Sep 2020 09:57:03 -0700
Message-ID: <CAH1kD+bHghGN_Gy-rXNyOZuyYJm585GK9KVCp0YOH-z8TOsnVQ@mail.gmail.com>
Subject: Re: Disable specific URLs in bmcweb
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="0000000000000d5e0c05ae578722"
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000d5e0c05ae578722
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ed,

In this particular case, I think Alan is talking about disabling the POST
for certain resources, effectively making them readonly. One example I
remember talking to him about was disabling the addition of new users via
bmcweb.

- Richard

On Tue, Sep 1, 2020 at 10:55 PM Ed Tanous <ed@tanous.net> wrote:

> On Tue, Sep 1, 2020 at 10:40 PM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <A=
lan_Kuo@quantatw.com>
> wrote:
> >
> > Are there some configuration files in bmcweb that can be used to disabl=
e
> specific URLs and HTTP methods ?
> >
> There are compile time options that can disable features (and
> therefore URLs associated).  They're listed in the CMakeLists.txt
> file.
>
> As far as disabling particular methods, why are you wanting to disable
> them?  It seems odd to want to disable a few particular HTTP verbs.
>

--0000000000000d5e0c05ae578722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>In this particular case, I think=
 Alan is talking about disabling=C2=A0the POST for certain resources, effec=
tively making them readonly. One example I remember talking to him about wa=
s disabling the addition of new users via bmcweb.</div><div><br></div><div>=
- Richard</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 1, 2020 at 10:55 PM Ed Tanous &lt;<a href=3D"ma=
ilto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Sep 1, 2020 at 10:40 PM Alan Kuo (=
=E9=83=AD=E6=8C=AF=E7=B6=AD) &lt;<a href=3D"mailto:Alan_Kuo@quantatw.com" t=
arget=3D"_blank">Alan_Kuo@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Are there some configuration files in bmcweb that can be used to disab=
le specific URLs and HTTP methods ?<br>
&gt;<br>
There are compile time options that can disable features (and<br>
therefore URLs associated).=C2=A0 They&#39;re listed in the CMakeLists.txt<=
br>
file.<br>
<br>
As far as disabling particular methods, why are you wanting to disable<br>
them?=C2=A0 It seems odd to want to disable a few particular HTTP verbs.<br=
>
</blockquote></div>

--0000000000000d5e0c05ae578722--
