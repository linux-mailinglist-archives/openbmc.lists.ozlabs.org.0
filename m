Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B591DBF9
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 08:34:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44svyw5fCyzDqNK
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 16:34:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cyzCJLtd"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44svy13vTVzDqK9
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 16:33:58 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id e5so3806103qtq.2
 for <openbmc@lists.ozlabs.org>; Sun, 28 Apr 2019 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SsD0l4K+MYn/GmAzB7hZC1h4kdqJYV4L/r8sBQiL1l4=;
 b=cyzCJLtddorbk6VCHKi4GWynPtpaaHFt1wquGbpWOpinrZVHd2HHCs57rji0dqihtK
 z54IJxnSsn+ioWGj7qIkzLUUeTPz4u4x7luNeyOldHIvN9Kj83HyiGibcaWlWAenRKRA
 O+NhkhyGlDWXlQwLYmP2Kn3NKDuakR0AqHLE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SsD0l4K+MYn/GmAzB7hZC1h4kdqJYV4L/r8sBQiL1l4=;
 b=MTJth3nxhXAZ6k1Oz2RG4RZd1956foCngkRVvisAoqr8i0hbTP3CA3K8tIdcVoNdv5
 CNEVeDizBOy3Xp67XEkLslAB5PmEn7q79RUytGW5T9jDZZkJ+GoGPsm+L0xrgIQM7nTt
 /AfveFLmNw2qPuhnj4v/ztcXRMsg6i/m7ZEJwEV1KyrjvPRwGWTnNdXFdY2eHd9qrc1e
 8NdzNaMY5j5/ERmzYq3U0rBDNvtw5F7hKovrcBQ4/g9HqjkfhpMJx7nG/afqX40i/fTQ
 9fjRUejqJIQiB0NTieBH3DBKujTnXJ+Ccoc+XDnxyoxNOEUYb7J51dp9d207HuK73fj3
 w7Cg==
X-Gm-Message-State: APjAAAV/q3XaJk9wgoXohhm8OOYWBNVa/oy4IcM6aw1LupR9s6tbplic
 z5quD4vinYDlpTdx6koBOLz8hDQ58A3PyodPUOI=
X-Google-Smtp-Source: APXvYqyJh2QMr3UjErgPK3KmLjxhNtv1ZSddVgY0JiwPl91NRW1+lIvgfXzLzxF2pCVyWAtZSPQpvHHCGQa42Q1KRgk=
X-Received: by 2002:ac8:3365:: with SMTP id u34mr35802950qta.284.1556519634763; 
 Sun, 28 Apr 2019 23:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
 <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
 <CAARXrtkSfziat2Eev0gqbHW2mih25FHXQ4JjXbV=BkCQh-0URA@mail.gmail.com>
In-Reply-To: <CAARXrtkSfziat2Eev0gqbHW2mih25FHXQ4JjXbV=BkCQh-0URA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 06:33:42 +0000
Message-ID: <CACPK8Xc2FsEWsfQu1UgJSBNdZ68JykcxWH8cOUGNp-sk6vOF2Q@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Lei YU <mine260309@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 28 Apr 2019 at 02:43, Lei YU <mine260309@gmail.com> wrote:
>
> > I recommend installing your distro's arm cross toolchain if that's possible. It's a much less invasive solution than sourcing the sdk's environment script.
>
> But it would be convenient for bitbake's kernel build to treat warnings as
> errors, so that CI will catch such issues.

Can someone take this task on? We would like the kernel build to error
out of any of the default warnings are emitted.
