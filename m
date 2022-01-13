Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC39348D176
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 05:12:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ9yJ5qpjz2yw5
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 15:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ibjmvFEu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ibjmvFEu; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ9xr6jlGz2y0B;
 Thu, 13 Jan 2022 15:12:30 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id c190so4225454qkg.9;
 Wed, 12 Jan 2022 20:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbtW5GNEznZHiafA75unnHcFZvdczANI1PgQ6YwC50I=;
 b=ibjmvFEuzUnUj0P4/dhygtlpXkwqsmCbtqtSnsfMo8cpFNuhzqPWC58ZSdU3L1JTwt
 0JbiyhvXcxCguvtxAY6qa9hCdayN57icMXEHv5DOV32DSMkflySg0TSy0Uod6ngnhHaT
 A+M5uaveL8e8wlbe7AJqTbAjOrKQ1vG8fia6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbtW5GNEznZHiafA75unnHcFZvdczANI1PgQ6YwC50I=;
 b=y8XdgGnAIWThQxcncV18j40dD9izFA3L6NT3MaHUsV7zzUoQcOzqN5t+0iNqlVHTae
 eYrKcqpcvDO7HGuKP5hPQhN/8Ldx+Hrfn3/ldV7OmDvfiDDfffUN+Ba8dOVU6l/3OKhc
 EZwSJoqpufkJcb7Yko/nC9LCCN4lbNVG4/FxlCsc58sfotnsHLWaN36uBt7At4a1k1yR
 AsCNKUPIYkLdZ4b0aqJKe5ExEODQTpWDjMhYIzeCfmdPIuDBMu1vBql0H1sc8nxbMKrH
 5xJ17DxCaOr4IBSTpB1nbxBjoCDoYQN+f3wavN8Y3OWnxSsGOEwoelxJTi3j5RB3olYH
 qauw==
X-Gm-Message-State: AOAM531KUEeT2j0+x/8/B0BDj2EJgRx9vgBaj1qU9Z3d4C4F7/OM6BdM
 eKp61mThoCIxLzIyKeCYrG7yVOEGEWAcsGe3vH8=
X-Google-Smtp-Source: ABdhPJwOVBaayKDH/i9TEqiJA4jUpG5Q9ZPM20KYYIs0XA0wcVXkAniMBmivwNgSlbtXPJKggVHdozQRsoV+5JJNw5E=
X-Received: by 2002:a37:a342:: with SMTP id m63mr272966qke.347.1642047148268; 
 Wed, 12 Jan 2022 20:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
 <20220112230247.982212-6-iwona.winiarska@intel.com>
In-Reply-To: <20220112230247.982212-6-iwona.winiarska@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 04:12:16 +0000
Message-ID: <CACPK8XewQJBvwssM6zQKQoxT=JLpk-qjGhsiTAa980OtbU7JBw@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] peci: Add peci-aspeed controller driver
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 23:06, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
> ASPEED AST24xx/AST25xx/AST26xx SoCs support the PECI electrical
> interface (a.k.a PECI wire) that provides a communication channel with
> Intel processors.
> This driver allows BMC to discover devices connected to it and
> communicate with them using PECI protocol.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The driver looks good to me. I would be happy to see it merged in its
current state.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I've a few questions below that can be followed up later if need be.

> +
> +static void aspeed_peci_init_regs(struct aspeed_peci *priv)
> +{
> +       u32 val;
> +
> +       /* Clear interrupts */
> +       val = readl(priv->base + ASPEED_PECI_INT_STS) | ASPEED_PECI_INT_MASK;

Should that be & MASK?

As you're just sanitising the registers, you could clear the status
unconditionally:

 writel(ASPEED_PECI_INT_MASK, priv->base + ASPEED_PECI_INT_STS);

> +       writel(val, priv->base + ASPEED_PECI_INT_STS);
> +
> +       /* Set timing negotiation mode and enable interrupts */
> +       val = FIELD_PREP(ASPEED_PECI_TIMING_NEGO_SEL_MASK, ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO);

That's a complicated way to set val to zero :)

> +       val |= ASPEED_PECI_INT_MASK;
> +       writel(val, priv->base + ASPEED_PECI_INT_CTRL);
> +
> +       val = FIELD_PREP(ASPEED_PECI_CTRL_SAMPLING_MASK, ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT);
> +       writel(val, priv->base + ASPEED_PECI_CTRL);

This will clear the rest of the ctrl register, including the divisor
settings. Was that your intention?

Reading the rest of your driver you only call _init_regs after
_controller_enable, so I guess you're fine.

> +}
> +
> +static int aspeed_peci_check_idle(struct aspeed_peci *priv)
> +{
> +       u32 cmd_sts = readl(priv->base + ASPEED_PECI_CMD);
> +       int ret;
> +
> +       /*
> +        * Under normal circumstances, we expect to be idle here.
> +        * In case there were any errors/timeouts that led to the situation
> +        * where the hardware is not in idle state - we need to reset and
> +        * reinitialize it to avoid potential controller hang.
> +        */
> +       if (FIELD_GET(ASPEED_PECI_CMD_STS_MASK, cmd_sts)) {
> +               reset_control_assert(priv->rst);
> +
> +               ret = reset_control_deassert(priv->rst);
> +               if (ret) {
> +                       dev_err(priv->dev, "cannot deassert reset control\n");
> +                       return ret;
> +               }
> +
> +               aspeed_peci_init_regs(priv);
> +
> +               ret = clk_set_rate(priv->clk, priv->clk_frequency);
> +               if (ret < 0) {
> +                       dev_err(priv->dev, "cannot set clock frequency\n");
> +                       return ret;
> +               }
> +
> +               aspeed_peci_controller_enable(priv);
> +       }
> +
> +       return readl_poll_timeout(priv->base + ASPEED_PECI_CMD,
> +                                 cmd_sts,
> +                                 !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
> +                                 ASPEED_PECI_IDLE_CHECK_INTERVAL_US,
> +                                 ASPEED_PECI_IDLE_CHECK_TIMEOUT_US);
> +}
> +
> +static int aspeed_peci_xfer(struct peci_controller *controller,
> +                           u8 addr, struct peci_request *req)
> +{
> +       struct aspeed_peci *priv = dev_get_drvdata(controller->dev.parent);
> +       unsigned long timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
> +       u32 peci_head;
> +       int ret;
> +
> +       if (req->tx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX ||
> +           req->rx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX)
> +               return -EINVAL;
> +
> +       /* Check command sts and bus idle state */
> +       ret = aspeed_peci_check_idle(priv);
> +       if (ret)
> +               return ret; /* -ETIMEDOUT */
> +
> +       spin_lock_irq(&priv->lock);
> +       reinit_completion(&priv->xfer_complete);
> +
> +       peci_head = FIELD_PREP(ASPEED_PECI_TARGET_ADDR_MASK, addr) |
> +                   FIELD_PREP(ASPEED_PECI_WR_LEN_MASK, req->tx.len) |
> +                   FIELD_PREP(ASPEED_PECI_RD_LEN_MASK, req->rx.len);
> +
> +       writel(peci_head, priv->base + ASPEED_PECI_RW_LENGTH);
> +
> +       memcpy_toio(priv->base + ASPEED_PECI_WR_DATA0, req->tx.buf, min_t(u8, req->tx.len, 16));
> +       if (req->tx.len > 16)
> +               memcpy_toio(priv->base + ASPEED_PECI_WR_DATA4, req->tx.buf + 16,
> +                           req->tx.len - 16);
> +
> +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
> +       dev_dbg(priv->dev, "HEAD : %#08x\n", peci_head);
> +       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req->tx.len);
> +#endif

The ifdef is unfortunate. Could you do this?

dev_dbg(priv->dev, "HEAD : %#08x\n", peci_head);
if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG))
       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf,
req->tx.len);

Not a biggie though, don't let this hold up merging.

> +       priv->status = 0;
> +       writel(ASPEED_PECI_CMD_FIRE, priv->base + ASPEED_PECI_CMD);
> +       spin_unlock_irq(&priv->lock);
> +
