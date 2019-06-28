Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBF59F4B
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 17:47:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1NS6Y0fzDqvH
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 01:47:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZ28gVG0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1Mn5KFmzDqsy;
 Sat, 29 Jun 2019 01:46:29 +1000 (AEST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7A60214DA;
 Fri, 28 Jun 2019 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561736787;
 bh=ogM5DFuL0hpNwB08hnvvzh1goOaGyhrCIOR73aDgEQY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NZ28gVG09tUT0i0jwUS2iQsrBsikCeynWpoIZLEW4lJl2MD/4E9HHsekABXJCrsjB
 QXUjawBUTAMvwJWKMqlRIr2pghSl7b+zwS5Vsb02ZIWINFUlAsGJGN8qOYSUqyUcPh
 81BW7HcKlY3bb2S5ugxN7GVkqN+vr3SaAXIiI928=
Received: by mail-qt1-f178.google.com with SMTP id y57so6806771qtk.4;
 Fri, 28 Jun 2019 08:46:26 -0700 (PDT)
X-Gm-Message-State: APjAAAUbMHjO2AFeg8agviCMptB0reNfSFxcqs5HrXiNZe2ParykoTeU
 VaeZP7+cuoU+RSHVJAAyd8tCWjLtm3rR+FSV9w==
X-Google-Smtp-Source: APXvYqyYBF/8wndwALugA2vJeelD3HLa6psVbvGS9oxdpy8J0nCqfRMpO4Ufp2igGgyxsfOpTntYKJCwPnhVM1XNc7s=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr8814969qtc.143.1561736786114; 
 Fri, 28 Jun 2019 08:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au>
 <20190628023838.15426-4-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-4-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jun 2019 09:46:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKF1H6YtFTG-xFhGztdDpMKBihW732Wx6HMUhCw27vNw@mail.gmail.com>
Message-ID: <CAL_JsqJKF1H6YtFTG-xFhGztdDpMKBihW732Wx6HMUhCw27vNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: aspeed: Convert AST2500
 bindings to json-schema
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 8:39 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Convert ASPEED pinctrl bindings to DT schema format using json-schema.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2:
>
> * Enforce function/group names in bindings
> * Move description above properties
> * Simplify specification of compatible
> * Cleanup license specification
>
>  .../pinctrl/aspeed,ast2500-pinctrl.txt        | 119 ----------------
>  .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 134 ++++++++++++++++++
>  2 files changed, 134 insertions(+), 119 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
