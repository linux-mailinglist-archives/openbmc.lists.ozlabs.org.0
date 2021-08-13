Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E683EAE29
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 03:30:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm5Zx2YtMz30G2
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 11:30:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XgmjOaNQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XgmjOaNQ; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm5ZP4wfdz302V;
 Fri, 13 Aug 2021 11:29:32 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id kl2so4350436qvb.11;
 Thu, 12 Aug 2021 18:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d7y1hw5LdhKxpKxA/yXBN3ZJJ9yKaaGgYxkF16tEOMQ=;
 b=XgmjOaNQhbcCpvEmbZ5/zeX1bIUCgsvOXXufJ2DPyPwiVEcOXqrSKm7FQ6EHIiZPyf
 oLeOmGXFO5wc15/y2C90t9Vq9dPWNQ1zd0kaJv433461YrWvDUAzi2BBUezZlhb5C9cK
 XEDHQ5hrZEWfa+AOsbVJMlsxxBhsgTXh6Acys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d7y1hw5LdhKxpKxA/yXBN3ZJJ9yKaaGgYxkF16tEOMQ=;
 b=h3pnMYFUrI+aDNF2LiRo545cDCLXCpMDYnThL7iKAggohVpo4WsYzhJNKk5RkMoJq3
 JLXazrQZoWS7GG2dJtoCHffOqKIwwoAAne9Ie5yJ3H2E7LqP3Ok5+V7fdTR+5Kk0mLw/
 n2YLb/S2hgt14oD4UGXV6CwBMuVAyoz0lyNfsBBVssfIJ0P4NYinCMWHuYlGEfLoSNG9
 4W+rysNsOA/UKBbdYZn4f/8D2YQ+aIrxKc/jHz978taej/5Mxij7+wWHmcY9gN+U130u
 EkR9gFWYAwLXpwEj2JDL1tog/X3x3dKTyCQMPjSxTaPAMO/yaCE/NZ8fAgvl2LaklHdC
 YrYw==
X-Gm-Message-State: AOAM531nZacOxaK8fDNPSkMzXVmBjaLdIti9GLRYF83cw1ks5DKE7+df
 eTfLl3U22WzTF0S3fy7sLQ42Y/4bbCX0BHNHCjc=
X-Google-Smtp-Source: ABdhPJwhFLUqMIHIWOI/nCQlWmPOcdMRcHIRqjb8rAdMkprVxUulQ0uUl0tMgKhaIcL2vd8J9M1zxJmLtEpFhq9AfOM=
X-Received: by 2002:a0c:e6a4:: with SMTP id j4mr107833qvn.16.1628818169431;
 Thu, 12 Aug 2021 18:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-5-rentao.bupt@gmail.com>
In-Reply-To: <20210805222818.8391-5-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Aug 2021 01:29:17 +0000
Message-ID: <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ARM: dts: aspeed: Add Facebook Cloudripper
 (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 5 Aug 2021 at 22:28, <rentao.bupt@gmail.com> wrote:
> +&mdio1 {
> +       status = "okay";

You're enabling this but it looks like it's unused?

> +};
> +
> +&mdio3 {
> +       status = "okay";
> +
> +       ethphy1: ethernet-phy@13 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0x0d>;
> +       };
> +};
> +
> +&mac3 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy1>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii4_default>;
> +};
