Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24E500BEB
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 13:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfH0b3n2dz3bWm
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 21:14:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Rtqp2OSy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Rtqp2OSy; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfH086Tr0z2yK7
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 21:13:58 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id r25so3268690qtp.8
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=appHvNugPrfwx2QBAtKpZLLEMOVNg4mQp/1Wt1KQhjk=;
 b=Rtqp2OSyt1pnmXKIye8tFEOHaqMyuLWjjR2eEx0zwu5ESJhM2Fdp7Z3ZylOKitTqAv
 /9Y1WqdSYDx7KDC+8fmPy2gP/nQLmR7T5kkgOc8LhTO+EeQOuHjte+HpjMF/8B3WXOau
 XS59GPVVCiEJCiw1XBs2obqdcbZMsVUJiQZiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=appHvNugPrfwx2QBAtKpZLLEMOVNg4mQp/1Wt1KQhjk=;
 b=pgHFcDBwWXl5SjmD08LBljHld/jH1huTDqG+W4i/4ujSAUzHVksYtwVgxKKRjavVFp
 kyjqBZjztL8I5jF6yuM/XGqTTFNSreowIIjoZySzjCtr6qe5cSA+S7CwxbdWKrP3wGJo
 elVSYmZdlPPpamTJLtrCBz5Ovp+inlkdB5x5J8sh2H1k9ttE0VDGdolhOWl8zaxaG6NK
 DNuAW6cla3IddA/Jm0NTZF5xAhOCCXzDjtnlF/2vzqyvbSg0fF6Ct5GntFEMn2fmCHbW
 naq3jBm5lrX60fbtU72bznEZyi2584PGcL4GbadA1p2AIGjGaFC4RqEmmC367eHm30RF
 RKsA==
X-Gm-Message-State: AOAM531NnyjdQAx/ihGKMtN4rgAFxGTgAjP5261cN1AkyDR6sfZGLW9S
 zHmzyD2cPsPf3Lhof5AJg3pzxkFSnQIWMHFJAUs=
X-Google-Smtp-Source: ABdhPJxDCbEBdEeIGQw1sKJWeaFOZc9U6Vy7bmMLjZJ1sHvW7mAPt4XDhwWYEsn1jZRxP6s+sV9XVourd8XVSm3xNeo=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr1281430qtx.494.1649934835129; Thu, 14
 Apr 2022 04:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220301011135.14066-1-george.hung@quantatw.com>
 <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
 <HK0PR04MB23394082DE0F46CA8111B1A18F029@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <20220324205454.GN5754@packtop>
In-Reply-To: <20220324205454.GN5754@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Apr 2022 11:13:42 +0000
Message-ID: <CACPK8XeGxmVwKznH_9ZDRy7PR6aS787pyxTYo503ry=uJWE+mw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
To: Zev Weiss <zweiss@equinix.com>
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 George Hung <ghung.quanta@gmail.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 24 Mar 2022 at 20:55, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Mon, Feb 28, 2022 at 07:13:44PM PST, George Hung (=E6=B4=AA=E5=BF=A0=
=E6=95=AC) wrote:
> >>On Tue, 1 Mar 2022 at 01:23, George Hung <ghung.quanta@gmail.com>
> >>wrote:
> >>>
> >>> Add build support for Quanta S6Q board equipped with
> >>> AST2600 BMC SoC
> >>
> >>Hi George,
> >>
> >>Which configuration (defconfig) do you run your system with?
> >
> >Hi Joel,
> >
> >We use "evb-ast2600a1-spl_defconfig" for S6Q system.
> >
> >>
> >>How different is this configuration from other platforms present in the=
 tree?
> >
> >Not much difference:
> >
> >1. RGMII for mac2 and enable mdio3 function pins
> >2. spi2 for BIOS flash
> >3. mac delay for mac2/mac3 to prevent network abnormal after A/C
> >4. I2C buses enabled according to S6Q platform

I've merged your patch. Sorry for the delay.

> >
> >>
> >>I ask as I wonder if we can get away with some common configs in u-boot=
,
> >>without requiring every platform add their own dts.
> >
> >Does it mean you'd like to add the additional common dts for AST2600 ?
>
> Any further thoughts from anyone on the best way to add support for
> platforms like this?  I've got a local patch adding a .dts for an
> ast2400 system that differs from ast2400-evb.dts even less than the
> above (just switching the console to a different UART and making a
> similar pinctrl tweak for RGMII on mac1).  I was about to post it, but
> then saw this thread, so I figured I'd hold off if there's likely to be
> a Kconfig-based way of achieving that soon.

I don't think there's a good way to solve this if the machine needs
different options.

One way to reduce the maintenance burden would be to include the evb
dts in your dts, and make the required modifications.

Cheers,

Joel

>
>
> Thanks,
> Zev
