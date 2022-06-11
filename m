Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2054D885
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmcf5d8Tz3bt6
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:40:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kEAxk8HV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kEAxk8HV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL2BF40tQz3btQ
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 01:41:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C43661138;
	Sat, 11 Jun 2022 15:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3327C34116;
	Sat, 11 Jun 2022 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654962099;
	bh=WarFohc9AefJgaCIQlkHm40D8Wfs78SeRMzjeAKfx4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kEAxk8HVupWHd5I6Rj3KedDoeCuYF35epsuBXMhaICxi8INQwZtjIZMawVF8FvqtL
	 JPcIuigeGH61rUyJFpIQ1APrwxcyg8DSF3EgKwOxHckL1YXY7xOVDHIdeOu5tzXVgq
	 DkivCQ5HeT/G1bmC2YkjnLQeQ0BkJ1l5mnty48UCr5Tm0t3mxhiMb6yEOioh5dcz33
	 caK4CH3CSp1ReI734M0SGWDo4Q37NAu1Qq3WDwqs6+W9WhI3FwIshlZ9sSmhctKfxt
	 My8E4nxFNF+Ywe8ZGhtM8D6WeWRNRXgT+gplAgEQAtHoXXgPawUVc8mFYOo9J7E/Ie
	 Bi1QYaLlMhxLA==
Date: Sat, 11 Jun 2022 16:50:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/34] make iio inkern interface firmware agnostic
Message-ID: <20220611165038.669dd8e4@jic23-huawei>
In-Reply-To: <CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
	<CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:37 +1000
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
Cc: chrome-platform@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, moderated@lists.ozlabs.org,
	"list:ARM/Mediatek"@lists.ozlabs.org, SoC@lists.ozlabs.org,
	support@lists.ozlabs.org,
	"         <linux-mediatek@lists.infradead.org>,  linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm  <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing  <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu  Prakash <quic_jprakash@quicinc.com>, Linus Walleij  <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre  Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,  Andy Gross <agross@kernel.org>, Michael Hennerich  <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson  Leung <bleung@chromium.org>, , linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>"@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 17:28:24 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jun 10, 2022 at 4:48 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jun 10, 2022 at 10:45 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrot=
e: =20
>=20
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com> =20
>=20
> Ditto for patches 26-34.
>=20

I'm fine with all the patches I haven't commented on, but some
of the generic fwnode conversions are complex as such things go, so
more eyes on them and the core changes would be great.

Thanks,

Jonathan


