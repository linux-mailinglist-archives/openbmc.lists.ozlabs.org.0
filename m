Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0CA7A85A
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 14:26:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ybPm6D9QzDqV5
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 22:26:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ybNc4rLkzDqNX
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 22:25:02 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id d23so62795691qto.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 05:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vg24wzBIc+D+Hmv+R1GPqhgrmLOPVkmrpAuvjDtlIDU=;
 b=s8n87gcgaqDo4FMIFebKYxShnMVBUBHEVHBXD4XCNHsv7IYKAVQhRTsa2I4n1894mR
 M/VpkQnpdJhGXDLZW1ecIHcCUG4bTIhpLf1bto8rx8RdGYhGN9Q+QoVqfyf7Vlq1fssw
 8Ng9p21HtbB6XxPNp0xP/3zqvE8Fzxc67cy5P70un87wN90JiQYeSk+RzDNBhr0AMNXE
 GfN4BiQvdDjwdQYKjzrJgSAXtWHh0TeH5Ucq13Y5AthY2Htvtzh8nRtUv/jieRNzkf4A
 Y1lupAy7AubRQVYJlQXPhXKu1W2YyLhYc+R0viwDyF2H256C+I71dguc956C2T2Xi9R5
 q12A==
X-Gm-Message-State: APjAAAWw8MZRfk+VfSLHniTVrM2wng3PZZ4Bg5ctC65V7cyCLzgOynn3
 xzI2T9RX6LxqjC0LeX/rDhOJ1+M411jNiS/xvFU=
X-Google-Smtp-Source: APXvYqzfoZoBuiAjwAqXgbVNXXKwoEiH6dY5V72EFZ3ka6brjjn9cMP5XNNFWJ1mx1f3K5mwNQb5H6XBvPEoDQjUWN0=
X-Received: by 2002:a0c:ba2c:: with SMTP id w44mr81948752qvf.62.1564489499864; 
 Tue, 30 Jul 2019 05:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3jjDh6aEVf0bBFYc=8GtB38kL6sWVZGJiUe427A7m2ng@mail.gmail.com>
In-Reply-To: <CAK8P3a3jjDh6aEVf0bBFYc=8GtB38kL6sWVZGJiUe427A7m2ng@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 14:24:43 +0200
Message-ID: <CAK8P3a1i3fV_qzx_q6nucqh4aNLi0a+iwvcis9BpYfMOkoew8Q@mail.gmail.com>
Subject: Re: RFC: remove Nuvoton w90x900/nuc900 platform?
To: Wan ZongShun <mcuos.com@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 2:09 PM Mail Delivery Subsystem
<mailer-daemon@googlemail.com> wrote:
> On Tue, Jul 30, 2019 at 2:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > As the mach-netx and mach-8695 platforms are being removed now,
> > I wonder whether we should do the same with w90x00: Here is what
> > I found after looking at the git history and external material for it.
> >
> >     - The supported chips (nuc910/950/960) are no longer marketed
> >       by the manufacturer
> >
> >     - Newer chips from the same family (nuc97x, nuc980, n329x)
> >       that are still marketed have Linux BSPs but those were never
> >       submitted for upstream inclusion.
> >
> >     - Wan ZongShun is listed as maintainer, but the last patch he wrote
> >       was in 2011.
> >
> >     - All patches to w90x900 platform specific files afterwards
> >       are cleanups that were apparently done without access to
> >       test hardware.
> >
> >     - The http://www.mcuos.com/ website listed in the MAINTAINERS
> >        file is no longer reachable.
>
> Recipient inbox full
>
> Your message couldn't be delivered to mcuos.com@gmail.com. Their inbox is full, or it's getting too much mail right now.

Yes, that too.

        Arnd
