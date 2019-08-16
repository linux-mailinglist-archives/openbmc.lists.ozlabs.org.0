Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E48319074D
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:55:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699w73xkgzDrNV
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 03:55:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="yQH2QSy2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4699R00nMNzDqWn
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 03:33:47 +1000 (AEST)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 766E82086C;
 Fri, 16 Aug 2019 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565976825;
 bh=iTWDKy7i46AGTrrCkTa1IC9HRZoGPU9Ot5ficdX+Qe4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=yQH2QSy2LVGYJfDgQnhKokR0BbtvYvrDV32d8I/eO7p423knqPRQmxBrtTVo5O7Ta
 RUsyrh7tBGeHnTHwn3OtWwga8a23vZ7geqX9sOLQQtXu7xn+E7S/zXMLfHrI8y8Isw
 iaBItVGnikwPApprJjYpt96Z/JSlVePWEzuSxdTA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190816141132.55060-1-yuehaibing@huawei.com>
References: <20190816141132.55060-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: npcm7xx: remove unused code
From: Stephen Boyd <sboyd@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>, avifishman70@gmail.com,
 benjaminfair@google.com, mturquette@baylibre.com, tali.perry1@gmail.com,
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com
User-Agent: alot/0.8.1
Date: Fri, 16 Aug 2019 10:33:44 -0700
Message-Id: <20190816173345.766E82086C@mail.kernel.org>
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
Cc: openbmc@lists.ozlabs.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting YueHaibing (2019-08-16 07:11:32)
> drivers/clk/clk-npcm7xx.c:365:48: warning:
>  npcm7xx_divs_fx defined but not used [-Wunused-const-variable=3D]
> drivers/clk/clk-npcm7xx.c:438:43: warning:
>  npcm7xx_gates defined but not used [-Wunused-const-variable=3D]
>=20
> The two variables are never used, so remove them,
> also remove related type declarations.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Maybe we should register the gates?

