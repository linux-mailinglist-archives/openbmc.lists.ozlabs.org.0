Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE55258800
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:22:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcRd3CfczDqFK
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:22:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ccff/u8U; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcQp60gvzDqBr
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:21:22 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id l17so278510edq.12
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8yW8TQdrgwakwj4ER4tGFc3JBkGS6sgkRfAl7tYHQTU=;
 b=Ccff/u8U6+UfXe4FUywwnaxYDLzhgzpRhoTvAEUA9fwimycWIu35j1C3+o9bPTiCjC
 JhTVgY0/+XAFa/x5nLfZFUco3eez6t3qMKZUJDHoZ0vLGtg45y9DCtELD3dAOWJqLCpe
 ggctDCODe01nhbrBxHNsu+5/iyM+Sz7ByNp0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yW8TQdrgwakwj4ER4tGFc3JBkGS6sgkRfAl7tYHQTU=;
 b=JD6s981uCfm3hWSlzGPfsNkXGBmaTYyrl4fhyZpjGQetKP+qreiaanC0QgncTGS7Md
 EZDZDnGangGxHkWUAxxwOUsjUQkgUP3rIBS5jweVUpSriGp/9nBSsqCgOEw+EcK77z8N
 9RbCtk1ALog0GcuJzohEzHoDkEloV04ZnSS9HKSxTdaSnUTHI4P5JjhiDNg3wWj/enQ4
 HqNeFjjJ5Z1QxxTfGOOBa+y0yMX4dn4ljHsHkzxHrdSc8n9Bc+8Ke7BTTMAEd3Fg7J8d
 aYW7HJqhRg0ykqLk3PcGAtc09jBTpfY2igdd0+qAdZKxRnBCz5Oz39nMmzl5uytuotV+
 jjeg==
X-Gm-Message-State: AOAM531EK1ijYJeGzxXzuvyUqn3NXUjowIMkZnpWIYSBtleX1NcWncFF
 uInYXZ8SJDEA5YVjNghUkq3jDQ1VskQvNFl+OCo=
X-Google-Smtp-Source: ABdhPJyG4M/A2f3aM3H2jPgGgnmp9aipxxhopaYmV/aJuoD1RXnoZlGICOyjQ1UDtj0TrrNdkCnFVN2rKyl5/lmQvek=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr431440edv.232.1598941279821;
 Mon, 31 Aug 2020 23:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200827133002.369439-1-andrew@aj.id.au>
In-Reply-To: <20200827133002.369439-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:21:06 +0000
Message-ID: <CACPK8XeE8Hri-Ct0f9BYpsp1zv=_X7p-P14TydE2G-FijpeUqQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 0/3] MAX31785 Fan Controller Work-arounds
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

On Thu, 27 Aug 2020 at 13:30, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series works around reliability problems with the MAX31785 fan controller
> as observed in the field on some POWER systems.
>
> I'm the first to admit the patches are not elegant, so feedback there is
> appreciated.

The way you implemented the loop took me several goes to grok. I
finally got there.


>
> Separately, our previous workarounds have run aground upstream as the hwmon
> maintainer was unable to reproduce our observations on the MAX31785 evaluation
> kit. I've recently received an evaluation kit, so I plan on putting some of
> these issues to the test myself. Ultimately this will help determine whether we
> have issues with our fan card designs or whether the controller itself is at
> fault (I have to admit, given some of the failures, it's hard to see how the
> controller might not be at fault). Basically, this paragraph is my excuse for
> not pushing these patches further upstream for the moment; I will re-evaluate
> once I have the results from testing against the evkit.

I would post this series upstream so Guneter has some context for
future patches that come out of your investigation.

>
> In the mean time, these patches resolve issues we've seen in some system
> deployments. Taken together, I've put the driver through an unbind/bind loop
> of over 20,000 iterations with no "loss" of fans, where prior to the series we
> typically achieved only a few hundred. This feels like a significant
> improvement, so please consider merging despite their ugliness.

Do you want these in dev-5.4, or both 5.4 and 5.8?

>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (3):
>   pmbus: (max31785) Retry enabling fans after writing MFR_FAN_CONFIG
>   pmbus: (max31785) Add a local pmbus_set_page() implementation
>   pmbus: (core) Add a one-shot retry in pmbus_set_page()
>
>  drivers/hwmon/pmbus/max31785.c   | 55 ++++++++++++++++++++++++++------
>  drivers/hwmon/pmbus/pmbus_core.c | 33 ++++++++++++-------
>  2 files changed, 66 insertions(+), 22 deletions(-)
>
> --
> 2.25.1
>
