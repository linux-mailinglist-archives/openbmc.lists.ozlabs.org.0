Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8931F7D42
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 20:58:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k93s4jM8zDqyc
	for <lists+openbmc@lfdr.de>; Sat, 13 Jun 2020 04:58:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=R6Z4v4tO; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k9354fLYzDqvw
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jun 2020 04:57:52 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id c185so10009212qke.7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkMApwiYezu5sKd52gZwgjFHzU4YUA8NWhzSxEipkeA=;
 b=R6Z4v4tOiqk2GfMf26w1Yh0MKKFnIQpofgdfFly39blh4DOWt+hPDy7XI2Uo3vIbwQ
 XoWdyv9Ntpe9RXpxAFkenOxIoo4Q4jNckC+RkAR82DwQSlszOSHGmQJL96zJDWoaMRH+
 F5fo06NKe3DJwf8GBbCnHCKjxcCNTJ1rBDi7JF+8pShgf5kMiON1L6gSm72fnInkIh47
 kOLN5WmJlxjMdgqa77TCyVwK92ywNhaU2hVg5c+UOhym2CUHzwrhlnc2/y5Wh6eYUch3
 4+0vBDMKyirPKO3A183e2pBWE2zrU5wyBuiY5kcgRMUOQW6C/iC4Jbi1B1aFZvj+XJ77
 yZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkMApwiYezu5sKd52gZwgjFHzU4YUA8NWhzSxEipkeA=;
 b=V+uc8G2Yq3P0tts9NtxN0Doe9LiFKzNKE6qEuI+JOKh39x7MGa68yxFLV33CDXkymG
 lF4bmvZMDSpLDJy+fwY+oKy5KcNXUW8G6h+K5RLwE/5SY94f5ccHpHInQbPf/wcXWZg7
 yVLcpvdCNG9IQfrpGOFU3aG2YXF/BC4Kvc0UwVQMQVEqXommmczzrricEyyNErupOHe6
 2/xFGoRR3Py3TvQwaZGVbrUfr+chSl20eNfWuXRID1FiVHQpKmMNivTnKVUEDYuWVkDo
 2+gA4gqL3iDyDoMfgLXVONmhjxdEa11qw8JVAQJxMGkl3ODB0e7rZy8irQp9zM8yOVOr
 pcXA==
X-Gm-Message-State: AOAM531RlHma0uXwqV6AGzY5a8xxmX27MijzWD3mOwv4ja82zCLO0l3y
 HA6kervK7AyNDUfXG7VFkdc/8qqOCHfLZForqh77kQ==
X-Google-Smtp-Source: ABdhPJwpC6jaqC/z7IheRuvYE1WNn7TEN4seK+rRzRMixJVxaub6YYG66HkJa+KHx0OUFPM1QOl4AJni3/VtNa1ZxP4=
X-Received: by 2002:a05:620a:2213:: with SMTP id
 m19mr4646835qkh.244.1591988268321; 
 Fri, 12 Jun 2020 11:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB4658331045B0A03FCFEB44449D800@DM6PR11MB4658.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB4658331045B0A03FCFEB44449D800@DM6PR11MB4658.namprd11.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Jun 2020 11:57:37 -0700
Message-ID: <CAO=notx-uT9hReCHgHhwujT16ps4A-Oj5KNXAk0vG2LVLrc8TA@mail.gmail.com>
Subject: Re: p2a control driver
To: "Montag, Gil" <gil.montag@intel.com>
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

On Thu, Jun 11, 2020 at 7:35 AM Montag, Gil <gil.montag@intel.com> wrote:
>
> Hi Patrick,
>
>
>
> I have an AST2500 BMC in my system.
>
> Doing lspci on the host connected to it via PCIe shows:
>
>
>
> 0e:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 04) (prog-if 00 [Normal decode])
>
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>
>         Latency: 0, Cache Line Size: 64 bytes
>
>         Interrupt: pin A routed to IRQ 17
>
>         Bus: primary=0e, secondary=0f, subordinate=0f, sec-latency=32
>
>         I/O behind bridge: 0000e000-0000efff
>
>         Memory behind bridge: f6000000-f70fffff
>
>         Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
>
>         Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>
>         BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
>
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>
>         Capabilities: <access denied>
>
>
>
> This PCI-PCI bridge is shown regardless of the aspeed-p2a-ctrl driver loaded or not.
>
> Is this the bridge you refer in your patch https://patchwork.kernel.org/patch/10873949/  or should I see some downstream PCI-AHB bridge other than this one?

The bridge is handled through MMIO, it's not specifically a bridge
device, and the driver configures the PCI-to-AHB MMIO bridge - the PCI
bridge itself exists regardless depending on the configuration.  If
that makes sense.

>
> If I should see such PCI-AHB bridge, what do I need to do to really see it?

The bridge is controlled from the host side with a register in BAR0,
and from the BMC via the control registers.

https://github.com/openbmc/phosphor-ipmi-flash/tree/master/tools <--
this handles identifying the bridge from the host-side.

>
>
>
> Thank you
>
> Gil
>
>
>
>
>
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
