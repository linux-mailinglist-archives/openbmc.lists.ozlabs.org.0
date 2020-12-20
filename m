Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07B2DF26F
	for <lists+openbmc@lfdr.de>; Sun, 20 Dec 2020 01:09:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2yT50ZgzDqTv
	for <lists+openbmc@lfdr.de>; Sun, 20 Dec 2020 11:09:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nlGohQ9E; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2xX1Qk0zDqSD;
 Sun, 20 Dec 2020 11:08:15 +1100 (AEDT)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608422893;
 bh=UVTrMZxourzJKz+ucOr71OHfCIHAav4FVKKyWXHo1T0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=nlGohQ9EaQJER4bWhErBzsKFgu5gC0Sqqv1XmkzwNuK2iCYBEP/l/y4igLoCypsyS
 5tjtQp/SNtWi6kIHO9GioxQpfmFNkmuoqO/S6XUgyeHb2VzOCxsijK4Tqr2WsXKXn7
 QPn2MiVX7oK1x5xXBZ+7HRkOOOAoElcOieMkT9MlzFSZi3sXRnR9VroD5otNegiKkH
 XquF3cbLDZlkg6x1nXB6OyX7luKIhiKIzN/ZmcxHKXrFQlhFvbXeQr8harbCR6+c4W
 xJcRZSjKRPVwTOkgQT0d88BWbpjYDgD7qjUsXpl0NANdmbUSOJrs1SEXz1zpWWLRCt
 8PNKwDUzcKqxA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
 <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
 <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
 <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
From: Stephen Boyd <sboyd@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Date: Sat, 19 Dec 2020 16:08:11 -0800
Message-ID: <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>, linux-clk@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jae Hyun Yoo (2020-12-17 11:54:15)
> On 12/17/2020 2:46 AM, Stephen Boyd wrote:
> > Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
> > So should the two patches be squashed together and go through the
> > media tree?
> >=20
>=20
> The first patch should go through clk tree, and the second one (this
> patch) should go through media tree. Both patches should be applied at
> the same time. Should I squash them in this case?

If one depends on the other, and having the first one breaks something
unless the second one is applied, then yes they should be squashed
together.
