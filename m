Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED1EBC55
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:24:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746x06SNxzF6Nm
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:24:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ML6KAt/+"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746wD5WsXzF6NX
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:23:22 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id r22so1304289qtt.2
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 20:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THbK9+H6Nb7rdbC1I7fKiazd92Zgz1Qungvt66SqJVM=;
 b=ML6KAt/+He/SnjqbG2l4U6Xw8dtOGMjlBko/7UENugtt30LiAs7rhX9h5Gq11pkfzO
 DOoV21mqFl3HWxx+ke3Fmc9MZSvpp3Pog9qG5vKEGOsrJ6JshCdtmMRVAc9UgVbf5F1h
 HzlU1/QbqPJsCDb/H/DBkwxuucXFnu4iZP6mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THbK9+H6Nb7rdbC1I7fKiazd92Zgz1Qungvt66SqJVM=;
 b=NtRTmEBgPLlXGfk1Xj662jsIf5VbWYyw9IwrM/GjwX3yJEh6f3726o2LBoa+prnXSw
 iq9s+WSY8JXc8vtTsNRzu25nerae6OQPZjdyzFY5v+fHUyPlkuKGqtakcPXfUM5UD77L
 kYgNYtjQ4vv18ldglWzD6T560BZZveSwu8kYSdc7XgRQPpjPqk4kh38WGf4t0QWT5G9Z
 yOFwQ2FyY10QJuY96DrRFsSETEDXH2Pe7B+0Ca/4Dj3b/NdObA/iHMC4ysElvUjOvLYx
 94160WKUnXnl/EkIrdOjj8pyOrhaLnIMLf/HtzHtnI/P66rzV8pSkAMhSWPLV7TGmePr
 Q1tQ==
X-Gm-Message-State: APjAAAVTdIF36Z6va/2P1FPh1dht4vPChxlTMKGYc/pqPG8Ud7xtjXLJ
 AlHHi/G5OeNg1lNorvvrP3w5Y3rO8Go02pWEz4Y=
X-Google-Smtp-Source: APXvYqwQszyWKDQ4/mAsoHIeWDYlxJCvWal0mqq7tgJx8E/U4gFizNNg3TcSDPn+n/ttqFRs+nfxUGx3hgxbMtgx2CA=
X-Received: by 2002:ac8:8f3:: with SMTP id y48mr8979612qth.269.1572578598768; 
 Thu, 31 Oct 2019 20:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-5-joel@jms.id.au>
 <93f40f731bedbf24fbcfe38964c0769de5dbf9ea.camel@ozlabs.org>
In-Reply-To: <93f40f731bedbf24fbcfe38964c0769de5dbf9ea.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 1 Nov 2019 03:23:07 +0000
Message-ID: <CACPK8XdAYwc6B74uqN59BfCZEx+0FVGMRvB2oYV2c5nyp5xyZA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 4/8] fsi: move defines to common header
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 1 Nov 2019 at 03:17, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > The FSI master registers are common to the hub and AST2600 master (and
> > the FSP2, if someone was to upstream a driver for that).
> >
> > Add defines to the fsi-master.h header, and introduce headings to
> > delineate the existing low level details.
>
> I'm in two minds about this - it's a specific hardware master
> implementation, while fsi-master.h is for the generic core API.

It's a bit messy already, as a bunch of the defines in there are for
the soft FSI drivers. I could create two new headers, one for the soft
masters, and one for the hardware ones.

> That said, it's probably neater than introducing a new header here, so:
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
>
> Maybe a potential future change: a unified driver that handles this
> common hardware, just with different register interface implementations?

That would be cool. It would also make it less work to do a FSP driver.

Thanks for the review.
