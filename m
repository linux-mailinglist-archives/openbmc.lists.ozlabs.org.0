Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B614A2B4B61
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 17:37:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZZVM5QNKzDqNy
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 03:37:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b41; helo=mail-yb1-xb41.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=y/rt4Rgk; dkim-atps=neutral
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZZTK2wRXzDqFK
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 03:36:20 +1100 (AEDT)
Received: by mail-yb1-xb41.google.com with SMTP id 2so16161366ybc.12
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4pRPUOuHI9yylcb4W488dda3bLzVyOZjSHfL9yQIqBY=;
 b=y/rt4RgkoH4FmdqadbD1ZzK5OLoZDOFxCicaWO9vMzj5BE7ZJ/pEjkC8RTQRxNs1Gj
 BlucCYtiuHyNHVImMCf7MJF7EH9XtWm6HMoryiAx7dK6kvLuLTKnC4Q1h7tQQuFhRldD
 G82ftG1fJxM+RFAMXphXpu9QZ82GCmt3shVAPHXahaHJRXojUcO7eiRtNC804+LZWk57
 Na73Kjrwk5mr7vGgrCFC8KApQOxU9W8oW3EI7su1GWwhHq/TXR3fOvfsto/d6K6axNBV
 MsiBCwZmwjNskgJIf1uxsuLc9lDB8Q1cUKS+jLjYz7c+5td1Lg6wYWvpqrNZ45RWtE41
 HcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4pRPUOuHI9yylcb4W488dda3bLzVyOZjSHfL9yQIqBY=;
 b=PffOt6PtgYnuGsnfWqsuCcsPRfpQM1jEkhqKwerHNxtZI5SpO5a6KARllkOHZ9iWhD
 cUB0QNPRzJECYSOrdzYyYdXJFGMQ4DyAR1EJJnLimMbjup+oUi9IK9TGzrv+T2j84m/d
 k6N9FPjCueDRF0SAs6dfQL1seBVZZYQ898biUCMqimPB1HYHbMjkkcIFz0y4RlV8cBZS
 9erYT4HjiRNUDQm6okw/k1Q9IuwBttJqqzsjH1AT+eImitdO9I2CyF3Wiq5pqhXrU+Fo
 IXnnMpwcmgvx9qKNFgNX/6MvlIThvXroHzZDRbCk32ie+EBruqK9HT66IfI/0hWVAVbV
 HF5Q==
X-Gm-Message-State: AOAM530OWLixmqwS/SDevm5oSV54IU0CnQq86Jsq4VRvHTIkg/+30id/
 6tQJITR+nMunZQjENjAyHGvknggqT96kyT0G8tSDGg==
X-Google-Smtp-Source: ABdhPJzyEztK/whnophZYyhxH29BcBrtjtnT6UHhHjn8ll7eZv0MlyBoZHkeyfXVUHhSIgBd0D7i+mUTcHyF5i1jroA=
X-Received: by 2002:a25:340c:: with SMTP id b12mr19268825yba.417.1605544576951; 
 Mon, 16 Nov 2020 08:36:16 -0800 (PST)
MIME-Version: 1.0
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
 <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
 <033645AC-B5C4-4FE9-A1DC-BE2030431613@gmail.com>
In-Reply-To: <033645AC-B5C4-4FE9-A1DC-BE2030431613@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 16 Nov 2020 08:36:06 -0800
Message-ID: <CACWQX815h68gp-BFFMg+5aM-hM8WgyzFYo94cOXo7SXfqDWpuw@mail.gmail.com>
Subject: Re: Add peci-pcie repo to CI
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 8:20 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
>
>
> > On Nov 16, 2020, at 9:32 AM, Wludzik, Jozef <jozef.wludzik@linux.intel.com> wrote:
> >
> > Hi OpenBMC,
> > I am looking for guidance or advice how to enable CI jobs for telemetry repository (https://github.com/openbmc/telemetry <https://github.com/openbmc/telemetry>). Thanks in advance for response.
> >
>
> I added the repo to our CI. I do see this error though:
>
> meson.build:1:0: ERROR: Meson version is 0.54.3 but project requires >=0.55.0

FYI, That package won't build and work until PECI is added back to the
linux tree.  See discussion below for details as to why, and what you
can do to help upstream it.

https://lore.kernel.org/openbmc/CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com/

>
> If you need that level of meson then please submit a gerrit commit to openbmc-build-scripts
> to update what CI uses:
> https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-test-docker.sh#L284
>
> > Thanks,
> > Jozef
> >
>
