Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EADE435B1E
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:49:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdPV1gMWz3bN5
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 17:49:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NkQbrePi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NkQbrePi; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdP43ZWpz3c95;
 Thu, 21 Oct 2021 17:48:55 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id v17so5275045qtp.1;
 Wed, 20 Oct 2021 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mNvxWtckYIaJV931ioym14Q5jqNR1mKAgWlKsIbIzrY=;
 b=NkQbrePiO+dBHQ9EvaNmEDupYsux/mvqQMa1GaCYmiycTjQJXAT1gAMc7VxaUVMeIl
 xFKQN3r3sN/FQycbzp2XPHz1vjhUy5BBfP1pZvOrpvgMRtVPz8RTH9cFoG+CHJVB5RyG
 XhxYmTcdIG7/Rt8AEgJrTlJTpgBAfwaL4kFII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNvxWtckYIaJV931ioym14Q5jqNR1mKAgWlKsIbIzrY=;
 b=7IV5pREIAsnGhdEsnGMoLe1mqVwhDWDgfMvyQnXZnjUkFOlg2RAbSxe1o1a0GF9xCw
 mtno4/Qc0idCU2BOXJLTqbw+IzpMMzJnFMkO4NmyLYZ85SGMxTQODOweVv9sAf+QKfx6
 uf+g7KVy4YoCMYV0gW9T9uCvr14GpRlTiIbXVJNuCesiZld36OUP8kjFN7DBSFT8qWbJ
 cSqqkTijDJ+At8M8eHEjrZucFrYuweDBBG2Z6HaP1PNRzRfu6txNhK7W1qklIDlr+Iv+
 eovHHCX7M0UECJrdqQd7dn//5yXfwSdKqKQVU6q2ExSt7aGZuZPlf1uGs7ST9BJc2o+z
 FsCw==
X-Gm-Message-State: AOAM532J0rCRBrtRIW7iMt+5agDtdA+QPnxdVmC9zKGRIeLjdUwVVfp8
 hya073nCTe11NvXCO5XpC8osk2xBS9ZHVBf5fpI=
X-Google-Smtp-Source: ABdhPJzBXdMJj7nI0BKVHrtJsFRFYsv4NGS3cg0KW3U1+iTkclWXcGjaJNsdvv35wBUBca9PfSTZTpnV25AliumF8xI=
X-Received: by 2002:a05:622a:1006:: with SMTP id
 d6mr3975310qte.259.1634798932006; 
 Wed, 20 Oct 2021 23:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
 <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
 <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
 <HK0PR06MB3779F430883E60E7E47849BE91BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779F430883E60E7E47849BE91BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 06:48:40 +0000
Message-ID: <CACPK8Xc2wzx1dthFYC_0vm4mj9e1BbL+Kwkqc_PvPFj4sqjOJg@mail.gmail.com>
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

On Thu, 21 Oct 2021 at 06:37, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Thursday, October 21, 2021 2:29 PM
> >
> > On Fri, 8 Oct 2021 at 04:35, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Mon, 27 Sept 2021 at 02:31, Chia-Wei Wang
> > > <chiawei_wang@aspeedtech.com> wrote:
> > > >
> > > > The 'reg-io-width' properties are not used by LPC drivers nor
> > > > documented as part of bindings. Therefore drop them.
> > >
> > > I assume they are there due to the lpc having a 'syscon' compatible.
> > > THey are documented in the syscon bindings:
> > >
> > > Documentation/devicetree/bindings/mfd/syscon.yaml
> > >
> > > Andrew, do you have any comments?
> >
> > Andrew indicated to me that he agreed with my observation: the properties
> > should be present as they are used by the regmap/syscon.
>
> Thanks. Shall we just drop this one and move on with the rest patches?
> However, like Rob mentioned, when doing 'make dtbs_check', there is a warning:
>
> /builds/robherring/linux-dt-review/arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml:
> lpc@1e789000: 'ibt@140', 'kcs@114', 'kcs@24', 'kcs@28', 'kcs@2c', 'lhc@a0', 'reg-io-width' do not match any of the regexes:
> '^lpc-ctrl@[0-9a-f]+$', '^lpc-snoop@[0-9a-f]+$', '^reset-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
>
> As part of this series has been applied, maybe we can fix this later?

Yes, that's a good idea.

I will send a pull request with your driver to the soc maintainers.

Cheers,

Joel

>
> Regards,
> Chiawei
>
> >
> > >
> > > >
> > > > This is in preparation to move aspeed-lpc.txt to YAML schema.
> > > >
> > > > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > > > ---
> > > >  arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
> > > > arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
> > > > arch/arm/boot/dts/aspeed-g6.dtsi | 1 -
> > > >  3 files changed, 3 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> > > > b/arch/arm/boot/dts/aspeed-g4.dtsi
> > > > index c5aeb3cf3a09..45a25eb4baa4 100644
> > > > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > > > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > > > @@ -345,7 +345,6 @@
> > > >                         lpc: lpc@1e789000 {
> > > >                                 compatible =
> > "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
> > > >                                 reg = <0x1e789000 0x1000>;
> > > > -                               reg-io-width = <4>;
> > > >
> > > >                                 #address-cells = <1>;
> > > >                                 #size-cells = <1>; diff --git
> > > > a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > > b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > > index 73ca1ec6fc24..8e1d00d8445e 100644
> > > > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > > @@ -436,7 +436,6 @@
> > > >                         lpc: lpc@1e789000 {
> > > >                                 compatible =
> > "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
> > > >                                 reg = <0x1e789000 0x1000>;
> > > > -                               reg-io-width = <4>;
> > > >
> > > >                                 #address-cells = <1>;
> > > >                                 #size-cells = <1>; diff --git
> > > > a/arch/arm/boot/dts/aspeed-g6.dtsi
> > > > b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > > index 1b47be1704f8..0d1aae6887cd 100644
> > > > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > > > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > > @@ -490,7 +490,6 @@
> > > >                         lpc: lpc@1e789000 {
> > > >                                 compatible =
> > "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
> > > >                                 reg = <0x1e789000 0x1000>;
> > > > -                               reg-io-width = <4>;
> > > >
> > > >                                 #address-cells = <1>;
> > > >                                 #size-cells = <1>;
> > > > --
> > > > 2.17.1
> > > >
