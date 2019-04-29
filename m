Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246BE573
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 16:53:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t7274t5KzDqB9
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:53:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HCu5B/bX"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t6x167RXzDqD1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 00:48:53 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id x15so5180627pln.9
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyg2ZwD0wqns/5ut0Y7mNg0CHB0isWAOd/UrQ/Op66A=;
 b=HCu5B/bX76j6AtfqljyNIsnron4TXukoWYz/0Nv0o1Xr+OJ6PvHS9hwz97x8l/z7a/
 QELF1wEUf4b2yKyUNmhKFEkl4iLfnsg/MR1IS4ubF1A/xjPx2QtdSopVL+FYYwWCipaT
 Bpi1wFHZUpZqZtjEy7S5M63DdiuGq9Mr9FvMtcH6tHjaP2SB+GjLu2S2szMl2B0+8Qz1
 taT9KoDJM75qkoO17CsG1FW+OUINTC2WtOpDXcMnt7pH4QNMY+AKwo9tVHqENAgRfw9r
 XMYhqwueLxMnNjxt4pIHVbeRGk9r6Ksj5+4AaeobnZ9+Us6zJi/dx4w6VzQkz3JXXKP6
 Oq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyg2ZwD0wqns/5ut0Y7mNg0CHB0isWAOd/UrQ/Op66A=;
 b=AHUXo9OBpw3681nyAMfclYT8AiiHVerSheEtIk3GOEHofUS4V1K+ddDktwejvGc4ka
 /ZeP1sdox6RKz4RNcC7jEVaa0kmZPIvRraEFjdWufJkCufvk7xEJbTANtiEwi3CDxYGb
 Jl5VYcqwbIBUgETUUIUCJpXxmEnVPY5zC2DihFIbJlc5HNxQtndnv2KSRKbzWd+v/avu
 VlK5cSdZcBJvp+E6SaHlpvGKMxiY3xQHH7apmQrR3Aq/VzRbVcnIi0MQulRCSpWq2s3d
 YTeQb5kuZpghGtgrPR78jUsiJT2/yldoaX3C5Oe48wUG12rQCDQL7b/DbYDOLeZAeFMV
 QLDw==
X-Gm-Message-State: APjAAAW9UvB/1nddPOQveKdp5a0ewlU0iqgA18WF17hKk9E3x+kjbgzJ
 R5zfFpgqrGYupUbUgh1/Z6ePUDqSGpjpj1km2n/sYw==
X-Google-Smtp-Source: APXvYqxt46wU9L5hVgciNkz93wd+C05NF5025YDzpA/5XZjyRiB27mqfhzdKh7Ooq9vRLDf4Kj+azdHE/8GrS283ylc=
X-Received: by 2002:a17:902:2:: with SMTP id 2mr62866991pla.61.1556549327543; 
 Mon, 29 Apr 2019 07:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
 <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
 <CAARXrtkSfziat2Eev0gqbHW2mih25FHXQ4JjXbV=BkCQh-0URA@mail.gmail.com>
 <CACPK8Xc2FsEWsfQu1UgJSBNdZ68JykcxWH8cOUGNp-sk6vOF2Q@mail.gmail.com>
In-Reply-To: <CACPK8Xc2FsEWsfQu1UgJSBNdZ68JykcxWH8cOUGNp-sk6vOF2Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Apr 2019 07:48:36 -0700
Message-ID: <CAO=notzSoZzej=Jod2cawj4HafE2pXcN5dcf77WqW53WA9jQOw@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Joel Stanley <joel@jms.id.au>
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

On Sun, Apr 28, 2019 at 11:33 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Sun, 28 Apr 2019 at 02:43, Lei YU <mine260309@gmail.com> wrote:
> >
> > > I recommend installing your distro's arm cross toolchain if that's possible. It's a much less invasive solution than sourcing the sdk's environment script.
> >
> > But it would be convenient for bitbake's kernel build to treat warnings as
> > errors, so that CI will catch such issues.
>
> Can someone take this task on? We would like the kernel build to error
> out of any of the default warnings are emitted.

So, when building the kernel with W=1 on all modules, wow, there are a
ton of warnings.  But presumably there's a class of warning that you
mean by default or do you mean only error on warnings generated from
an openbmc build?
