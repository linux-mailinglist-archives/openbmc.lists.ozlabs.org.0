Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3259725A5
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:59:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thRR154nzDq6N
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:58:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsT/GmA7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tM0Q67HhzDqQ9;
 Wed, 24 Jul 2019 00:52:54 +1000 (AEST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B356227C0;
 Tue, 23 Jul 2019 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563893572;
 bh=mxAyG2JWokyVjQwpLu0BobuO2nOu71LIAdILH2OdHK0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SsT/GmA7WLxu60XFYod8t1s+fvkmxf73mvaoLNNxbiTOvhxPnPw/1IkqXSXvvxKQl
 ZCROOwBxWxMqCKY2Q4lqljcMP0vZMuhMJX9L2lBqGVf6amVNzvsTt0LN1G4fFEGCFi
 GUR4fiX5KQgNIpL+X3wCr+/3XOzhM7SxTu7asOV8=
Received: by mail-qk1-f181.google.com with SMTP id r4so31258250qkm.13;
 Tue, 23 Jul 2019 07:52:52 -0700 (PDT)
X-Gm-Message-State: APjAAAVZw6ZjMu1IqYk5C1b5MkbGiIq+i/LvQEubij8k37gaG2tEeAeO
 F6K0efbTh3oMe6BmOURH89xYMWBJ1WrXQLYOqQ==
X-Google-Smtp-Source: APXvYqwZiOcoe1s7qhiFAJYivK+N5IPJMZGWxi+ThTt1Kn4ty2xNdEW6gS2kpNUOpRp3jkH0X+VUlMMwP04mvYWysaQ=
X-Received: by 2002:a37:6944:: with SMTP id e65mr46744250qkc.119.1563893571463; 
 Tue, 23 Jul 2019 07:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
 <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 23 Jul 2019 08:52:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
Message-ID: <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Anson Huang <anson.huang@nxp.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Patrick Venture <venture@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Gebben <jgebben@sweptlaser.com>, linux-aspeed@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2019 at 8:50 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 6:46 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> >
> > The pxe1610 is a voltage regulator from Infineon. It also supports
> > other VRs pxe1110 and pxm1310 from Infineon.

What happened to the other compatibles? S/w doesn't need to know the
differences?

> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 2e742d399e87..1be648828a31 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -99,6 +99,8 @@ properties:
> >              # Infineon IR38064 Voltage Regulator
> >            - infineon,ir38064
> >              # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
> > +          - infineon,pxe1610
> > +            # Infineon PXE1610, PXE1110 and PXM1310 Voltage Regulators
>
> The comment goes above the entry.
>
> >            - infineon,slb9635tt
> >              # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
> >            - infineon,slb9645tt
> > --
> > 2.17.1
> >
