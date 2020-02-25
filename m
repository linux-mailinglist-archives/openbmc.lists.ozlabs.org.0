Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352916B780
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:03:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RMg04RmdzDqMM
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 13:03:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hkKaZq8b; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RMcS5x4KzDqCF
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 13:01:44 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id 145so4441892qkl.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 18:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrPv5Dvqrp020cO8P35ijt3eARm7ARc3QHW9sIoErHU=;
 b=hkKaZq8bKL7aH8d/L3redmbFU0bxFQAxYqLN1ClKZtXOe0RbictB+r6HlgTLgBeR+3
 6DOn/aM50uDjKugBJuvVpRFxkLTzrWzufMlIQ2KKK+DjaqzZfl/qfDJu1fvj3H6RoO9f
 rGVNvFOjfhSnrCGE36QvMnDm3Dd80vbrUf6zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrPv5Dvqrp020cO8P35ijt3eARm7ARc3QHW9sIoErHU=;
 b=fIzwBdSe7tbgsqb0iUHMtju9vr4SS8RSFvAogFzn6f09yCVGzINKZoS76eXhxFjyxr
 hTFANY0rdKhARemCrg/CVNcPaOdF97luoTtbt8yhePmu4/RlnW0ZJjcM7cmHAuTt7PXR
 vx5kdRiFgL2XROGT7FNEUynuzlG8tGz8fHFF1ukdKw2mjpJMCui54/2/Y8bP4eq9sgSk
 56/C44H3H8zwz4KiDbl8KlMPbulHlpDyTLA7HO7Bpcp+HnBcP55KTrTIw2dIm1Lg/ggu
 k0WmFmRL6LvVUn5TfpR7uSrQS2B0A3AF7CTGi/4qpvC3+x2SYQm0sjyzdrPFHa7wcbRI
 rmSg==
X-Gm-Message-State: APjAAAX+ynm+P8Uwno5v++3Nbs02NELG2Wsby/I1m8b+OmVExRSjlVsS
 XtzrYGQYMnGO6n/1wruoCxTM3OTLAUtMKUi8Hn8=
X-Google-Smtp-Source: APXvYqx47vy7ZZUxMYsqCNvdr5MznZrGPOi4XwpZADwUghW5xP8eQIKIIJYPV0bfzHgExFYMohobk1Qq9Gn3hmfhRZE=
X-Received: by 2002:a37:c07:: with SMTP id 7mr53590205qkm.414.1582596100352;
 Mon, 24 Feb 2020 18:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20200217201619.16713-1-eajames@linux.ibm.com>
In-Reply-To: <20200217201619.16713-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Feb 2020 02:01:27 +0000
Message-ID: <CACPK8Xe7_i3N8m7nMv9yZHv4x+LvaouQWjFmFEv8pGf+S_+PuA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] fsi: master: Add link_disable function
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 17 Feb 2020 at 20:16, Eddie James <eajames@linux.ibm.com> wrote:
>
> The master driver should disable links that don't have slaves or links
> that fail to be accessed. To do this, add a link_disable function and
> use it in the failure path for slave break and init.

The implementation looks okay, aside from the code duplication.

We should clear up my first question about disabling the link in all
error paths. The other questions don't need to block this going into
dev-5.4, but should be resolved when upstreaming.

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-core.c          | 13 ++++++++++++-
>  drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
>  drivers/fsi/fsi-master-hub.c    | 22 ++++++++++++++++++++++
>  drivers/fsi/fsi-master.h        |  1 +
>  4 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 8244da8a7241..d81ee9f582a5 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -1154,6 +1154,14 @@ static int fsi_master_write(struct fsi_master *master, int link,
>         return rc;
>  }
>
> +static int fsi_master_link_disable(struct fsi_master *master, int link)
> +{
> +       if (master->link_disable)
> +               return master->link_disable(master, link);
> +
> +       return 0;
> +}
> +
>  static int fsi_master_link_enable(struct fsi_master *master, int link)
>  {
>         if (master->link_enable)
> @@ -1194,10 +1202,13 @@ static int fsi_master_scan(struct fsi_master *master)
>                 if (rc) {
>                         dev_dbg(&master->dev,
>                                 "break to link %d failed: %d\n", link, rc);
> +                       fsi_master_link_disable(master, link);
>                         continue;
>                 }
>
> -               fsi_slave_init(master, link, 0);
> +               rc = fsi_slave_init(master, link, 0);
> +               if (rc)
> +                       fsi_master_link_disable(master, link);

Do we want to set the link as disabled when the init fails in all
fsi_slave_init error paths?

>         }
>
>         return 0;
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index f49742b310c2..7ce5d9eb6c78 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -299,6 +299,35 @@ static int aspeed_master_write(struct fsi_master *master, int link,
>         return 0;
>  }
>
> +static int aspeed_master_link_disable(struct fsi_master *master, int link)
> +{
> +       struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> +       int idx, bit, ret;
> +       __be32 reg, result;
> +
> +       idx = link / 32;
> +       bit = link % 32;
> +
> +       reg = cpu_to_be32(0x80000000 >> bit);
> +
> +       ret = opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
> +       if (ret)
> +               return ret;
> +
> +       mdelay(FSI_LINK_ENABLE_SETUP_TIME);
> +
> +       ret = opb_readl(aspeed, ctrl_base + FSI_MENP0 + (4 * idx), &result);
> +       if (ret)
> +               return ret;

Do we need to have the delay and read when disabling?

> +
> +       if (result & reg) {
> +               dev_err(aspeed->dev, "%s failed: %08x\n", __func__, result);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static int aspeed_master_link_enable(struct fsi_master *master, int link)
>  {
>         struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> @@ -491,6 +520,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>         aspeed->master.write = aspeed_master_write;
>         aspeed->master.send_break = aspeed_master_break;
>         aspeed->master.term = aspeed_master_term;
> +       aspeed->master.link_disable = aspeed_master_link_disable;
>         aspeed->master.link_enable = aspeed_master_link_enable;
>
>         dev_set_drvdata(&pdev->dev, aspeed);
> diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
> index def35cf92571..26617fd5e2de 100644
> --- a/drivers/fsi/fsi-master-hub.c
> +++ b/drivers/fsi/fsi-master-hub.c
> @@ -77,6 +77,27 @@ static int hub_master_break(struct fsi_master *master, int link)
>         return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
>  }
>
> +static int hub_master_link_disable(struct fsi_master *master, int link)
> +{
> +       struct fsi_master_hub *hub = to_fsi_master_hub(master);
> +       int idx, bit;
> +       __be32 reg;
> +       int rc;
> +
> +       idx = link / 32;
> +       bit = link % 32;
> +
> +       reg = cpu_to_be32(0x80000000 >> bit);
> +
> +       rc = fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx), &reg, 4);
> +
> +       mdelay(FSI_LINK_ENABLE_SETUP_TIME);
> +
> +       fsi_device_read(hub->upstream, FSI_MENP0 + (4 * idx), &reg, 4);
> +
> +       return rc;
> +}

This is the same code, with fsi_device_read instead of obp_read.

We should look to share this code between the aspeed master and the hub master.

> +
>  static int hub_master_link_enable(struct fsi_master *master, int link)
>  {
>         struct fsi_master_hub *hub = to_fsi_master_hub(master);
> @@ -228,6 +249,7 @@ static int hub_master_probe(struct device *dev)
>         hub->master.read = hub_master_read;
>         hub->master.write = hub_master_write;
>         hub->master.send_break = hub_master_break;
> +       hub->master.link_disable = hub_master_link_disable;
>         hub->master.link_enable = hub_master_link_enable;
>
>         dev_set_drvdata(dev, hub);
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 6e8d4d4d5149..7ecb86a678f9 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -130,6 +130,7 @@ struct fsi_master {
>                                 uint32_t addr, const void *val, size_t size);
>         int             (*term)(struct fsi_master *, int link, uint8_t id);
>         int             (*send_break)(struct fsi_master *, int link);
> +       int             (*link_disable)(struct fsi_master *, int link);
>         int             (*link_enable)(struct fsi_master *, int link);
>         int             (*link_config)(struct fsi_master *, int link,
>                                        u8 t_send_delay, u8 t_echo_delay);
> --
> 2.24.0
>
