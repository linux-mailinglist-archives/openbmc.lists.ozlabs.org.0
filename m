Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9824B22B5
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 11:03:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw8Mw2gLrz3cDy
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 21:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M/SwASz3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=tajudheenk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M/SwASz3; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw8MX3YxZz3bXR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 21:03:35 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id bt13so23330302ybb.2
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 02:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZ7PZpsK5p7Ml+99aFSqPujPkgqK4WHxi+lxYdkVxSQ=;
 b=M/SwASz3MKoyaWLNqV7c8leZb+6dIQRpD1OHDIWStQsiZBO1FMIkLAY5PA4WLpesel
 Qeo3ax5XovSqLijzgPlWWMFLENrLANPzUPzplk+VpSavPJ/NUe0oo/yG4y6RuNrjLR9i
 xj/qgFZBxP0vJBnmIkVTEwT+i30iWcU8D9zeL8Hk6qts6hmm+w/Di9YWVLHjcpA35qJT
 6v3EFVUnOTGcDk+Pq/fvvP5d/9Q50xHN7hgDjdCilWELV1PdCMtpXWgI7iuB86VLRG6U
 N+4I/z59+0R70DatRFqButURFGdEey56gNMNQgf3aR4aUZM73mKmOoXQiPMbECFo+J2e
 t1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZ7PZpsK5p7Ml+99aFSqPujPkgqK4WHxi+lxYdkVxSQ=;
 b=lsSkR/kqGV0NbVUojXXyZA5qsn2MT5I+CSfm+yDxAoYCLGuXS9tjF48Jw5VUQ9HPa8
 21XBXYZ7Q+/gqS0XOQfl5a/Y8ax/yDlBugb85rP0qNyuYzgwmaJ9664Uv9C6DSCXm4WQ
 nnulVNLWa83T1w36lxAX7iruUyaNSAH81V8UGMJibEhzqLvvzHmgVriFPdpawEMCckh5
 PiNBCuW7IWLk/lth8uyxoiLcOj+LyeZHCoeTNKjexM40KREd3y/NlWbyvT0gJpGdR13n
 8/sOf6ms75Ux/fd4s4CZw8D2dsOJKCLgg9THh0NNU7hG26dz5XgJszS9vhSxW/4uRxS+
 AiwQ==
X-Gm-Message-State: AOAM530dUaipOmCCxochScKTHT734FP9KvL0K5BsyRSQZrluVMm+rlRc
 HsDHMqaBSEbCRbLWlHgeH2VddXcBSVXN5mIOq3AtUIgK
X-Google-Smtp-Source: ABdhPJx3FZpT6b0U4e5VXZ4qTXCl1SlPGHXHrayiLi3wNQOFQ26J9ebsL21OefYNVutKyn3sCYjKLeMsU67Mzy94160=
X-Received: by 2002:a81:4104:: with SMTP id o4mr817025ywa.233.1644573808367;
 Fri, 11 Feb 2022 02:03:28 -0800 (PST)
MIME-Version: 1.0
References: <YbposjOPwc1puNvR@heinlein> <YehtxgLG3KlzKFAk@heinlein>
In-Reply-To: <YehtxgLG3KlzKFAk@heinlein>
From: Thaj <tajudheenk@gmail.com>
Date: Fri, 11 Feb 2022 15:33:12 +0530
Message-ID: <CAH2KKeY_aGKzp+BjYJPagjWAR2WLuqeib4aPy2nBjSc4_ed_zg@mail.gmail.com>
Subject: Re: Upcoming OpenBMC release 2.11
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000a79b7d05d7bb2d5e"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a79b7d05d7bb2d5e
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

2.9 is quiet old. There are a lot of changes after that. A newer u-boot
with secure boot support, better AST2600 support etc. A new release is
necessary. There is no 2.11.0-rc1 yet. Is it possible to initiate a release
process?

Regards,
Thaj

On Thu, 20 Jan 2022, 01:30 Patrick Williams, <patrick@stwcx.xyz> wrote:

> Reminder...
>
> On Wed, Dec 15, 2021 at 04:14:10PM -0600, Patrick Williams wrote:
> > What I'd like to do is target January 14th, 2022 for our 2.11 release.
> If you
> > are interested in your systems working on that release branch, please
> test the
> > 'honister' branch and let me know of any issues you see either here or in
> > #release-planning.
>
> I have not heard from anyone on interest in a 2.11 release.
>
> --
> Patrick Williams
>

--000000000000a79b7d05d7bb2d5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Patrick,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"=
auto">2.9 is quiet old. There are a lot of changes after that. A newer u-bo=
ot with secure boot support, better AST2600 support etc. A new release is n=
ecessary. There is no 2.11.0-rc1 yet. Is it possible to initiate a release =
process?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><=
div dir=3D"auto">Thaj</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, 20 Jan 2022, 01:30 Patrick Williams, &lt=
;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank" rel=3D"noreferrer">=
patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Re=
minder...<br>
<br>
On Wed, Dec 15, 2021 at 04:14:10PM -0600, Patrick Williams wrote:<br>
&gt; What I&#39;d like to do is target January 14th, 2022 for our 2.11 rele=
ase.=C2=A0 If you<br>
&gt; are interested in your systems working on that release branch, please =
test the<br>
&gt; &#39;honister&#39; branch and let me know of any issues you see either=
 here or in<br>
&gt; #release-planning.<br>
<br>
I have not heard from anyone on interest in a 2.11 release.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000a79b7d05d7bb2d5e--
