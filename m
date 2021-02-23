Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F932252B
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 06:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl6rZ1PL7z3bPM
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 16:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=acJ2LZLF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=acJ2LZLF; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl6rM05yfz2y0J
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 16:22:38 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id l5so3559582ooj.7
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 21:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B/Uv1Pr4CkwiHzTWbBalMxYc6Q7am9FBfdz42GthYiM=;
 b=acJ2LZLFj/bOoaTYiJu5IZpKrGwCFFjE5PrZgZrGjklNfFJJW6scvwCtYGKmddlnEi
 z6t5pxEszbEy9gs3NuazW2jYuvLbhYWqL56GxXptILHfatmINkHHAuuiiKhBavCtKujY
 X3Vb6BfEIxDhNVHwMrzqSTfMvJBhPGA03sdy9+Qi6r5sCJ9duZW/oS6tvjNFjfraltV5
 ecU+q45EJY+MOmhhYAkeWMzZ7ne+iEMSjT2KrL+9Ta5/qduMIprFXyyIywhAFOQ1PZMP
 MA3aHA+64yw2904nCDFr9fop8RJd86CvLsBP8L1EjOZESRCFe0/vQJYatQfbPDJwvUmo
 6W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B/Uv1Pr4CkwiHzTWbBalMxYc6Q7am9FBfdz42GthYiM=;
 b=cxXIY86ndaYEhIZjcl5DJ7sTlDid/yIXvpTXgfw/QUWnpQaVpGPaf3fk1qqIxKngkk
 lFsIOqVS4rZgdPV5gfK7V6qtlu3pKsYpArK8w9urd4VUv5SlR2LFSI3mFWLLiRyRDBWs
 Us2SfJwZ3mlfLM2PbaWvnIOY/il/5OHZbjnMoYavJ4tEY/D3BVMKvzkTsMxYA+iHSY8n
 3/0AJcUO4hT4sz+3mUtEpzM9Ahjci5gE2oh9+PCAshjMbJ0EujxjlM5iE3B+oyRj3gwq
 tMOoMAw6GbgghhxUSGDODeYL4LoGRvwotKuqULqdEEkWg4tKuO8HwTkETBpDjWbm53hf
 qJqg==
X-Gm-Message-State: AOAM530G1er+UWkPUqF3FATHFxZiMHG+gOkl4C4wc7IT0lLGwDUjXxr+
 DHoOEGldh/U8xwsYJmS/wjiNwlG079zJJgswXKNaVQ==
X-Google-Smtp-Source: ABdhPJzuSYOnILc1QAvqSUYqc/rM1Cldp0kyHky7pyB4AExo/tLva+9nuoQDt/DZ2xpo+SGncxxR2OwJglj80fIrgCE=
X-Received: by 2002:a4a:4fd7:: with SMTP id c206mr14088562oob.10.1614057755569; 
 Mon, 22 Feb 2021 21:22:35 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
 <YDE90CWoSXCHjgYK@heinlein>
In-Reply-To: <YDE90CWoSXCHjgYK@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 23 Feb 2021 13:22:24 +0800
Message-ID: <CAGm54UHXEkGZc9nrr+ttMJJGbQObWYwO4rdpm4CYzBAEGT1YiQ@mail.gmail.com>
Subject: Re: overlayFS security concern
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kun Zhao <zkxz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 21, 2021 at 12:56 AM Patrick Williams <patrick@stwcx.xyz> wrote=
:
>
> On Sat, Feb 20, 2021 at 11:46:08AM +1030, Andrew Jeffery wrote:
> > On Sat, 20 Feb 2021, at 11:01, Kun Zhao wrote:
> > > 2. don=E2=80=99t use overlayFS (but it=E2=80=99s really useful for de=
bugging during
> > > develop, and configuration management)
> >
> > Possibly, but it's probably worth looking at IMA instead:
>
> IMA (or similar) is likely a good option.
>
> There is also work going on to remove 'root' from many users and
> daemons so it should be harder to overwrite executables.  If you
> have root I'm pretty sure you can always subvert even something like
> IMA.
>
> A protection we could do which would make attacks slightly harder
> than they are today would be to change how we mount OverlayFS.  Right
> now we mount it on top of root, but we could be more explicit about
> mounting it only on top of places we expect to be read-write. `/etc`
> and `/var` are the two that come to mind but I'm sure there are others.
> This shouldn't be very difficult to implement for someone wanting to
> take the initiative.

Yup, as far as I remember, the "ubi layout" distro feature only mount
specific directories instead of root.
Checking the code, it enables the `read-only-rootfs`
IMAGE_FEATURES[1], and use a different init script to mount only /etc
by `preinit-mounts.bb`[2]
The same for `phosphor-mmc` as well.

@anoo should know this well :)

[1]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-p=
hosphor/images/obmc-phosphor-image.bb#L35
[2]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-p=
hosphor/preinit-mounts/preinit-mounts/init

--=20
BRs,
Lei YU
