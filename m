Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB297A68E0
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 18:29:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WImvJ0PN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqnDk2BKZz3c5j
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 02:29:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WImvJ0PN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=1vuh=fd=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqnD34FZLz3bTC
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 02:28:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 96732CE1398;
	Tue, 19 Sep 2023 16:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBAFC433C8;
	Tue, 19 Sep 2023 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695140926;
	bh=Gs2VeKYvanEmhRbfroqQm1XNSDENhOjKx9E77X+qzDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WImvJ0PNoZteN42w7al/gnnH+lwAzvx7thtk8cjvknG2YkrhW/o+QsmNUwQER6jrS
	 8DlDdEMHAA7qTT3YAMwRH6UU96mUJBfl5CDSI+k8dgNNiBqAcqx7aOOSHLiq1iXCfq
	 /pWeAq4E2YoLuxbB5c7bVdaIWj/hYqy7jRwC5/1rtgdIxnJFcRi/azKy5vfkbGRAEO
	 vXlV24Sf4DcR7UoJH0/TysoI69PK9k+u7pdgH1OYtI4juxuEBjTlRU7JzfRnfNpsYC
	 MnM6VYFzy0BGBSZ36Tz/EI54ujxh/LQUitvrn3MI/rzsvsxkyX1vva9i9uaf0OhA/f
	 R0wBWR4b07glA==
Received: (nullmailer pid 4059576 invoked by uid 1000);
	Tue, 19 Sep 2023 16:28:37 -0000
Date: Tue, 19 Sep 2023 11:28:37 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton
 NPCM supprt
Message-ID: <20230919162837.GA4051010-robh@kernel.org>
References: <20230918165958.2659-1-tmaimon77@gmail.com>
 <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
 <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
 <e0d42d13-b307-9915-97c8-948261b39ce1@linaro.org>
 <CAP6Zq1g0=-h0PFg2a8bqao+XjdNHoxGMdYSRRPAnfY_6WdemAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1g0=-h0PFg2a8bqao+XjdNHoxGMdYSRRPAnfY_6WdemAw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 19, 2023 at 04:31:56PM +0300, Tomer Maimon wrote:
> On Tue, 19 Sept 2023 at 15:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 19/09/2023 07:14, Tomer Maimon wrote:
> > >>>            - nvidia,tegra20-ehci
> > >>>            - nvidia,tegra20-udc
> > >>>            - nvidia,tegra30-ehci
> > >>> @@ -325,6 +326,20 @@ properties:
> > >>>      type: boolean
> > >>>      deprecated: true
> > >>>
> > >>> +  nuvoton,sysgcr:
> > >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > >>> +    items:
> > >>> +      - items:
> > >>> +          - description: phandle to syscon that configures usb phy mux.
> > >>> +          - description: offset of usb phy mux selection.
> > >>> +          - description: mask usb phy mux selection.
> > >>> +          - description: value usb phy mux selection.
> > >>> +    description:
> > >>> +      A phandle to syscon with three arguments that configure usb phy mux.
> > >>> +      The argument one is the offset of usb phy mux selection, the argument two
> > >>> +      is the mask usb phy mux selection, the argument three is the mask usb phy
> > >>> +      mux selection.
> > >>
> > >> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> > >> devices.
> > > Sorry the role of nuvoton,sysgcr property is to handle a mux between
> > > the different devices and not the handle the phy itself, handle the
> > > mux done in the GCR.
> > > Should we move the nuvoton,sysgcr description to another place in the
> > > ci-hdrc-usb2.yaml
> > > or
> > > Should we use a different driver to handle the mux and call it from
> > > the ci-hdrc-npcm driver, If yes which driver should we use?
> >
> > What is an "usb phy mux"?
> We have USB phy that could be connected to USB host (different driver)
> or it can be connected to the UDC driver(ChipIdea)

Isn't that just role switching? There is a driver framework for that in 
drivers/usb/roles/. Though it doesn't seem widely used yet.

Rob
