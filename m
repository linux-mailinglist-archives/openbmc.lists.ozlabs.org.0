Return-Path: <openbmc+bounces-341-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF65B064EA
	for <lists+openbmc@lfdr.de>; Tue, 15 Jul 2025 19:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhQbk27M4z2xd6;
	Wed, 16 Jul 2025 03:07:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752599250;
	cv=none; b=F6IYenaelI8ihRSUwZgVkfop+5x+9BHuw9U9GoWdlcec2frdMXIV5wxmPlxNwfRNiJFQZA3kVLTcp4qg4FVQeG2m3BQkIC/fy4pXq5nsNxSaJMaZ4ikzEvJHTC5eP8E6PydP2VFcg68eudxuzcvw5xeltPweVfCLhwCBoDhJdvnu8Gm3AEQELfE/4WKf1LX+A5lHwdz/3jx53FblTEwvjxaGVgqqvZwcz3xrEDM1OAoU/6E6BGlJ9x4O1PQa/Wd5EeLrNf8QOa10LmEwjNcXZTvK5S8TjkpDY4x2mVfbf7f6CMkwh4QGrPRW+5MwA1nEBcq3bGKG4gUJphkay/ZzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752599250; c=relaxed/relaxed;
	bh=rGs/l04TD5R/3ve+iKBgA47mAtv6wQTleh/5nWpeFXY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=bm3jAirTRezfrP65H3ejuGyn5wQZMI+BkNQT75/6CcRJdBvWIkWhHXtW5P4umRGLQtTbpp446D8jOszYwQ26eDX6+nkvhmWw153iP2etkDIj752LBg6awk9JWNWDpjwMScEoMkuBtRnUPllUA1G2r1vYaUWd/vu3hef/9GtiUHFU6sEmejBr34UJBwFRaBAuItOGymKVqokd/1wAGxarmtvLwcNua9jKPNWccVE3AIaLLPpXmaKu92W2zviuTSvKORCToafIrBavrvcHCM8HxUHiLGrvXZmYuirvGtUdNnLpNp3qitmqxk+zsgXPWBouNlJNJYsRrMyjzsDqaNrXsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Gms+X0Ob; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Gms+X0Ob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 390 seconds by postgrey-1.37 at boromir; Wed, 16 Jul 2025 03:07:26 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhQbf2yMcz2xYl;
	Wed, 16 Jul 2025 03:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752599233; x=1753204033; i=markus.elfring@web.de;
	bh=rGs/l04TD5R/3ve+iKBgA47mAtv6wQTleh/5nWpeFXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gms+X0ObcYEH56yM90oN8j65PCTF8VNtlG5gbjvb+OqIq3qhg7k7YODEEBjRj20y
	 ktFrlTgko9DqhtJ5eC/XEkP7asrPv4pnODzjaI/RUgACL+XqUaTluWoB2J2kFQKBW
	 /bi0Z0k1AaujQf9YIH6pobcFkE77bhs2+P53ijj9TcCLSpVjWULvMtHIF2U+ZNM71
	 qUbp1ft3Z7O0zD/iG1sUuwjGbb4/EPsSCYzk8btK0erwZUbu9vcPf7irZMd4SDeko
	 BVbnH+T1t+m+5EGc3RPxXNKlSa2Cd7DkVTdgytLP5+t2jtcWtRq41ME7+6jb/UX8f
	 vaDVqMwkFC2rHKGmqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1uG5Qf1ZaL-00VKQl; Tue, 15
 Jul 2025 19:00:40 +0200
Message-ID: <8fe0f561-ef44-4ec2-9b93-f73105bd67ed@web.de>
Date: Tue, 15 Jul 2025 19:00:27 +0200
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
User-Agent: Mozilla Thunderbird
To: Jacky Chou <jacky_chou@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, openbmc@lists.ozlabs.org,
 BMC-SW@aspeedtech.com
References: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PoiZJ9fSzSlWKLh1vwNyOAzkuNF7hTRNV71wlCsQn9g9VWcuxTx
 nT8JNwaatT96O2Duhbk0shm1AnqD4uQPhFU12ISegzxBQZh3+6CXUa5B7lNmbliSmSeZm8S
 G4xWGpI8d1VQASPeeVwHpTZK5ZBwxPjT7anBgPmC4d2Tui/pGWvOVuFtKIpaPfsuZYgmH0J
 v9SrV1YYB8SF8bevLSxeA==
UI-OutboundReport: notjunk:1;M01:P0:dltKTgujAqk=;G33VzvogkYGATuj3pK/oweWwyHK
 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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

=E2=80=A6
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1137 @@
=E2=80=A6
> +static int aspeed_irq_msi_domain_alloc(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs,
> +				       void *args)
> +{
=E2=80=A6
> +	mutex_lock(&pcie->lock);
> +
> +	bit =3D bitmap_find_free_region(pcie->msi_irq_in_use, MAX_MSI_HOST_IRQ=
S,
> +				      get_count_order(nr_irqs));
> +
> +	mutex_unlock(&pcie->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&pcie->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16-rc6/source/include/linux/mutex.h#L2=
25

Regards,
Markus

