Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2B258862
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:42:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgcty43MzzDqBv
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:42:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Yddfn6+j; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcpZ4s9xzDqML
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:38:30 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id l21so326470eds.7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmMKe/toEwZX6zue2G9ZNlVOv6x1oLvtLo1BpZU9fJo=;
 b=Yddfn6+jAHe+mfO2ktyQKVYNMQ6RWD5ywcdKHN+WM4QyYuUqd0/PKx6NuKjmKC5+TJ
 ahCTcnUcKs04au4DE+zJlmd2BEhfPhD0n9owBJN3+UZZA9AhI+6JeYHeg8BMpDT/dHLq
 K55Pa88V4nX7h+leORRnF3+kQqPwtmqqO6dko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmMKe/toEwZX6zue2G9ZNlVOv6x1oLvtLo1BpZU9fJo=;
 b=HhQkcHPEZIeZDLWTUv3fxhNGQ+Md7AIXEK0hrW5joeWznRFD0cPa+vvNC0eOpQJZCH
 Xuzt+98r4+BsGnN2c43tdUDpAotzFbhJj6fHUMYn0B1HYoXYL/+UP10unfMZ9iyujBvd
 htlG0+d9axr/bOkeRKEgmsRQ4lHCuo36e4g5nHplkd+XErRDiJ7mkPFj/68Cnx42C1xR
 baXP98r5a0y4Eq4VmSLy1Tu2JS4TFIpsP8LIlQmwhzBUqsv4p8mrdqEljIhdCXKhfMgn
 QspEZdQ6HhP7G5e6psxy2wsUKbIP51JsDJ/5CYy+CTXjojXbsbUqG2vHtD2xzqHW15+k
 5mPw==
X-Gm-Message-State: AOAM533mWwtEcdKCCveW76g3KOPVgA2Va+5xlSll7CAQnX2gls4MdW7T
 Mblocg1nRdHbAl85Sb523YjwJOJo/84PkdXDLgk=
X-Google-Smtp-Source: ABdhPJw/s8JEZI90Led/rrpKDLF8/tJI2alCDQftCApAbxfzEJPUiFMwhuF5J7Ta0moeq7vcMxvJBmlZaX54hELdBjs=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr480444edv.232.1598942305435;
 Mon, 31 Aug 2020 23:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200824221051.47972-1-eajames@linux.ibm.com>
 <20200824221051.47972-3-eajames@linux.ibm.com>
In-Reply-To: <20200824221051.47972-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:38:13 +0000
Message-ID: <CACPK8XcMHyu=+TvEmiEpgC54-JhJZg_7d-DxUi7ptpiBCb9RhQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 2/4] dt-bindings: fsi: Aspeed master: Add
 clock-frequency property
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Aug 2020 at 22:11, Eddie James <eajames@linux.ibm.com> wrote:
>
> Document the clock-frequency property.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> index a513e65ec0c9..f10abef837e6 100644
> --- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
> @@ -17,6 +17,7 @@ Optional properties:
>
>   - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
>   - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
> + - clock-frequency: the frequency of the FSI clock

If we follow the example of i2c, they call the frequency of the i2c
bus the bus-frequency. This stops us from confusing it with the input
clock of the AHB or OPB or whatever peripheral bus is inside the SoC.

>
>
>  Examples:
> --
> 2.26.2
>
