Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C157AF848
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 04:43:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=m/y+mwvY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwLX85sbrz3c7Q
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 12:43:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=m/y+mwvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwLWW0KkYz2yt0;
	Wed, 27 Sep 2023 12:43:01 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so167510211fa.2;
        Tue, 26 Sep 2023 19:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695782578; x=1696387378; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMinxs6nfn6iZUfMzZa2WeT44I91Ws9Lj88tZvpoGtU=;
        b=m/y+mwvYU1PBJedo1i+/wMYDVALemrQYhf2QBu5qh+V14GNqa3QYpNUsf8ezHg01aw
         UPFwHaQIoReM38OdG1q9P+lWQ26E+MlCineDEnZZBfBl4FR424Tx8DmtxFSTY5cqpH5K
         7HEmQ5X/CcI4r0Ag1hRCVmdFmGydPIa4suy9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695782578; x=1696387378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMinxs6nfn6iZUfMzZa2WeT44I91Ws9Lj88tZvpoGtU=;
        b=hhHi/TeEulhbbNmXQ0EF0QUBZ2gZ8N/lhyysf/tv5n4HxdCBHgOSGapmmo5Z3kZFqJ
         WlewaGS1z3xv0H5Hz0yLaUarKUTha/Ig1M/jDBIsTZQOYm/PsIWqknMJcOjtjtAtt17n
         9cshZe6fVfrseRZPlOYym+6NLrkWuFUEqll1Lyzgzs5j5wFtWYAGz4tCXrIufaYwiQcW
         KtOTVP4DC8JHeyhjZ73Qa7Ov13DFkl0Tt8fnl2xWTZwWz8shN9JBZ15ghHR71OIzI2No
         U7Sfl8RAKjhQ4rzIKt31KOaXMtOyd91yaWE7FSowkN491FAr/jipPOL51//yTI2q/QCJ
         3eBg==
X-Gm-Message-State: AOJu0Yxrqx2nNEI7KCeiIKacx1k3l90ry/B7CGGWwDL72Nn8jCPD3WQC
	M5QYhI4cEfnzp97zI2Vq38kpX8YCu3TYRgsCy8k=
X-Google-Smtp-Source: AGHT+IEoGxjFIivq3ZMXhL6ZTDxnLdVcOLOzUHrNnMa0KFIxb8uxpmFj3uJhgYHyG7vXKUM/QD4YPpVc0zYFqvug4qM=
X-Received: by 2002:a2e:808d:0:b0:2bf:f599:be63 with SMTP id
 i13-20020a2e808d000000b002bff599be63mr681593ljg.41.1695782577775; Tue, 26 Sep
 2023 19:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
 <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com> <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
In-Reply-To: <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:42:46 +0000
Message-ID: <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
To: Jian Zhang <zhangjian.3032@bytedance.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, brendan.higgins@linux.dev, Tommy Huang <tommy_huang@aspeedtech.com>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Sept 2023 at 14:39, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
> >
> > Tommy has submitted a similar fix:
> >
> >  https://lore.kernel.org/linux-i2c/20230906004910.4157305-1-tommy_huang@aspeedtech.com/
> >
> > His change is very heavy handed; it reinitialises the bus including
> > re-parsing the device tree (!).
> >
> > Should we have merged this fix instead? If not, are you able to
> > confirm that his change fixes your issue?
>
> I feel it's for solving the same issue, but I think this patch is
> missing the action
> `bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;`,
>  which means it can't resolve my problem. @Tommy, can you help confirm this?

You're right, it doesn't change the slave_state at all.

Unfortunately, despite no acks from the maintainers, this patch has
now been merged and backported to stable. We should complete the fix,
or revert it asap.
