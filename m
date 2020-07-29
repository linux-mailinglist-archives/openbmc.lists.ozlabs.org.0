Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829C232826
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:36:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH90k2lwpzDqlD
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:36:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ReFJmUum; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8zx5YRDzDqhD
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:35:40 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id y10so26107822eje.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rgl7KkcaLMzzEAux8QbOU9ALNhVLB/3gcmOVFedgx+0=;
 b=ReFJmUumT9clz0W6Nf4+/T3MIYjF6VhDfaUtcPtqSMpKJzbJhPt9xEbr4Zm8j4wp67
 tEQ33ovm625Q6zpRq4IRESOaCsoH04T5LW18Fqko15xIdn0j9b7Jz2xft1UFoD/p2Gki
 +fcRWUpVfEsZOcU49pFFyyl8vigcyju+y5FYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rgl7KkcaLMzzEAux8QbOU9ALNhVLB/3gcmOVFedgx+0=;
 b=dXiPWrgUUfSP10yLYZyIDvRbyPxyBd0mshgEv6GuKZDIDxVolj3f2AdZAf5nVBuz+N
 pEIGt/4AQDKo7Kb5TbjNxut+VqFTpYktqFKPNvl20sfRYPCUNrAQhUBXkUzBlir2JXQy
 nxqQkrOlM6RkiArkFA4vq1vbQnmK8djUTC5i4X40FnfHvt/04ct5cP8FqTxeJCgpaAuV
 o7B4G88h6PMsmW7JHUN0U3SePDsPJmCogTOkyxxNFLKpIeYozlIbPfJrgBhM9G0SlTJK
 j9XySlkZEWjdlfDY9ZIxje7P0VYi0bNM9MulmzSC7eyvOg463gWZ0tDpS2DpLzuyh4uL
 rRug==
X-Gm-Message-State: AOAM531tM0y5pDUX53GhieA9HA6STEjclbC3C5hhCRZ5WuuOH/H6DfCH
 YguMJpSJRWDVlnBGLDYmjYXS8z/+gArlGIGRy3o=
X-Google-Smtp-Source: ABdhPJxFFebvV7WApfGN2LaAx1iCbY43CMJ4h0+14ckDScKr0bKIig0kStYuI5OX0Bmg3FwmCwQWpTycHVwOyA7A9KY=
X-Received: by 2002:a17:906:2816:: with SMTP id r22mr3912ejc.215.1596065736641; 
 Wed, 29 Jul 2020 16:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:35:23 +0000
Message-ID: <CACPK8XeoPyJ6aaAqBtJnev5kuK=8KquKY9kTir9RdY8i3_7W2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 0/6] spi: Fix FSI-attached controller and
 AT25 drivers
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series implements a number of fixes for the FSI-attached SPI controller
> driver and the AT25 eeprom driver.

Thanks for sending these out. I'll give you a chance to respond to the
comments Milton and I have made, and then merge them to the openbmc
tree.

Can you then send them upstream (keep my r-b and fixes tags)?

I'd be interested to see what the upstream maintainers say about the
at25 patch. I suspect we will have to fix that in our controller.

>
> Brad Bishop (4):
>   spi: fsi: Handle 9 to 15 byte transfers lengths
>   spi: fsi: Fix clock running too fast
>   spi: fsi: Fix use of the bneq+ sequencer instruction
>   eeprom: at25: Split reads into chunks and cap write size
>
> Eddie James (2):
>   dt-bindings: fsi: fsi2spi: Document new restricted property
>   spi: fsi: Implement restricted size for certain controllers
>
>  .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  | 10 ++
>  drivers/misc/eeprom/at25.c                    | 94 ++++++++++--------
>  drivers/spi/spi-fsi.c                         | 99 +++++++++++++++----
>  3 files changed, 145 insertions(+), 58 deletions(-)
>
> --
> 2.24.0
>
