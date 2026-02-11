Return-Path: <openbmc+bounces-1359-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EZLEZ4qjGmsigAAu9opvQ
	(envelope-from <openbmc+bounces-1359-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 11 Feb 2026 08:07:10 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233E121CA7
	for <lists+openbmc@lfdr.de>; Wed, 11 Feb 2026 08:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9qHW6gGTz2xlM;
	Wed, 11 Feb 2026 18:07:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770793623;
	cv=none; b=aXzP6ZcQLRLFbOInL/ffqjXpqDyVsKKNFhRTQrqtzHplFLbr4FqaAyYRzOgfH6ByWJgjnZbYMeBlmw+WvBMYlkvzK53YMEP9/MjC3BBxNM5kcpvpFC3LEB/+h/6jmDbVBsMFDmgF2jHuyzoK4MKhF2g29FXdGwcKIbJXDzt+dBv6TRixZJVE2oIaDETEwtr4qaEgQy6Bw6Jc+/wP7Am9fjMWPASaGp6bpskV7HzZlwYvv1xG6swNcPv/W4EWTh9RuYv8FNrqA2v7ys2d8VUwQ42uU9zDob8fngbZK3QvZMUXIsPbAGdfSf9EcOMRQRuk4SLNpjCEutkr4KUwNbEo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770793623; c=relaxed/relaxed;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OrSnpnrMOh2TlJOp3ke06p0k3s4IymrUgPTotvv6bv7hBeh83viD9tULy1/vbnr0YJ0Sl/CMSqje7aCQGx9NMg0cpmh4V5to/JD3EhREgeBsVKUJ5fxVHbalQd5abl80Qi9Ic4q4SwXrjwl/3wPRtQOBtA7ly/4RWRfl/e4cu7XsjYiTRhP9uOmbGzNYA/AHGRF/OIMFdpl3jJoflw/z0ZrPQfAAFmb2vPihVDUs0OOKs85ZzIcC7J/msYrBStXipVCLFqzTNCkc1iiCX8MMMrwIAgwyZnzXEJKHVxxpIvi7cmvFkIGUhJ06Ml/iwEBy5X5xLxDCGsZeL/uRb6gYHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P9M0s6tm; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P9M0s6tm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9qHV6GvQz2xSb;
	Wed, 11 Feb 2026 18:07:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770793620;
	bh=ekwU2eOw8Ug7JuWGM23DP3Zt8xIe9aWbc8KSy6O2ZiA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P9M0s6tmcbwCi6R7qtb9G7n9zjrlhTdWDjrCSNhFhzlYolQSCANRFcMHilkBkkoOH
	 8C5d/18JDioaWOfFnBe2EfO/xlBqrzgtBJAguPI3qj1EYxv7Dmr02z8pkSxyfXNGLT
	 csWtmJ1Dc9ePK7bk/9tlbaS/74ddev/TnjVEHKUALXGsFrOS4S7plZBx++8fxXhrVN
	 cyFEYZlQkcA+/xsPsE85UoTevoL6bMD6PQN9OJaBLQr65pYpJL5fJEtrpL5Hmov0wX
	 KqSDB4BjiWyVO2czOwvkUksWj133s+z8bmHW8NTQFEEyaY5vfYClOdMHmHyQbM0L35
	 /9wVgqf3VefZw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BEB226040B;
	Wed, 11 Feb 2026 15:06:58 +0800 (AWST)
Message-ID: <31a3283787df06b7b44796ef78cca3fd380ee18d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to
 the SCU binding.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,  Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
Date: Wed, 11 Feb 2026 17:36:57 +1030
In-Reply-To: <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
		 <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
	 <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1359-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6233E121CA7
X-Rspamd-Action: no action

On Fri, 2026-01-23 at 17:03 +1030, Andrew Jeffery wrote:
>=20
> Going down this path for pinctrl to fix the SCU situation will require
> some rework of what's already merged for the AST2700. However, we've
> not yet merged either a DTS or DTSI using the compatibles (and by
> extension, aren't using the AST2700 support from the drivers), so I
> hope that allows us to do a course-correction without too much
> collateral damage.
>=20
> A possible path forward is to:
>=20
> =C2=A0* Move AST2700 definitions out of mfd/aspeed,ast2x00-scu.yaml into =
one
> =C2=A0=C2=A0 of:
> =C2=A0=C2=A0=C2=A0 - soc/aspeed/aspeed,ast2700-scu.yaml: Follow the examp=
le of
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mobileye,eyeq5-olb?
> =C2=A0=C2=A0=C2=A0 - arm/aspeed/aspeed,ast2700-scu.yaml: We already have =
e.g. the secure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot controller documented under arm/aspee=
d
> =C2=A0* Retain compatible strings but require simple-mfd is not specified
> =C2=A0* Rework AST2700 support introduced in:
> =C2=A0=C2=A0=C2=A0 - drivers/irqchip/irq-aspeed-scu-ic.c
> =C2=A0=C2=A0=C2=A0 - drivers/soc/aspeed/aspeed-socinfo.c
>=20

... but perhaps that is too much churn for this stage.

Krzysztof: If you think the rework is worthwhile, let me know and we
can look at that design, otherwise I think Billy can proceed by
incorporating your current feedback for a v4.

Andrew

