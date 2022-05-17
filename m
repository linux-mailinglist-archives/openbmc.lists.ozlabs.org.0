Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6585298E8
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 06:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Nxk587Yz3brH
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:51:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=eyQrdRKw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=eyQrdRKw; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2NxL5Xp7z2yb6
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 14:51:18 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B0B9D48B;
 Mon, 16 May 2022 21:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652763076;
 bh=mjzamyTFjL4wMG/JFLuPyFm+5ZFupvUP1giFm2+EJG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyQrdRKwpKkxM3yXohLs8gfweCFKSlXo7dN8n9MME98oVnDzXRdnhc9XSeXLprqiJ
 Q1ipYNwCAP98Oz0O+fQgMNOcZbY4iporIP7Ngqd+UL3+MiNk40xn44UFFGKZ3EoECx
 rnm+WQdZwvMiXSZhHxHNliGf/MALhlwcIOTSUPiU=
Date: Mon, 16 May 2022 21:51:15 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ftgmac100: use bus name in mdio error messages
Message-ID: <YoMpw1WrKC+RBez4@hatter.bewilderbeest.net>
References: <20220517043825.26893-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517043825.26893-1-zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 09:38:25PM PDT, Zev Weiss wrote:
> Previously we'd been using a device name retrieved via
> ftgmac100_data->phydev, but the mdio read/write functions may be
> called before that member is initialized in ftgmac100_phy_init(),
> leading to a NULL pointer dereference while printing the error message
> issued if the mdio access fails.  We can instead use bus->name, which
> is already available at that point.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib support")
> ---
>  drivers/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Sorry, forgot the subject-prefix tag on this one -- this is for u-boot 
v2019.04-aspeed-openbmc in case it wasn't clear.

Zev

