Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249B3A34E5
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 22:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Fz1703hz3bvC
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 06:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=bb+JAy7i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bb+JAy7i; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Fyn27J5z2yWl
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 06:32:33 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id m18so3684800wrv.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J7FXSH1kN0fSsckk/KAnEkeeVyqFbPZavGrzSy2eX+M=;
 b=bb+JAy7i6fObXRmmTsJXNy0zCot12CF7pArUqBwH+D1bgRP6S4GD9uYqZnNgcso85D
 G/ldbN7VJrAvldnfuQ4GYQ9tSAmkYBV+M4ZzeFFMIS5p4WQmAocEE7A7BLJeVGsvzTah
 WFWFqPsbJUWJniO14b56I1gDeoA1D5FZpZen0fBI9aLAE5N5ncfReL2X93022JmWY4IR
 82a+zkgHVj67eegDn6ed/neGA7RkwYS383H5R3NE4f9kFXi5+QPXONirujbWztHqH1m9
 8k5Dg/r5TQ+s+maHXO4ZwHuXek1dbmvoQwjBpAtLgEw8YRhj0M6ECycNFVHc7r6PZCDB
 wWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J7FXSH1kN0fSsckk/KAnEkeeVyqFbPZavGrzSy2eX+M=;
 b=OIGHa1jGBwOGdXHCrsiz+sBYSBOg8SJ+dfydLWpwwwYuRXEJzKWhm/4M/GCGPZ7xCX
 sDxcEn8vlMtk6ZLk3HQOfJ2URfEhEWxVFJlZbki65ZEtKxwEfsUxo/d4T9/YBpfRXfJG
 6djphnO+yKO0sQVzHO6RBFIo6nqzQM4F+hDeB9qTgCxxz9SFA5LCk8QMS3AC5ZuQj4Zk
 s0dzp8QQQvbkYHqnpGhQ0Ho1hCNB7dAaD3R80ekenI3rDTk+4pPOEIi1wmJ+nGfr0XJW
 gpARsEyVfALjosMcvd1xdDGZr5YKodQ/QeZ/oOo313Zb0NA2pzIeWZ5xiQRA2aviNVTm
 tdCw==
X-Gm-Message-State: AOAM531djV7KqM1XoxSaMj48jpznjgaIAKdk4C2n5pwFdGlyuEw47CBl
 ex/onmQ7FuW5TUumQUQ0wWkiUa4y6h8a0x6yyYWE/A==
X-Google-Smtp-Source: ABdhPJwfc56gUVUbwySIsobJm/e2oXRKmM2ZEk20m2HaYTYl7EHC8zcGLGoNWQA+R4sTQXmHUGACPfsZuyyzW3LCIZc=
X-Received: by 2002:adf:e389:: with SMTP id e9mr268292wrm.424.1623357143694;
 Thu, 10 Jun 2021 13:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 10 Jun 2021 13:32:12 -0700
Message-ID: <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
Subject: Re: RDE Enablement
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 10, 2021 at 1:26 PM Garrett, Mike (HPE Server Firmware)
<mike.garrett@hpe.com> wrote:
>
> Greetings,
>
> I'm am interested to know if there has been any organized discussion or d=
evelopment on Redfish Device Enablement (RDE - DMTF DSP0218) for moving enc=
oded Redfish data across PLDM/MCTP interfaces.  We are interested in promot=
ing this standard and are willing to lead a reference implementation for Op=
enBMC if there is not yet something in progress.  If there is something in =
progress, can you point me at the work because I would love to see it.

We are interested in this as well, although we are in the early stages
of looking into it.  Ideally we'd like to have OpenBMC support add in
cards (NICs, Accelerators, ect) that supported this functionality, and
make that data available to the normal OpenBMC channels
(Redfish/ipmi/ect).

>
> What is the normal sequence for proposing, debating and finalizing major =
new features?

The mailing list tends to be a good choice for the very early
discussions.  https://github.com/openbmc/docs/blob/master/designs/design-te=
mplate.md
tends to be a more formal process if that's what you're looking for.

>  Would I submit something in Gerrit for review (e.g. a markdown file for =
the docs/designs repo?)   We could probably get something started fairly so=
on.
>
> Thanks.
>
> Mike
