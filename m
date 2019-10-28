Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F5E7748
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:07:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4721Ng17nmzDrfs
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:07:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=navid.emamdoost@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JS8Fy9vg"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4721Mf2RZSzDqs6;
 Tue, 29 Oct 2019 04:06:21 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id s6so5296050iln.0;
 Mon, 28 Oct 2019 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qEZnOAl+fyol577/Ww6E9JnJ75gZF3IAAiee1LeCfz0=;
 b=JS8Fy9vgAdKI1FobnGClOfeD0pP41gqq5kqD7rnWblls7q2odK63Ol6xwiCU9Zt3Kk
 PPdk/JRUd0iUR8wz32PvlRY0otvIlahvYWrZwznaXZEVIxIn4/jPuAzFMsp5sJGVZpTY
 /NNuHZrnpV0yV019S6CtWPQGyn2FefiJ5Rs5vXnndxT0gVUAJT3HxlNfXwaQikrI1pVp
 +qa7kqGsaYHXdZwRLcvTnuC1c9s9lluWveBkjJVMS30yBn6FaRCZqHxiw7cO+caqI5IB
 8JkdkFI8+2aJKZBVCcQT62Psv92rV5tH3it3Dl6t07b6jVjVKEizlz+dOKlN2n+PL2Uv
 fYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qEZnOAl+fyol577/Ww6E9JnJ75gZF3IAAiee1LeCfz0=;
 b=dK4nwYEIG4d2XRCCIEFutmDW2LpAFeLxWol6zww1mdAAM8/vcoU1YSfr2xZazsm+u2
 a9bbkbzuRGy+/Jgxidjkc0rpUNqp3To2jE4F7XH680womCj83jbWdn0RwA6Row+CgBpL
 JXrkG+MOITkD+Cfs33/1NUbOGrhBTKnzCbylfw1GJXXF4pE9+DSN9FjMkguXQr4TgF06
 y/d5Zx5VaD7pSLfcw9Cj6KofGt6xhZOfHm11vGq1HeqD5Sh57ziSijyB79ZPaeCsYsqq
 GpBnLLyD1GiPtMksMsi4Z3fJG49LQnlg6bimZPVI5pu8ZTfUUYY2ebvIWTBzeJNm0spL
 4hNg==
X-Gm-Message-State: APjAAAUmHfKh+UvM/ZJ6PgNxxpSgNjgCbakPMhNUF70+SO2Vm5Sjug9Y
 yQHSB2AX3d2Qma+QNLaE7bX5eaK+lfvzkUoex7M=
X-Google-Smtp-Source: APXvYqxYIzKYXKMFa2CgHK7gcirYERSxMdE2I4RnMEWEhwn3UG4OKqYAn+/jnr8wxay0EFmyz1FqWZSWRzSEPIAP5fQ=
X-Received: by 2002:a92:6a04:: with SMTP id f4mr6280005ilc.252.1572282378109; 
 Mon, 28 Oct 2019 10:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
 <20191028165827.24949-1-navid.emamdoost@gmail.com>
 <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
In-Reply-To: <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 28 Oct 2019 12:06:07 -0500
Message-ID: <CAEkB2ETFNFKtGTo+HZ4L9uzr-W1CTeuGAwfKqm8hX5fx7d8dbQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: aspeed-video: Fix memory leaks in
 aspeed_video_probe
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Kangjie Lu <kjlu@umn.edu>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 12:01 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/28/2019 9:58 AM, Navid Emamdoost wrote:
> > In the implementation of aspeed_video_probe() the allocated memory for
> > video should be released if either devm_ioremap_resource()
> > or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> > kzalloc() with devm_kzalloc to avoid explicit release for video.
> >
> > Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> > Changes in v2:
> >       -- replace kzalloc with devm_kzalloc based on Jae Hyun Yoo
> > suggestion
> >
> >   drivers/media/platform/aspeed-video.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index eb12f3793062..2aa8ea2f9824 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -1646,7 +1646,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
> >   {
> >       int rc;
> >       struct resource *res;
> > -     struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> > +     struct aspeed_video *video = devm_kzalloc(sizeof(*video), GFP_KERNEL);
>
> It can't be compiled. devm_kzalloc should have 3 parameters.
>

Oops! my bad. Do you think such a list of parameters is fine:
    devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);

> Cheers,
>
> Jae



-- 
Navid.
