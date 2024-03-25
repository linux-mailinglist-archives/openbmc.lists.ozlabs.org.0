Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262BD888884
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 03:29:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GgJfJ9is;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2xj36RDNz3d2m
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 13:29:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GgJfJ9is;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2xhT5Zbjz307y;
	Mon, 25 Mar 2024 13:29:13 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 80D0620173;
	Mon, 25 Mar 2024 10:29:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711333752;
	bh=h+6XaK7IxAXSBys2cMcf2r6FjybdgZqGRT5bDLSNFUc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GgJfJ9isOY7k62lNBAZZElfPt55iMk6k/yyazIYqTHP/jkuu8KG5ZZZBC+eZtaFE9
	 oVIcsY2oxJElrHqJxw3mILN0E022LooGgrmuwNSl9XI8ViH+GEo4GhLC/RDMX6h7QS
	 3+AhjniTgf9kMViuf/bbiuo0TQmrhmWuFy12l734dZOHwVTrcTWIKvxnL+AgVYBpoI
	 LKf3Z93yK20GOrnMpos1ZlUcSSbt9TZlOUTj12HV/LUdj5ELOkbjOp+SNaEKts5SXZ
	 5GunjCFSNV76ZdmCJJT0Nufqg6YOmmtNfDrmgRXmdX2BJD4FclCcPqofB8HkcwTDan
	 gU9mxszo53U9A==
Message-ID: <93bd01d104f752d29d182249773e83c230a3ab20.camel@codeconstruct.com.au>
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org
Date: Mon, 25 Mar 2024 12:59:02 +1030
In-Reply-To: <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
	 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2024-03-22 at 14:24 +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
