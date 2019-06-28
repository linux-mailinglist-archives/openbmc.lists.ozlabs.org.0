Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 355C159F70
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 17:48:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1QH3bfJzDqtp
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 01:48:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qiBPRUh2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1NZ41sszDqtY;
 Sat, 29 Jun 2019 01:47:10 +1000 (AEST)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FAAE214AF;
 Fri, 28 Jun 2019 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561736828;
 bh=IvQrseI2FT7GlH+2IVTYalj+9dZqPkQ+umge7Io8BYs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qiBPRUh2Rl/4JkSewXW0u5fTbCvxhNAiAvyoKPvWUekoyPQH5NWCaeHqoHo8wrx/z
 +F+dnsHWd+I11+gyHYSrt7TBj0HOf3gNZZL6EP0gSEQayXinWtxuzoeLJlLC3Nqneu
 JmWm7oUz6pJSL2mRKcrxq7zpVd4D504DPYgODGcs=
Received: by mail-qt1-f174.google.com with SMTP id d17so6778695qtj.8;
 Fri, 28 Jun 2019 08:47:08 -0700 (PDT)
X-Gm-Message-State: APjAAAXCYZ3Ye0xbBuya1zflRDCZ+cmzQB9+kChODr7bw3JX047+p2K0
 BjIhEI+VepdGaIFvNiuwXIVKxokdwyDT1u0/Jg==
X-Google-Smtp-Source: APXvYqzI7nz1Eud6yl97g4IKf/vW5/y3ZQY7AiYHNAFU5cp6XG9kpOIjyOkxG/G+hIZCgCZpbktv/2gOhf4y7pIKPB0=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr8736951qtf.110.1561736827529; 
 Fri, 28 Jun 2019 08:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au>
 <20190628023838.15426-3-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-3-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jun 2019 09:46:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKjDyuDjeBBqhF=2ceG2h0WiJC6QKtHJ-=yL3XqxXF0Hw@mail.gmail.com>
Message-ID: <CAL_JsqKjDyuDjeBBqhF=2ceG2h0WiJC6QKtHJ-=yL3XqxXF0Hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: pinctrl: aspeed: Convert AST2400
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
> Convert ASPEED pinctrl bindings to DT schema format using json-schema
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
>  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 ------------------
>  .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
