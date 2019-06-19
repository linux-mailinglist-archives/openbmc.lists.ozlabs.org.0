Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC964C2EE
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 23:26:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TdL648rpzDqmj
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 07:26:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P5V/sT+i"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TdKW10PDzDqkf
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 07:25:44 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id i189so322553pfg.10
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9mMQK9sKtWkYVn2tTLrqE2pA0vjVcq3E0qdtFwjDm0=;
 b=P5V/sT+i6r81AGxDHVHYVwgTBdH9hf/mud3jTlfe52eCS6W+5ngfmHBS5Z0sHkjZdw
 P/hyp+SElxNTgemRSGOtbTDIUYWWHxkBwrIyTDtPXANTdBjE7SWyRMT0/BHQiAkYqtPc
 CSlOqLbY6l+1vYT1oVdeGzUXQmPLiA74Y4dL0y1Zj8En/UvVab1vDGuLxQtsk4rddVhb
 OcAr5e4o52ldWylZ/rrctkX2uy8M7eUQyGn8gsZDMCHYREcdFW24LXs34IwCBkBGl5ae
 N8iqEYxxI6acRivHQIYSUz5sAU6zqbAlhwwRES74c0CoBDLOtl1msA3bIVAvdRuQwNoZ
 KoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9mMQK9sKtWkYVn2tTLrqE2pA0vjVcq3E0qdtFwjDm0=;
 b=coWuG8ge9dJNThtr94XKqnRVsdDZ2+TlpKVk2PxUASAi4y0D4vDCTc/IViTM6src9H
 U+46dRSLmcLxtovE9Grv4QyVQ3Kqsq95JfVy7CBRZj/mgHiSpd2PiA+iAAMGkYZPDzL4
 9jxdvOhEVgkhHl2xNfoGZRCh8eHige8UKLepgXr0HjiHYhOT293gbtI4uOUvTXF0YB2V
 8JuxlQm/iFpogNJf0JoyXEYo7mxjzTbmi+0QRzLlKvrrJccZE8pgF/ihRPA9rXBZKFT2
 oo1zjgrwbPJ7gaiQeLG9BImx1pHkPamtpssThfjR5KwCK1+g4UBxYwD/iTGPsp6iw7+h
 XbWQ==
X-Gm-Message-State: APjAAAX1UYC9Z6U5+NedY8dG30ZTtOH3QvP+TFge5W2BAQM64X6yWaVl
 rIKfOX2cWJbIRDNBdnw7qLfm4VRvhpVOYWWjCi/2Gg==
X-Google-Smtp-Source: APXvYqztE1b64ddvyGSTrs/viqOnx1s8V4PiJRCg0njvbgRaqHL43xEmtPe+sNLTtcWqmb9QiWUsUoMuerCidUN8TiA=
X-Received: by 2002:a63:c94f:: with SMTP id y15mr9670654pgg.159.1560979540781; 
 Wed, 19 Jun 2019 14:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190619205009.4176588-1-taoren@fb.com>
In-Reply-To: <20190619205009.4176588-1-taoren@fb.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 19 Jun 2019 14:25:29 -0700
Message-ID: <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
To: Tao Ren <taoren@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 19, 2019 at 2:00 PM Tao Ren <taoren@fb.com> wrote:
>
> Some intermittent I2C transaction failures are observed on Facebook CMM and
> Minipack (ast2500) BMC platforms, because slave devices (such as CPLD, BIC
> and etc.) NACK the address byte sometimes. The issue can be resolved by
> increasing base clock divisor which affects ASPEED I2C Controller's base
> clock and other AC timing parameters.
>
> This patch allows to customize ASPEED I2C Controller's base clock divisor
> in device tree.

First off, are you sure you actually need this?

You should be able to achieve an effectively equivalent result by just
lowering the `bus-frequency` property specified in the DT. The
`bus-frequency` property ultimately determines all the register
values, and you should be able to set it to whatever you want by
refering to the Aspeed documentation.

Nevertheless, the code that determines the correct dividers from the
frequency is based on the tables in the Aspeed documentation. I don't
think the equation makes sense when the base_clk_divisor is fixed; I
mean it will probably just set the other divisor to max or min
depending on the values chosen. I think if someone really wants to
program this parameter manually, they probably want to set the other
parameters manually too.

[snip]
