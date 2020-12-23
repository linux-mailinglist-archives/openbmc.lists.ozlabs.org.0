Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658D2E1104
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 02:08:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0w7F3Y19zDqRj
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 12:08:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FBLHaVSF; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0w6T0h9YzDqRj;
 Wed, 23 Dec 2020 12:07:28 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id n142so13749737qkn.2;
 Tue, 22 Dec 2020 17:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/IvHYt4zK7qrtLu/dIFfw1GWqSkerWH38ekPT2Fi8I=;
 b=FBLHaVSF9xVVMTPm3bwINQWKYKnm6a0cqbzSMhkX4GAX1RksMdNDHK2JguD4n/leut
 wlBTQBhTNkQsp0XAj9f0Bt/qO9vdusmj3o0Ux3Upl2JiPoIAl3XqFlMHYjgW8/uZsegf
 QxFHw0SsUQbzVaGUra6Z8zNUIOI/R8fDTVsBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/IvHYt4zK7qrtLu/dIFfw1GWqSkerWH38ekPT2Fi8I=;
 b=Iz4pNJv1VgHdqNFIKNC1o5CTYvgO7VT+f5+JIVxh65KvldiR+WPDB27CRVRvdqPd1V
 SciusKxRgAYsD2BkIy8z5ctxWw2rMhYMZSGHoeO9D4xeQHSRa8UQkWSQwdNZlFFWmFhy
 d3t3HiqPHzLpzslWk7i01pYz0fno4SUcWNhvrMoTgGqesT0dx0u4HYOuE3fwYuk2s2dI
 w/Pbu/LN7a5CLiEAKj9loPna1Sls0W/SthXu20h+2+qap+nvMHrcwB1x5ViIBUMSN+ON
 Kc+Kn7R1X099xM1u+36rBfMGCDToBDmAD+ce7j+nsdaO5Nt4grCYqbSdYxG+gqZmKlUd
 rSmg==
X-Gm-Message-State: AOAM5332mRXOreP2oCsM13v0HNJpWak/gBXehIVXEpt548Ac1p57IlNe
 a67tp1Ze72a+bUZEzt7yaCO5ZizeRU6uXrhqzJ0=
X-Google-Smtp-Source: ABdhPJweuxZG5b2ckpgGQ3CTgEg8EXlZp8qF2RXEjdc10DG4PVJk9A5cd6eJ1QbThAHKMa5XdNdfQsCKrqo435qrsp0=
X-Received: by 2002:a37:6790:: with SMTP id
 b138mr24838589qkc.465.1608685644841; 
 Tue, 22 Dec 2020 17:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
 <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
In-Reply-To: <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Dec 2020 01:07:12 +0000
Message-ID: <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
To: Zev Weiss <zev@bewilderbeest.net>, Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 22 Dec 2020 at 19:14, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
> >On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> Instead of testing and conditionally clearing them one by one, we can
> >> instead just unconditionally clear them all at once.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >
> >I had a poke at the assembly and it looks like GCC is clearing the
> >bits unconditionally anyway, so removing the tests provides no change.
> >
> >Combining them is a good further optimization.
> >
> >Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> >A question unrelated to this patch: Do you know why the driver doesn't
> >clear the status bits in the interrupt handler? I would expect it to
> >write the value of sts back to the register to ack the pending
> >interrupt.
> >
>
> No, I don't, and I was sort of wondering the same thing actually -- I'm
> not deeply familiar with this hardware or driver though, so I was a bit
> hesitant to start messing with things.  (Though maybe doing so would
> address the "stickiness" aspect when it does manifest.)  Perhaps Eddie
> or Jae can shed some light here?

I think you're onto something here - this would be why the status bits
seem to stick until the device is reset.

Until Aspeed can clarify if this is a hardware or software issue, I
suggest we ack the bits and log a message when we see them, instead of
always ignoring them without taking any action.

Can you write a patch that changes the interrupt handler to ack status
bits as it handles each of them?

>
>
> Zev
>
