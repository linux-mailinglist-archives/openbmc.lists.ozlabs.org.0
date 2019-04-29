Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3DDCCD
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 09:28:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sx8R1p3XzDqLM
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 17:28:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BnF/3gVW"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sx7d3ybMzDqKN
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 17:27:25 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id f25so10818661qtc.8
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NZ+Da3JjmgTvGlFhTWoAA78BqA4md+ldNow4QHVPfw=;
 b=BnF/3gVWCcqVVGoFQ6+w17M2FE4++3KW/gKNdxuFZ1wyTyS7qCf06U6Dr8L4L3x+YJ
 s7N5g+bL0Y9ffTnw2cfCyvk2ithm62tbUNgzZkBYt1EmLkGdkMD5F05E16gE5c36jkdU
 tdbkJz7iXehl4KHle7EXtWFnmVkWPkzs1GQi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NZ+Da3JjmgTvGlFhTWoAA78BqA4md+ldNow4QHVPfw=;
 b=Xt3LtmrJAWSMnEdeCnMFNfSQwHLjLmnzNxgZ8+GyjKcjkHylbI9WpGaIxxszkPOH4e
 R5qPeajY4NznNMwj88FT6FXuAlVeZ/FPCfjYuDtmCu9RYAG/7O1gjk0qbzYA+Vfr2P6s
 AjYbw+lOwSMa9+jyRVx1+q9BIdVblHY2jYYddVy/lZsQybzXbN4MArPRnX5MMDAOO+Ew
 kQtXV2DZtEhRWXJXNEOvj/JUaYNPmrt5sd5HbT4Lslj2jbXcAWEwnANxX6oTW1oYPzMd
 ehoPfxmTaiSLGMg9Xt6miK2o3mWcPQp3x5xdMXePN+U0P9Z/6Knk97PrtayIyOawgUqe
 cbeA==
X-Gm-Message-State: APjAAAUORaLQ7KIrPzcpaLapVjOk5Fjf0rK2nxGfkcx42mY9QIuUPREe
 TX+rwb0vvWBmaP4yCSpLcEZM/TTQIH5q2gt4M8Zx2vzGW8Y=
X-Google-Smtp-Source: APXvYqwIColbcGF8EcOOErVSZIAI4ataktjKvkVf45G4ZUa7PUCm3avnYXAATATVC5uRNCBs3niZRsB/Sa7C+HnNHlc=
X-Received: by 2002:a0c:948e:: with SMTP id j14mr17629620qvj.245.1556522843091; 
 Mon, 29 Apr 2019 00:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:27:11 +0000
Message-ID: <CACPK8XdOBgGrR6EKj4rP3VhnwiCrFGAn33n6XTrU1UR3kJSigA@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 0/4] Improve stability of Aspeed video engine
 driver - 2nd phase
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jae,

On Thu, 25 Apr 2019 at 22:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This patch series improves stability of Aspeed video engine driver by fixing
> interrupt handling logic and by reducing noisy log printings in the driver.

NIce work. Did you post these for upstream inclusion?

I suggest doing that now. I can apply these to dev-5.0 once we have an
ack from Eddie.

Cheers,

Joel



>
> Jae Hyun Yoo (4):
>   media: aspeed: remove IRQF_SHARED flag
>   media: aspeed: reduce noisy log printing outs
>   media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
>   media: aspeed: clear interrupt status flags immediately
>
>  drivers/media/platform/aspeed-video.c | 35 ++++++++++++---------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
>
> --
> 2.21.0
>
