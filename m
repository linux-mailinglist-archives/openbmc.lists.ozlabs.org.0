Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1591B03
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 04:21:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bd2Q61n8zDrC7
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 12:21:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZfSBy0mA"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bd1k16ByzDr0q
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 12:20:25 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id q4so356034qtp.1
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7rnR1qd4xgOUxyyaF6IjQnLml5tXyZWdkBe61/XKs8=;
 b=ZfSBy0mAR7LEIy8hyM1zGqml5g+qdngvkT5lgRQzobe8DZoZiyvOsHbDb4niMhGwPk
 DmVDkeIFtlyTEv8OZw8KneGVipNN4tY1Fkb6KDwQqloV43aVD3rLLppOikxeAWHkeGnh
 3Fk+Bj8lsj8Oq4jL9OGuEGGy8Sg1gF8Ch/qdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7rnR1qd4xgOUxyyaF6IjQnLml5tXyZWdkBe61/XKs8=;
 b=TAdwI+fNv8K79IBL+8ChEJJTeqR+RMaVi2hnzOFbftgJQ+t00mvgOIut0Vn0F/Gxgx
 KSXcnSsu2I2fTSzlC3jPv+ki7sxUTWyuUvaErnAhVouE1qmfBrEF8eE1BNh6ES5mWwPp
 M6NRGfGlwimy0HXRUlr9Dr97emOQKoWpx84npSW8w7WdncaR/RVjHZUfaU3zLVgPmQOD
 5TVbRE1Lq1NUHCl34gXu7EWYI4Gh7TH7eWa72+XbEoJF0vmqX8zHxEY1QQG8+y/snASd
 UBGOM7Pb3SaMLo1IgbiVsDVHRobJf3vivxoqRvgihdge7jQzckpQ7dFrhcixFGx2cNEH
 tfyQ==
X-Gm-Message-State: APjAAAUBCuLBBcKF20YBQAA2nwz3uvAHqJTdP1jj3DT+gwlH/gsEKjv+
 gLteWQqAnyPyX7YXcS35mD9M3PYLsyBeEti9aw4=
X-Google-Smtp-Source: APXvYqzlVVWIt46DHe3BSDVNFq99MZ4mEWM467ZlIV1gDI6a+EYmDAWabohjbwWZMa5JgJ25PPU/sJa8NkSQbWUN5so=
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr19146680qto.234.1566181222265; 
 Sun, 18 Aug 2019 19:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190816101944.3586-1-wangzqbj@inspur.com>
In-Reply-To: <20190816101944.3586-1-wangzqbj@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Aug 2019 02:20:10 +0000
Message-ID: <CACPK8XegTePdmykMzZHnW=g6hyEGr7jiW3TP8AvdzSwZGr=2gA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
To: John Wang <wangzqbj@inspur.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 duanzhijia01@inspur.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Aug 2019 at 10:19, John Wang <wangzqbj@inspur.com> wrote:
>
> Add the driver to monitor Inspur Power System power supplies
> with hwmon over pmbus.
>
> This driver adds sysfs attributes for additional power supply data,
> including vendor, model, part_number, serial number,
> firmware revision, hardware revision, and psu mode(active/standby).
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>

> +static const struct i2c_device_id ipsps_id[] = {
> +       { "inspur_ipsps1", 0 },

Convention would be to use "ipsps" here, instead of "vendor_device"?
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, ipsps_id);
> +
> +static const struct of_device_id ipsps_of_match[] = {
> +       { .compatible = "inspur,ipsps1" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, ipsps_of_match);

Do we need the of match table? I thought the match on the device name
from the i2c table would be enough. I will defer to Guenter here
though.

Assuming the device tables are okay:

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> +
> +static struct i2c_driver ipsps_driver = {
> +       .driver = {
> +               .name = "inspur-ipsps",
> +               .of_match_table = ipsps_of_match,
> +       },
> +       .probe = ipsps_probe,
> +       .remove = pmbus_do_remove,
> +       .id_table = ipsps_id,
> +};
