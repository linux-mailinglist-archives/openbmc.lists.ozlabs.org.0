Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CB3C4662
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 12:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNfVq2lH4z302B
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 20:04:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ldgz/aTv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ldgz/aTv; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNfVW1DVVz2yNM
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 20:03:46 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d15so2195512qte.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngW9aOExkdA+8gr3Muk6ucNPU2ote1fxcTjHlDfbYPA=;
 b=ldgz/aTvlPE0wN5F95/vk6lbZSXd8s3hKumAUg0zKoiB769NTKawQ67pVUdhMPZbgZ
 Ah5SJP3fY611LFd5YJ9QeS/2H+ajPzMKnIcrY5ThqDetzV9GopwcNHwrtPCiMlmu12ts
 e2ZzVRdtZEYrlyfmni8ZY+DMV2zzapzHeRPD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngW9aOExkdA+8gr3Muk6ucNPU2ote1fxcTjHlDfbYPA=;
 b=ai2p2PLbLDmKhKpO1qITNijMBEul4LmwoVuEGRifqUeYEbEqkBMrbiVFNuo/l5SiP1
 abRO7CSJ8zzDFrHBuQ2a67Oqrys0l2i4N+u03p0OFRsmnR3RQK1/6Csg592HNg8UxoWy
 xNe6s50miFDvSFEDaH1+9cykhs1vxRpnyvGGHyJAR46wZXlDIpaOSBjHi8zwsJFMyW/i
 P4vOOmmpHLLsCDRLpBRHFoUDWYrCpuTIwSUZZhUR4VtjvtIqjindLny46vdKijC8qyWJ
 F1l0j6XWWdj2xlNQzz+7hRCLOa+bFbX9RfxxLtD6LLLxcJbbCB2EscPdizEiyz8YWy7o
 m8pA==
X-Gm-Message-State: AOAM533xUFJqVK+ZoWYwMhudBga94SQdI6/Ox5riyR9Ymy7NCPGKpU9v
 rrk9yjIDFKlOWWEDtsddfOmsarUw4Q/pz0bO1us=
X-Google-Smtp-Source: ABdhPJwA6F+lr1GUCFpwTdOS+T8+z4SsfDpdbCxoXo57JEjvV1Tm8T70iYN2FbsFkhrmrrgUj+AIaHMTK6i3F8W+lJM=
X-Received: by 2002:ac8:588e:: with SMTP id t14mr46760025qta.363.1626084223702; 
 Mon, 12 Jul 2021 03:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-4-i.mikhaylov@yadro.com>
In-Reply-To: <20210708122754.555846-4-i.mikhaylov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Jul 2021 10:03:30 +0000
Message-ID: <CACPK8XcdUtzZCPcmr+=b5kJ=563KroEtfMATquwkqd6Z11JCDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] net/ncsi: add dummy response handler for Intel
 boards
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

On Thu, 8 Jul 2021 at 12:28, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> Add the dummy response handler for Intel boards to prevent incorrect
> handling of OEM commands.

What do you mean?

Is this to handle the response to the link up OEM command? If so,
include it in the same patch.

Can you check that the response is to the link up command and print a
warning if not?

>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  net/ncsi/ncsi-rsp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 04bc50be5c01..d48374894817 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -699,12 +699,19 @@ static int ncsi_rsp_handler_oem_bcm(struct ncsi_request *nr)
>         return 0;
>  }
>
> +/* Response handler for Intel card */
> +static int ncsi_rsp_handler_oem_intel(struct ncsi_request *nr)
> +{
> +       return 0;
> +}
> +
>  static struct ncsi_rsp_oem_handler {
>         unsigned int    mfr_id;
>         int             (*handler)(struct ncsi_request *nr);
>  } ncsi_rsp_oem_handlers[] = {
>         { NCSI_OEM_MFR_MLX_ID, ncsi_rsp_handler_oem_mlx },
> -       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
> +       { NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm },
> +       { NCSI_OEM_MFR_INTEL_ID, ncsi_rsp_handler_oem_intel }
>  };
>
>  /* Response handler for OEM command */
> --
> 2.31.1
>
