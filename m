Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494B25B21
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 02:23:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457tfB2RX2zDqNT
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 10:23:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IIqbvkNm"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457tdg6TxgzDqLn;
 Wed, 22 May 2019 10:23:19 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id r136so265765oie.7;
 Tue, 21 May 2019 17:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kzpqczefs29aUKJQ46tYt2demPTD2jJ/hbJuDAYK7dM=;
 b=IIqbvkNmAN358FP3iICvLElEx/qPl8CXFzG51rFJHG4wkcKYgtsCasGDHiFj8ChKD2
 ZBkOvaDLCrzOSnoEgd3GZyhIsCDV6vCbc45+lBX53p9X0tfaNw6UbEENSjAqnH0GhrAG
 6JpTPExGWtUS5t+qPQ5edRiSmhI4efURYeOmv9jIJfFRRzThdMFa3xXhPYF1VMoxSnYV
 dctFhhqZ3+bXv0lg4PbVjLla0xdawvz68pfHm78YQn3HyZFXkiEo3qTFcoA3j0A0hpQC
 3Z1zCVquIzSrs2Mq/6LQU+fnx5asaR7yc5P/UUDGfaj93KYrRiakxU0mM0FCiD75HBdN
 dFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kzpqczefs29aUKJQ46tYt2demPTD2jJ/hbJuDAYK7dM=;
 b=XCvV/Umu3K1UJiOXAK3e0CoLPXiLAIaCTdapvlUKgDLMXyq7GPxSEKnXerM4TIKs92
 65GJerIIxj+zq0/Ao0ikJmbqqE9QBeNzQ9VZ6ky/deFZCgkIz0zY05+ShrSbeTGWvcH7
 HiBikURe5V3XtsW909r6uZal5PJUb74m8G0UemBA2G50h74gi4EOjDO99SC+/saeaVbC
 ps1jGcKGvoZLcAulnG5cElVOuZUNbW7XkNj87wheS0vLl1TtEWy5kKSrOAV8FQ6MNpNl
 Jlf/xlylw74VSbxWL5O80wRCVhyH6KViYxUX5aSPvA8SwDV231nf1ORhv4S6urmXpXSI
 W+TA==
X-Gm-Message-State: APjAAAURgc882xtq35OILfdHHDc5d6TkghdaWDWuDHCY8oTaNNyjBA15
 SD+uH/MKs3+NC315a833YWt35kvZBj36osWj+Pk=
X-Google-Smtp-Source: APXvYqyG5C6Im0OtpU8QzNS3fdYR8KoynoitCCajclviRcAHWwGGsh7ztWGb+uXnUyzAFtDzIEnVOXo4H3EiO2X0YKk=
X-Received: by 2002:aca:f20b:: with SMTP id q11mr5436712oih.4.1558484595234;
 Tue, 21 May 2019 17:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <1558383435-38811-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1558383435-38811-1-git-send-email-anoo@linux.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Tue, 21 May 2019 19:23:05 -0500
Message-ID: <CAK_vbW2474g00xqoNU-Qd5DJ31mk5vcQvcr1GKxL8mGZ-Dqxfw@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add pca9539 devices
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 3:17 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add the pca9539 devices to the Swift device tree.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 146 +++++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index 9610637..270c923 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -732,6 +732,79 @@
>                 compatible = "infineon,ir35221";
>                 reg = <0x72>;
>         };
> +
> +       pca2: pca9539@74 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x74>;

This looks like the right bus, address, and chip/compatible type, but
what follows after I am not 100% certain on. I do not know the
specifics of how to indicate these are input GPIO pins.

> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +               };
> +       };
>  };
>
>  &i2c10 {
> @@ -756,6 +829,79 @@
>                 compatible = "infineon,ir35221";
>                 reg = <0x72>;
>         };
> +
> +       pca3: pca9539@74 {
> +               compatible = "nxp,pca9539";
> +               reg = <0x74>;

This looks like the correct bus, address, and type as well, but again,
not sure on how to make sure they are GPIO input pins.

> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +               };
> +       };
>  };
>
>  &i2c11 {
> --
> 1.8.3.1
>
