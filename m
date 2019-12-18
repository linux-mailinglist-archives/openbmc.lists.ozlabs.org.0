Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3E123E59
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 05:18:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1w91RzrzDqX1
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 15:18:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="DM18G2KW"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1vY32LdzDq7F
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 15:18:01 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id z14so465027qkg.9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 20:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jv1tZy9HTvFv29WsPoDGC/6ZRTjY1TnpLzSfOgG9wZA=;
 b=DM18G2KW2K0W1hesp48ssW6AeCGuIORqDeJf7jSajPehqPemA4X63EbyvgXVJyjCXe
 p/hMTxS4IjWM0wJRn2IzpV1v+TNNlCKk928mO79trzcg59E1GH5T9SnSLcwATl4kx1Ef
 WUf7kSfiwB/w9hET87K5U3h/LHgagUNqqGiU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jv1tZy9HTvFv29WsPoDGC/6ZRTjY1TnpLzSfOgG9wZA=;
 b=REzNpQo/FzEK5TyfoBdn79poSibUE/RXqD9KpkvxPQSB1N5/b/wrVWvIHgnKQMr3i2
 pS03q3qrPJBzq5TRfVxxvfuOFUs9cxDuCi6eElU6Lqv5Y7tWAvXeyVqfHxtI2qmvlrX3
 djDw3QwvTMqTpsW1BCgWGrgTR5kfqgy/qzgf7OaTiVS6xDOSJ5nGk9jQEnaNwosxizX3
 hBvMAqKGtZrIFt5S3ck4rR1e2PMCKQE43ftCfgP7iilsVWIk4qcX4LFJkSYUjnIWr15H
 xh9EhX2jEPzUH4lwpanw85eBNAroOy4/KFOnrzKT4sYtofkgOlZpup06eB6Ram3ipzLC
 0AJA==
X-Gm-Message-State: APjAAAUI6TQ7XqTKYajm1C1FP1dE94WC33sVp9SGXJzVkvRx/X75KKQU
 BIU4bAd33kQYU4pl50SOOBid6GDSeMLfsPQoSSXnxuSY
X-Google-Smtp-Source: APXvYqwqmMKiJDb3F0hVg8MEn8IBzrJISuDhvYK+zQhk5Rl7spgRifQ49HLfWkHnjNr0L1cQQtqV0iW11FttG+++Ojs=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr515009qku.414.1576642675525; 
 Tue, 17 Dec 2019 20:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd1fEh-o_5XR=QFppfR=HiQVbz60KjUFvjX7Lh7b9Le2g@mail.gmail.com>
In-Reply-To: <CACPK8Xd1fEh-o_5XR=QFppfR=HiQVbz60KjUFvjX7Lh7b9Le2g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Dec 2019 04:17:43 +0000
Message-ID: <CACPK8XezVTqvKRvJfxua=76H2aSdgEQrSaryZ0sqpM_ejV=6zQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.4 00/14] PECI device driver introduction
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 18 Dec 2019 at 03:08, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 18 Dec 2019 at 01:28, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>=
 wrote:
> >
> > I'm still trying to upstream it but it would take more time so I'm send=
ing
> > it to OpenBMC list to get cherry picked in the meantime.
> >
> > I rebased it on dev-5.4 branch and it includes fixes for addressing
> > upstream review comments I've got so far.
> >
> > Below change should be removed from the OpenBMC linux tree before apply=
ing
> > it to avoid conflicts:
> >
> > c31349b9039281107b948bf94ed5e53c235c8081 (ARM: dts: aspeed: peci: Add P=
ECI node)
> >
>
> Thanks. I have applied this to dev-5.4. Please test.

When CONFIG_OF_DYNAMIC=3Dy we get this build failure:

../drivers/peci/peci-core.c:1717:52: error: passing argument 4 of
=E2=80=98bus_find_device=E2=80=99 from incompatible pointer type
[-Werror=3Dincompatible-pointer-types]
 1717 |  dev =3D bus_find_device(&peci_bus_type, NULL, node, peci_of_match_=
node);
      |                                                    ^~~~~~~~~~~~~~~~=
~~
      |                                                    |
      |                                                    int
(*)(struct device *, void *)
In file included from ../include/linux/node.h:18,
                 from ../include/linux/cpu.h:17,
                 from ../include/linux/of_device.h:5,
                 from ../drivers/peci/peci-core.c:8:
../include/linux/device.h:176:16: note: expected =E2=80=98int (*)(struct
device *, const void *)=E2=80=99 but argument is of type =E2=80=98int (*)(s=
truct
device *, void *)=E2=80=99
  176 | struct device *bus_find_device(struct bus_type *bus, struct
device *start,
      |                ^~~~~~~~~~~~~~~
../drivers/peci/peci-core.c: In function =E2=80=98peci_of_find_adapter=E2=
=80=99:
../drivers/peci/peci-core.c:1734:52: error: passing argument 4 of
=E2=80=98bus_find_device=E2=80=99 from incompatible pointer type
[-Werror=3Dincompatible-pointer-types]
 1734 |  dev =3D bus_find_device(&peci_bus_type, NULL, node, peci_of_match_=
node);
      |                                                    ^~~~~~~~~~~~~~~~=
~~
      |                                                    |
      |                                                    int
(*)(struct device *, void *)
In file included from ../include/linux/node.h:18,
                 from ../include/linux/cpu.h:17,
                 from ../include/linux/of_device.h:5,
                 from ../drivers/peci/peci-core.c:8:
../include/linux/device.h:176:16: note: expected =E2=80=98int (*)(struct
device *, const void *)=E2=80=99 but argument is of type =E2=80=98int (*)(s=
truct
device *, void *)=E2=80=99
  176 | struct device *bus_find_device(struct bus_type *bus, struct
device *start,
      |                ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Additioanlly, the nuvoton device trees in dev-5.4 did not compile. I
will send a patch for that.

Cheers,

Joel
