Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 394924195C
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 02:14:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NnSG08FJzDqx1
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 10:14:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b4K3rjDq"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NnRh6X7dzDqlB
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 10:14:24 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id a15so16797156qtn.7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 17:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jm1DhyCPqs0bH9SkgP3aJDm3RNLXmV7YxghKtHqCIfU=;
 b=b4K3rjDqIg/YQQDe5XA61JnbE+eOyPOhBt8LzmIVSeIiy+H6y+3SK+Z/SxrD93K0tu
 POWa0k75hfLWK6hwaTts7GUDbdjHxFfPuo7LvRB+I5EgYbWlgmRAU+PDUN7CPNswg/Gq
 tQ33hqK7HfAhuBqG79vcv0UBPCNueYXByALno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jm1DhyCPqs0bH9SkgP3aJDm3RNLXmV7YxghKtHqCIfU=;
 b=jluUJHg475It+EsuFgzwOZird2A+0HndxLruio7H4T1FVddvVUlLiFB+Z+U+LS0ECC
 S3ug49nGAds+bnHc7q+/jeLDKPIN5TjpodI/PWyObb9m9e/x+hvIOgOvztp6to6r6Ypr
 AJUI925Cmh3mV6ImB+oJHRnepnxuqAXAgT04xqdWG+xkN9iKM6LV/TYe6+4pW0FluBSy
 Mijzj8d7JKD/EbHXAhoI62jKt16J6NOJ7BFU/H7p5sO6+DqzypCDEn/+lb9avbJh+JBN
 FfSWqHbID4p0mpVL05ozzS0W8aywyHZv5bEolQuadjaVOTmArqsKCJpjlOL8VYS/dKSu
 uDOQ==
X-Gm-Message-State: APjAAAVvtRkJalF0Ow2jTAgffySzXeUfD/ue+CUl0p6ZbI6hUWo0/a4s
 /ah2jppRiKh3E3TeH4C/oj9Enw9RYxgCU/zE6vc=
X-Google-Smtp-Source: APXvYqwRFDHK40zpeZHKqfmhugRQg6QEQLeKpEtln/7IqWDqjkaz0EEzVueTxcQPeWHOKex71s5UKybL/aTrQDBXaSU=
X-Received: by 2002:aed:3e36:: with SMTP id l51mr66269253qtf.269.1560298461231; 
 Tue, 11 Jun 2019 17:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190611134636.15828-1-Fran.Hsu@quantatw.com>
In-Reply-To: <20190611134636.15828-1-Fran.Hsu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 00:14:08 +0000
Message-ID: <CACPK8Xe1S78YzNQ7K2keqj2bUkuo=ckBEcxco5g+NgusGD0LtA@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v7] ARM: dts: nuvoton: Update Quanta GSJ BMC
 Device Tree.
To: Fran Hsu <franhsutw@gmail.com>
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
 Fran Hsu <Fran.Hsu@quantatw.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 11 Jun 2019 at 13:48, Fran Hsu <franhsutw@gmail.com> wrote:
>
> This patch cleans up the warning message when build GSJ device tree.
> Remove the part of i2c-slave-mqueue from GSJ device tree.
>
> Tested:
>   Build Quanta GSJ image and load on the GSJ BMC module.
>   Ensure that BMC boots to console successful.
>
> Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> index 380d0d382395..497f46d690e9 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -5,7 +5,7 @@
>  #include "nuvoton-npcm730.dtsi"
>  #include "nuvoton-npcm730-gsj-gpio.dtsi"
>  / {
> -       model = "Quanta GSJ Board (Device Tree v11)";
> +       model = "Quanta GSJ Board (Device Tree v12)";
>         compatible = "nuvoton,npcm750";
>
>         aliases {
> @@ -300,26 +300,14 @@
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 bus-frequency = <100000>;
> -                               status = "okay";
> -
> -                               ipmb@40000010 {
> -                                       compatible = "slave-mqueue";
> -                                       reg = <0x40000010>;
> -                                       status = "okay";
> -                               };
> +                               status = "disabled";

There's no reason to have the node listed if you're setting it to
disabled in the dts.

A better cleanup would be to put the description of the i2c buses in
the dtsi, with the nodes disabled. Then in your dts you enable the
nodes that are in use, and add the attached i2c devices.


>                         };
>
>                         i2c14: i2c@8e000 {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>                                 bus-frequency = <100000>;
> -                               status = "okay";
> -
> -                               ipmb@40000012 {
> -                                       compatible = "slave-mqueue";
> -                                       reg = <0x40000012>;
> -                                       status = "okay";
> -                               };
> +                               status = "disabled";
>                         };
>
>                         i2c15: i2c@8f000 {
> --
> 2.21.0
>
