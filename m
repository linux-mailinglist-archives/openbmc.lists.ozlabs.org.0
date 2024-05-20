Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id D3E9D8CA107
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 19:06:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fd9eSDMZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjkMr5TnQz3gJc
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 03:00:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fd9eSDMZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjkMD6v6Mz3g1B
	for <openbmc@lists.ozlabs.org>; Tue, 21 May 2024 02:59:51 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-34e0d47bd98so1451461f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 20 May 2024 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1716224381; x=1716829181; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr9BrRgB0j/kPmHYK8lkkrDBKCn/v0e7js9EeqDfkGM=;
        b=fd9eSDMZanfb6NB93We0/s/BPxwK19IngPHmSwcTaryDUSWgdmZI2LfsFsyeUUasv9
         b+j06Nb33GTls9qOsDEiLUCKBs8CEha66mcl41GVTlY6d3EOADS50Nzdmu1XcdUeRwYi
         CESnR0+Qm+MD5D9ptqCult3q5E//wXZ8yENxmW7IwllENQWEALIEgxt2SvxXt6Iy4ONQ
         QtUL92ibX0u6oWKVhSMp6YgoMCoxUhftu6zIFQjHxJySjBttXj8wPusf1TnSmNFIiXxw
         PydRSxj9RGfIdpeM7XnbGyJjsLSQRZ2ofyBhO3uaYvO7XXoLnQNkUO9jyxYY3PgUBKF2
         3dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716224381; x=1716829181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cr9BrRgB0j/kPmHYK8lkkrDBKCn/v0e7js9EeqDfkGM=;
        b=k+RSkRM6SW8FIG+++vdNt1gLKKwu3Ursov8mccu5CgZtmX7TferECbq4iQJbUFZpRV
         cCzG9ArMtX1Ntjc64py8kUP8H+jJn9WSTrYt+Hs6YAp2jPRcwQn1DByjzHcn0LXGbR7d
         TinxXXosTMk+sttyn9lbp7H0kN4KbaGeUcHOGKUTONluNKDb/ujT0rTKBVuQcsqYI2kd
         2X9MEdFHvfAavVkMDrsiLg4wcIzGhUtcvsMcnrhunQ9z8GPdRBn7l77eqh4zpTNjpMJ7
         BEpBRyKZ6Q4nAQharrPukedBYs6e1JfOnk4BxPSqetNKlF73+vWNj9bE36Xu/pJHlbqG
         IT2Q==
X-Gm-Message-State: AOJu0YxxDaeF56RRs/9PSz1XLi60LzutATBkdOBDVD9rzOVStNBUJ8ZA
	zKIlrwAzuW5p+i+hyUxRYo884UhZLfB59BV5wlFwsEsFzJZgf8vXvnakFhNMEJyUhgTAdGrv6YQ
	PZsshsovc12agDSsVA2VadRqvtQdf5/TKkaGsG97LGBcvPAcCy3A=
X-Google-Smtp-Source: AGHT+IFZE9o5M4Y74LgpMsblM2c/V6EcwJpJLceqQgEvE4C2V8uIdoRCGzAxZDebdUPqJo0uOK5vDV0MKeiaBPJptA4=
X-Received: by 2002:adf:ed0c:0:b0:351:c05e:3c12 with SMTP id
 ffacd0b85a97d-354b8e24573mr5895028f8f.25.1716224381038; Mon, 20 May 2024
 09:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
In-Reply-To: <CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 20 May 2024 09:59:30 -0700
Message-ID: <CACWQX817b2b2gHnBVYch0P-e92m0rs3pzCdrNZOX9vYrSfrLAw@mail.gmail.com>
Subject: Re: SDBUSPLUS in OpenBMC
To: Kasra Amani <kasraamani80@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, May 19, 2024 at 5:11=E2=80=AFPM Kasra Amani <kasraamani80@gmail.com=
> wrote:
>
> Dear OBMC Dev Team,
>
> I am trying to create a D-BUS service for an evb-ast2600 build and have w=
ritten a server for it which works fine on my local intel ubuntu machine. I=
 have been trying to deploy it on my image but have had no luck. What I wan=
ted to ask is does a workflow guide exist on how sdbusplus can be used to c=
reate new D-BUS services for OpenBMC? and how it can be done through bitbak=
e.
>

I recently updated the template repo that I generally point people to
when they ask this question.  It implements a basic DBus-connected
application using OpenBMC style and dependencies, passes openbmc CI
checks, and implements a basic unit test pattern.

https://github.com/edtanous/openbmc_template_app

For a long time this was hosted in an abandoned gerrit review, but
that seemed like a mediocre place to host it.
https://gerrit.openbmc.org/c/openbmc/docs/+/41099

This was previously discussed on the mailing list here, if it helps
you gain some context:
https://lore.kernel.org/openbmc/CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6Gqrv=
kJo59Kqg@mail.gmail.com/

> Sincerely,
> Kasra
