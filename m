Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F57539EBD
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 09:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChFb5jGtz3blg
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 17:52:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CrgNways;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com; envelope-from=gangadhar.ubuntu@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CrgNways;
	dkim-atps=neutral
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChFD4MCRz3bWt
	for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2022 17:52:14 +1000 (AEST)
Received: by mail-oo1-xc2f.google.com with SMTP id u4-20020a4a85c4000000b004147b93393bso206495ooh.4
        for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2022 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G1+zA7ybsIc1C4w//ut/6wIR4FEqlKvo6eCKaro4UDU=;
        b=CrgNwaysrs3lMJKnJ3cPMwaHARhw1eZwUI4P0Ub/8d/a2qx6SxVwuaHL9x6g4CAU7c
         /WGMX4qba0OCyXgf6U9dWk8EXdh57HVPA2WLZqTCTnykr6i4+BV9TlEZ5JD/Np9RufN8
         iskXGvzT12KPXInjxYazoCaywJgO+FO0450hWfwTT3SHFx7NGDM8vXpP3KUuJWI7qM6g
         GAFlhBR2Gdbxk2ME1oa6kd+1uMBUHPLHT988U+5DZPeSdifZEEDw+VCbEewvxxneeN53
         DKs92+8O7un7X1Z93B2BKxHwI8NcDDFYjc448XU26M3PXdwI5rW/9rejdoOBdh+KLObB
         81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G1+zA7ybsIc1C4w//ut/6wIR4FEqlKvo6eCKaro4UDU=;
        b=RcBmAAFoP54GNe06Il8taeBZmHpy5Ckekcbmne+0S841eXsFC0iNsCQYehBbEc31tP
         EKOg9AMntmetCjMAOm1A2H6oVHzTqs90a1meWv53XsKym8teY2oM08/hDp1/j8SgFNSm
         A0iB3JObSy0x2pXwsbhtu4Yo0204g3vZC0ZN87IJ8/WVhPI2nLfYtGKW4HTybS/Wr/1x
         VKzbYFdo7zqjf62+uNdPyIkBR/JS48Z5kuyBzyMrOHCwXyXwEqkN4u4LqhVYlDpqzPiJ
         BGGIEmaGr15f8Dt+y9Jk0IhYKIET+H4a27xBTEeZZNUyzXbSkcTvbFtqKJ/sbyO9rRAc
         ZbbA==
X-Gm-Message-State: AOAM5316wlIUdKgSG+sxbXxDuksMhSvGpfJ74AlvY4N7YnW+xXpcDshU
	szQzaLgGmEzfM/lfD0uQo+GqAy5S+r9uXTczT99+pdKxGJsBwJ5V
X-Google-Smtp-Source: ABdhPJyGi4FmME0aXN+tSn+OGRdu5uHz2HC1O+8gwxmmviqIEXM43nJj3ypEbLcCZeMJOAZ+sDyfCfMimd1ePcOngcE=
X-Received: by 2002:a4a:8c41:0:b0:362:19a7:7529 with SMTP id
 v1-20020a4a8c41000000b0036219a77529mr24618638ooj.38.1654069930897; Wed, 01
 Jun 2022 00:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAKxnL=hnWt8ZYL2eU8yaYMRTF7wMO8asb_YLmY2361CWddMkXg@mail.gmail.com>
 <YpYbwIAec+Fc+iaw@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YpYbwIAec+Fc+iaw@heinlein.stwcx.org.github.beta.tailscale.net>
From: Gangadhar N <gangadhar.ubuntu@gmail.com>
Date: Wed, 1 Jun 2022 13:21:59 +0530
Message-ID: <CAKxnL=gZNCxTuQr3xvfxox1kuUq94j1cAbhsFgu0PDfdXqBfOQ@mail.gmail.com>
Subject: Re: Usage of SHA384 signature for FIT image instead of SHA256
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000aa365b05e05e2a92"
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

--000000000000aa365b05e05e2a92
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,
I am using 2020.10 uboot

Thanks & Regards,
Gangadhar

On Tue, May 31, 2022 at 7:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Mon, May 30, 2022 at 02:56:10PM +0530, Gangadhar N wrote:
> > Hi All,
> > I am facing an issue while using SHA384 signature for FIT image instead
> of
> > SHA256. I get build errors.
> ...
>
> > uboot-mkimage Can't add hashes to FIT blob: -93
> > Unsupported hash algorithm (sha384) for 'hash@1' hash node in 'kernel@1'
> > image node
>
> This is reporting that the mkimage tool generated by u-boot doesn't
> support SHA384.  Which u-boot are you attempting to use?  It appears
> that v2016.07 doesn't support sha384 but v2019.04 likely does.
>
> --
> Patrick Williams
>

--000000000000aa365b05e05e2a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Patrick,<div>I am using 2020.10 uboot<=
/div><div><br></div><div>Thanks &amp;=C2=A0Regards,</div><div>Gangadhar</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, May 31, 2022 at 7:14 PM Patrick Williams &lt;<a href=3D"mailto:pa=
trick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, May 30, 2022 at 02:56:10PM +0530,=
 Gangadhar N wrote:<br>
&gt; Hi All,<br>
&gt; I am facing an issue while using SHA384 signature for FIT image instea=
d of<br>
&gt; SHA256. I get build errors.<br>
...<br>
<br>
&gt; uboot-mkimage Can&#39;t add hashes to FIT blob: -93<br>
&gt; Unsupported hash algorithm (sha384) for &#39;hash@1&#39; hash node in =
&#39;kernel@1&#39;<br>
&gt; image node<br>
<br>
This is reporting that the mkimage tool generated by u-boot doesn&#39;t<br>
support SHA384.=C2=A0 Which u-boot are you attempting to use?=C2=A0 It appe=
ars<br>
that v2016.07 doesn&#39;t support sha384 but v2019.04 likely does.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000aa365b05e05e2a92--
