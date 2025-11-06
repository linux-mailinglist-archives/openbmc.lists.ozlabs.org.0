Return-Path: <openbmc+bounces-848-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EDBC3950E
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 08:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2CnS5T81z2yrq;
	Thu,  6 Nov 2025 18:02:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762412572;
	cv=none; b=FxKIqfjCEEW0leVDulvu8B39lIOWpIf1KPGOnVkQkQbnu/P0G9jRokEYCy5jg/1LSgxjH612z/XarGccL62e+4U8W6RzP49WiIH+08vcubIqCwfUeuGes6iZBoq4e2ORARUuw1eBtWoSyuNe/88fOA073FlrqIfthdUp0ZQxJ/TrhEO0jHJ4z5YHi35PdgLV6ENxzKGntLklqY79EwsQQZ7Gi+CQFLCSpyGBwj7zg4M2Hb3Kpse5/hH034TSeZnSnZQBlGHuAVuT8z1sDOrXIczJVJXaaaSVTm3IW1aN1mFL04ADbzxxBFV9pncVPZzmh977McYfI0OrNgzh/7jsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762412572; c=relaxed/relaxed;
	bh=wJRRyH1biVoQpuVUMOuahV2xY2HkN9uZ9WuOiYC82es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRx7XLUjcji8HT4wmyrXCeVrayQqWFRaERhHtrS86JTW+33uH4yRjX8Hc0ns17eIe+mzZF2f4Qldq7QEuodN+KGrRslpo77V65Bq3f8ZpbixCymp6zhIqtT+nYEhu2K5uDKvYgR3l87TMF/7/iAvBXAZAqpzl1PKAUYFI6BuNLm4z7XuiX/wT/7r0Udp+GzFpOOvLVQbfCsUnrz0s2Osp1jm0lOloe6mGAfzzTEoXQ0PFId4cJbzEsGcUKC6ZEyOcHb7xHdtp/stXvYdZq+CZQYBcf6hAPVLkmSFOn/kQ/pqdTN2MBF/touzACINp8WApH3OWulbS+zobfIUouCl6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HJTTxuzf; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=HJTTxuzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 47891 seconds by postgrey-1.37 at boromir; Thu, 06 Nov 2025 18:02:50 AEDT
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2CnQ2BlZz2ySP;
	Thu,  6 Nov 2025 18:02:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762412542; x=1763017342; i=markus.elfring@web.de;
	bh=wJRRyH1biVoQpuVUMOuahV2xY2HkN9uZ9WuOiYC82es=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HJTTxuzfxLdgb8c6b1Myhjh8Tr3DTCONApo5RD7nmPuleAzbNd6t3nrEhZ21VKYO
	 UK9LpFhk6nPd0O3WedENt+Jso1PqnUxM7UCf8fwIwIhyvd9k8G29bYvTOaEOZOWwZ
	 DjcegI09Qw7mBHEz7+6HpQT1D7qd2rf5W91oyEUlplm19unMcyoePfsaoqODXyRJB
	 nV2jFdreoRbF4SVvlKDyEvfnMvYpH1uPb25VO+9OKiOYcT9emOV/+gex6uq7oAj3l
	 pyj3E6cPY0y0vqmp8vesVN8u1MnNnd4KmaYd3l/CzD97WpN+UFTh9oz0/8D6xqrKk
	 hM8IL5GWO5SdZBliaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.214]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDMzM-1vPBCS2fZO-00Ccl8; Thu, 06
 Nov 2025 08:02:22 +0100
Message-ID: <f8edb81d-f38a-4756-ab58-6bffd9ac501e@web.de>
Date: Thu, 6 Nov 2025 08:02:17 +0100
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
Subject: Re: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap()
 memory
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-spi@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: lkp@intel.com, LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Mark Brown <broonie@kernel.org>, BMC-SW@aspeedtech.com
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
 <1a234e96-b41e-4f6c-b23c-e57426ff6aa1@web.de>
 <TYZPR06MB5203380D58961A36922E0436B2C2A@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <TYZPR06MB5203380D58961A36922E0436B2C2A@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wPBf2YQTiaXxrbnaV2IYm9gh7k0gc/6cfk/pxby3/CaDEx+9fkv
 yEuq4IajSOXl9D9jXeJueK75jbZTAofY5DH/UBnvtprpln6OhDTnK00VdXGPtpfFG8lJj2w
 NZ3qIymA+C6O+ZkKj5EErsHPzTMD8dfHU1c5hBdhN6V6OTX4wvRwVVZqdhSYkTOHAmCA/kc
 zfHnuqtjsTQRnhKLE3Y8w==
UI-OutboundReport: notjunk:1;M01:P0:DucKiG8aLfs=;U+2xBOGRHUc0OQqeiQil5V0Cgpi
 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
 +PHuos7ffGlrxw==
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> How about change the description to the below one?
>=20
> Use devm_iounmap() to unmap memory mapped with devm_ioremap().
> This ensures proper cleanup of device-managed resources.

  Thus ensure?

Regards,
Markus

