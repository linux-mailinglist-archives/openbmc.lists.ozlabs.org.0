Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DC944773
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:07:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iZp9GoyW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNQM1tdkz3dLW
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:07:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iZp9GoyW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNPq275Dz30V2
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 19:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722503182; x=1723107982; i=markus.elfring@web.de;
	bh=H1qeNadCSH/lJd7w//ysMiO5jE1nOgWC2onDSyEJdJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iZp9GoyWT3jJtox6YIvkeZ1DRU6J9TbSmM73lTebtLTdpBoMJrQo6V2xAkdkC0lp
	 jGjXkPqLBDN222/MnLyD2bxaZhs5ofwD5g70dUjGJ/dOOOIGp7pmZ/PGej/zF1sTF
	 TYd903/VjN5GYBjfNqK5kY0GlkLabuEFuVDEh8O1rDhOgIYjqEjfb6MU3kyqUqlzq
	 hXn1MuNx/4WUf2t6tsJzwULBgdT3Jv7kTT2OVKR5p6uJZ6/M3pOPm2xZTf9C/HwDv
	 2jWeSiskEU0YZN9mdaLBzxhDvsdwpUNWLydBcvkCxU00QRLEk4Ccy95ko6ruupGlH
	 a1Dan+w66fu+ehx1vA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzCEB-1sLTif1wax-00tFVo; Thu, 01
 Aug 2024 11:06:22 +0200
Message-ID: <910f96b4-509d-445e-8749-ee4240849b0b@web.de>
Date: Thu, 1 Aug 2024 11:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Chiang <cpchiang1@nuvoton.com>, Stanley Chu <yschu@nuvoton.com>,
 linux-i3c@lists.infradead.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>
References: <20240801071946.43266-3-yschu@nuvoton.com>
Subject: Re: [PATCH 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cv1GejkDpGglUQJHRpjeZ/Lyh4VjytkKH29sJnL6xwtkrklUbmg
 rz34ZyrkbnO71Fl+Ryg6xj/j/CKo+YKc8nB9JsbQlBwP+xGN3Ni10jJHaORjHx9radPbJE3
 9yf1hqqs+QxzxvJV+I3HLqxY7RoFLDlYr8n4dF+JxhyiIIdxc5yYI2bAO3NeLFMMC3pjZYZ
 RDu5WYRToRIFl4QDeyIhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XCX5bElp9yc=;llUWJOUHi/eBMuE2SjC8YPKvOAI
 WakZfsGMV5d/3NetHrU7cmtG0BIrzsJ7aOKs66jQTvfpZQXBv7CUlunPMSNRhGASBh0QqqQFj
 wr+wMubfeRkfhr8WwxGf63huYT70qJsY3q3Tm9elbu35fYBheSu8mE9FJUn103vBdJsD3zCLc
 /TKh5YkYhUtKl0eHhhtDcweQNdf+qMCoQ466OX6WFDhm537HODpgEYX6jV8z7gbc2h1GJzgLz
 UTlF5B4B+Y4BYMkifZ86y709STwUAmxl+ueoIZsaSTa4q7ePeZMbAGJBa4VoZLF1wXFJwhO7n
 HgO8nLd8y6wQJ36b+6CGVxnag4MdN7VUhwAQD4JSHRlpzdkP78WQAFTazpIHa2JZxpJAy6mO1
 qXlax29sjw639DPdPbU8DjhtA8ZNu359/DMML8Rif90+19+LSAtkkg0spxynahhPDAKsojSAb
 KE0LDaGtCT3UuDxO/hG4dgm93m7bUfxPLtU1/wGMEGUMqqVFVuLt6hhjuYmHiscyu0JDLkq6S
 DWipx7R1fkmrNXQ6MW878YuFNOrGcW4CwD5Gjz/Nag5Vm0gyB/vBnca+50emg8ghxlMUVoKw8
 d6YzgP99C/2le87Upi2dfwll3itVTE/VL3Hcci007cz8aSu7KJWlnRaOgvxyCrClCv+EJy2Ff
 Zw5Jn/IsNks4Yq5+NlOuRcQ8VGLJCkOeXEwS0oWyc9k0KBH2fp+kLx5zibDbwfQRHloKBl26Y
 QvN4gX97lsNeDjI47iw61zcrfiU2hgshAJfqhON5m14GtYxboNQBURoCRzCWHPampdIz2qC/t
 mfuD94XnjXMy2pGDoTeWnrdQ==
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
Cc: Joseph Liu <kwliu@nuvoton.com>, LKML <linux-kernel@vger.kernel.org>, Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> +++ b/drivers/i3c/master/npcm845-i3c-master.c
> @@ -0,0 +1,2364 @@
=E2=80=A6
> +static int npcm_i3c_master_probe(struct platform_device *pdev)
> +{
=E2=80=A6
> +	return 0;
> +
> +	debugfs_remove_recursive(master->debugfs);
> +
> +err_disable_clks:
=E2=80=A6

Please avoid non-reachable code here.

Regards,
Markus
