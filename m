Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F3C9410
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 00:07:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46k9HM3n46zDqVs
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 08:07:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="RsaX3chV"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46k9F825BnzDqX8;
 Thu,  3 Oct 2019 08:05:47 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id f16so296774qkl.9;
 Wed, 02 Oct 2019 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1s738KR7peDPdk0egrEOotdFH/XvdoPuk8qM2dZV4+M=;
 b=RsaX3chVgIapb461BDRuC0sDD0I5xgnK4SHyqIX74Teg/PoXx45jz4Bn1w1j0x915o
 0cld1gKH27FzDLsKxsCxX2fDACDVYXV2Kl7DbbVqnNr2YV5auxIbgJ3ZClu9UATlO1cd
 phlso1RkSrEk+wzqJ5HPqDerQZGThL/aqS8nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1s738KR7peDPdk0egrEOotdFH/XvdoPuk8qM2dZV4+M=;
 b=P8loX5Bhm/eQ63dO9zoIdQIazSf0v006pi9z2WYx9FP5tfukReA99e7/c7SwfIID/2
 HViBEeRkc+t8qNqsihkKDKnkfzdWfByl7n/Wnb24mOEyWY98PNJ/GmwBZ+4OHNKhGxdg
 jScwe+/NiNiqKojs8bOR6zhXaEZIP+F0vuSN6C3SjpeXNeDnNHixyIRce1lRhEeuLz9X
 3+BSPKRr0Qj4hMtSAbPSFW9J96FSu88GdnVZOE0NayPQTiAAzGU0zRiWQJZLo7ovOQVQ
 Wb3swGloW57DQV9fART/ZHFEv8NmTh1dGhjdK8LxojQvOvjskxT/BG62jAhfEndsuwu4
 1Jhw==
X-Gm-Message-State: APjAAAUeV4oI/BIGm+PtyPNq4h7qlwFzeqwhoTGJfaNhvohS99r7Y4kK
 qJG31cwfnY7GJlGwrba0lxbcEy8IjhQn0vqz1hY=
X-Google-Smtp-Source: APXvYqzCQ+ctGU7OQGZqx/nxtHTMHw9WlHbGNxcjNnj4Cgg7Cq7pSYMp4k90/LRI+zGC5+lRhoD79BWDyiWYxBW8A0g=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr1165671qkb.171.1570053944314; 
 Wed, 02 Oct 2019 15:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
 <70044749-785b-6ff3-7a28-fb049dcfec54@linux.intel.com>
In-Reply-To: <70044749-785b-6ff3-7a28-fb049dcfec54@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Oct 2019 22:05:32 +0000
Message-ID: <CACPK8XfBxC+4PHHCkMoXr+twjfWaovcJ5c=hfCmHRJ6LpGNeFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] peci: aspeed: Add AST2600 compatible
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2 Oct 2019 at 18:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Chia-Wei,
>
> On 10/1/2019 11:11 PM, Chia-Wei, Wang wrote:
> > Update the Aspeed PECI driver with the AST2600 compatible string.
> > A new comptabile string is needed for the extended HW feature of
> > AST2600.
> >
> > Chia-Wei, Wang (2):
> >    peci: aspeed: Add AST2600 compatible string
> >    dt-bindings: peci: aspeed: Add AST2600 compatible
> >
> >   Documentation/devicetree/bindings/peci/peci-aspeed.txt | 1 +
> >   drivers/peci/peci-aspeed.c                             | 1 +
> >   2 files changed, 2 insertions(+)
> >
>
> PECI subsystem isn't in linux upstream yet so you should submit it into
> OpenBMC dev-5.3 tree only.

OpenBMC has been carrying the out of tree patches for some time now. I
haven't seen a new version posted for a while. Do you have a timeline
for when you plan to submit it upstream?
