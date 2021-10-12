Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797F042AFCB
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 00:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTW360hnCz2yQL
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 09:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LcfudLXN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LcfudLXN; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTW2d0ftMz2yMx;
 Wed, 13 Oct 2021 09:45:12 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id a16so627900qvm.2;
 Tue, 12 Oct 2021 15:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UB0FzdGahcZ/l2MY8TB+GokWnB79j38+awN2OfnaO/Q=;
 b=LcfudLXN6HQWE0aY2xGsAF/8weSXlQQsY4xxKu6MZnfjAtEuugJG6bRyEhhCn25rnk
 iHtv+oMtEja0+Ad2adDnQ/EA5Lf/l91/PVY8ef79Xv2QZczxTlLOGkADd5GlD72SIBTc
 LcrJ3INNWwvqJEXp6fRxbfbQ94CpEqjCsKS2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UB0FzdGahcZ/l2MY8TB+GokWnB79j38+awN2OfnaO/Q=;
 b=e8fKJSdrqBlv2qHea/RD5O/g2vWaeUS+9GmQndbrbS56NP2VLAvLbTtmfrlUfwfXTY
 Gh7fjafzZMnrrY+gFhkEKaFZfxU1R0VgbYD2Y7hNZcljRBUmAHR4b3vXshM38wo16abG
 tfhK+Eb5XhX1zl4zEEvOrzOOIf8rT9KfEHO+GgthbRk1kWL3fJFka8JfqiiROBtWNlVk
 Z7veeGQTu0ngpWUc1uv+7veUbmw9cOiYY68R8KfE6QlWM8uCwLm7qX+w2xxEU0MA3kYE
 IiUo0u5vGxVyOhc+RtJ4Cy4lMuNfnoA0XmzirrwVbkHWcxxckwv4Mgvzunvwu3mWjd5I
 uBAQ==
X-Gm-Message-State: AOAM531mPm0leXez++G948jXg1DxleaWf+PWHp0I5UR1rO0rbss/Vi5i
 PGPhHiYPX6rbrquHozcFQ7yJPYj3QUZS3g1X82c=
X-Google-Smtp-Source: ABdhPJwdwg2qSLzUdtrTctTwZKvWb4MQibvHrqcgJytR74M9tC4QY151Jz7EyAyfvKBrwpu8/yilNdMssEM59AByd7c=
X-Received: by 2002:ad4:5de9:: with SMTP id jn9mr33494860qvb.41.1634078706757; 
 Tue, 12 Oct 2021 15:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211012062240.GA5761@gmail.com>
In-Reply-To: <20211012062240.GA5761@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Oct 2021 22:44:54 +0000
Message-ID: <CACPK8XcJudWoKgXORvRzGAbtBwHm3a56RULriVABfERZgNgt9w@mail.gmail.com>
Subject: Re: [PATCH] net: ncsi: Adding padding bytes in the payload
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 12 Oct 2021 at 06:23, Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
>
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.

Can you help us review this by pointing out where this is described in
the NCSI spec?

We've been running this code for a number of years now and I wonder
why this hasn't been a problem so far.

Cheers,

Joel

>
> Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
>
> ---
>  net/ncsi/ncsi-cmd.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index ba9ae482141b..4625fc935603 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -214,11 +214,19 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
>         struct ncsi_cmd_oem_pkt *cmd;
>         unsigned int len;
>
> +       /* NC-SI spec requires payload to be padded with 0
> +        * to 32-bit boundary before the checksum field.
> +        * Ensure the padding bytes are accounted for in
> +        * skb allocation
> +        */
> +
> +       unsigned short payload = ALIGN(nca->payload, 4);
> +
>         len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -       if (nca->payload < 26)
> +       if (payload < 26)
>                 len += 26;
>         else
> -               len += nca->payload;
> +               len += payload;
>
>         cmd = skb_put_zero(skb, len);
>         memcpy(&cmd->mfr_id, nca->data, nca->payload);
> @@ -272,6 +280,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>         struct net_device *dev = nd->dev;
>         int hlen = LL_RESERVED_SPACE(dev);
>         int tlen = dev->needed_tailroom;
> +       int payload;
>         int len = hlen + tlen;
>         struct sk_buff *skb;
>         struct ncsi_request *nr;
> @@ -281,14 +290,18 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>                 return NULL;
>
>         /* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
> +        * Payload needs padding so that the checksum field follwoing payload is
> +        * aligned to 32bit boundary.
>          * The packet needs padding if its payload is less than 26 bytes to
>          * meet 64 bytes minimal ethernet frame length.
>          */
>         len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -       if (nca->payload < 26)
> +
> +       payload = ALIGN(nca->payload, 4);
> +       if (payload < 26)
>                 len += 26;
>         else
> -               len += nca->payload;
> +               len += payload;
>
>         /* Allocate skb */
>         skb = alloc_skb(len, GFP_ATOMIC);
> --
> 2.17.1
>
