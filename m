Return-Path: <openbmc+bounces-425-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F343B1FD26
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 01:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0Z6V51Njz2yMt;
	Mon, 11 Aug 2025 09:41:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754869298;
	cv=none; b=d/K6jZEAmgHakfILaL/SVYR6BPf7QxzzQWeuguKBltz5s3IRCoHNuQ847Pw1EsM08pPhusQxFqrlfWV9LdVuLaGzceYxdYcNbFl6D4JMoA0E06w7/dIwhLpkR8hdSZnUGwwLS2Gv9myXCxno5+Rv7G9Guvnfsm6Dbi/xaJR5oQrV3m+LaXptlWuT7CEfI5ya5LAYAqGLGa35OXMl1wilUiD44TOC4mpgy85XtGD3YjhXZ+GkxkFD1d1xiynFBsip5bey8W261729OOVzrt07LjuAO+7qZTpJLX+HaUMPyXYanGo5E0QEP5AlpOBA2t09V8NqGIcA0O/1ZW+XYCRr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754869298; c=relaxed/relaxed;
	bh=REzSVtd8E60Yj+5C6uLbwls/fB4MMHP0jIckVl79a/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BAzW2OKgzELTgFt0+dVUf4ZGUV323AQx696Br0lc5t+n34sK5+dQsBN2rRPXOEQp4PcwFsDkRsvJ/CVzXnxFyC2ik6YsuCDzb+u8055dEvyJxrPsnQ2/Tarq2gNVZAI0WI5wlesL6uDTuItVbnYschwqecKuqMw2c+Gklpxg+IN9N4475ZsfScgiMRNjjpeFkDJnDt93GRGUTrS6p0pPvOSsrxX7J4IZzWWo7YXxSWcSsDHe2l96A4gPfBFiZT6XDNCo/lMaMyWlQQ5vbca33KU0XPs2DXJwoGuo6/hpx8t+5kaR0tlU7ngSny7rzxCmHzV8qvoLO4i5dMMyjXPGMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mYLV4ywf; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mYLV4ywf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0Z6T5hz0z2xQ0
	for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 09:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754869296;
	bh=REzSVtd8E60Yj+5C6uLbwls/fB4MMHP0jIckVl79a/w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mYLV4ywfeq+jNyUuNyic9Smt4OUh9HcN2DFB0REpfgeydkDQfrpHK3EXQDtFTdOEu
	 QFbZUpbuOEahDLU/X4a3dgwBT6A3vKmBNx/ObWeYCTeKAdIX1IT4+kx1yHb6+ZTKRj
	 FkD+2MhIjdAMcUpw8r5ahLlueg+3Ezl2ueXqAXX86gsjdLQCWyL+pRD7UZHJvjjfH9
	 8TVYW5tlQBmviU36n13ysr8HKKHdbgcXXkRaOuxSg51Q0zSb/iCt9mO1I4UyEFQKxb
	 HvYvd5w51qWO/kgmsxnX9ZtYfHJkiRryBR8fy9si4O7kWEf/QyMGl7wtPmA2p5x/s8
	 gD634nlSuaSDw==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFC5E6A930;
	Mon, 11 Aug 2025 07:41:35 +0800 (AWST)
Message-ID: <d5137a265ef45b9aa88d15cdc8c168da86dbb7fe.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 1/2] hwmon: Add driver for MPS MPQ8785
 Synchronous Step-Down Converter
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Mon, 11 Aug 2025 09:11:34 +0930
In-Reply-To: <CABOy658yqYX9V+k=koX0VYLxhE1v=HGmun+NPqgtJ+HtKoRvXA@mail.gmail.com>
References: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
	 <b3c77e888624c2e1b2a6a6fc52d27d73e494b55d.camel@codeconstruct.com.au>
	 <CABOy658yqYX9V+k=koX0VYLxhE1v=HGmun+NPqgtJ+HtKoRvXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-08-08 at 15:28 +0800, Fred Chen wrote:
> Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2025=E5=B9=B48=E6=
=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:35=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >=20
> > On Wed, 2025-08-06 at 20:12 +0800, Fred Chen wrote:
> > > From: Charles Hsu <ythsu0511@gmail.com>
> > >=20
> > > Add support for mpq8785 device from Monolithic Power Systems, Inc.
> > > (MPS) vendor. This is synchronous step-down controller.
> > >=20
> > > Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> > > Link: https://lore.kernel.org/r/20240131074822.2962078-2-ythsu0511@gm=
ail.com
> > > [groeck: probe_new --> probe; add MODULE_IMPORT_NS(PMBUS)]
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > (cherry picked from commit f20b4a931130cb574c40563cfda0fc2cb944b4df)
> >=20
> > I'm not sure what you did here with the backported patches, because
> > trying to apply this series from the list lead to conflicts. However,
> > on the basis that there was no discussion of conflicts, I cherry-picked
> > back the changes as indicated by the commit IDs, which applied
> > successfully (though with auto-merge results).
> >=20
> > Possibly it's differences in the tooling for patches vs existing
> > commits, but some discussion of your experiences would be helpful.
> >=20
> > Did you try to apply your own series before sending it to the list?
> >=20
> > Andrew
>=20
> Hi Andrew,
>=20
> Thanks for pointing this out.
>=20
> I realized I was using the wrong Linux 6.6 tree when testing =E2=80=94 I =
used
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> (branch: linux-6.6.y) instead of the OpenBMC Linux kernel. That tree=E2=
=80=99s
> index.rst doesn=E2=80=99t include mp5990, which caused the conflict. I=E2=
=80=99ll use
> the OpenBMC Linux kernel for patch preparation next time to avoid this
> issue.
>=20

Thanks for taking the time to understand what happened.

Andrew

