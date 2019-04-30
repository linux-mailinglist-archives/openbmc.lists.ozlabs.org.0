Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58130EF57
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 06:13:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tSnv4dD1zDqQR
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 14:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ecYAWbLf"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tSn31Nm2zDqPm
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 14:13:10 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id n81so7394210qke.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYZm6BG2bAHVLlIIf7eZegoG2mXPfBgQUjJSWCfmXpQ=;
 b=ecYAWbLf3xZPYRt+LRAz2b8nnoULonQwlztghHzui6rFyYYLf64aLbQo7IhHQaKe8J
 ayfNj3AOaks5WH8uWtVqDIGwcUWK54tDkQM5z4JzoRI5cLoRlsAYz/5meXUqAiBAgelH
 MhxbkYK98lHTuKTRMH2Ry5slIwfbmeym9ZoXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYZm6BG2bAHVLlIIf7eZegoG2mXPfBgQUjJSWCfmXpQ=;
 b=C3dZzdh+ZU5dEpPxz2azWbolGwNFy7i/a6qcJFdt7WInZkIGpEN668TZAJU4YHfP7e
 tqztpnSqf0t98PGQ7K1yBuCdsCx8cbb9xmqrqy0vGTQQg3Dwe6fBROmCCtBAesgq0lhz
 OSc55qqJj/I+dT4g0J93+DQ96dLicafajYSnH9Sio1z7ii0+iFgjz7JO27izaDeMIzT6
 BgzhIXSZIj/btdIDAfHoBjPLhSGUCSZpErw5DTUpxctxArb++eldba2/anb50a2fhXOR
 GS93gC+KNzNdjvkw3w9lJT2H0erIbCZtk5qEKQHZ5YwgJHrVfb/8offNfbVYq6hYEaMl
 0jpg==
X-Gm-Message-State: APjAAAV+JelYNLdq5qKCt6DTKNDjTSJDq3cv5tSoGfzEu4k5OGSAYrIH
 JmJAGgKJrC5VK+D//nmFu2MMGaNwAxi8Aoz1636S1jqC5AU=
X-Google-Smtp-Source: APXvYqzE3Z5U+O8tL9LXRGEuonm5WPktJP9mqraBIz7mLCSdS9pNWVW1mO/e4dnQx7lR5MP7faR5cR26RNx67SvjZMw=
X-Received: by 2002:a37:7f84:: with SMTP id
 a126mr48517770qkd.231.1556597584365; 
 Mon, 29 Apr 2019 21:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XdOBgGrR6EKj4rP3VhnwiCrFGAn33n6XTrU1UR3kJSigA@mail.gmail.com>
 <66b34da6-5d17-aa0b-0bcf-21ce9049fca4@linux.intel.com>
In-Reply-To: <66b34da6-5d17-aa0b-0bcf-21ce9049fca4@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Apr 2019 04:12:53 +0000
Message-ID: <CACPK8XeL6vDFa94RmbhpM8riLcsvzyovi3HCTOf6yLe0LzGSLw@mail.gmail.com>
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

On Mon, 29 Apr 2019 at 16:27, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 4/29/2019 12:27 AM, Joel Stanley wrote:
> > Hi Jae,
> >
> > On Thu, 25 Apr 2019 at 22:20, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> This patch series improves stability of Aspeed video engine driver by fixing
> >> interrupt handling logic and by reducing noisy log printings in the driver.
> >
> > NIce work. Did you post these for upstream inclusion?
> >
> > I suggest doing that now. I can apply these to dev-5.0 once we have an
> > ack from Eddie.
>
> Hi Joel,
>
> Thanks for your review. I'll upstream it after Eddie's patch
> upstreaming. Will submit the 1st phase and this 2nd phase series
> altogether then.

I recommend you post them to the list now, and note in your cover
letter that they are based on Eddie's fixes.

Cheers,

Joel
