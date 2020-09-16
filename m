Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BCA26B982
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 03:51:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brjk555sVzDqG0
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 11:51:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brjj6302bzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 11:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Z0EM5VpL; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Brjj56dzhz9sRf;
 Wed, 16 Sep 2020 11:50:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1600221018; bh=cg0+XMIVDwm6UW1sjhJ3hMzd11MTVSTgjFIntVwxuTQ=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Z0EM5VpLuQIFv/6y3/ffCXLydQZyGn34D003QMVvoa4mes24aFClphlmCG6VMf9+n
 dyJKtJUSksX9rhxQlHSY5EQBWgeEUzzaoKXWXtKJPJvg0f4vYf5rOocUWfi5hxu+oX
 oZyMKyBKPwaJ3uKWyAElpiuHBH4xCeoQ0MGfXLcSJENrZkOUILBqJ91zprjt1lIR9Z
 H1fmnS65/Ny9rccoZkrj+w6Y6xA208op9885AJBfWAgiUzVz9bP/AMmwpDxGqHdNAP
 ONkFrGBLTP8AqLc6pu5TZ0oCW14BiUrmyRUefGReQVlHH+H0xSldJ5Q2EbKHOp/qrE
 Tb6EkYEhgKuJQ==
Message-ID: <6ac9393f6e6fba55d8cc2ac5d188642dc08ed20e.camel@ozlabs.org>
Subject: Re: jsnbd: removing dependency of the state_hook
From: Jeremy Kerr <jk@ozlabs.org>
To: "i.kononenko" <i.kononenko@yadro.com>, OpenBMC MailList OZLabs
 <openbmc@lists.ozlabs.org>
Date: Wed, 16 Sep 2020 09:50:13 +0800
In-Reply-To: <3e24eacc-b8f1-cb0b-78ed-8bf3a81b1cc5@yadro.com>
References: <3e24eacc-b8f1-cb0b-78ed-8bf3a81b1cc5@yadro.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Igor,

> 
> Jeremy, I'm working on implementing a virtual media device interface
> type.
> Gerrit PRs: 
> https://gerrit.openbmc-project.xyz/q/topic:virtual_media_interface_type
> .
> 
> Actually `jsnbd:nbd-proxy` are depend on a call the `state_hook`
> which configures usb-gadget and inject the UDC. 
> By PR
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-bytedance/+/35726
>  
> the related feature are moved to the `usb-ctrl` tool and 
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/33492
>  allows to use `usb-ctrl` in `state_hook` script.
> 
> May I kindly ask, can we avoid the call `state_hook` in `nbd-proxy`
> and move to directly call the `usb-ctrl` from it?

This would assume that all of the uses of the NBD channel are to be
exposed to the host over a USB endpoint.

As far as I know, we have at least one usage where this is not the
case.

The state hook is intended to be a per-platform customisation, so I
would be reluctant to remove it.

Regards,


Jeremy

