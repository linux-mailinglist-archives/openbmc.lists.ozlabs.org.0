Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687C4A5251
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 23:26:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnjMd6m2Vz3bPH
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 09:26:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gugUXv6r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gugUXv6r; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnY2J1PZfz30N0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 03:10:45 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id j2so27519507edj.8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 08:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sd9JXtvswqiL8mWGThMlt1DTiPcnfbG+FXtfueuIbic=;
 b=gugUXv6rjyxt/fMhGwhKO3SXes+pEBO7WZbrGTS6qfm4s3WVDeDQDRj+0qD8xZrSNU
 1R30DmEI6iTzoBYfjeITU9x/22z+kgOch1XZmDMO/5F913/nwjeVkIlM2wEIU2zeNobx
 MtVmXHSXLJpKPx0SXQLfZjwb9CkevEJJwoIfN0mpIzVK2db7GsW1guHi/ehPNc/ze0p0
 Gd5BKI1cQd+VD/U8AYKZgrRo0njd5J7MwD9b5+61v5Z2j9etlZeWUtcdQEPhQfLMy/eS
 oJ9Vfwuwp22nSCOVvR1DJW4yJFuPX4jSBsJj/VIv1YFRmpv4Ap/ebmoo/YELxl02tPbs
 ZfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sd9JXtvswqiL8mWGThMlt1DTiPcnfbG+FXtfueuIbic=;
 b=N1FwR0LZCFwUA6DMfXWYSg/+AhJL0zgdX5hnsIffxhwBU5idouNhJPRi+4t86FgiX4
 6IsZ3rAIyNPltv5b9KbAXyBzmd+vjFxtImD+GFcI3ez1Os002eIby7edAi2njNi2a92h
 o+y3h5J8oQ8LSpGL3XFKaoSsQVAwNaD0cUlgAh/SRSEumPaXd0owA8fwICNX9tuQNS4J
 dt7wAubiEjagjrV7uElqr0klijPS85QZ6CoDf4FlON2Sx2hcXVOxj+hpRY4hhDE3Qr1B
 cgH1viVOKAHinxFxu3EpSYo6FWAWX5O4n8rNTNpsorebeqo9Isn3gpdQlPhnYMaSwHss
 ZqxA==
X-Gm-Message-State: AOAM53237/6zQDVamSxlXQO7si9WGx74eDu8dkxw77Ko6M4PE6yx5kis
 YKQd5FD66ZBBxWaFnvib2Bffa1gEylRBjtx6zWM=
X-Google-Smtp-Source: ABdhPJy6ICNYtkQ6rclOwtDzYzgsxwr90w3q4FiskTAxAw8hD1GNjaw8YmtSas4hwIslA2ORqKnCNEes2T4aiFUgj5A=
X-Received: by 2002:a05:6402:254d:: with SMTP id
 l13mr8947189edb.77.1643645438092; 
 Mon, 31 Jan 2022 08:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131032405.105204-1-andrew@aj.id.au>
In-Reply-To: <20220131032405.105204-1-andrew@aj.id.au>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 31 Jan 2022 13:10:27 -0300
Message-ID: <CAOMZO5DOSMXWK7BmfC2NVVLaZkyzsch+Z9tKsyKu1K+aPMd4_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add gpio_request_by_line_name()
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Feb 2022 09:25:55 +1100
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
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 9:55 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Add support for the upstream gpio-line-names property already described
> in the common GPIO binding document[1]. The ability to search for a line
> name allows boards to lift the implementation of common GPIO behaviours
> away from specific line indexes on a GPIO controller.
>
> [1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Please also add a user for the newly introduced gpio_request_by_line_name().

Otherwise, this is just dead code.

Thanks
