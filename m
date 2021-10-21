Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE593435B2C
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdX83bsCz2ymt
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 17:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fKQNDYIv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fKQNDYIv; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdWm0bzHz2xYD;
 Thu, 21 Oct 2021 17:54:43 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id 77so6042340qkh.6;
 Wed, 20 Oct 2021 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcvMFf/PBr+vnHvIHJelZJWVuinTtq0U/FPg7ugQ1tQ=;
 b=fKQNDYIvhjIM8psQ+eqv0/5/XiwPvK1WAG172nhm62aA9HlwIglIVu0t5bb+9Vawkn
 HX2XiS6o77RXEOokv4CDIXefrTjngtVofwbsNcI11AkElhsk73M5VYo7d8Wu+34PL6bH
 ESzq9z6/c8fWKj6vQaoXkziRZwPaINvapGAVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcvMFf/PBr+vnHvIHJelZJWVuinTtq0U/FPg7ugQ1tQ=;
 b=HDr+gJuqtg4SMnu7PZysObxW1GHUKjJm2S1Prik+J+StKCImV1fNfQ75buctD5yoGX
 yvhBysPrT1i3ZFhMf69AuqaqOKc+aqaUB5ITwANWfkUz7UuebBsUbhk1oLwny1MLW/8h
 LbWuJsGFOkMwDn1c+kIqO/3qtfNg9dDtAoTqHgX2q4RYgj4FjWwe09qEEA320tXrdwqD
 L6+VLPPiwJj6Q9Xw/uY+AZkIosLuCHjDZVPrE7pd93FXAF3rr8SGOkHFLFNxTWLVXfSP
 U6Ghqg188pxhZmvlllKZoGjvhECzf0tZhaJ5+oGRwiS7kYFO30hJiqb8sWRsrsV1dpr2
 VA1Q==
X-Gm-Message-State: AOAM530VoSDbB1XuIm1tvNR7wYkRxkBWOd1+SOkIfpoOI0LsMEcqmIu+
 AirQDXK1/EYvhvU+0RGOMjrEWmwhgAb86m70hjQ=
X-Google-Smtp-Source: ABdhPJyNQXn6PsIjcPW1B5CBugTu/eSKAk7xtFNqEkuM+K8Qi1CV2TZfRtUCVD3mpjg30nViRLCT9/QQR6/tXwx/n+c=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr3011594qkc.36.1634799278179; 
 Wed, 20 Oct 2021 23:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
 <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
 <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
 <HK0PR06MB3779F430883E60E7E47849BE91BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8Xc2wzx1dthFYC_0vm4mj9e1BbL+Kwkqc_PvPFj4sqjOJg@mail.gmail.com>
In-Reply-To: <CACPK8Xc2wzx1dthFYC_0vm4mj9e1BbL+Kwkqc_PvPFj4sqjOJg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:54:26 +0000
Message-ID: <CACPK8Xfc+vuqbnw8xuXGtGwKRLnb7EwYZYE0Z-+g3fUM28yc6w@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Oct 2021 at 06:48, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 21 Oct 2021 at 06:37, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
> > However, like Rob mentioned, when doing 'make dtbs_check', there is a warning:
> >
> > /builds/robherring/linux-dt-review/arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml:
> > lpc@1e789000: 'ibt@140', 'kcs@114', 'kcs@24', 'kcs@28', 'kcs@2c', 'lhc@a0', 'reg-io-width' do not match any of the regexes:
> > '^lpc-ctrl@[0-9a-f]+$', '^lpc-snoop@[0-9a-f]+$', '^reset-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> > From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> >
> > As part of this series has been applied, maybe we can fix this later?

FWIW, this fixes the warnings for me;

--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
@@ -56,6 +56,9 @@ properties:

   ranges: true

+  reg-io-width:
+    const: 4
+
 patternProperties:
   "^lpc-ctrl@[0-9a-f]+$":
     type: object
@@ -144,6 +147,9 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32-array
         description: The LPC I/O ports to snoop

+      clocks:
+        maxItems: 1
+
     required:
       - compatible
       - interrupts

make ARCH=arm CROSS_COMPILE="arm-linux-gnueabi-" dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

If you are able to test this and send a patch that would be appreciated.

Cheers,

Joel
