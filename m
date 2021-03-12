Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D3338209
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:07:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR324685z3cTX
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:07:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DowvkRTU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DowvkRTU; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR2q5SSCz2xZl
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:07:31 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id 94so2569730qtc.0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjLrX568ADM2GMim+pRcaGVRgWQ8vgJxVrYml+bR8SQ=;
 b=DowvkRTUOhbC4pSL209vFnNZJ4XDhvAICOIzFke02yh9mC51zvriZXoJK9CaVlomSk
 BlV8dEL/cTFrkDkF2SMW5Qxk31Hv4pi/Ob8YxDDN0ZEwxkjqXEN5IR4axfhpJbWmorME
 hOgPek/cycGviIzMvBqp/34+XG0wnjFDm3UFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjLrX568ADM2GMim+pRcaGVRgWQ8vgJxVrYml+bR8SQ=;
 b=Uf8niwrRV32z29kk6T6vzDC+5qIuMBb0ksc2nQ5mPMDMEyxqGVY0IsyND7Wyj+3S8p
 IG5ArxY+V3Mv3WZT/ce1Keq+HHCI0Za8SMVpN3yOK/mi7PfC8Dlu4X3ZHp6YmoYAMAo2
 9yBKQuDabITl44pVOOoRXmrB1XLxm7UsOVbfNcOHIsMOxcwNsWHALsIvS2y2IZ/IFEiU
 NrMZWZpuA8u3fIEC+ds9QE61uaQUzVROhaQWRYQWZoVZlVjvxGqpAkK+WL46qdP8W17S
 5vVBwCS/CB8SIFc+Nf+bKWeFKvozyV1pR9kmlK/LmK5Gu/yfwHxf3XrcXlxFXDxuXR9d
 m3cg==
X-Gm-Message-State: AOAM532g0xYThszvbpHiDTQ0kNAQQxFiS0ekNdWOfLIq5g4YTbJKBXrj
 wJw6AQHdTw4CvA0Jmin6EWni9kMqSCnzfxPkIsA=
X-Google-Smtp-Source: ABdhPJyobUem8/wNHnBwikwQn171ot5MPK+SVALTeGn3EvjTblqCnwjc8rC6meyUupo4/4Hx7uxe1YoeUzOJaQ6O+Wc=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr9431674qtd.135.1615507648226; 
 Thu, 11 Mar 2021 16:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-5-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:07:16 +0000
Message-ID: <CACPK8XdqgawxxifUP81h96rkgOXRiEYxL-gTNaerR8khvPPx5A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 04/35] ARM: dts: aspeed: rainier: Set
 MAX31785 config
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

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Matthew Barth <msbarth@linux.ibm.com>
>
> Set the MAX31785 device configuration properties
>
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>

These properties are not supported upstream, and no effort has been
made to submit the required driver changes in some time.

Please discuss with Andrew what direction you want to take with these changes.

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 54 ++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 98c396283c1b..e147ff549517 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -827,24 +827,78 @@ fan0: fan@0 {
>                         compatible = "pmbus-fan";
>                         reg = <0>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan1: fan@1 {
>                         compatible = "pmbus-fan";
>                         reg = <1>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan2: fan@2 {
>                         compatible = "pmbus-fan";
>                         reg = <2>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>
>                 fan3: fan@3 {
>                         compatible = "pmbus-fan";
>                         reg = <3>;
>                         tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan4: fan@4 {
> +                       compatible = "pmbus-fan";
> +                       reg = <4>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan5: fan@5 {
> +                       compatible = "pmbus-fan";
> +                       reg = <5>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
>                 };
>         };
>
> --
> 2.27.0
>
