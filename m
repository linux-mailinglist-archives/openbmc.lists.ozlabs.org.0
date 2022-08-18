Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC245982E6
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 14:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7kCV2dNYz3cB1
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 22:07:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.187; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7kCD2sGtz2xGJ
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 22:07:03 +1000 (AEST)
Received: from mail-ed1-f52.google.com ([209.85.208.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mtxxk-1nUkrV36z6-00uJhY; Thu, 18 Aug 2022 14:06:57 +0200
Received: by mail-ed1-f52.google.com with SMTP id x21so1619045edd.3;
        Thu, 18 Aug 2022 05:06:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo35kTlXufdd7+K7MZLi801O8Uw/vXs4EiXDRBTHQDMR8v3O9JQd
	/Sjgl6xRT/vQ5MA+mBLeOH5dH5eEc1YM+Xiy8ew=
X-Google-Smtp-Source: AA6agR7Sz6NPJtIQZSUoxG0aPUAHiTh3EAkYGAZrmlAF1RKyRr2hih2GPF/vQbUl19Y1aDytKituxOjsVxorJ/QDiyA=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr2078468edd.16.1660824416882; Thu, 18
 Aug 2022 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com> <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
In-Reply-To: <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Aug 2022 14:06:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QP+E9PbV/xoPJlKNfF8C2aDQg8Mf+IQ+lm7ycX5++InzTwOUPiF
 UPKevyHY6a266yxDJ+rJbPjEpjeBYpTaX4cPv/xiV3MeUDZdgt0O+1aY6P6RbsGrTBHetw5
 onQAKUk+ebOKqn74oNzqAvPjV9K1sUarFhArxGl5vsuLBKGn+2JwzgZRr5AyLZiJJG1izlF
 4qy6/GYdEI2WSL9LNXJFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NUgLIXT8dPU=:ie2opn8xEVMJOzFOLKeksu
 u3utBGPpXEGOlox60G4tGQA7mRvrJDzTAinfVdSZuNRZYj2nwPlbhuQirQYUAzeHfUwYwa9oK
 CNv+omYznx1AGZ9riMo4unR26Fi1eCWO38M+slQI29QN9kOLG97jEZ5byAWSTdNdF4obGzs/e
 3f+xNBOwDWtUktYkWqUJ7pJn6SXyH/GV3wck+rcUa8xMZGOtzXcfZFhsOlmdL69u6aEgLB4IK
 pGNCiHkSACRLNQrlbc9LcXwzrRkQCwvRXg1h7xn+YGn5qogtd3LYr+q7LBxMxgx/H1TyStZki
 GNN3HnQK1nYcXi+xLffsOGDvs21FzQjv+Jy4mW9nu9s06GcKJJfpArKb2uIMgmwdmdFZCbQ4R
 txZkGjlqh29lHAYKZ9dc8il0x8GFgbnboqUZrFmHRWZb4euZkgy631nCuFByffUFnqG5UoRva
 nZrl5Kfk/3UWCWXNFbv2kwkc0qcklB3dPtly70tpZ0gSuJs8olEUixp9QGaZ0HCxwluvMBjMX
 R8DUOX3zITmwDAmB+JKYPpzpHkDVF+smXSiO/fm/wFrS2UEiIk50jFjmvc9AsZXggoNHZmAm8
 i86t2pVoxuK8ncmLu1H0T5jE43CdNX+ZeMih8dLdS1jUadBoKZSLiRaxXy6ySnaEPZqPcsJ8u
 X/z1ZJmlGzeLvsiNyK9YWbuHf0upQI3JiDxE5pqfFN6f5nm75eNFHfUh/Ka6TvYaMEJiVVApp
 giUUC+894gGhz2s/94MRd/SoO/0dQ/JJEpVFbIFxXVECMNosOUxeHLq1Gvev6OV4pDBhU+39N
 O12E+69ulwvJDLexM6JRd60tdzeLFPOFVqrIyWrOJFpxMegtaL9Pfe4A/ic9Iq7ldOIOZrvfT
 BT98xkb3rPzK0TwOSLvg==
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 9:33 AM Joel Stanley <joel@jms.id.au> wrote:
> > +
> > +/ {
> > +       model = "Ampere Mt.Mitchell BMC";
> > +       compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> > +
> > +       chosen {
> > +               stdout-path = &uart5;
>
> I know you've been told by Arnd and others to remove the default
> command line here, but without it your device tree fails to produce
> any output in my tests:
>
> qemu-system-arm -M ast2600-evb -nographic -dtb
> arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dtb -kernel
> arch/arm/boot/zImage
>
> Without a working test, I can't tell the difference between a broken
> device tree and one that omits the serial device on the command line.
> Can you work with Arnd to come to a solution here?

If you use qemu as the boot loader, I think the expected way to do
this is to use the "-append" command line argument along with "-kernel".

Is there any reason for this machine to be special here?

       Arnd
