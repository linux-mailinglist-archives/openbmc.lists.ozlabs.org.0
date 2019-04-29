Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5AE5A2
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 17:01:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7Ck1ygnzDqT7
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 01:01:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="HDTLJ3b2"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t7Bg56lZzDq7h
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 01:00:42 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id h16so6571953qtk.6
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4I+JZLfeBpp/pjwUg6QGPTIeUiDTDDU00E2o6DHn4LQ=;
 b=HDTLJ3b2ediPbfdoKSS8DdMxn/QcLb4XlWVCEVcTNv6vcKDb7YOqV9YsM+4SiQCC9o
 zKrcmEz/jTeWZ7SITd2ymyByX6wy4FUdDS/81vNaw9PbsPuSHG6SFyiSw+t92bzllrgZ
 QiUCi/LbjThN49EsxxSFsMRRD3Ll2JtZpi0fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4I+JZLfeBpp/pjwUg6QGPTIeUiDTDDU00E2o6DHn4LQ=;
 b=JimVPSKU9hmlJHkg6uFtgO8c/5EdXwY2tG2Z1ciMz1MNqVRuRwQAkjLIRGC4mK6Gqu
 wVjoAwk7ie56ZmWX0RBpLcavESCtaMXE/L6ORrMbVtaPoxRFUDEetFqQaVC9ZORxAX3e
 iI8dbmAJ5i4Pu9P5IqiDc/glUjd7vTyciOercAistniof2Krd7dxy8VhH4nW3NgUcbmo
 z0eCDAZR3UJ4czXMxUC+pXfFVpYtEBMG2IsXcgGlRrB7zcISvCT3Z/QrlX7YAbWvzfaw
 tAl3hBpn6/V7U1PiEkHARf++DUIudThohLQzXxpzGXqM/q6Q0HuG8yRxncegVW+G6dt3
 8jzA==
X-Gm-Message-State: APjAAAU/z5Oh7n4k7zmKS5O4kI8dcNLI1YP2bNMi7ZRV81uhIM78cDQh
 XU8SFdd7U1YZWYecY4FxS34WYlH6+58g4O8879g=
X-Google-Smtp-Source: APXvYqyaKorZzWMCpFoL5IFKFHl+oYTTmzFj5RZQ2y7ex6/OpcfN0rw8oEYtFnBmntXeYmAHcOUmfE5QVGMdGC3Qt2c=
X-Received: by 2002:a0c:86ea:: with SMTP id 39mr13132637qvg.89.1556550038999; 
 Mon, 29 Apr 2019 08:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
 <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
 <CAARXrtkSfziat2Eev0gqbHW2mih25FHXQ4JjXbV=BkCQh-0URA@mail.gmail.com>
 <CACPK8Xc2FsEWsfQu1UgJSBNdZ68JykcxWH8cOUGNp-sk6vOF2Q@mail.gmail.com>
 <CAO=notzSoZzej=Jod2cawj4HafE2pXcN5dcf77WqW53WA9jQOw@mail.gmail.com>
In-Reply-To: <CAO=notzSoZzej=Jod2cawj4HafE2pXcN5dcf77WqW53WA9jQOw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 15:00:27 +0000
Message-ID: <CACPK8Xc=NJXOirPBeBNVMPOnM2-2rswRvZH3ypiKT4rpfit_hA@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Patrick Venture <venture@google.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 29 Apr 2019 at 14:48, Patrick Venture <venture@google.com> wrote:
>
> On Sun, Apr 28, 2019 at 11:33 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Sun, 28 Apr 2019 at 02:43, Lei YU <mine260309@gmail.com> wrote:
> > >
> > > > I recommend installing your distro's arm cross toolchain if that's possible. It's a much less invasive solution than sourcing the sdk's environment script.
> > >
> > > But it would be convenient for bitbake's kernel build to treat warnings as
> > > errors, so that CI will catch such issues.
> >
> > Can someone take this task on? We would like the kernel build to error
> > out of any of the default warnings are emitted.
>
> So, when building the kernel with W=1 on all modules, wow, there are a
> ton of warnings.

W=1 is the first level of warning insanity. It goes up higher.

I encourage you to also take a look at the output of C=1.

> But presumably there's a class of warning that you
> mean by default or do you mean only error on warnings generated from
> an openbmc build?

I meant the warnings that you get from a normal build should error us
out. We could add this to the kernel command line:

KCFLAGS="-Werror"

In practice this won't be necessary, as I won't apply your patches to
the kernel if it introduces an error. But if it helps other developers
do their jobs then I'd +1 a patch to do it.

Cheers,

Joel
