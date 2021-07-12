Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4863C462F
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 11:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNdJC27Bdz306N
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 19:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=F2WRzrh9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=F2WRzrh9; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNdHv6qd6z2yxv
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 19:09:31 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id c9so9358822qte.6
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Hb4dRGQaLYUGOw/97dBG/9ft0r02/qtDhdKS1aLQhY=;
 b=F2WRzrh92USD1R81KIWzagjewtnabzUnm6mBgrT41r0CFTr30dSUEf4xI0MwXvBQ5O
 tnjOPWBjCcWxo1n4XK/xB+DTWBoyIjpW4OS0MjcXzZT7soZzl1oKNs7X/ze1zfutUoQI
 4/mGBepuM7tjzr0zqIXQxnemW8/X8yhwjdzXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Hb4dRGQaLYUGOw/97dBG/9ft0r02/qtDhdKS1aLQhY=;
 b=klM7lti21Kum8vy5g4NHngtZF2QXELu3DoCO2Q79KaGNBul+Jt3aIHuZ8Nvdt6pt6s
 c0ql2fb8DaA7cBxf3NHoIa0VUQ1QMy1klf9ikO+MMS+YXcLAYGA400FoLUPTQqArndBy
 H/uZVieUco0uGm0JIbNLgAt4tuh2LgqFJ29cqizUK9uLeV395Df0XlJi4B1z4k6xyU6C
 FunCs6nvcre4QiHOtRgP6VgKmPDBQf5unmkB7elXidscQ/kmMmCzwyIcF9kb/9svhucX
 VGSdPftUB/4zgcDuX44NX8i65Fdi6voOC1/PwS98iTqZ4aAXCvt+RUsL4ay3aDfgZyyj
 xzKw==
X-Gm-Message-State: AOAM5326ypgt2JrC0Q4amgyHX52OLD080lx3ebY0fiKHMy10XSmt/0EZ
 z7h1+0+Cru8lCxBpa7t41KS3bh8baUxG7+DKOxw=
X-Google-Smtp-Source: ABdhPJyToliZLHFnqZ8syXg4Y03QiwsYTKpHEyW2zOfd12JZgZ+RqmnvsIaw3P6B3EnDucnrgc6D9QhtXSC4tf18m5Q=
X-Received: by 2002:ac8:6697:: with SMTP id d23mr43113869qtp.135.1626080967396; 
 Mon, 12 Jul 2021 02:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-2-i.mikhaylov@yadro.com>
In-Reply-To: <20210708122754.555846-2-i.mikhaylov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Jul 2021 09:09:15 +0000
Message-ID: <CACPK8Xe2W-qTPjyuAHkTGq6Kz0sWYRz23Cqqdxu0CL2XNc=T0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net/ncsi: fix restricted cast warning of sparse
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 8 Jul 2021 at 12:27, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Sparse reports:
> net/ncsi/ncsi-rsp.c:406:24: warning: cast to restricted __be32
> net/ncsi/ncsi-manage.c:732:33: warning: cast to restricted __be32
> net/ncsi/ncsi-manage.c:756:25: warning: cast to restricted __be32
> net/ncsi/ncsi-manage.c:779:25: warning: cast to restricted __be32

Strange, I don't get these warnings from sparse on my system.

$ sparse --version
0.6.3 (Debian: 0.6.3-2)

>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  net/ncsi/ncsi-manage.c | 6 +++---
>  net/ncsi/ncsi-rsp.c    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index ca04b6df1341..42b54a3da2e6 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -700,7 +700,7 @@ static int ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
>         nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
>
>         memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
> -       *(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
> +       *(unsigned int *)data = ntohl((__force __be32)NCSI_OEM_MFR_BCM_ID);

This looks wrong, the value you're passing isn't big endian. It would
make more sense if the byte swap was ntohl, as it's coming from the
cpu and going into the NCSI packet.

>         data[5] = NCSI_OEM_BCM_CMD_GMA;
>
>         nca->data = data;
> @@ -724,7 +724,7 @@ static int ncsi_oem_gma_handler_mlx(struct ncsi_cmd_arg *nca)
>         nca->payload = NCSI_OEM_MLX_CMD_GMA_LEN;
>
>         memset(&u, 0, sizeof(u));
> -       u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
> +       u.data_u32[0] = ntohl((__force __be32)NCSI_OEM_MFR_MLX_ID);
>         u.data_u8[5] = NCSI_OEM_MLX_CMD_GMA;
>         u.data_u8[6] = NCSI_OEM_MLX_CMD_GMA_PARAM;
>
> @@ -747,7 +747,7 @@ static int ncsi_oem_smaf_mlx(struct ncsi_cmd_arg *nca)
>         int ret = 0;
>
>         memset(&u, 0, sizeof(u));
> -       u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
> +       u.data_u32[0] = ntohl((__force __be32)NCSI_OEM_MFR_MLX_ID);
>         u.data_u8[5] = NCSI_OEM_MLX_CMD_SMAF;
>         u.data_u8[6] = NCSI_OEM_MLX_CMD_SMAF_PARAM;
>         memcpy(&u.data_u8[MLX_SMAF_MAC_ADDR_OFFSET],
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 888ccc2d4e34..04bc50be5c01 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -403,7 +403,7 @@ static int ncsi_rsp_handler_ev(struct ncsi_request *nr)
>         /* Update to VLAN mode */
>         cmd = (struct ncsi_cmd_ev_pkt *)skb_network_header(nr->cmd);
>         ncm->enable = 1;
> -       ncm->data[0] = ntohl(cmd->mode);
> +       ncm->data[0] = ntohl((__force __be32)cmd->mode);
>
>         return 0;
>  }
> --
> 2.31.1
>
