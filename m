Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E0913FB0
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2024 03:11:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B0wJkMJM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6qfz2Vfjz3cTP
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2024 11:11:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B0wJkMJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6qfM357Nz30Vs;
	Mon, 24 Jun 2024 11:11:07 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B46F2009F;
	Mon, 24 Jun 2024 09:11:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719191467;
	bh=giM+F77N/fKXGQck/K8NUqp4U74padZuVBdVaeLCN/k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B0wJkMJMMwDvuGBccHAsQSypDZTL9TbKy5y2qfw/27ULeFe6zzTNZITBUF1dLHocn
	 obsIrtSn0nDXcbv8N2wrqtn+uMZ1EuiveqpEjIHbuSreUhgbQagh0Tm7B2osE1mT0N
	 HLmlO61+blr9opB8eIx6KsrSwjfjLXalj0Dj+cEp4a/GI4HK0n6O6wzJPb9K+pI5kC
	 BctqaNcYXG3PZAXSOi6yH6Eu8fyrqykIuZQ0VnAmwc6su2P+xufeVAmcJgfWJk8FHD
	 QMipA4Mmm+Q/hSIiYFOY6USD6vdWw4Nmx/cA/qI9fdGyaV8mv+DC7eiZEmUtj8U/zr
	 dO7z/kXsNP6pQ==
Message-ID: <3083d7243b7ec79b78f47df962f9bd6189402727.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Jun 2024 10:41:06 +0930
In-Reply-To: <20240621093142.698529-3-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
	 <20240621093142.698529-3-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-21 at 17:31 +0800, Potin Lai wrote:
> Based on the NCSI pin table (Table 181) in NCSI spec[1], the reference
> clock output pin (RMIIXRCLKO) is not needed on the management controller
> side.
>=20
> To optimize pin usage, add new NCSI pin group that excludes RMIIXRCLKO,
> reducing the number of required pins.
>=20
> LINK: [1] https://www.dmtf.org/sites/default/files/standards/documents/DS=
P0222_1.2.0a.pdf
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

