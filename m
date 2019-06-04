Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D43CE33E61
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 07:24:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J0jM2TDpzDqRh
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 15:24:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Kz63OG5q"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J0hw0gNrzDqLw
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 15:24:15 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id x47so12286969qtk.11
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92snOCFV/Z7THXEYlBJkM72T49lRtTY8y/2zT+OtfoM=;
 b=Kz63OG5qt1q+GgRiSApbcgFOFWqINzENStuXKuNlFcUFYl7jmHgjnifxJ2Eijbt6uf
 YsdICSN9wBBwto6Akoe+9x88TuKv3ZoSi8+qaRatqqb4EF0yTY5G7dfyxTyLB0HsFE98
 odb3nyi4fpiMscY8i7r7kuF0nMgqZ1U/U0xkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92snOCFV/Z7THXEYlBJkM72T49lRtTY8y/2zT+OtfoM=;
 b=s40pMVUGJUVf1h9sAVS2CyGa55NbZmOxV+z+6/ZquXz3Hqto4+rzRUwwjUn2cbTc+a
 YbYiNxhyrC+O7c2j2H0Z0XWl/Xgi6Ywve5EmoS0wshYUZU8IwgozSs8x6OdJmIvFa5bK
 xjhDrU7IqvzjRIF6exdd3CZ+QaAAo0iwFNS7pczRCSrKErG30ZB7eLGSdzvAqLWbc1jt
 ynqTH+B9IetfqdPpfFO2M8rtOkhk41R1DFQ/bqvEbT2o9RxeaKbcAGUY5vh/LaXItfvn
 RcGh8Xnig90KATkhFLRJeRnGGjzMyPg9tWBez6SCr4VofG0Ra1SFRqTrf5FnV1QTeZrH
 xriQ==
X-Gm-Message-State: APjAAAWAu0dvrQfF3srdfPxD1qc4olYgbyb7KX2QfQXFb1005IF9vj2v
 lkhMJDUIWYGV8eFIcPi85DPtHsCl2E8guCCvSL8=
X-Google-Smtp-Source: APXvYqz2AcIZ6sPIe5+wBQhB7mfmbqYiNBAKuLK0GExA2UL/tpItJwSHAqH8tr/F7W6uduxiwrgeeFHOIZf7+eY/W9o=
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr12827542qta.169.1559625851996; 
 Mon, 03 Jun 2019 22:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
In-Reply-To: <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jun 2019 05:23:57 +0000
Message-ID: <CACPK8XetcxfY1uWfiv9pLsX9a+X+66d2pD5-A68ZHrOUZhAd0Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
To: Benjamin Fair <benjaminfair@google.com>
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
 Fran Hsu <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 31 May 2019 at 15:28, Benjamin Fair <benjaminfair@google.com> wrote:
> This looks great! I think it's ready to merge.
>
> On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> wrote:
> >
> > Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> > This file describes the common setting of NPCM730 soc.
> >
> > Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
>
> Reviewed-by: Benjamin Fair <benjaminfair@google.com>

Thanks Benjamin for reviewing, and Fran for working to get these
patches in a state that we can merge them. I've put them in the
dev-5.1 tree with some small tweaks to the commit messages.

Fran, can you please submit these to the mainline list for inclusion?
Now is the right time to make the submission in order to make the 5.3
merge window.

Cheers,

Joel
