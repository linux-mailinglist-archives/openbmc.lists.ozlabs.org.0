Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B059446FD
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 10:50:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=NR5WqHUj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZN2H0cXFz3dRB
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 18:49:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=NR5WqHUj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 326 seconds by postgrey-1.37 at boromir; Thu, 01 Aug 2024 18:49:29 AEST
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZN1j1yC1z2yvh
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 18:49:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722502165; x=1723106965; i=markus.elfring@web.de;
	bh=CQp3GKwVPbSykTP1zO1E1wRNFejm6ihvP+iQi9limaM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NR5WqHUjLJLhReTTF/D+gByXFftR9HHAhtBtzteEV7dbTsjIpvMgH5On5rxtq2pm
	 wnY2Y/x6OuUmw3zan8X/VUIfZ/V62ri+rk420C0Xcdq9cDv+vHPR8t1ouE7u3QrDs
	 EACeHYNofO3Kjh8pyTp0Ox9sUIUomTTbBET1L5s7fNE7eM2cGhGu8de0eyG1SiLcV
	 fLBditWVYipQU56Wr9WJp1rTIa/4hp4rfAFpqGgZLkp7nS8O55fygX7HTcRKxEhm2
	 htgOSMeVJQEWSRIawmoC7MayBpp1v/NPnjkrDogsxzmO+vfiPuw9c1PWKHi68AeTN
	 JjX5pvpkCvJyBLojSw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1sqQ3c0u9q-00OTWR; Thu, 01
 Aug 2024 10:43:22 +0200
Message-ID: <73180782-0f78-4e49-9528-172c5d8c43f6@web.de>
Date: Thu, 1 Aug 2024 10:42:56 +0200
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
X-Provags-ID: V03:K1:YbpryX/+DRSBcSU8+6mi9njm2dNI/wHtDq3ZO/tUM/dvgTqvWv7
 PRIO2b/RloTIK74+SjBlfZz4U3GEwueyDeLwrICYZNSCc42UmxVmQd0xQPk3IYR8VNpe0Cr
 iHVEm36QTzZBriqrHSbT9p/1a1egGIgCzVJ+HQt3VdO3qt2C3MqyEcmgKi59AEfXZ+UJrGt
 ql6EWwXjyQ62IVoZwMjmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RhssAMpvZB0=;3ycrl5rTXampSsgnV6l7hEAW9me
 arjxKB5w8300OUVGJmXRIAug1ulOYHvLNfLsUahwVkrsOyCi4QAmB3N9PQIb8B9cBXGLXMepw
 2EBvzVbZfDT9hT03IrbH9WiqQBQl4Pwd4njjl+6kjo6oDjOzdU1b1EUTpdX/tnTienyuJXY3M
 iG1EkrSIiap5iVOeb7IHxvH0WEKoPW2TGAUfXXqhWdFl6xq39ysSZe+W2ucYKeEj5moz8+i8G
 BklLb3zRmziFUOKaz6fLCvUa8R6cLEvW86z8OiwkvAUTkCrBiqQjhr8vWzfDAFowAiee6l7ng
 vtG16SBp04hzVGi/FneflFFVN0zFv+JxUy4Z60REiKzHue5cI6WHcRmivKw8XyqOtPEL72mxe
 zT8VM7Ram01ZC5i81XDSeK8lw0EqxIysqTPFIDLDTF2uwa6xZFcwGCYK1Oz4x2k1az3upogI6
 Qm591y9PQv7ZtHO25jPwdcgBzMyGW5Su1YPOkeDd/r2obpTWcCUuAkNOLbnb3Z7rWpfQ7DULn
 +g67MmHVTks9qj1Zjy+4eUQTqxRSMZjoW7sqMAlEU5JQYFQS7cpqLEKV4/dQWOx+NBanK3Gbg
 IxfceVjevqHB+wgIwNQoEuVAeR7enut0b3cbmohtBievXhKYer07s2UPwWaPssTv65r6EQATW
 nMK9PZHeCMxE9Ow4nt1wkOSZMoLlinqiiFLsNKDEHaeznIRZ+kuQA8Fpe+KRShPJ05TNlVS92
 Yev1ijGb/ncMXc+JoLcX9zK2XBXCo+K5MAufKXlbLd0gRBFiDfJsA3rd9dKNuW5aaB1p1v8z2
 1Fx0jM+0Jrtmv+2qAfqcBK+A==
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
> +static int npcm_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
=E2=80=A6
> +	int ret, i;
> +
> +	mutex_lock(&master->lock);
> +	spin_lock_irqsave(&master->req_lock, flags);
=E2=80=A6
> +	npcm_i3c_master_set_sda_skew(master, 0);
> +	spin_unlock_irqrestore(&master->req_lock, flags);
> +	mutex_unlock(&master->lock);
=E2=80=A6

Under which circumstances would you become interested to apply statements
like the following?

* guard(mutex)(&master->lock);
  https://elixir.bootlin.com/linux/v6.11-rc1/source/include/linux/mutex.h#=
L196

* guard(spinlock_irqsave)(&master->req_lock);
  https://elixir.bootlin.com/linux/v6.11-rc1/source/include/linux/spinlock=
.h#L572

Regards,
Markus
