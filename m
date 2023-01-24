Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC267A19C
	for <lists+openbmc@lfdr.de>; Tue, 24 Jan 2023 19:44:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1bV959Dmz3cBm
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 05:44:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RuxlPFOP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RuxlPFOP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1bSX5W2Rz3c61;
	Wed, 25 Jan 2023 05:42:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A162B81686;
	Tue, 24 Jan 2023 18:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F14C433A7;
	Tue, 24 Jan 2023 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674585767;
	bh=DBSo7OynaPiD3LOZ5Et+hWfS1NPFDENYrFZZTqaJ4Zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RuxlPFOPF6nG3xhTMWTioiwTQkM78eHKGibjNQ4Ld2qVM6eMg+Pqb+1pVDyLlEO88
	 pCYdM+O5ReIsLpkyvLRIL8D6J8ybMRFahWkSUIYHGGmpS8jhZzaK8678isY2qke6J2
	 Cc4WWweSKl5bPOqJYmyqqauDgUrccGrX1l18oSf5R4CHQZk/4niQE1RwVUAD8XWJaR
	 TwCmM300aL9mG3rYbQBV7zQVXNTDypTmog+KVAjaRBT2nOh06Tg7xGq2KZH3P2MUdk
	 IYGcne5XS33CH7MmDjhdgIB4U4YYi0kmVixCDf3HSDRQD921jyFvl2U+H5qXGNjAMO
	 DsXd2ZRZKdUcA==
Received: by mail-vs1-f50.google.com with SMTP id v127so17388983vsb.12;
        Tue, 24 Jan 2023 10:42:47 -0800 (PST)
X-Gm-Message-State: AFqh2kqOrXyfOJfddkEbyy9doG9troRk+e0Z+NJHWJlsyGXNu7Miwk2A
	DcYGolAZidkKM9u57wb300K055iyxNMaIofm5g==
X-Google-Smtp-Source: AMrXdXvM0olT9jSHiUMDJsNqRTneaeFB/92hij1cU2Y+/6V74N/GT/dxRky2xzkFIbykeif2r193/563hWiLeZlWlho=
X-Received: by 2002:a05:6102:5490:b0:3b5:1fe4:f1c2 with SMTP id
 bk16-20020a056102549000b003b51fe4f1c2mr3941513vsb.0.1674585766048; Tue, 24
 Jan 2023 10:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org> <Y9ASq0VZ6G7Efe7s@kroah.com>
In-Reply-To: <Y9ASq0VZ6G7Efe7s@kroah.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Jan 2023 12:42:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJ8tFUCw-MbAsfJ7vKssRxu=p+3jG7dURmB77DOYoiSg@mail.gmail.com>
Message-ID: <CAL_JsqJJ8tFUCw-MbAsfJ7vKssRxu=p+3jG7dURmB77DOYoiSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dt-bindings: usb: Convert some more simple
 OHCI/EHCI bindings
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, openbmc@lists.ozlabs.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Tali Perry <tali.perry1@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Venture <venture@google.com>, linuxppc-dev@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023 at 11:17 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 23, 2023 at 09:05:15PM -0600, Rob Herring wrote:
> > The 'ohci-usb' compatible is another 'generic' compatible for OHCI, but
> > isn't documented with a schema. Let's add it to generic-ohci.yaml
> > schema. While looking at this, I found a few other USB host bindings
> > which are simple enough to use the 'generic' schemas.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Am I supposed to take these in my USB tree?

Yes, please.

> I'm still confused if you all want me to take these types of things or
> not...

Yes. I try to only pick up what has less responsive subsys
maintainers, treewide (binding) cleanups, or otherwise falls thru the
cracks.

Rob
