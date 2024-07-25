Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D843D93BC98
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 08:36:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b9kLlMqk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WV1PD5tJ7z3cyL
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 16:36:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b9kLlMqk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WV1Ng44zYz3c3l
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 16:35:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721889344;
	bh=x9GvAJaZ+Fn6uPq+iYakReUkjCfOIKJdudh3/ZrhyIM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=b9kLlMqk0uKyqLzSlmcW5k20K69+02JGk6QyTvdsMSUYvwORpfNlzDAfB2yxXsFuR
	 e6ulr+ZCJefy92rTO05FjB/5/+eDzMpTyxEMQ/f4rT3gzDwxKRcyQrgsYDRVU4R+8C
	 MiN1lmVxSOTsp16LUmHd7Jlg9UsKn+z7QH/5SfO+qaePfDP3FoCE5HlGZTMV+GwXik
	 TjZRJ6oAvBroFcSIxsmwtmLkK1fTP/zUSWxzm2nDc0bvqy9T1hFNmtUtMx75nvIHMj
	 hFHBDxUVms3Bbli9l7v1YhW8sxLOuPZ6NdKvlIaszjRmcyE4Po+00lJxrwy7KUxRx7
	 lSHqY/Vi3545w==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E13766AB4;
	Thu, 25 Jul 2024 14:35:43 +0800 (AWST)
Message-ID: <dce3cf89e2ee7e9f8fafb78e657696f640fdc671.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/5] Add NCSI pin group config to
 aspeed-g6 pinctrl
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, andrew@aj.id.au
Date: Thu, 25 Jul 2024 16:05:41 +0930
In-Reply-To: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
References: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-07-25 at 01:21 +0800, Potin Lai wrote:
> Add NCSI pin group config to aspeed-g6 pinctrl.
> Backport the patches listed below.
> Link: https://lore.kernel.org/r/20240531-dt-warnings-gpio-ast2600-pinctrl=
-funcs-groups-v1-3-a6fe2281a1b8@codeconstruct.com.au
> Link: https://lore.kernel.org/all/20240725-potin-catalina-dts-v4-0-aa6f23=
5a2e78@gmail.com/
>=20
> Andrew Jeffery (3):
>   dt-bindings: pinctrl: aspeed: Use block syntax for function and groups
>   dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
>   dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe I3C, USB
>=20
> Potin Lai (2):
>   dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
>   pinctrl: aspeed-g6: Add NCSI pin group config
>=20
>  .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 169 +++++-
>  .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 188 ++++++-
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 514 ++++++++++++++++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |  10 +-
>  4 files changed, 796 insertions(+), 85 deletions(-)
>=20

Thanks Potin, I've applied these to dev-6.6 as cherry-picks from the
upstream commits.

Andrew
