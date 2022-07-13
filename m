Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C757372C
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 15:18:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjdVG6rLVz3c4w
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 23:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GLLMUteQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com; envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GLLMUteQ;
	dkim-atps=neutral
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjdTs13CVz3c1R
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 23:18:07 +1000 (AEST)
Received: by mail-vk1-xa30.google.com with SMTP id g25so3698638vkm.13
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9YNWQWkLQe3dgDR1Syrlky8FupJwmQvJGfOHmDgHPU=;
        b=GLLMUteQaMIfxsfCo3ygvE0pR3gHEnXBhphowhfnoZACtE4XdQ1+r3vddDTnoVhxfF
         599zzdIXb8+uX6lEqaMLdnW9Zw0IWf8q2GQ6rOzaQfeHTJg/V7nz3OIzDqr0ShdTXVN2
         3HEJ6OlyDjirB2vpS+o+MPGi2a42EFv8H1g3nZ9Lt7zCqUtL42t0jP+68we406wADsPW
         Xrh8M2t6KNaAfI/tbvWexwNLEf408IWarwa33xgSyidQXhB5RihlCfTOYbVKeOyeUdYC
         yAe67deFIddglUu8fEVqgyxHbORmEO2OY3cUP2la1StQypkZYW/qNOwJ6wj7Wyw1g5a7
         KuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9YNWQWkLQe3dgDR1Syrlky8FupJwmQvJGfOHmDgHPU=;
        b=YMNUjngrzKBGGb4ymtlBicIT/C9njvd/kkRckTua6IKEaWdGsYWkjk5k/Klf7Bf1Bh
         jEZJYQiyeTwR4OTFHXmG0iccgJerGHkP4YAZxAu6Cm5LpXsJqJ1Poq0HhzUb14PXa3nt
         KD0GYEU5IRdN314oQ0UsxqiIyg1MTWHfeY1x02Jz+u8s7iwtX/s309HaNVZ44sYYc7rj
         TzmBtkqUypXJQrCdjaJC4F2jScQj3jRbA/BI8Qwdv3FSidKN7JsMaTjjr0vc+20Kmmhj
         7gKnUbG2f5NevyXUCulwu9+Wig2k7z+IOBEY7SvLXBl+bVwmPvEa1qBmjyvxkh2VXBEV
         GCrw==
X-Gm-Message-State: AJIora+XwGUKzOftZX3f0AV7C78n2zxujPmMERHj4QBEZPkwhhi28CCm
	nwFvPy6cD4DArg+zGcl32lMkQh96ezy25qLVuakr5Q==
X-Google-Smtp-Source: AGRyM1tQ5uGwr+OOxzHT+Jd/wkJiEyd/7IFKQwxcScjcXFRtcyJgf6tmkYB+G9uRr5snpGYlD+p2chZsWgLIsqcKejY=
X-Received: by 2002:a1f:4fc5:0:b0:374:978e:2848 with SMTP id
 d188-20020a1f4fc5000000b00374978e2848mr1307140vkb.8.1657718284083; Wed, 13
 Jul 2022 06:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_CE8FD07B89E821C6930362C833A1A1171D06@qq.com>
In-Reply-To: <tencent_CE8FD07B89E821C6930362C833A1A1171D06@qq.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 13 Jul 2022 06:17:53 -0700
Message-ID: <CAO=notxdA3WrTs8ThB76b=X1Ug6BfvP-K-_48b6rgv5jJJSbpg@mail.gmail.com>
Subject: Re: Q:ipmi-blob-tool of aminclude_static.am
To: Amol <28105285@qq.com>
Content-Type: multipart/alternative; boundary="000000000000764c8f05e3af9da0"
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

--000000000000764c8f05e3af9da0
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 11:25 PM Amol <28105285@qq.com> wrote:

> Dear Patrick,
> where is the file "+include $(top_srcdir)/aminclude_static.am" in this "
> https://github.com/openbmc/ipmi-blob-tool" project?
>

Presumably something generates it. I haven't looked at this in a while,
since it had been working --- in the future please, cc the openbmc mailing
list with inquiries.


>
> commit 51372f02b96e1f1b1317e25e956c712019557bb4
> Author: Patrick Venture <venture@google.com>
> Date:   Mon Mar 18 09:06:56 2019 -0700
>
>     autotools: Fix for autoconf-archive 2019.01.19
>
>     The code coverage macros from the archive changed in a backward
>     incompatible way. This adds a workaround to autodetect either version
>     and do the right thing.
>
>     Change-Id: I4258fab8811f07760ebd73e8ac55c8493370e19b
>     Signed-off-by: Patrick Venture <venture@google.com>
>
> diff --git a/.gitignore b/.gitignore
> index 89226f6..65cf1e9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -19,6 +19,7 @@
>  .dirstamp
>  .libs
>  /aclocal.m4
> +/aminclude_static.am
>  /autom4te.cache
>  /build-aux
>  /config.h
> diff --git a/Makefile.am b/Makefile.am
> index c4335da..7473e23 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -29,6 +29,14 @@ CODE_COVERAGE_GENHTML_OPTIONS += --config-file
> $(abs_srcdir)/.lcovrc
>  CODE_COVERAGE_GENHTML_OPTIONS += --prefix $(abs_srcdir) --prefix
> $(abs_builddir)
>  export CODE_COVERAGE_GENHTML_OPTIONS
>
> +if AUTOCONF_CODE_COVERAGE_2019_01_06
> +include $(top_srcdir)/aminclude_static.am
> +clean-local: code-coverage-clean
> +distclean-local: code-coverage-dist-clean
> +else
> +@CODE_COVERAGE_RULES@
> +endif
> +
>
>

--000000000000764c8f05e3af9da0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 11:25 PM Amol=
 &lt;<a href=3D"mailto:28105285@qq.com">28105285@qq.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>Dear=C2=A0=
Patrick,</div><div>where is the file &quot;+include $(top_srcdir)/<a href=
=3D"http://aminclude_static.am" target=3D"_blank">aminclude_static.am</a>&q=
uot; in this &quot;<a href=3D"https://github.com/openbmc/ipmi-blob-tool" ta=
rget=3D"_blank">https://github.com/openbmc/ipmi-blob-tool</a>&quot; project=
?</div></div></blockquote><div><br></div><div>Presumably something generate=
s it. I haven&#39;t looked at this in a while, since it had been working --=
- in the future please, cc the openbmc mailing list with inquiries.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>=
<br></div><div>commit 51372f02b96e1f1b1317e25e956c712019557bb4</div><div>Au=
thor: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_=
blank">venture@google.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Mon Mar 18 09=
:06:56 2019 -0700</div><div><br></div><div>=C2=A0 =C2=A0 autotools: Fix for=
 autoconf-archive 2019.01.19</div><div><br></div><div>=C2=A0 =C2=A0 The cod=
e coverage macros from the archive changed in a backward</div><div>=C2=A0 =
=C2=A0 incompatible way. This adds a workaround to autodetect either versio=
n</div><div>=C2=A0 =C2=A0 and do the right thing.</div><div><br></div><div>=
=C2=A0 =C2=A0 Change-Id: I4258fab8811f07760ebd73e8ac55c8493370e19b</div><di=
v>=C2=A0 =C2=A0 Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:ventur=
e@google.com" target=3D"_blank">venture@google.com</a>&gt;</div><div><br></=
div><div>diff --git a/.gitignore b/.gitignore</div><div>index 89226f6..65cf=
1e9 100644</div><div>--- a/.gitignore</div><div>+++ b/.gitignore</div><div>=
@@ -19,6 +19,7 @@</div><div>=C2=A0.dirstamp</div><div>=C2=A0.libs</div><div=
>=C2=A0/aclocal.m4</div><div>+/<a href=3D"http://aminclude_static.am" targe=
t=3D"_blank">aminclude_static.am</a></div><div>=C2=A0/autom4te.cache</div><=
div>=C2=A0/build-aux</div><div>=C2=A0/config.h</div><div>diff --git a/Makef=
ile.am b/Makefile.am</div><div>index c4335da..7473e23 100644</div><div>--- =
a/Makefile.am</div><div>+++ b/Makefile.am</div><div>@@ -29,6 +29,14 @@ CODE=
_COVERAGE_GENHTML_OPTIONS +=3D --config-file $(abs_srcdir)/.lcovrc</div><di=
v>=C2=A0CODE_COVERAGE_GENHTML_OPTIONS +=3D --prefix $(abs_srcdir) --prefix =
$(abs_builddir)</div><div>=C2=A0export CODE_COVERAGE_GENHTML_OPTIONS</div><=
div><br></div><div>+if AUTOCONF_CODE_COVERAGE_2019_01_06</div><div>+include=
 $(top_srcdir)/<a href=3D"http://aminclude_static.am" target=3D"_blank">ami=
nclude_static.am</a></div><div>+clean-local: code-coverage-clean</div><div>=
+distclean-local: code-coverage-dist-clean</div><div>+else</div><div>+@CODE=
_COVERAGE_RULES@</div><div>+endif</div><div>+</div></div><div><br></div></b=
lockquote></div></div>

--000000000000764c8f05e3af9da0--
