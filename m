Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC5123B82
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 01:24:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cwkY6h6MzDqW8
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 11:24:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MMYzJp6U"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cHVl30YzzDqX9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 10:27:26 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d15so5191538pll.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 15:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=pP1hagqSYDwwA2YjZ9gfdWx6xDMgnbeyBHGfmn3+DE0=;
 b=MMYzJp6UxQUQNh58RYjrQGcY6a+hdQWcxSmKtC7oHVd0+x7KJpndeE6yPq3xBAl3jZ
 B/MX8003PV+SZ2nwo8AxyMJHjMHWpXKKFZsX3sWY/ZhgsSxWp3VW8rlFk3N5TVHYYYEX
 qpki9caXNC3/QO8osDQ43QRMuA/yh72mDh6umUSu4mOhWTdU8DaM6XUsO20xR7HH/TAY
 lE2AQsIq2ECvmaIM5v3+cWuHGSiTBIqbd/D1GSPw8a4IbTUmHJ1vwbN5KmsKT+zS7PBd
 VmO+ZH5dNK6HKl8B0m1c0D/SeFnNP8WfLnr7i9jiwoQ/Z3YF/c3IFNfjz1CggHZdxXJ0
 rjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=pP1hagqSYDwwA2YjZ9gfdWx6xDMgnbeyBHGfmn3+DE0=;
 b=UlatUH2X/QyeYYB7YxzOwXKr7VkFiuQH9j000mMosIeimv1VsQJcr6yli/DxMvO2oj
 c60S/exM9gKT5eyzdbJhATz4wCyIDF1clAbTr9ngP9sAlL0FbKKHz5F3Py3DJIGT9ylT
 5oYsCAZPgB+xoCz4UtwclViV2MDzCnOqiuRYeq2s31iML+wEbaUKjeOaJ0N7Mj2bOJrP
 wGOmEmv8GEBbUrFc0fBycgkhGFnKGGrIoR8vKbR4MZgz279ChzABtg20PYPbwQpqnkik
 igrbg30MCbw6xyfiJq259j1LEDh4KmCbYp9thcwp57e6ii1SUbmkhBQvdxQ7IdsTgoiG
 VD0A==
X-Gm-Message-State: APjAAAW7xg/Wlnxenezufs+7vBv2HB01ine12ursV27ro/N+oGBnNJ0S
 w2zpTheaHAiHa8oZb7OvZlE=
X-Google-Smtp-Source: APXvYqxGQ8NGtMEivlA2YMXllL8k/BlL9MhGxi6roCjQUTeTt1nWxWnBdxfsHtWDSc0zFy7zNwVsAA==
X-Received: by 2002:a17:90a:bd8f:: with SMTP id
 z15mr2370209pjr.54.1576538842771; 
 Mon, 16 Dec 2019 15:27:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k9sm593648pje.26.2019.12.16.15.27.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Dec 2019 15:27:21 -0800 (PST)
Date: Mon, 16 Dec 2019 15:27:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v11 14/14] hwmon: Add PECI dimmtemp driver
Message-ID: <20191216232720.GA17398@roeck-us.net>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-15-jae.hyun.yoo@linux.intel.com>
 <d75aaad9-ae07-feeb-966a-899ecfe9d4b3@roeck-us.net>
 <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
 <20191216212120.GA12089@roeck-us.net>
 <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 18 Dec 2019 11:17:37 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Randy Dunlap <rdunlap@infradead.org>, Tomer Maimon <tmaimon77@gmail.com>,
 devicetree@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Eric Sandeen <sandeen@redhat.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 David Kershner <david.kershner@unisys.com>, Wu Hao <hao.wu@intel.com>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>,
 Johan Hovold <johan@kernel.org>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Alan Cox <alan@linux.intel.com>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 02:17:34PM -0800, Jae Hyun Yoo wrote:
> [...]
> 
> > > > > +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
> > > > > +{
> > > > > +    int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> > > > > +    int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> > > > > +    struct peci_rd_pci_cfg_local_msg rp_msg;
> > > > > +    u8  cfg_data[4];
> > > > > +    int ret;
> > > > > +
> > > > > +    if (!peci_sensor_need_update(&priv->temp[dimm_no]))
> > > > > +        return 0;
> > > > > +
> > > > > +    ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
> > > > > +
> > > > > +    switch (priv->gen_info->model) {
> > > > > +    case INTEL_FAM6_SKYLAKE_X:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 2;
> > > > > +        /*
> > > > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 11, Function 2: IMC 0 channel 2 -> rank 2
> > > > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 3
> > > > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 4
> > > > > +         * Device 13, Function 2: IMC 1 channel 2 -> rank 5
> > > > > +         */
> > > > > +        rp_msg.device = 10 + chan_rank / 3 * 2 +
> > > > > +                 (chan_rank % 3 == 2 ? 1 : 0);
> > > > > +        rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    case INTEL_FAM6_SKYLAKE_XD:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 2;
> > > > > +        /*
> > > > > +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 12, Function 2: IMC 1 channel 0 -> rank 2
> > > > > +         * Device 12, Function 6: IMC 1 channel 1 -> rank 3
> > > > > +         */
> > > > > +        rp_msg.device = 10 + chan_rank / 2 * 2;
> > > > > +        rp_msg.function = (chan_rank % 2) ? 6 : 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    case INTEL_FAM6_HASWELL_X:
> > > > > +    case INTEL_FAM6_BROADWELL_X:
> > > > > +        rp_msg.addr = priv->mgr->client->addr;
> > > > > +        rp_msg.bus = 1;
> > > > > +        /*
> > > > > +         * Device 20, Function 0: IMC 0 channel 0 -> rank 0
> > > > > +         * Device 20, Function 1: IMC 0 channel 1 -> rank 1
> > > > > +         * Device 21, Function 0: IMC 0 channel 2 -> rank 2
> > > > > +         * Device 21, Function 1: IMC 0 channel 3 -> rank 3
> > > > > +         * Device 23, Function 0: IMC 1 channel 0 -> rank 4
> > > > > +         * Device 23, Function 1: IMC 1 channel 1 -> rank 5
> > > > > +         * Device 24, Function 0: IMC 1 channel 2 -> rank 6
> > > > > +         * Device 24, Function 1: IMC 1 channel 3 -> rank 7
> > > > > +         */
> > > > > +        rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
> > > > > +        rp_msg.function = chan_rank % 2;
> > > > > +        rp_msg.reg = 0x120 + dimm_order * 4;
> > > > > +        rp_msg.rx_len = 4;
> > > > > +
> > > > > +        ret = peci_command(priv->mgr->client->adapter,
> > > > > +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
> > > > > +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
> > > > > +            ret = -EAGAIN;
> > > > > +        if (ret)
> > > > > +            return ret;
> > > > > +
> > > > > +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
> > > > > +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
> > > > > +        break;
> > > > > +    default:
> > > > > +        return -EOPNOTSUPP;
> > > > 
> > > > It looks like the sensors are created even on unsupported platforms,
> > > > which would generate error messages whenever someone tries to read
> > > > the attributes.
> > > > 
> > > > There should be some code early on checking this, and the driver
> > > > should not even instantiate if the CPU model is not supported.
> > > 
> > > Actually, this 'default' case will not be happened because this driver
> > > will be registered only when the CPU model is supported. The CPU model
> > > checking code is in 'intel-peci-client.c' which is [11/14] of this
> > > patch set.
> > > 
> > 
> > That again assumes that both drivers will be modified in sync in the future.
> > We can not make that assumption.
> 
> As you said, both drivers must be modified in sync in the future because
> each Intel CPU family uses different way of reading DIMM temperature.
> In case if supported CPU checking code updated without making sync with
> it, this driver will return the error.
> 

... and in that situation the driver should not instantiate in the
first place. Its probe function should return -ENODEV.

Guenter
