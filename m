Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E362DCFB3
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 11:47:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxTGR4xNKzDqV4
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 21:47:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QtT1U6O0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxTFW62h3zDqQV;
 Thu, 17 Dec 2020 21:46:39 +1100 (AEDT)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608201995;
 bh=Pue5gigex8jLd7iX7Y19MlVXPLtenFipsfqR9Dz+YM4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QtT1U6O0JVdEkWREGobtHZUPwRol1SATKWy0EPGBHuEaXkxfISISnMSKYD9wskfIE
 EVacZcGpuh+mZ+qWqMGlF+rdda8qETP2qmPLQyckTG4lDsYv5Y08lpwxZBB3WLQ+Ui
 /WeTNXF/5BVMSkINYM0MRupJLYrXJ+1cK4Bpq2c+20VhSnwJchvrFM2KPJo3M2ilaE
 /KtNSSTowXM59VW1/wQEQrYfxnSvveRplsgVnYuDilLtC9Ke+M76p9gEH8Wisc1His
 oM+Kmj7zYb3P8XCVqFfB6uHP6Ww8WuLIE6Uu9T5pM7J9bq0/bzqq2b4bSLSEdSrIEc
 e4ki9Pt2LUnmA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
 <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
From: Stephen Boyd <sboyd@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Dec 2020 02:46:33 -0800
Message-ID: <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
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
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
> Hi Joel,
>=20
> On 12/7/2020 6:39 PM, Joel Stanley wrote:
> > On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com=
> wrote:
> >>
> >> Video engine uses eclk and vclk for its clock sources and its reset
> >> control is coupled with eclk so the current clock enabling sequence wo=
rks
> >> like below.
> >>
> >>   Enable eclk
> >>   De-assert Video Engine reset
> >>   10ms delay
> >>   Enable vclk
> >=20
> > This is the case after " clk: ast2600: fix reset settings for eclk and
> > vclk" is applied, correct? Without that patch applied the reset
> > sequence is correct by accident for the 2600, but it will be wrong for
> > the 2500?
>=20
> Correct. Video Engine reset was coupled with eclk for AST2500 and vclk
> for AST2600 so above sequence was observed only in AST2500. As you said,
> AST2600 didn't make the issue by accident but the clk/reset pair should
> be fixed by this patch series.

So should the two patches be squashed together and go through the
media tree?
