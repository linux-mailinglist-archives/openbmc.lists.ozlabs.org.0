Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B890F9D8
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 01:46:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dohAyRhp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4KyT0sgkz3d2S
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 09:46:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dohAyRhp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4Kxw0FpGz30VT;
	Thu, 20 Jun 2024 09:45:55 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E2FFC20154;
	Thu, 20 Jun 2024 07:45:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718840753;
	bh=0rrDHG6GQ3ZPTEMZclkJ055uBnnGraoUKkuWTroE0M4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dohAyRhpTxw/33WRPJ9Mdqdis4t5zfM7m2r0c1IETWbFfzW8o2bc/bsGafowhlV+P
	 m/WrOnFyU3V75fhr0Qx8HqVZ6QE+fosWnPRsiumeCwa++ucEUuXhZsHtgRQm3I+25n
	 ip8KqrtQD0qK1ZmJqi1OXHP2lLhvM0Z7z4Dkxr1JWYWrbO5XY721k5aLSkc7e8wwsM
	 uNlh4h54Uq00W49U6koh5DWhhaidC7eT1saqTfxy8+lX1j1agu7jl55Arxt1QaC6GP
	 SnujxMbHVrqYL6GepkQZvk2+7yhur9jCzW3W5AzVDLJxJwKHbNep5WmKl1apYVHMEF
	 ImCCkpwzBusCA==
Message-ID: <4eb1830db13cc3aa8d23d2c6075f744c0b75bda1.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Jun 2024 09:15:48 +0930
In-Reply-To: <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
	 <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
	 <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Joel Stanley <joel@jms.id.au>, Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-19 at 19:24 +0800, Potin Lai wrote:
> On Mon, Jun 17, 2024 at 3:33=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> > > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is=
 not
> > > needed on the management controller side.
> > >=20
> > > To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRC=
LKO,
> > > reducing the number of required pins.
> >=20
> > Hmm, I'm not convinced this is specific to NCSI (and it's an
> > unfortunate mistake on my part), but we do need to call the groups
> > something different than RMII[34]. Did you have any other suggestions?
> >=20
> I don't have better name for now.
> In ast2600 data sheet, it also mentioned "RMII" & "NCSI" together most
> of the time, is it ok to use "NCSI" as a new group name?

Perhaps we go with "NCSI", because the other thoughts I had are all
much less succinct.

Can you please add a note to the description in the binding that
discusses the difference between the RMII and NCSI groups?

Andrew

