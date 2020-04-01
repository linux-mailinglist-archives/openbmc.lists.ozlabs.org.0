Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BED19A5A0
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 08:50:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48scJf6NMZzDqxQ
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 17:50:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cduP/okh; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbq258rNzDqkh
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 17:27:58 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id i6so25978259qke.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 23:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CS4A1+xOZ8hbCe525vMzptl20aErfoBVB1n2nlAwYt4=;
 b=cduP/okhB5X5DdQ9GZsGywNhwJ1vJCt8NODvszhNfdW3vDqDZoDhSafTxYek2+Kuhb
 3b+eno+MvhxDxXZe3xtvfrdYEm1T1hw2AJ9X39ejaLRLng/+ll7YG8mqpE6HEeTOvk2P
 pzMuHclcpB7Sl2OE8wmvXweVUZgPQiIVOZS4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CS4A1+xOZ8hbCe525vMzptl20aErfoBVB1n2nlAwYt4=;
 b=TB1KVPF12xnyLH6IE5Lpp/TfSMhUEmh20bwozB4x52DU7zAkqmentuQx1f7j7biApc
 EHBnjyj5jiyYjhIAQB2ibOJrFQDChGm9qdfT4E+bo+aT1cS5HGA/WzJkas0jI3kfH1YH
 aBP04lpJML2EV8mJR/Oiqh+I4W+o3Xbz6D5tAbGAkLqzbiehZPtKTAlGmZcAi1Unktfu
 5udmjX8WTiMO+TLKYptIt/QYfvT++HhEljR+bCgtc9NXJvHcZrS26x4Vs1yasbBMQiHa
 yJQIuAiFPMlBoW2xmax1/9C7hYB0VhqDTHOMXCcrmPuYqgsfWNvVg9xgd4hO3pC+tnV9
 izgw==
X-Gm-Message-State: ANhLgQ1orCVjTa80AGS4tUrpNVYbLp7kC4Yy3jI1V21iT7P97l1vDCTz
 G6QRlCMGqV9e54gEegv+sUeSh+Q0IgRfXMlMxn8=
X-Google-Smtp-Source: ADFU+vurFQpVDrOdEbdViUY1ZlNf7uDm9X2s3RdWvHw9YbyFa+z2b3F3LxW0XtfTaAseOvEz/BelVW50kuDiPuX+nbA=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr8713190qke.414.1585722474783; 
 Tue, 31 Mar 2020 23:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <1583953450-21660-1-git-send-email-eajames@linux.ibm.com>
 <9cd51cb31c98f3ca8c4dfe46656b0dd239bf350b.camel@ozlabs.org>
In-Reply-To: <9cd51cb31c98f3ca8c4dfe46656b0dd239bf350b.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 06:27:43 +0000
Message-ID: <CACPK8XfVJQN6vBccfcxPQndcRpWOty+h682tX9S9zFhB7sg4xg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] fsi: aspeed: Enable 23-bit addressing
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 31 Mar 2020 at 05:23, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Eddie,
>
> > In order to access more than the second hub link, 23-bit addressing is
> > required. The core provides the highest two bits of address as the slave
> > ID to the master.
>
> Looks good, this is just the reverse of the encoding we set up in
> fsi_slave_calc_addr().
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thanks Jeremy.

> [I assume that the opb area is large enough for the 23-bit
> addressing...]

On the AST2600 the AHB to OPB bridge sets the OBP base address to
0xa0000000, so we have plenty of address space to use. Is that what
you're referring to, or have I misunderstood?

Cheers,

Joel
