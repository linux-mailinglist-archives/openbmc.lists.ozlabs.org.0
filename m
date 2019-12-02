Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 049BF10F286
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 22:59:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RfC75bTGzDqD3
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 08:58:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XWw2EpfR"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RfBH4sv4zDqCw;
 Tue,  3 Dec 2019 08:58:15 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id g24so1412216qtq.11;
 Mon, 02 Dec 2019 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVaXi6VJTkbrgkla/zwTZyQ8K5/Xxz313P0oOuR5JLg=;
 b=XWw2EpfR9RQ5mqYx+5gAbzvTMmVCWjIReY5TUkcIZu0YmHa4ZB0fXyRpQt2prd/Jt9
 zB2H7XHyKxEelGbm1Zqadp6pIw230RhAiwSmkhq9kTLZZ1T1oTCTXScsMfTiO9GzVYgi
 Yhq8U0O6rEwP0mAEFu8/zQqPp/Jyi3YRBrHvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVaXi6VJTkbrgkla/zwTZyQ8K5/Xxz313P0oOuR5JLg=;
 b=CO29vUoGeBrglQIVwKtvFOdlbcCT1Uwy3zzxFkst89843a0QFMAniLMOMkVkvhSXLe
 +JIqriiwsv1oQaXzhOXY9hB3AUp7yH1rVHu8hlkMCDkhdc7Gt0WMjV9tBSO1/Xb1nJkq
 tONVa3t7LbtcjxOI5xTFFbI/7Niocj5crUaNQJnyC5CYd1Q20zN1PPfKM5zXH4768JkE
 4LBiUNITua9eKz6BLCrCzu5WegvTv+jEHrNjBfjlVO6tI/uKueDVVCqb31EzEzuNbyzw
 6sRjXKuleO7zo7jvW3yNPmoOWcI8RAOk/FCQbnuQRoNC063MfGwhcSZpoqOe+LbJEw1Z
 +Nag==
X-Gm-Message-State: APjAAAXi0gwy+aGLfPIIoxyMyyfzUE41qGMx01Xj6yhHoFutBGS0QuwF
 V2GB8RozYhI+rI1EB7dboCw648GvRFkVFBxqcm0=
X-Google-Smtp-Source: APXvYqwn8km6OVIYCMYJKryuP0QuX/13ylrQEYjCB7m9ABt4yTHTTD4AFAZOfzcAiG0hyJq8vCjs4fCaeUqpwTnDWRE=
X-Received: by 2002:ac8:4244:: with SMTP id r4mr1769497qtm.169.1575323891858; 
 Mon, 02 Dec 2019 13:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191118104646.3838-1-i.mikhaylov@yadro.com>
 <20191118104646.3838-4-i.mikhaylov@yadro.com>
 <CAPDyKFrshWd1P9dZGTSuU=5P0L6LSPz=v2nn+0SWi3ZZazKrRw@mail.gmail.com>
In-Reply-To: <CAPDyKFrshWd1P9dZGTSuU=5P0L6LSPz=v2nn+0SWi3ZZazKrRw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Dec 2019 21:57:59 +0000
Message-ID: <CACPK8XeOgNviNY6gBw74Kvmf=a6d8t4PRbZk1YevxUG035QxUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mmc: sdhci-of-aspeed: add inversion signal presence
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 Nov 2019 at 12:59, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 18 Nov 2019 at 11:47, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> >
> > Add read_l callback in sdhci_ops with flipping of SDHCI_CARD_PRESENT
> > bit in case of inverted card detection signal.
> >
> > Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>
> Applied for next, thanks!
>
> For clarity, I am leaving patch 1 for arm-soc.

Thanks. I'd already sent the aspeed pull request for 5.5, so I'll send
the device tree patch next merge window.

Cheers,

Joel
