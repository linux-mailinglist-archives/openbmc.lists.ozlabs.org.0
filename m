Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA25A4D02
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBks6zytzDqWR
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:07:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VhRc64zP"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB4x6SrDzDqMW
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:37:53 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id t12so13974990qtp.9
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u9f8+YMdy+6TzZrT8RZX1JyJ6aIpCjS/Ik6wChS5myI=;
 b=VhRc64zPhBNZT5fgC7CGRIsc7IyU4j1TBFXl5cNlQsEDUzF8SFyUzP9/l5mEK2h7GC
 LdWkm6to1E/HS5qt3NfqG7KrGzsgqxsGUu5li4HnuQ/7BvNx7xByWqH9TmH12IrG5B1K
 44JBMkVfmS3jSb4Zj5iMymb6Y8ttBRt5aNdFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9f8+YMdy+6TzZrT8RZX1JyJ6aIpCjS/Ik6wChS5myI=;
 b=TIkn9jfNz/nz8g0ntMZDXtoBhEzElJnTu8qKUARSHX++zaRT5GL5FPczD+AgW66zXd
 anel/xqhp08i4AURVlS1pqmZ8RyZO07ESwAYmoAGu4KuJyQeCzkzkAM15tvNyjJ3pnT4
 HtFeKUW6Nwvk68MAngssf4OKlR5Z8Ei75LpvE+vC6Yg+aPW5KzJOkVc73HilbKX3kBl5
 VgVJUwZtjHoImnSVabXolR+MATlUt9IlQOCSkG71vQpdQ1WLv0I4Qks5NXkYRCteXTl4
 q9S5dcvTxIm7bUEZcBPQ0sh5MywBVkuNdBaiLL5fcxsK7Vd9guOR7DIOLFNoi8TAGiZ8
 myWA==
X-Gm-Message-State: APjAAAXhXRTwt9TiLtRu1R4TVApUchj/s0YRD4Liu9r3aNfEmPXuqhXF
 ojJyRJ2xY4w9JtvwGVDCs9jOaAh1FTf9ZTOzOkTK49DO7fA=
X-Google-Smtp-Source: APXvYqzD3oxetXunQ4SPR2trnaIq1p5IVOjdKzz3i4yIVOadkmn3mR1XERQzYGIHpahqFghJ6sOdFOURK+vbYeba958=
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr16399048qta.220.1567384671444; 
 Sun, 01 Sep 2019 17:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-3-andrew@aj.id.au>
In-Reply-To: <20190830090244.13566-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 00:37:40 +0000
Message-ID: <CACPK8Xf73LHALPzrpn3y=2QkxHV7Fzpi8FbB+BTEx6qW=UTEHA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 2/5] mmc: sdhci-of-aspeed: Drop redundant
 assignment to host->clock
To: Andrew Jeffery <andrew@aj.id.au>
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

On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> host->clock is already managed by sdhci_set_ios().
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I assume this went upstream with a fixes tag?

Cheers,

Joel
