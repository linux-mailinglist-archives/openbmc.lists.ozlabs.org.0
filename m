Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5D444602
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 17:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkspq4vNdz2yHB
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 03:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ojrTeb5n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ojrTeb5n; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkspN49qCz2xD4;
 Thu,  4 Nov 2021 03:35:54 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id v11so8918064edc.9;
 Wed, 03 Nov 2021 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fl6Lfbm+X3UayVvu1C+abXBObfdqGAMXq7dg4VuZX2Y=;
 b=ojrTeb5na24B7cVdE5f0WeZLEzuhcTWkRpTjTKgl0jtXwDjDMV1LmW5TmyskSlaCab
 qf7oar6g/lGW9yxiFKvzbJrPtfKHv4fM8AnJlK0D8mNn8MSosMV46ZG/VbyDw8ZyVDlN
 4G/A1mqc8dqN42e1X/5Fy0yYlzgaOinZymU6P3H8WTVx4UStgpzQ8+i1cuosDXtf4N6c
 Wn7Edwu/a8yD1U5caS9XworKLnZSidqPrOhopm78Hd0+jInUfwqvYYHSNlYOWuU0kLyn
 UUIfGyupoYnmdWgZcCfarnbUVctVknxJ/7k3t1Z8z4S+2YtUBHmFComOUV50cmK7arH6
 yeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fl6Lfbm+X3UayVvu1C+abXBObfdqGAMXq7dg4VuZX2Y=;
 b=zVW+y0WUPYYMfBw8UxfcjMm6i5JkMHj9s6yAhgaK2FXJmuZS35LeyoFCtLSdrCVCkb
 MrMvy27IYLTvVaun16DTzR/dQaR/Fy8kDvSetmVhbL2mJ4mpAX/Fo75vMFcRErhLCMX1
 KT+0ypTpG/DwBv59qDH4IF1DYNvtYAJORtFgguo9nPy9kM14jd1hKZjnnRQ0nhf0JE25
 as38MfytjEW4R/VuO9ehHYB8kNrAG99Pw8lP9MRxIeMIyPLjZgOMLkV8J0RGQspOlOoF
 +CF4rxskj2s5S0lnE50Mw6/SSbWOJLmer8h2WnPZEHflFXa6eaVO6sakD8yaZ7jGcGyj
 xIvw==
X-Gm-Message-State: AOAM5300EBAyfP/2OMNh0kd2e1yeVfxoyCKaISKBXPYP8MYWvBxXa4Qm
 BG/2Min7IdNuGYedS4NFbleqKeXB4wb0MNX7BsQ=
X-Google-Smtp-Source: ABdhPJwGjwr/Uf8m0Fc3GQC8E/cgWQEZk8tLwHPoqezLFLf1XC9hp9ajQDKMY986F1IE5CVmR5hAkODhA1dxX2hINEo=
X-Received: by 2002:a05:6402:4304:: with SMTP id
 m4mr6105179edc.396.1635957351242; 
 Wed, 03 Nov 2021 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211028095047.GA15236@gmail.com>
 <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
 <20211103084939.04f6813f@kicinski-fedora-PC1C0HJN>
 <CAA7Tbcu7rOxhP45m0tkQBKWxUFGwtQ3Z485wyCtS-wVaTtq2=g@mail.gmail.com>
 <20211103091620.718b4e11@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20211103091620.718b4e11@kicinski-fedora-PC1C0HJN>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 3 Nov 2021 22:07:43 +0530
Message-ID: <CAA7Tbcu4cs-K_hpW6Ox3SKbCbvFyt5upC6qkLOjFttw=ee+UtQ@mail.gmail.com>
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000c9e03205cfe50037"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c9e03205cfe50037
Content-Type: text/plain; charset="UTF-8"

Ok Sure Jakub.

Thanks,
Kumar.

On Wed, Nov 3, 2021 at 9:46 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 3 Nov 2021 21:43:03 +0530 Kumar Thangavel wrote:
> > Hi Jakub,
> >
> > Thanks for your response.
> >
> > Somehow, My mails are not delivered to netdev@vger.kernel.org.
> >
> > So, I removed it in my last 2 patchsets.
> >
> > I will try again to CCing netdev@vger.kernel.org.
>
> For normal replies you need to use plain text, not HTML. The mailing
> list rejects HTML emails. But the patch should go thru, we'll see.
>

--000000000000c9e03205cfe50037
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok Sure Jakub.=C2=A0<br><br>Thanks,<div>Kumar.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Nov 3, 2021 at 9:46 PM Jakub Kicinski &lt;<a href=3D"mailto:kuba@kernel.o=
rg">kuba@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, 3 Nov 2021 21:43:03 +0530 Kumar Thangavel wrote:=
<br>
&gt; Hi Jakub,<br>
&gt; <br>
&gt; Thanks for your response.<br>
&gt; <br>
&gt; Somehow, My mails are not delivered to <a href=3D"mailto:netdev@vger.k=
ernel.org" target=3D"_blank">netdev@vger.kernel.org</a>.<br>
&gt; <br>
&gt; So, I removed it in my last 2 patchsets.<br>
&gt; <br>
&gt; I will try again to CCing <a href=3D"mailto:netdev@vger.kernel.org" ta=
rget=3D"_blank">netdev@vger.kernel.org</a>.<br>
<br>
For normal replies you need to use plain text, not HTML. The mailing<br>
list rejects HTML emails. But the patch should go thru, we&#39;ll see.<br>
</blockquote></div>

--000000000000c9e03205cfe50037--
