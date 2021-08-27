Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0C73FAF8C
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 03:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyXky1flrz2xtB
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 11:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=aNaHRKsi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aNaHRKsi; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx4nJ6nnfz2ypP
 for <openbmc@lists.ozlabs.org>; Sat, 28 Aug 2021 02:25:04 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id m17so4253054plc.6
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=olUZYI52FUW5gVkrVAMR5duictYeHKMMzQr6nXakedQ=;
 b=aNaHRKsiD+SM+Lu9zvZtUAsPhN72aJZEO5ggEUbd+9i2E2zx+tYCvMVsH57GRkwHdf
 TEaqxgEcVqpk2OQ9H7VyX1+9BLBU1szPxLHX49NuTsQbgdwMV28fkCyIXIQW5Xd+QD3R
 WQ8/mhACDBZ1RuZyFTGtQQEZWkuERfp+C3Hd1pWoNSnZkvtdCCCdX43x97hoWme9ZdEO
 45oFzDbvZXtq0iWx7LSdO55FY2oYiiyByKOWYg3IoUUbV30sBk3aaucbioyl2Cd8PO6k
 bo+KZEykhRVe2BTh/XS6P2KQyoHNyAxEkUHVXaf1/Vmq1vtUC/5rzUkbwFKRZBjsF7bZ
 26nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olUZYI52FUW5gVkrVAMR5duictYeHKMMzQr6nXakedQ=;
 b=Llv78+wSXER52xDPoZmNKKgSMdtTHmBjhSM/hv3V4EjPN1CQQuut55oj9HViszACi0
 Oo4VJnQn//59qmUEU8VsjuOB6XTPrQ90bK69hYFBSG+aOX8NpU+v4kz1K7yIhXlPCpkG
 Kn7GBZ7YBGehgiv1Cxd1OsO2qsdPwxkFtCWAUrsfnlmJThmW7A2piF/N+ASVYsZuzXE7
 gXSPG11yfPQRhaUF+UE7Goyir/U5CcHD2o1VwriYpwhvYQbUwBH5ZFBh6yR4glEupSVS
 iB5YMG+3aSRMnNJCAqgf968rGEO5JyAZOYmEtUmMY99cO/7Z0QW0I7YWS8cA4uowD3e7
 jOFg==
X-Gm-Message-State: AOAM532Lojawaek+iXVgeCmpCscG8+AcVkOYz8o7hvn1UASj+W0SJlBA
 qomHwnOPtfW6wwr3mfBil4YyjMXS+vtdKuTN6FYPUQ==
X-Google-Smtp-Source: ABdhPJy9Fys2MKe+4NKONrWKg51ffmdsBaOmd1A6Uev8PSTHXgB2mLpKO7Fg2ktC2vZ1DnSMGf/U9PYBzR/IUsq76cs=
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr24462608pjk.13.1630081500678; 
 Fri, 27 Aug 2021 09:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-8-iwona.winiarska@intel.com>
 <CAPcyv4jPVSt9Wr2TkDActFVLP+ygaDwBnsKG410Nf1qfP_MB9A@mail.gmail.com>
 <b26ee278838698289869964fe59578f0d5f7b19c.camel@intel.com>
In-Reply-To: <b26ee278838698289869964fe59578f0d5f7b19c.camel@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 27 Aug 2021 09:24:49 -0700
Message-ID: <CAPcyv4hUm0Ec1+_n0PZ+S0A9Tt1=8oLdeYtEiEnAmntm8PtmKQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] peci: Add peci-aspeed controller driver
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 30 Aug 2021 11:27:51 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 26, 2021 at 4:55 PM Winiarska, Iwona
<iwona.winiarska@intel.com> wrote:
>
> On Wed, 2021-08-25 at 18:35 -0700, Dan Williams wrote:
> > On Tue, Aug 3, 2021 at 4:35 AM Iwona Winiarska
> > <iwona.winiarska@intel.com> wrote:
> > >
> > > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > >
> > > ASPEED AST24xx/AST25xx/AST26xx SoCs supports the PECI electrical
> > > interface (a.k.a PECI wire).
> >
> > Maybe a one sentence blurb here and in the Kconfig reminding people
> > why they should care if they have a PECI driver or not?
>
> Ok, I'll expand it a bit.
[..]
> > > +static int aspeed_peci_xfer(struct peci_controller *controller,
> > > +                           u8 addr, struct peci_request *req)
> > > +{
> > > +       struct aspeed_peci *priv = dev_get_drvdata(controller->dev.parent);
> > > +       unsigned long flags, timeout = msecs_to_jiffies(priv-
> > > >cmd_timeout_ms);
> > > +       u32 peci_head;
> > > +       int ret;
> > > +
> > > +       if (req->tx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX ||
> > > +           req->rx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX)
> > > +               return -EINVAL;
> > > +
> > > +       /* Check command sts and bus idle state */
> > > +       ret = aspeed_peci_check_idle(priv);
> > > +       if (ret)
> > > +               return ret; /* -ETIMEDOUT */
> > > +
> > > +       spin_lock_irqsave(&priv->lock, flags);
> > > +       reinit_completion(&priv->xfer_complete);
> > > +
> > > +       peci_head = FIELD_PREP(ASPEED_PECI_TARGET_ADDR_MASK, addr) |
> > > +                   FIELD_PREP(ASPEED_PECI_WR_LEN_MASK, req->tx.len) |
> > > +                   FIELD_PREP(ASPEED_PECI_RD_LEN_MASK, req->rx.len);
> > > +
> > > +       writel(peci_head, priv->base + ASPEED_PECI_RW_LENGTH);
> > > +
> > > +       memcpy_toio(priv->base + ASPEED_PECI_WR_DATA0, req->tx.buf,
> > > min_t(u8, req->tx.len, 16));
> > > +       if (req->tx.len > 16)
> > > +               memcpy_toio(priv->base + ASPEED_PECI_WR_DATA4, req->tx.buf +
> > > 16,
> > > +                           req->tx.len - 16);
> > > +
> > > +       dev_dbg(priv->dev, "HEAD : 0x%08x\n", peci_head);
> > > +       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req-
> > > >tx.len);
> >
> > On CONFIG_DYNAMIC_DEBUG=n builds the kernel will do all the work of
> > reading through this buffer, but skip emitting it. Are you sure you
> > want to pay that overhead for every transaction?
>
> I can remove it or I can add something like:
>
> #if IS_ENABLED(CONFIG_PECI_DEBUG)
> #define peci_debug(fmt, ...) pr_debug(fmt, ##__VA_ARGS__)
> #else
> #define peci_debug(...) do { } while (0)
> #endif

It's the hex dump I'm worried about, not the debug statements as much.

I think the choices are remove the print_hex_dump_bytes(), put it
behind an IS_ENABLED(CONFIG_DYNAMIC_DEBUG) to ensure the overhead is
skipped in the CONFIG_DYNAMIC_DEBUG=n case, or live with the overhead
if this is not a fast path / infrequently used.

>
> (and similar peci_trace with trace_printk for usage in IRQ handlers and such).
>
> What do you think?

In general, no, don't wrap the base level print routines with
driver-specific ones. Also, trace_printk() is only for debug builds.
Note that trace points are built to be even less overhead than
dev_dbg(), so there's no overhead concern with disabled tracepoints,
they literally translate to nops when disabled.

>
> >
> > > +
> > > +       priv->status = 0;
> > > +       writel(ASPEED_PECI_CMD_FIRE, priv->base + ASPEED_PECI_CMD);
> > > +       spin_unlock_irqrestore(&priv->lock, flags);
> > > +
> > > +       ret = wait_for_completion_interruptible_timeout(&priv-
> > > >xfer_complete, timeout);
> >
> > spin_lock_irqsave() says "I don't know if interrupts are disabled
> > already, so I'll save the state, whatever it is, and restore later"
> >
> > wait_for_completion_interruptible_timeout() says "I know I am in a
> > sleepable context where interrupts are enabled"
> >
> > So, one of those is wrong, i.e. should it be spin_{lock,unlock}_irq()?
>
> You're right - I'll fix it.
>
> >
> >
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       if (ret == 0) {
> > > +               dev_dbg(priv->dev, "Timeout waiting for a response!\n");
> > > +               return -ETIMEDOUT;
> > > +       }
> > > +
> > > +       spin_lock_irqsave(&priv->lock, flags);
> > > +
> > > +       writel(0, priv->base + ASPEED_PECI_CMD);
> > > +
> > > +       if (priv->status != ASPEED_PECI_INT_CMD_DONE) {
> > > +               spin_unlock_irqrestore(&priv->lock, flags);
> > > +               dev_dbg(priv->dev, "No valid response!\n");
> > > +               return -EIO;
> > > +       }
> > > +
> > > +       spin_unlock_irqrestore(&priv->lock, flags);
> > > +
> > > +       memcpy_fromio(req->rx.buf, priv->base + ASPEED_PECI_RD_DATA0,
> > > min_t(u8, req->rx.len, 16));
> > > +       if (req->rx.len > 16)
> > > +               memcpy_fromio(req->rx.buf + 16, priv->base +
> > > ASPEED_PECI_RD_DATA4,
> > > +                             req->rx.len - 16);
> > > +
> > > +       print_hex_dump_bytes("RX : ", DUMP_PREFIX_NONE, req->rx.buf, req-
> > > >rx.len);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static irqreturn_t aspeed_peci_irq_handler(int irq, void *arg)
> > > +{
> > > +       struct aspeed_peci *priv = arg;
> > > +       u32 status;
> > > +
> > > +       spin_lock(&priv->lock);
> > > +       status = readl(priv->base + ASPEED_PECI_INT_STS);
> > > +       writel(status, priv->base + ASPEED_PECI_INT_STS);
> > > +       priv->status |= (status & ASPEED_PECI_INT_MASK);
> > > +
> > > +       /*
> > > +        * In most cases, interrupt bits will be set one by one but also
> > > note
> > > +        * that multiple interrupt bits could be set at the same time.
> > > +        */
> > > +       if (status & ASPEED_PECI_INT_BUS_TIMEOUT)
> > > +               dev_dbg_ratelimited(priv->dev,
> > > "ASPEED_PECI_INT_BUS_TIMEOUT\n");
> > > +
> > > +       if (status & ASPEED_PECI_INT_BUS_CONTENTION)
> > > +               dev_dbg_ratelimited(priv->dev,
> > > "ASPEED_PECI_INT_BUS_CONTENTION\n");
> > > +
> > > +       if (status & ASPEED_PECI_INT_WR_FCS_BAD)
> > > +               dev_dbg_ratelimited(priv->dev,
> > > "ASPEED_PECI_INT_WR_FCS_BAD\n");
> > > +
> > > +       if (status & ASPEED_PECI_INT_WR_FCS_ABORT)
> > > +               dev_dbg_ratelimited(priv->dev,
> > > "ASPEED_PECI_INT_WR_FCS_ABORT\n");
> >
> > Are you sure these would not be better as tracepoints? If you're
> > debugging an interrupt related failure, the ratelimiting might get in
> > your way when you really need to know when one of these error
> > interrupts fire relative to another event.
>
> Tracepoints are ABI(ish), and using a full blown tracepoint just for IRQ status
> would probably be too much.

Tracepoints become ABI once someone ships tooling that depends on them
being there. These don't look  attractive for a tool, and they don't
look difficult to maintain if the interrupt handler needs to be
reworked. I.e. it would be trivial to keep a dead tracepoint around if
worse came to worse to keep a tool from failing to load.

> I was thinking about something like trace_printk hidden under a
> "CONFIG_PECI_DEBUG" (see above), but perhaps that's something for the future
> improvement?

Again trace_printk() is only for private builds.

>
> >
> > > +
> > > +       /*
> > > +        * All commands should be ended up with a ASPEED_PECI_INT_CMD_DONE
> > > bit
> > > +        * set even in an error case.
> > > +        */
> > > +       if (status & ASPEED_PECI_INT_CMD_DONE)
> > > +               complete(&priv->xfer_complete);
> >
> > Hmm, no need to check if there was a sequencing error, like a command
> > was never submitted?
>
> It's handled by checking if HW is idle in xfer before a command is sent, where
> we just expect a single interrupt per command.

I'm asking how do you determine if this status was spurious, or there
was a sequencing error in the driver?
