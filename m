Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8434DE18
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 02:36:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VKWK5DKDzDrKd
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 10:36:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GaWhQzfa"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VKVp0P7QzDrFd
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 10:36:17 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d17so5144207qtj.8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VpLjpjTSdJ8LXkNjHhkOfeIM70YegL3ssME+e/Cuuzk=;
 b=GaWhQzfaKvIcp49TgeVouEAOMbSMxZKlY5phpiksKkcMNkiLoMuzgKeVq1DaN2B1Ux
 W9tk4B/h9rkmakS2P3zJ7HXHUAbH8YG6NzoB8gRJuWFTO+dmO+uUpr3WPz5bYOsplCZa
 IQm2sz7jD4Qm5xOmPAbzgM69liiRW2GlPqe3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VpLjpjTSdJ8LXkNjHhkOfeIM70YegL3ssME+e/Cuuzk=;
 b=e7b2D5bd4ZJFKodrL4dtkjsCcjgSz34JpFZxnIErgWeeRyK0HRNTVl96qOUdWU1fAE
 +2PxV1IREhTU2CChQVLyvtT0/nVlyAB0Ur/WpXdYA/1p11YkJKdtp713E+vpZaT+qDUi
 kDc8fElo2faN+O2BaqDp8au4djHgfy4qJDajb+a8XqcKfRD1u0p1OdWwoGUcGXgzgcmg
 BgLLOrLGZvca5R/a30BfJrjJIq2TJ5LJM3femkAJySf/xjBMIuW0YqWeKmZ1FoOyJYLF
 HVfgYPnQ3fUDo6Ad2jWq/t1Sa30DKVU5Wa53ynqBT6U2Ham8IIh/neHYWHynSMZwYCsC
 OOvg==
X-Gm-Message-State: APjAAAXNtacyIcCZHLmjLkekqfV69n3GvRJMXAaAYg2ELtc2dp0TSnyX
 2UtXZYouUXIdz/Cx9rxVwuGdBh8B9fnyd4MKVDvtsGo/
X-Google-Smtp-Source: APXvYqyEht3zScqQEte1KzAsfJM6A+RK6caQDfD0N+KIF8jPuEKLoXLkQKkQ6POzp/ZZelY4l4/8YmajMqBgzkTZ1T8=
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr42772576qvc.172.1561077374022; 
 Thu, 20 Jun 2019 17:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
In-Reply-To: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Jun 2019 00:36:02 +0000
Message-ID: <CACPK8XfBwP1M01BNuy0E3DwYdvpJLw-GNyRq9tPrtV2OuzgfBA@mail.gmail.com>
Subject: Re: OpenBMC Hackathon will be at OSFC Sept 2019
To: Nancy Yuen <yuenn@google.com>
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

On Thu, 20 Jun 2019 at 15:35, Nancy Yuen <yuenn@google.com> wrote:
>
> OpenBMC will hold a Hackathon as part of the Open Source Firmware Confere=
nce (OSFC) in September.  OpenBMC will have it's own track there.  Several =
other firmware projects will also represented.  Registration is required an=
d there is a limit on the number of spots added with this track. Please reg=
ister early.

Great! I've registered and have travel sorted. I plan to submit a talk
on the openbmc kernel/u-boot efforts, and I would also like to talk
about our qemu work.

I look forward to seeing everyone in September.

Cheers,

Joel
