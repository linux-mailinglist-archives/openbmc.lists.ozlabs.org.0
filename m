Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BCF350A7F
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 00:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9hX11KBpz30Dn
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 09:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SzDy9UCo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SzDy9UCo; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9hWp4d5gz2xg0
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 09:56:37 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id y5so439168qkl.9
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 15:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcIZLwds67hQAR36ZY1wljIzUrH3Bl2hKqJRy/PMJb4=;
 b=SzDy9UCopRPxFuDZ6Wfh/enlWQ93qvBoKgOfRitg3hQktCPIyzhPKfurtiuCT2Wz3c
 YdylN56ZRA5fzXGqNaTCAMlRk0k8M8WoRNax+Z1HN/ifcWP1arRhR8Sg62OgR5Lh2x6S
 NYEwJdHGSzedqe3Y5DcfGHGZidUWwrKv+jius=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcIZLwds67hQAR36ZY1wljIzUrH3Bl2hKqJRy/PMJb4=;
 b=XTJQ7ZFsL3ngUw7Sy3oMlGpqKva0X1oZcH1Mg3xqtLS+P0zbIbsegtIPV6/yLxBFRg
 7n3HBAHKIbJ2uHTVhgJO4bQ08jwG0qYtZOg0f38q70iviOtMBFNhVCh/kZ26H9q/1vnh
 LYE4xNeX/bl2Jo+gJxzKT1KTibg5tT472AM7Jic9hJUXqkNbFqrs8UVurTpqZVd5IoPk
 3sxx5whPoArnevJYwdI9SrsLtF1T79mprnxiHCQrq3kG6ZfQuxcMgIg459mVg8rdJWQG
 6izG2eORiOdKQfhwOtApb6as02F01mhTepxkIxDaGjDRlO0/dJ1tRaI5j63YEQMoVtpn
 fBYA==
X-Gm-Message-State: AOAM5325ZoH3Fp8oDvxfko8rwcHwIxY9VZn+hzk32jiBrnXAnTAmLTeK
 1ZnQHVhDMhvBIrcZ6ACPcnKnuGnyPcoeKE5E2ny2u/CVwE1XKA==
X-Google-Smtp-Source: ABdhPJxiN9POj377a0drLCBxhuuVPKmU8BEFcKJe2EJFu7BkApOzq/Xek+DMNvdq5eg4afwbAympvrh7LuJPidax3PI=
X-Received: by 2002:a37:a147:: with SMTP id k68mr5657609qke.66.1617231395526; 
 Wed, 31 Mar 2021 15:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210331223815.2994650-1-wak@google.com>
In-Reply-To: <20210331223815.2994650-1-wak@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 22:56:23 +0000
Message-ID: <CACPK8XeHvyBYvx8ztftdOiVPU6TbYY923ULoKfXeLK_dq=h+eA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] net: npcm: Remove superfluous logging
To: "William A. Kennington III" <wak@google.com>
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

On Wed, 31 Mar 2021 at 22:38, William A. Kennington III <wak@google.com> wrote:
>
> Any queries of the ethernet interface will enter the settings functions.
> This causes dmesg to fill up with unnecessary log entries every time the
> phy information is queried.
>
> Signed-off-by: William A. Kennington III <wak@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I've applied this and the other emc patch to dev-5.10.

Cheers,

Joel

> ---
>  drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> index 3e9b8b68fc55..28aaee3e80ff 100644
> --- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> +++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> @@ -1773,7 +1773,6 @@ static int npcm7xx_get_settings(struct net_device *netdev,
>         if (!phydev)
>                 return -ENODEV;
>
> -       dev_info(&ether->pdev->dev, "\n\nnpcm7xx_get_settings\n");
>         phy_ethtool_ksettings_get(phydev, cmd);
>
>         return 0;
> @@ -1789,7 +1788,6 @@ static int npcm7xx_set_settings(struct net_device *netdev,
>         if (!phydev)
>                 return -ENODEV;
>
> -       dev_info(&ether->pdev->dev, "\n\nnpcm7xx_set_settings\n");
>         ret =  phy_ethtool_ksettings_set(phydev, cmd);
>
>         return ret;
> --
> 2.31.0.291.g576ba9dcdaf-goog
>
