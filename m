Return-Path: <openbmc+bounces-846-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D9C373B7
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 18:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1tPq1VRqz30Qk;
	Thu,  6 Nov 2025 04:59:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762365583;
	cv=none; b=gJ2iPffvCPZjy/EkKmVOnrJ+dglGdMgc9AkgeBoaPfTFuvTiOzvkmg3ozPdVcrddnl9jTC8j00ShLVSkjd2zOGGOhE//KGsRrVqV2c6CwzFquWgcd5Ltz6eS+vpzzXqCxh2PO0ivzdfnKEm5+LBvCODREeTdkoL8+pBXL4VRuatwRUXXAgP3rFyWidiw5LGOtJ28Ns43dUbEa+jBtcoQGD+VbmvwdfAMXqubJ1VN+LTfkiy2kJdfOL3hp1rnh1A4L65R1ol/UOfhrI7qSJh8Orx13UHwz/Xe3v2H7dwBu96xUKVZ8R0NaZK1zpGrXwJtgdtT40UJkRJmZjQroOoVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762365583; c=relaxed/relaxed;
	bh=062oThQfCiAu6RO0RcHJ7UUZxncftkZICnZEVJAs4lo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=n1Ls5ZcxfTx1xBDn/n5SZ5T5V8iiBxpHMXxllKu484k9KhdHXh8c72kr8RVPHrAQWuqJMAwl49cP5I9RQENBGaYGfWucHWBaeq2+pikWnnWGHslEYXb7l/g5cb12zYW1aVv+TsO2cdr0Ddbo+j3/Bmb8DhB0Lo9rtF84dXS8CUeMMF9tz3Gv6aCiAsepcS+soVm4dQwR1XRkIWKrroU11RtItiiN/fPgxgZXVdorJ7sqFLXCp1MeVZGX3ywO4/qcBYzvCv6aDjKA10BKijanfumBSAQ4SwiZJ7NBRzqtoBbhK4aBjwPXvaZ6wNKktVcziN20eeaJDV+19xnW5lZvzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=by04EZmb; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=by04EZmb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Thu, 06 Nov 2025 04:59:41 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1tPn5tr5z2yrT
	for <openbmc@lists.ozlabs.org>; Thu,  6 Nov 2025 04:59:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762365575; x=1762970375; i=markus.elfring@web.de;
	bh=062oThQfCiAu6RO0RcHJ7UUZxncftkZICnZEVJAs4lo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=by04EZmb9B5HoFKhCSyw4Dn6UJ2Qdt1M8VZlEe4yWjngvoD453vFbjnYtLII5Q+X
	 nPNOa1FxUtXd17gU7vzbLeelm8/NJQh7j+YrgZEFwOFb2JhlNAtXYAeRV15exaEWv
	 SlC8NKPIVVWchGKozfoVEZ58IthVzV7GYuxAU7FwLXVcciG92vBNUZ9dW30DE/lBo
	 L7Lcqi9fTCM1xMTX8gJrGeNjiX5ndZr4eGgPKpUFOdpITRInK+Mu6P2IesLV5xjjV
	 2H24iVm5RK98JGz0UYXtmoBQCfo4mfmUfgJpt1gGBZbCfvugN9AEA9zIcW2qUfRsx
	 3y4LOHoLMYSpZDjWBw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.250]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMGuC-1vYuvu05by-00Hw0X; Wed, 05
 Nov 2025 18:44:32 +0100
Message-ID: <1a234e96-b41e-4f6c-b23c-e57426ff6aa1@web.de>
Date: Wed, 5 Nov 2025 18:44:27 +0100
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
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-spi@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: lkp@intel.com, LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Mark Brown <broonie@kernel.org>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap()
 memory
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jot5tDQJo1L36cL8JOgENIFyiccB0wx8wvoPXnsvMFO7Sx3sCtA
 qDsGMlMmcQ2G1W/kFisssqz4WcxD4S2GeztozjrMc1rGpu7fh2OWU3/BgAAJUJXdzmCVbdC
 pVeLpxkUuTNVafWFIW+Axl3Qcxz9aLGDtldOUyCrvVFAi/vxOOA9Q47kD1xIZECAE0gl0JU
 Exv31t3Z6fWyvu8AgoBDg==
UI-OutboundReport: notjunk:1;M01:P0:iCXgxErQn6Y=;u5Pe+iBkrX9CLkGIHgw2H6bx6L6
 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
 ddiGy92Up2L4Vg==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> The AHB IO memory for each chip select is mapped using
> devm_ioremap(), so it should be unmapped using devm_iounmap()
> to ensure proper device-managed resource cleanup.
=E2=80=A6

* You may occasionally put more than 61 characters into text lines
  of such a change description.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.18-rc4#n658

* Would another imperative wording become helpful for an improved change d=
escription?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.18-rc4#n94


Regards,
Markus

