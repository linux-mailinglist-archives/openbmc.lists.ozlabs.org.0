Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED91986AB
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 23:37:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rm5p5PpKzDqm9
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 08:37:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Gbth+XFw; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rm5608QRzDqbp
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 08:37:13 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id v38so9809474qvf.6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++oZiEqpCsMNl4lhg6dO9iIDFnof3dmoLta5BKn567k=;
 b=Gbth+XFwo2e3130AJY0gCRh9RpKB1ZRLRLV2Y10sho0kq1kersm/tkj8vexehoDbcT
 +xdJa/XOBs3GHmAd9VoyJEs0a2OrK7mynVLg16gWWP/9P1RJgzHTO7x0sgbTgeGU3Y+r
 D2TyS6c/nUQHzMt+2YXwq9vswWSeNS5mA17+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++oZiEqpCsMNl4lhg6dO9iIDFnof3dmoLta5BKn567k=;
 b=FHxh1aNPrst6ywEGQ3NArQfl877A3ndLFmVR6uDN+es6TMcOF3p+dvYiLa3xwT7hw2
 NgA6sb9X1akixi0Nwdw7ZpFqo6K4PCF05MEksYWegu6DN3Kbg6rIB2tg4nx/vndIfbht
 lmxvyL54heqFpVBxlvr0r+IEygxKT6kh0m6YZsG/nUGHSyTxrOOv+OU2/GCiMVF6baGr
 EDIVNHoKOKn00BaLMecnY7X1q3taY51rjdxaCuP/iIc++GiUiBoCJu2dhJ+94K0Z5CfM
 nGjhfHVVFWGtlbmksE57bE51dOSOlRK/4Gx6C7PZ/7ibWoRxrOMUTJ9w1D4hbMtXds7N
 0ghg==
X-Gm-Message-State: ANhLgQ2V4RDtch/Zt+szMUKmhTl3FUtkokk1IrCUUm39MIdFqsKEY2j1
 B4v9elNMhO4h/HxXd+yfKCDeKYhFCEWkZAhf4X8=
X-Google-Smtp-Source: ADFU+vsvW6QJPqRXzQDja6Dc13aLo6U5QdrqWKVxRboiVa7NpzLHP27UHNEeCSCMbf2n7I6I0PwrGQlfKprctjUuCpQ=
X-Received: by 2002:ad4:4388:: with SMTP id s8mr13847202qvr.2.1585604230037;
 Mon, 30 Mar 2020 14:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200330211430.13064-1-eajames@linux.ibm.com>
In-Reply-To: <20200330211430.13064-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Mar 2020 21:36:57 +0000
Message-ID: <CACPK8XcSvozg23MzbAoJP85ACnCvc8Hx6sFC7ye8BNR71=L6KQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] ARM: dts: Aspeed: Tacoma: Add iio-hwmon
 nodes for IIO devices
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 30 Mar 2020 at 21:14, Eddie James <eajames@linux.ibm.com> wrote:
>
> Connect the BMP280 and DPS310 to the hwmon subsystem with iio-hwmon
> nodes.

The BMP280 was on pre-production witherspoons. I imagine most of the
ones we're using have dps310. Can we drop the bmp280 support?

Cheers,

Joel

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index ff49ec76fa7c..374512a83f33 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -89,6 +89,16 @@
>                         linux,code = <7>;
>                 };
>         };
> +
> +       iio-hwmon-dps310 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&dps 0>;
> +       };
> +
> +       iio-hwmon-bmp280 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&bmp 1>;
> +       };
>  };
>
>  &fmc {
> --
> 2.24.0
>
