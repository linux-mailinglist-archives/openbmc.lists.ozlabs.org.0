Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3153596F5
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGr6y5qzHz3bqS
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u2BbVFCG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u2BbVFCG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGr6j67vTz30Dl;
 Fri,  9 Apr 2021 17:56:13 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B481C611B0;
 Fri,  9 Apr 2021 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617954970;
 bh=g5uN6Pl+84n19Wf10nEdkopoOYV20QI0EjR4ZGbc7jw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u2BbVFCGWc0iS4ph2dc5d1nDl187zG5P9pXL1Cm6UOvWXL3L0dBEsKrg9/h1POc19
 h1WrlG2N5RR70AfSyZdWdMlRfjSGxKElfDb2SekhNnbfeKF4rnj6bxkOif0Ar50QQN
 L8FOwMyG1mXV7kTv/r2whQZMJUOhdTOYVDxPMGm6ArRqHL3EPwgc0LK+44RK7rTaEo
 QtrxjBMbCvXDQloY7nyKYEsuVDzznNlhD0KJKBz6g7AEXPQ+O+gkf4K5ostmrJzQXT
 Ao9W8Dtp2lp0FyPZk/qIJzxaOuEHjUxNrPcTk6TwRCsXKnPbtf7wW4aI220hiiVUBS
 iOtE6CzaWBe6Q==
Received: by mail-ot1-f54.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so4878484otb.7; 
 Fri, 09 Apr 2021 00:56:10 -0700 (PDT)
X-Gm-Message-State: AOAM533muVICQ6W/qTv3pju4iCSx/xvUccfquM6ImreQ2AonW3jxDcpn
 VGf/P/MhGlSlunO38L52mi5x2UeHN6DsHncI3lc=
X-Google-Smtp-Source: ABdhPJyqkLL/YHm17TDMQcZw+JH1/6IOKmDcxX4k29Ovd57mDpReYbYM6BJUI+r5hcy0H4zXnuBQh0qM5jt0HH/0Mc4=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr11539093otq.251.1617954970003; 
 Fri, 09 Apr 2021 00:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-16-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-16-andrew@aj.id.au>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 9 Apr 2021 09:55:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
Message-ID: <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] ipmi: kcs_bmc: Add a "raw" character device
 interface
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, chiawei_wang@aspeedtech.com,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Corey Minyard <minyard@acm.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> However, KCS devices are useful beyond IPMI (or keyboards), as they
> provide a means to generate IRQs and exchange arbitrary data between a
> BMC and its host system.

I only noticed the series after Joel asked about the DT changes on the arm
side. One question though:

How does this related to the drivers/input/serio/ framework that also talks
to the keyboard controller for things that are not keyboards? Are these
separate communication channels on adjacent I/O ports, or does there
need to be some arbitration?

       Arnd
