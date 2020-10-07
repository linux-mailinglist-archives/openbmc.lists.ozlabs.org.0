Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A49286864
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:35:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C64Ls2GDkzDqSP
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:35:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fR3LYWgx; dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C64Ks1BJlzDqMp
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:34:52 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id t12so3443626ilh.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/EugpBGYCS6ueUoAKg64A3wYBAKR/KSGJIaS0FDmMyM=;
 b=fR3LYWgxJaCjeJIL7Q5TcTNc4ImADOW87p0WbO7nN9EQjFbRwZuhGJMRUpj1khHk45
 rDd+3iSzHfTvAvPK61/NJEcp6a0xZ56deTXbWoK/3Idn9ssfK1GTBqyUvO8TT8mLFwS4
 9mklM7+vVGdjaV4Edj7TNsdMy2IZQOU+xSF3X+lytgTn4/b5FegqFs/upnvkjSdRGlqX
 DSIuT1DP4Ra4vZnX+H0gdRUs92NvkSG71Cixvit2YccpJTe4G9Qmrws5mYmJhCTXR9MJ
 vGe83tWMv32493FM8PayXwB8LzLmXLXJzJRFUNmWrHcoBKS/0bQirJcEnEpyulAq3inl
 QJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/EugpBGYCS6ueUoAKg64A3wYBAKR/KSGJIaS0FDmMyM=;
 b=DMukDXHt4r9XfyJbQPuPiKcn6LScqRs3mdudKPZUSAhqjWiEYv1+Sgo5O/94u9lbue
 ZkpghPElHePhsz4APUkW7oFqBiYJ5/wO2Brq+vD6rPZksB2ei+0bAFO93tetcgdvVHjS
 fvbLrUDBOikwyS3ciq/ixv974MvzJCQMdIisdWJ/VVT3BD7VD2raHhFZl+AfBb1Ndx93
 D0wSOjlU+2gTMYPntroYnfnaTjjmyypPXYpfTfku//f64kk8dRrifIqJKIHxWrInQ3u7
 ExXm4ZekThZoklB1ngNVGwBpzgibUSRBxdtSwMloMVfB5be58idg7KPB0V8MKiCI0S1/
 RVPw==
X-Gm-Message-State: AOAM530cnKvfeh9TzC7aU80SVbNKIQQ6I3fKNMbrl2cX4YMleFywXuaX
 rZVhvp7lnOryM8VToPBq5kixoIyt1vhHv9rY7PYCpA==
X-Google-Smtp-Source: ABdhPJyVF6pVM4YsOoKX+E4xTM3LmqI/zxBBvLCKF/JkFP2D9T3adgSgLASOcwqN34GWJsUNw3Kh8zj6Eu1cFgpOFks=
X-Received: by 2002:a92:d742:: with SMTP id e2mr3849708ilq.11.1602099288897;
 Wed, 07 Oct 2020 12:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR11MB3912CEF62A96635A64D096B6E9380@BY5PR11MB3912.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB3912CEF62A96635A64D096B6E9380@BY5PR11MB3912.namprd11.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:34:37 +0200
Message-ID: <CADVsX8_-Lk28To0bmzMxuLgbEPd6q-7STa_9N_cx7r_Xjy74Jw@mail.gmail.com>
Subject: Re: recipes-tpm on qemu
To: "Thompson, Kent" <kent.thompson@intel.com>
Content-Type: multipart/alternative; boundary="00000000000002ee9305b119cfc0"
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

--00000000000002ee9305b119cfc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Kent.

I don't think so.

You should enable meta-security layer in build/conf/bblayers.conf and
include "swtpm" package in build/conf/local.conf in a way like:

IMAGE_INSTALL_append =3D " swtpm"

Note the leading space within quotes.

Then rebuild the image.

On Thu, 24 Sep 2020 at 01:01, Thompson, Kent <kent.thompson@intel.com>
wrote:

> Are there any instructions for building/running =E2=80=98swtpm=E2=80=99 a=
nd the tpm
> related recipes on qemu?
>
>
>
> Thanks,
>
> Kent
>

--00000000000002ee9305b119cfc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, Kent.</div><div><br></div>I don&#39;t think so=
.<div><br></div><div>You should enable meta-security layer in build/conf/bb=
layers.conf and include &quot;swtpm&quot; package in build/conf/local.conf =
in a way like:</div><div><br></div><div>IMAGE_INSTALL_append =3D &quot; swt=
pm&quot;</div><div><br></div><div>Note the leading space within quotes.</di=
v><div><br></div><div>Then rebuild the image.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 24 Sep 2020 at 0=
1:01, Thompson, Kent &lt;<a href=3D"mailto:kent.thompson@intel.com">kent.th=
ompson@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_86698244684222261WordSection1">
<p class=3D"MsoNormal">Are there any instructions for building/running =E2=
=80=98swtpm=E2=80=99 and the tpm related recipes on qemu?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Kent<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--00000000000002ee9305b119cfc0--
