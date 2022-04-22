Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A650B839
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 15:20:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlFQ1327Yz3bcB
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 23:20:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 773 seconds by postgrey-1.36 at boromir;
 Fri, 22 Apr 2022 23:19:55 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlFPl2xftz2xn9
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 23:19:54 +1000 (AEST)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Myb8N-1o7PAL00SL-00z0Qt for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022
 15:06:56 +0200
Received: by mail-wr1-f54.google.com with SMTP id k22so10999443wrd.2
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 06:06:55 -0700 (PDT)
X-Gm-Message-State: AOAM532SFR8JnTA6e8yN1kERHDrl39YO8/Apf51dCZ2c1Pc4ZLfH4lwv
 owfWp8aMpWpR9arqqWk5YjvHO5zhMboWGPBp3WQ=
X-Google-Smtp-Source: ABdhPJzr/sEIyUtXuTAvF8Q8/DssMA5FZLT4Nk4euAN9C8OsZ19szl+6WaUMm+cqYUy3lMIOfLqToKLe+raWpc5CMcM=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr122170wrs.12.1650632815075; Fri, 22 Apr
 2022 06:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-11-nick.hawkins@hpe.com>
In-Reply-To: <20220421192132.109954-11-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Apr 2022 15:06:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2axNe=w_5PDdSQ8tDZFand_aEQxdgrNMx0uUKYKVmWtw@mail.gmail.com>
Message-ID: <CAK8P3a2axNe=w_5PDdSQ8tDZFand_aEQxdgrNMx0uUKYKVmWtw@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] arch: arm: boot: dts: Introduce HPE GXP Device
 tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Y/HNPsW2rXykADnHZ7XCRPZKJVRBot8k7fBLuSmvPqXWVQoEoA9
 TSHvGgksgXltSR184Cgj5iQKz9wUZoDNhbsiOOI9AIIOK5/BMOUZLDwgjwuehmxXr3vlg29
 KdS6Bhm6eGtpwc15irVML54l+sWCjnB3Ygq+fTogJto/BFzqSlLntRfaxvrf/TRYUCB4a1x
 bqBYZHwfQkzqa7Eg+KerA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:izdWeb77/Rg=:AQ9B5HxX378UlXBlgvDCzr
 GoBbRhM+dj2BtA/LnXCwSXJJAITKGjfpIk1TGeyHpD1fB4tVRjDtqOvdNazeQclvWGSJVddsE
 ny7iPL2UOB6e71bcwnKR2MNjJG+Oe664vDdO6yLQ62O8T8mrRFmep92aLhkRXjdYM+k4/z76D
 M7haayFn5UJ0rt7S/pmqsDRPmUNkZjNw4oOMSZGhQyF6RVHwMDI7IcyzH/YQwEVB8ktHHv6NE
 LoVeI3wNVRvaOM9z4gDAM8xjdjlAWj1SKiYEousB5LpHr8mrabB8rUcgFxZnzbXeBQFTUftZV
 f3n/Ei7gFN1uXBgzvM9iXtuJ5io0sfPWv3FEzH5/3P4+lRcZKoMF61/RyxGYMiKIR7ogGTdai
 G/V+xEedWPS6qg4ZQe0LUQIeBOVLka3LDkVAJ71BAuFCg4FtW8ezNT17bi97l/W4q+DdKdyPF
 Ezn6ThOdcssq9b7tkqjfkNqIrlnARPyysGEolt61Z0qyb5fee3Ejw1fXA/SOuypKelGwm7SnS
 KSt8RGunuG0By5JL/ib2PPmgDLCedMh7PX/l1o7x2dazgQfsAHxnJZp+WKzg5mWRnMAJF7y8V
 ga15z92eYovwH5iEN396EZUPkFSR6Ssy2eL1LTwqnAgpIFkpKgFkGQVZM1g8bq3+VTK4hyM8L
 wOd/87GfZekJZQN19jyy83bW+wESZdeCpLbIooiUE6u5CMJtprlbK6X4NUIMmjilNUZU=
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Verdun,
 Jean-Marie" <verdun@hpe.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:

> +       axi {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +               dma-ranges;
> +
> +               ahb@c0000000 {
> +                       compatible = "simple-bus";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0x0 0xc0000000 0x30000000>;

I think you should add a "dma-ranges" property in the ahb node as well,
otherwise this would mean that none of the children are DMA capable,
when at the minimum the USB controllers require DMA.

       Arnd
