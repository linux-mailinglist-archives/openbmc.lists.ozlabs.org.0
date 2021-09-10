Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5CC406E97
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 17:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5gX34s2kz2yXf
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 01:58:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JNVN1LXq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JNVN1LXq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5gWY0G2lz2xr4;
 Sat, 11 Sep 2021 01:58:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C0DE611F2;
 Fri, 10 Sep 2021 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631289476;
 bh=OotjQF2bxMZEJco0/Gv02FhpVGn61tKpFVjxwA+zp/o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JNVN1LXq6vmR9QlJQZHH8XXvm/5msVKWBI503LcAuo56Q/f45/S4dqvEoPj1f43go
 DNUDt+cIFWvfAmIGWNgx/diSQHgOLLU3UBk1MMb3NgsEM33M433TIafHvcg1y/XDO8
 9eDoFpde62ATmdYekcJnqdYhIDD8dX+E+7nl/cyGY0w87YZdr7NazVptT3r81pMZhY
 fToKiSbuY7Nj7i+yaUEHOjPxqmvI+KnJ0jpiEdL4SPDrqKMwdMO9tUP1rQPynBtAVB
 sHUoHZumXRy/QeY5gHBIR7dxg3NT3rZv3ko5aoIj3XFZ+xSuOSDty8R9FFOruflsSq
 OKtIxRM4txcHg==
Received: by mail-ed1-f48.google.com with SMTP id t6so1705783edi.9;
 Fri, 10 Sep 2021 08:57:56 -0700 (PDT)
X-Gm-Message-State: AOAM532VbqTfwlPSNHXYjuRopxGCc5A+8PUIbxhl+1fwWOjPa2j1vulU
 +usfXBfy5a+Os14vjgS1006u95EpkUEMQSnD0w==
X-Google-Smtp-Source: ABdhPJz9v5lqxyUTA+g8jVvKXFtRQFiX5ZFb0Rqxbqvcrt8lXlceF1p3OtFUhqYUTbWFE+wT3Cq7tu7DMDfjhzRPdok=
X-Received: by 2002:a05:6402:4314:: with SMTP id
 m20mr9889784edc.6.1631289474935; 
 Fri, 10 Sep 2021 08:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210909102907.32037-1-chiawei_wang@aspeedtech.com>
 <20210909102907.32037-2-chiawei_wang@aspeedtech.com>
 <1631190773.304300.200343.nullmailer@robh.at.kernel.org>
 <HK0PR06MB3779990AF1A5BF5300DC9B0E91D69@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779990AF1A5BF5300DC9B0E91D69@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Sep 2021 10:57:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLdT3U2k8Znjo0LHUtC41vPidR4ZDDhcRPpxDC7atgEug@mail.gmail.com>
Message-ID: <CAL_JsqLdT3U2k8Znjo0LHUtC41vPidR4ZDDhcRPpxDC7atgEug@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: aspeed: Add UART routing controller
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 9, 2021 at 8:38 PM ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Hi Rob,
>
> > From: Rob Herring <robh@kernel.org>
> > Sent: Thursday, September 9, 2021 8:33 PM
> >
> > On Thu, 09 Sep 2021 18:29:05 +0800, Chia-Wei Wang wrote:
> > > Add dt-bindings for Aspeed UART routing controller.
> > >
> > > Signed-off-by: Oskar Senft <osk@google.com>
> > > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > > ---
> > >  .../bindings/soc/aspeed/uart-routing.yaml     | 70
> > +++++++++++++++++++
> > >  1 file changed, 70 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m
> > dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/soc/aspeed/uart-routing.example.dt.yaml:
> > 0:0: /example-0/lpc@1e789000: failed to match any schema with compatible:
> > ['aspeed,ast2600-lpc-v2', 'simple-mfd', 'syscon']
>
> The "aspeed,ast2600-lpc-v2" compatible string is described in the .txt file 'aspeed-lpc.txt'.
> Do we have to firstly convert the text file into YAML one to resolve this dependency issue?

Yes. This is a significant change to the LPC block binding.

Rob
