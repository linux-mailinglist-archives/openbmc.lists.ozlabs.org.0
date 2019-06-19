Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FC4B021
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 04:33:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T8Bm1msqzDqhN
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 12:33:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="m60e4ew5"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T89r1H8SzDqLJ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 12:32:31 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id i125so9957529qkd.6
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 19:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEn0ozy42HRHcx85VB8P4BCsNKiD4S48ITPodMaQS8Y=;
 b=m60e4ew54TdNflpfShWjhLdidsMlvt5m+EkIl4AM61I4kKgiAMl/MJadqCYDwBl2wn
 AbtrFuYAx2hft4+xHUrACpy0kFC91OnZrwxL8Fagh39tyOnK+O3m7l1+Q1je4cCbF3+F
 efPZISkTHrNYeMS4/HLO7wVE6Uq8zN3P/ucN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEn0ozy42HRHcx85VB8P4BCsNKiD4S48ITPodMaQS8Y=;
 b=JnCG0CT80m6RmGILI/ZfFnUFMITz9tZ+QFSXSZGCfbReInG7YuSCGgHjNh6m7Qr7yl
 TWYzZfH+3n4AZ1V+or83STkO+L1/wP3qzC4Vx2LKAR8kLiOhLWb6KqEpPWEQWKngNXen
 5a9BTvQ6oJY3mbOyBfnHMjOVzzDtDxWuJ0ABAHTTzIiBTG2mUG5WSMOcFK2UoiLCNPtE
 9dKnpCd2aKAfZkd7YGGS2ENE09+Zh/2j48RMpVXKLftbhSl6/kkDAG+IcE8IuXJ0uGuR
 z2rE4EP8y4uEevh8vxPRJ5Al5SAecYdGV0wDvgFKxDq/0KZmUz+AlHIYD3+KsyU7ivSz
 GgfA==
X-Gm-Message-State: APjAAAUfEgqGVdhQ0eqeGOQW0w3740pJFUqiRbTgb0XLtvTqa8IdbDsc
 /Rls6roLGBD9Xlj1cRbK6+XCecuYM1aU44hbe4s=
X-Google-Smtp-Source: APXvYqx1FWSf8RpBwPsce7fHAaN/8dmLLC+mJtBzh2PqkbagWyxYysLaQkOZBYEioUbrPGQGmX02WYgpHx/P6LIrDE4=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr100002020qke.76.1560911548147; 
 Tue, 18 Jun 2019 19:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-2-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-2-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:32:16 +0000
Message-ID: <CACPK8Xc2fzsZoZw3d1A3LG60qMYuUAJAdUXWnHjC61561pbhUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] phy: Add support for the NC-SI protocol
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 at 01:37, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> This introduces support for the NC-SI protocol, modelled as a phy driver
> for other ethernet drivers to consume.
>
> NC-SI (Network Controller Sideband Interface) is a protocol to manage a
> sideband connection to a proper network interface, for example a BMC
> (Baseboard Management Controller) sharing the NIC of the host system.
> Probing and configuration occurs by communicating with the "remote" NIC
> via NC-SI control frames (Ethernet header 0x88f8).
>
> This implementation is roughly based on the upstream Linux
> implementation[0], with a reduced feature set and an emphasis on getting
> a link up as fast as possible rather than probing the full possible
> topology of the bus.
> The current phy model relies on the network being "up", sending NC-SI
> command frames via net_send_packet() and receiving them from the
> net_loop() loop (added in a following patch).
>
> The ncsi-pkt.h header[1] is copied from the Linux kernel for consistent
> field definitions.
>
> [0]: https://github.com/torvalds/linux/tree/master/net/ncsi
> [1]: https://github.com/torvalds/linux/blob/master/net/ncsi/ncsi-pkt.h
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> v2:
> - Fix endianess issue when setting MAC address
> - Make checksum offsets easier to read
> - Instantiate per-phy ncsi_priv structures
> - Used update ncsi-pkt.h version to include SPDX header

Thanks, the updates look good.

Reviewed-by: Joel Stanley <joel@jms.id.au>
