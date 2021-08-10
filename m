Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8003E5110
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 04:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkH5W2b8Cz30JP
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 12:31:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=apL6yAb8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=apL6yAb8; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkH534Dm5z2yL7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 12:31:17 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id t68so20807838qkf.8
 for <openbmc@lists.ozlabs.org>; Mon, 09 Aug 2021 19:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gvwCL2cifrbdnILTHWIB/SLa0Z5B7OhQzxqyw4LsFjE=;
 b=apL6yAb8faARFBXXwarAR0nS9MPiVlaV2diuDtNTNDxt/1j87UQx07iYI04RPT3siR
 mOsRn4nzCoadhvY8PXZ2OOSGpTpE9uVaXtokoY+yME6m06HoZGUPRWv2fpfnRlOyP+I0
 pAfvwZLLhZn3V5JYzdLQEPVcTXIHUcsaT8TPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvwCL2cifrbdnILTHWIB/SLa0Z5B7OhQzxqyw4LsFjE=;
 b=SqWeQ78zGl0f2cyfuqU7PZN0U9uXHCqHGWnLFzRnJkznnVnENSox0VjA5iFk7Xpq+M
 o08VhoR+u7evFj2BTv6IadUPCXM1TmxmYj9qpvZuYcrrK6eH7237qR8HQpeMQ7pCXGSP
 +L+WJ8xLd+wXX50b5xA+mUGv4tfCoYXJAne3KRyiUqJ0in4MFZl9EI3HCmruWGB+pbTi
 LGiP7MGIKNnfXLM+WCcD1o5kfopySPa5LWp47FS2WqRmgZTPqQsRGuK/+pSwpjnt8Vjh
 hGgIZT9LlxLDWykaYAMrsIU6bN3TmFutQkjBp4h5AgFzUE37S5YgWTtBAwSNe0sJOi0i
 NlDg==
X-Gm-Message-State: AOAM531dYqOu6XSzgjU8evaprlHhAV+ACY1AXjMPBNIjRXd0ozlI2c0m
 TCJIwKf/8mfI9yv1xRivhn7CXlZU/0/S4AxfqNk=
X-Google-Smtp-Source: ABdhPJzXo5TVSez/WgIyRFclOjbMEbCXILH3IOTS9PGEMv9RXqcmb6hKEmxt+hy8JLUxRfXG6Zo52zhI3O3ZFq9X1t0=
X-Received: by 2002:a05:620a:12a1:: with SMTP id
 x1mr13627070qki.487.1628562672284; 
 Mon, 09 Aug 2021 19:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAM=TmwU57zhc_k7KAKc56wTf=mihD4uWxBd8qPS+-22ZKER94w@mail.gmail.com>
In-Reply-To: <CAM=TmwU57zhc_k7KAKc56wTf=mihD4uWxBd8qPS+-22ZKER94w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Aug 2021 02:31:00 +0000
Message-ID: <CACPK8XdcNq7_N9FKB9zOrknwkR2JQN2btL=qa2JBR14aMe2tMw@mail.gmail.com>
Subject: Re: ast2600-evb qemu and usb-net
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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

On Mon, 9 Aug 2021 at 04:56, Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:
>
> Hi All,
>
> I am trying to launch the ast2600-evb machine on QEMU by passing a a
> usb-net device:
> qemu-system-arm -machine ast2600-evb  -drive file=<bmc
> image>,if=mtd,bus=0,unit=0,snapshot=on -nographic  -nic
> user,hostname=qemu -device usb-net,netdev=net0 -netdev
> socket,id=net0,listen=:1234
>
> I downloaded the QEMU binary from
> https://github.com/openbmc/docs/blob/master/development/dev-environment.md#download-and-start-qemu-session.

This is unrelated to your question, but that qemu is built from an
outdated branch. I would recommend using mainline qemu instead.

We also have a qemu tree that Cedric maintains at
https://github.com/legoater/qemu. The aspeed-6.1 (and soon aspeed-6.2)
have changes that we have not yet merged to mainline.

> I get the following error when I run the command above:
> qemu-system-arm: -device usb-net,netdev=net0: Warning: speed mismatch
> trying to attach usb device "QEMU USB Network Interface" (full speed)
> to bus "usb-bus.1", port "1" (high speed)

As the error message says, you're attempting to attach a full speed
(USB 1.1) device to a high speed (USB 2.0) bus.

This is where I get a bit confused by USB. I thought that the
controller supported both full and high speed (that's what the data
sheet says).

The chip also has a USB 1.1 controller (UCHI) hasn't been enabled for
the ast2600. There's also no qemu model hooked up.

> The intent is to have two such QEMU instances talking over emulated
> usb-net (the other instance would do a connect on the netdev socket).

If you're hooking up two instances over network, is there any reason
you can't use the existing network devices? It would allow you to test
your userspace without requiring extra modelling.

>
> I'm guessing this is the lack of usb support/initialization in
> hw/arm/aspeed* in the QEMU tree. Has anyone else tried this with
> ast2600-evb?
>
> Thanks,
> Deepak
