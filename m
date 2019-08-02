Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5807ECAE
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 08:32:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460HPz2Ft3zDqpL
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 16:32:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cTOZX6Px"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460HPQ75lZzDqnD;
 Fri,  2 Aug 2019 16:31:37 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id t8so53978984qkt.1;
 Thu, 01 Aug 2019 23:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cU53kLwgvXwi7YmNfuNjyU7Fjnwocbh+C31lAE2HzLg=;
 b=cTOZX6PxGxXFImrywl7zCwC/CJrBlmNZKDI4Dd7SOu2wZvajdyC1nqkKNmdH1Fetdg
 a4Vu4mfrdmF4K7QkrHUYRJ4eTrR51A2uPiNtwIo04a7PJ+o9If/oNwd0JNBA+5Cr99rC
 JTmZnW2X6Xtt1WrTb7RY3VbfHgAKMXbbbRAjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cU53kLwgvXwi7YmNfuNjyU7Fjnwocbh+C31lAE2HzLg=;
 b=HARF2U8Bzu/0XUK5RHv6cNhGhqslkF1MNFoJWyzSVHhrPm1A2isLAfj25hwCL/wZoH
 yNDQyjqT4HRNkuredC7BYg8PmWjocymjFL89rVUP5NpMFb9U9zYXhELi28ggWoF1suhk
 pgXbCzcz9UKpwvl4dhF7eGYr1csiL1IGpCbLQjk+GEuV1cc6Q5AMECLPXs3gScngykRd
 Y0CSXj1ulSLeppPS8edrmQ/62BlmtsOh80jrRckujPDMsFlgBBFFUNNdkWBa/W/bJxJW
 sufoyXW+d54TekYOdFg7SfIh6L1Iqt8adwmjN9ryp0lJqSIz6pOoJcTiTXcol62hGOAM
 h4Rw==
X-Gm-Message-State: APjAAAVfAFL7GyqAAfQrk0PkfZn/VmXLH4BNs7khKFy8fL58MfsbaOcD
 RzhGx/fqZuIUj6EFTKlcimgmh0c8/uKv5Lo5siw=
X-Google-Smtp-Source: APXvYqycpdU0Ot7OSszfb9qsAobDtrU0SbtRJPSehpAqubHj0m1A4ozadPuePm+cp+fofQLhkzNkPzk0PDDfC3RngLc=
X-Received: by 2002:a37:a1d6:: with SMTP id
 k205mr88446327qke.171.1564727493972; 
 Thu, 01 Aug 2019 23:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
 <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
 <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
 <F7BAC53E-925E-4FA4-815D-ACB82DF8D240@fb.com>
In-Reply-To: <F7BAC53E-925E-4FA4-815D-ACB82DF8D240@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 06:31:22 +0000
Message-ID: <CACPK8XehEoakQxvQhC1cU5tvZaVbLOARtZ4xc6dD8sx9WDiPuA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jiri Kosina <trivial@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Anson Huang <anson.huang@nxp.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Patrick Venture <venture@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Gebben <jgebben@sweptlaser.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add pxe1610 as a trivial device



On Tue, 23 Jul 2019 at 17:14, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> =EF=BB=BFOn 7/23/19, 7:53 AM, "Rob Herring" <robh+dt@kernel.org> wrote:
>
>     On Tue, Jul 23, 2019 at 8:50 AM Rob Herring <robh+dt@kernel.org> wrot=
e:
>     >
>     > On Mon, Jul 22, 2019 at 6:46 PM Vijay Khemka <vijaykhemka@fb.com> w=
rote:
>     > >
>     > > The pxe1610 is a voltage regulator from Infineon. It also support=
s
>     > > other VRs pxe1110 and pxm1310 from Infineon.
>
>     What happened to the other compatibles? S/w doesn't need to know the
>     differences?
> As far as driver is concerned, it doesn't need to know differences.

You have these three IDs in the driver:

 pxm1310
 pxm1310
 pxe1610

So all three could be listed in the documentation?

Rob, is this what you wanted Vijay to do?
