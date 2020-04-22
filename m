Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD11B35D9
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 06:00:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496RYK3p3fzDr0V
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 14:00:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WW4DnR4r; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496RXM5dtkzDqq0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 13:59:47 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id s3so782541eji.6
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 20:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCqL67zSLXZMKNvPEAUxKa6m67t6riJS3n/4WQqV7zY=;
 b=WW4DnR4rgwMKEO/5ijPswBjoc736a5w4KkV+wWZKcD2jkzs4zMgbN8w0E8zUGomwMC
 rdfx4+tnCdEmgxL1nXd2G/Aan9VEEIG7mDDTXg3krInCKN65wq2t2kOLLAclJDZR/ueh
 HdmZ9lMFNBRtnYO0JKujdqGnsD0Rpb1Ho+iME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCqL67zSLXZMKNvPEAUxKa6m67t6riJS3n/4WQqV7zY=;
 b=R2hA7L/9mT42whtHUOIuCfSbmdYyW6OjU44N2kW7xN8FEsz/VO0fHBL73j/5k2cpjE
 l3tE3nl0FvXQ1jEIc9VRgG7yxt4ghmo4TnmqOkY6LXdIVf3dyrAakG+k7nf9B/zU88es
 DGAzrpRqdVj72el61b2tUQbSzwleOHRAi5zv+h4rNQdmjDDBz5yYkJfeCkT4Hj+7rrCB
 6LlkVh2qROh88j60NfMmGtscKzCL+MEDRZZMmWyGXQcxGzaBFQ9tkpXf3MQYoLv2zGFM
 zDNp/9wZaS6opBEMpQz3w6PItbderWq7hCe152CfSylbBIdAQa8JADCt1LO/B4DTSH5l
 Shsg==
X-Gm-Message-State: AGi0Pubu4itOR4lqbmCS45kqreR+O5m0Zg5CxvD2+4iWCR5xf8O+WrWn
 d+bSSjB8L41ip5epzkC1Ct+JZlZJ0CksBkwpTeY=
X-Google-Smtp-Source: APiQypIh7YIMTSl2fHLAHbuf2jKm9FaW0IvOaRV1SB3DsIVeZrk4hzLJIRD5k3sGdsvN4y3JzfaZDN7UdHUpuCIQuZU=
X-Received: by 2002:a17:906:6444:: with SMTP id
 l4mr23622287ejn.313.1587527980488; 
 Tue, 21 Apr 2020 20:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200422034431.21255-1-wangzqbj@inspur.com>
In-Reply-To: <20200422034431.21255-1-wangzqbj@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Apr 2020 03:59:28 +0000
Message-ID: <CACPK8XcJ-0B=TDuJc37guWu72SQ8R0enet0n5rna6Q5XJ1KhOA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Inspur cp5280g2 BMC machine
To: John Wang <wangzq.jn@gmail.com>
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

On Wed, 22 Apr 2020 at 03:45, John Wang <wangzq.jn@gmail.com> wrote:
>
> The cp5280g2 is an open-power(p8) platform with
> an ast2500 BMC
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>

Looks good.

Can you please send a v2 with the gpio line names for your system?

> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +                <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +       use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};

Does this need clocks?
