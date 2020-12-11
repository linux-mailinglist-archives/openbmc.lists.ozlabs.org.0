Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 287732D7429
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 11:48:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsnZ70jxhzDqvh
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 21:48:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=M6aHfXZH; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsnYM3jddzDqjh
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 21:47:34 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c14so6074386qtn.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsUjWAoAa5+wjcbA1hFlnJAcKl6yF8CSwUNyujKoXyM=;
 b=M6aHfXZHFHWXWnlN+9xSNx2oAc5BgLYPz+6RaiABdHXP4bHe/MHrAvgykiv2Afi7u5
 q+TGwaWOIVRNLCYT/PtIoGMaVQs5Y3K4j/vbcictNSaZ6JUMortRe+uZjSHTFMv+WF+u
 hsz2nFyrFJ08fU1VOeoSBZCkfXl6CTYp318NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsUjWAoAa5+wjcbA1hFlnJAcKl6yF8CSwUNyujKoXyM=;
 b=g9qlhPSdpMrjx+aRAqPCuS+4yYEZec6rU+4S/JKBRoKr7ggUUnKtMLKIE+hpMcN7kf
 Pn7MkhsJxPqBO9lfnpNcNF1yyw0/rpFt0QiiWGvzNj2c8DoXg6T35MUNmsoBC0SXn8Li
 MqfygnqG3jOdEaZ21OCCXHMhNqzSsLVa1oMAl+SSIUktB+A5iAczYfXkm65/hJWHZMGA
 ggz1rq9LADUHjct3f9fnUTOuK8snHn5fl4l/bREmwRp4cdy72w0RRNWFb4UjuFI1ucwW
 XgZIfxqYjDlonnNDEBcCeMU1UUDaLsXFrxBIrjvR9VeVg45YhdgZ4q9MsuUHCwcQv8II
 WggQ==
X-Gm-Message-State: AOAM533J28S/q7uAzgGJEEsaMAzK7ZD59WBOm7hAc48oH2X0Jz1+qyOK
 1YfbSSLoEvQEh//TGCrzYpL3o8lyPBx5k/TTau4=
X-Google-Smtp-Source: ABdhPJzIO//O4Itmcs5jOeqVBfJ2vL0rByGZzbgeQDxVqyTN0pdxkafUyOzMPVFqheqR7qM7CrK+YKpt5oSbxpmhQz8=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr14301044qtd.263.1607683650039; 
 Fri, 11 Dec 2020 02:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 10:47:18 +0000
Message-ID: <CACPK8XeVS615UrdhKXZTVEwrC_4a-3O2REH66Webr3Gu2zD6_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: g220a: Enable ipmb
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Dec 2020 at 04:00, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> From: Lotus Xu <xuxiaohan@bytedance.com>
>
> Enable ipmb on i2c4
>
> Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> index 89916a2eec18..3a4bf3db400c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -453,7 +453,11 @@ channel_3_3: i2c@3 {
>
>  &i2c4 {
>         status = "okay";
> -
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>  };
>
>  &i2c5 {
> --
> 2.25.1
>
