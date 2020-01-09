Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D351361F1
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 21:46:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tynr67K0zDqbk
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 07:46:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BJR70tk0; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tynD0ZH5zDqZm
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 07:45:50 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id l2so8695492lja.6
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jan 2020 12:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHkkI8Q1Dv8uiUPEo5Nh6W7cGgc0XwUnFm/niuTO5DI=;
 b=BJR70tk0zNSNGuGseOFFMJHmlQw6p9HWZAfGSnv5NqPo3OxynewGmQskVHX++wmn9O
 AnjNHYF4Fo5LACuCDKVRwaY3XbjXPTDcCWDmCPBCBgxq4nhkP0H6W76X3XlOUqC1ce2a
 17iCkr/Dr1dfbG6YLe8enDcrwL8IHPihiPZTHp/hkjU6Z6jA/i/o5jrBPfdpvwa9MDzM
 7JcNhk3TzToZeIrKYdCcBYTI/PM4X8Suk7ikoadvRq6W3mRBpuaXlsV799Vw/3WBW40Z
 XKRzJeNxgE7pJueWUy2RYfM17akBxSA9Tts3Z50N0zSFwhYR6ed2Gs3W7A1PHtk0PzZ7
 Zv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHkkI8Q1Dv8uiUPEo5Nh6W7cGgc0XwUnFm/niuTO5DI=;
 b=HMS6mIdcpezYIcICRE1JNd3B2T2KCTYg3PqY0p+L8Wvu21egNLn8J+7y5vSSNGohYV
 4juxdZ2ObRpxtJP2skp4v1Yyb7CT8HJgoA63BYQ5CS0Gktp9hFu2+SsizG1+eN5SApnG
 JJRq+3cr+QdFUtBM6OfwO0k9q4ooBJ+xIa0wajW4bgjTW3L9BfZe4QghNTULsZYzCwPd
 8HsbDnle9p2ZSFbFbT0Tg9D8w5ij5XuSeOHXK+WwbdTyvk2bQjQ9YLfS6CGaaTXmbREA
 Rk7Imyosab5RuhPJ9P4Jp+KfnK2GywaGNTh0UtsM6r0UwFQbVEJD1TJ/Ls7kUWRFfo+7
 gBuw==
X-Gm-Message-State: APjAAAWLBmGwC5Yv7PJgnaYFjJCu1ylIRhq2bDHOWCjoPuX51F3ceZyA
 YkdQcT984rM4ieBJz+UoNRZ/acpqyEDuCJ71zv0ZKA==
X-Google-Smtp-Source: APXvYqw9dV1YDMmdNDW7KPIXuHQt/2IvRmAjd4ljFyTF2lj4ESb9ULtjviKTVmpCSiSp8wgKEEDPQ01w6ER3EVj7U2Q=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr2602928ljb.75.1578602744051;
 Thu, 09 Jan 2020 12:45:44 -0800 (PST)
MIME-Version: 1.0
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <DEDED966-177F-472A-B9EE-677A3114743A@fb.com>
In-Reply-To: <DEDED966-177F-472A-B9EE-677A3114743A@fb.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 9 Jan 2020 12:45:32 -0800
Message-ID: <CAH1kD+aa+mG=sMqFstNCokUtdd0QcxL_gxnP=hDJkF-oU2+Ykg@mail.gmail.com>
Subject: Re: MCTP over PCI on AST2500
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000cd763b059bbb1700"
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Sharad Khetan <sharad.khetan@intel.com>,
 rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cd763b059bbb1700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll add a +1 in interest for MCTP.

Performance would be better if this is moved to the kernel, but I'm a bit
curious about any other pros and cons of working in userspace.

One of our most immediate use cases for MCTP would be in a UEFI BIOS before
a Redfish client can be bootstrapped.  Would things be more portable for
BIOS vendors if this is done in userspace.  I genuinely don't know enough
about that area to know which is more flexible.

-Richard


On Thu, Jan 9, 2020 at 10:18 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

> This will be much better if implemented in kernel.
>
> -Vijay
> =EF=BB=BFOn 1/8/20, 5:55 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote:
>
>
>
>     On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
>     > Hi Andrew,
>     > Sorry for late response.
>     > The plan is to have MCTP in user space.
>     >
>
>     How are you handling this then? mmap()'ing the BAR from sysfs?
>
>     I plan to get back to implementing in-kernel socket-based MCTP shortl=
y.
>     Unfortunately it slipped back a little in my priority list late last
> year. I'd be
>     interested in your feedback on the proposal when I get something
> written
>     down.
>
>     Andrew
>
>
>

--000000000000cd763b059bbb1700
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll add a=C2=A0+1 in interest for MCTP.<div><br></div=
><div>Performance would be better if this is moved to the kernel, but I&#39=
;m a bit curious about any other pros and cons of working in userspace.</di=
v><div><br></div><div>One of our most immediate use cases for MCTP would be=
 in a UEFI BIOS before a Redfish client can be bootstrapped.=C2=A0 Would th=
ings be more portable for BIOS vendors if this is done in userspace.=C2=A0 =
I genuinely=C2=A0don&#39;t know enough about that area to know which is mor=
e flexible.</div><div><br></div><div>-Richard</div><div></div></div><div di=
r=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 10:18 AM Vijay Khemka &lt;<=
a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
is will be much better if implemented in kernel. <br>
<br>
-Vijay<br>
=EF=BB=BFOn 1/8/20, 5:55 PM, &quot;Andrew Jeffery&quot; &lt;<a href=3D"mail=
to:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:<br>
=C2=A0 =C2=A0 &gt; Hi Andrew,<br>
=C2=A0 =C2=A0 &gt; Sorry for late response.<br>
=C2=A0 =C2=A0 &gt; The plan is to have MCTP in user space. <br>
=C2=A0 =C2=A0 &gt; <br>
<br>
=C2=A0 =C2=A0 How are you handling this then? mmap()&#39;ing the BAR from s=
ysfs?<br>
<br>
=C2=A0 =C2=A0 I plan to get back to implementing in-kernel socket-based MCT=
P shortly.<br>
=C2=A0 =C2=A0 Unfortunately it slipped back a little in my priority list la=
te last year. I&#39;d be<br>
=C2=A0 =C2=A0 interested in your feedback on the proposal when I get someth=
ing written<br>
=C2=A0 =C2=A0 down.<br>
<br>
=C2=A0 =C2=A0 Andrew<br>
<br>
<br>
</blockquote></div>

--000000000000cd763b059bbb1700--
