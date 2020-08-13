Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E42432F5
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 05:51:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRt074RBmzDqb9
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 13:51:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=A4mkOraM; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRszK75PyzDqL4
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 13:50:21 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id f24so4612190ejx.6
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 20:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZG0dvfm01m4/EVtmqX3FMZ6Mc4Y9wT7OCws8byvLRq8=;
 b=A4mkOraMyQ/PKMKkMkFRDpe5tzbC8YlhmcGCMsmSbudXDdq2Pgz7i71LvHSiOwADuk
 XjdHLUDmakNI7ACMuBdN2tpiY5xr98mxePEEfqdzsoe/rLLYEPax2xIrq3ZVltKieDQP
 400IeMpND58u1T5776+RX1oTAdxFdS6DAN62o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZG0dvfm01m4/EVtmqX3FMZ6Mc4Y9wT7OCws8byvLRq8=;
 b=V2wMvD0hXsQhz5v/fWmb8jCw58TejW9ebS88bJBbTlcRDa1c6/Nsw5nK/zqkeIGlzX
 EugDTKSAxlwUhuNLKWAqp4Bl0R3wwWl4UOsGUB1WMij2vAIRY6iQdG8ATityKnTEuXud
 1KAgRaRFJuMGLtNL0utRmdpJe+26uzGscEbrb4N5YI7olnROtF14mt8K+E8XE55OPH20
 kG3ESMqAzQGQ8Xn3Jl2MX/MWg9/e/r7lalejdqohTo5C+UOC4EfX3RdfgYKpkdxh2aqW
 +vr2QSg+8FlFBBBbWnJfcw++joSwROgnBWuRPsuYFzLKPZy4SqIFHqXQY0eWc88rcaBA
 c86w==
X-Gm-Message-State: AOAM533gYfJJE4pmhcwUkYYPsqdPxnHaLPcP94gjOtlc3MsQn9JpVYui
 DLXGGf5qiRnA9Z5lplq0K6PRXbldg/m2HUeKBGc=
X-Google-Smtp-Source: ABdhPJwB8GeEjj0x6UE/PRqpKuwZuEK56wRdGd4KPai0c4YPEU2xHhdqC2vR5kJcquLwMq97ZDwFrhSGKSt8dI/4qm0=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr3071752ejz.108.1597290617243; 
 Wed, 12 Aug 2020 20:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200730220330.16368-1-eajames@linux.ibm.com>
In-Reply-To: <20200730220330.16368-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2020 03:50:04 +0000
Message-ID: <CACPK8XcvBTnW6syjHCVZADHfnFdR0qTj_znG-q0-ruqfLGb6FQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 v2 0/7] spi: Fix FSI-attached controller and
 AT25 drivers
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jul 2020 at 22:03, Eddie James <eajames@linux.ibm.com> wrote:
>
> This series implements a number of fixes for the FSI-attached SPI controller
> driver and the AT25 eeprom driver.
>
> Changes since v1:
>  - Add patch 6 for checking the mux status before transfers
>  - Minor fixes to at25 driver formatting and such.

I've merged this series into dev-5.8. Please consider my review
comments and send the series upstream.

Cheers,

Joel

>
> Brad Bishop (4):
>   spi: fsi: Handle 9 to 15 byte transfers lengths
>   spi: fsi: Fix clock running too fast
>   spi: fsi: Fix use of the bneq+ sequencer instruction
>   eeprom: at25: Split reads into chunks and cap write size
>
> Eddie James (3):
>   dt-bindings: fsi: fsi2spi: Document new restricted property
>   spi: fsi: Implement restricted size for certain controllers
>   spi: fsi: Check mux status before transfers
>
>  .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |  10 ++
>  drivers/misc/eeprom/at25.c                    |  94 +++++++-----
>  drivers/spi/spi-fsi.c                         | 139 ++++++++++++++----
>  3 files changed, 172 insertions(+), 71 deletions(-)
>
> --
> 2.24.0
>
