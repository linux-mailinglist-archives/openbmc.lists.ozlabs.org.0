Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F358BB128
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 18:44:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=jZAs1Vjk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWGqL6pM8z3dRr
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2024 02:44:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=jZAs1Vjk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 803 seconds by postgrey-1.37 at boromir; Sat, 04 May 2024 02:44:01 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWGpn69sVz3cTG
	for <openbmc@lists.ozlabs.org>; Sat,  4 May 2024 02:44:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1714754636; x=1715359436; i=markus.elfring@web.de;
	bh=qI/wYC/RyotTKQTORqzcTsleWbiY2bQQMWYFl52q9fg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jZAs1VjkEXHfb7n8YRW7j1ZPnALSVNGICJt0UlUJFNnVYSKS2BfSdBAsEWSHt37+
	 qofxHEgQp0kOe1Sjt/w1D3BS+fipGIEOGLnjsiGSEw04Lb2/j/Gmd4UcTL8TPVKk9
	 phkUU7nYZ+7YGDXXX5gfMmQR2lUs673jMyI5Zo8TFDfZYQ9jw4kmAQnCPXYyrxY6U
	 aefAbUNmRWsdNpyjbgirAuXhMOt7o2Q/dsd/jnDccxGJFMRn0nfJu4xohDriWLZwp
	 DAFhFwmwWBTCquw1PWxzdg/wp2OFAL3cwjK2uWImCD9UfqXwTdzWrk3m8a97APPU9
	 dMkBcVewMYdxkf8r8w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MkVsa-1sVAPu28Ew-00kLVd; Fri, 03
 May 2024 18:30:16 +0200
Message-ID: <f616ab40-68a1-4f80-9bb9-c80214d087c5@web.de>
Date: Fri, 3 May 2024 18:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jim Liu <JJLIU0@nuvoton.com>, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Dan Carpenter
 <dan.carpenter@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
Subject: Re: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QfKikTXkYDmDVNk692GaHnGmUB3CSL6kLdR/8/PnieOW7UxBWoN
 47KNl2ajuHpuJLCtpbBBDwt7Lr3lrpaZbDP1tn1T0OT59g9x0L4UG6Fy+CnvWiN4SsRbqUD
 7Sw+m7P8kK3KEJ9kXF0ku85VB61tTE7pO3f61+vu9KTacvPF0b1V7mx7KXpI1KdwetuI4mb
 7b9hmyaOHSogHJ9D3zDOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c5u0MJFXU/8=;uZxVmhQPOHV7LZDIa7xPaLxjspz
 eNR+ij3NkKFaEz/dIuk/mK6mbNdQR/y8oHuDm+Gza3lGiO1W4Sh/k9rDDlBhNugy/AbRJamh1
 nYcRpMXneiIfRFenLoDUEP+WlhriCIjmnO9Y+Rn+jQVtxHDO6j9tW5VQONkaNpvWwVSK0aGIk
 ClDVrlTfnpRMjYXliUKx2/XbDYmSrPQ0adkFHu1ctzBpvmHMr+Gu6tfhxSn7XGTfAnd7O34cQ
 mdCVtgxj/S44yvZGWY0JPlCNq8BVoAP1Cg0tkBoiUeDQTKUcHoSGzTvIG5gyxf30R5an9DCzf
 F7HZNwJLl68oEb1znYKwhvkkC5cEpNKATyXgvGAx4dvF0nrwAD1i3VNSzoTYehHGsL0EXiefJ
 HXaVXv2b2hmRi32JypWFRivPc/AMvZUiGkInC2nkZbFZu6EcEP1DlUlOn5mJw6lH66CGIO6mk
 2ZwW2bTfJXWn1O757te7VSmZrZw7WU0yleEc8m4mov6EyH1VS9siaIzKJ8WyOi01wWWezvs14
 PJL60wC+CL4qS4MMTonvxuFJ3f7+KKdAzB+0u8RxRzILP/T6Y9RXJ+9vvsUFzETgT6ujE1TST
 ejrsq3HtcslMkntcolcO/NkKgjfJ0F7XJVxJD8G2o+/CHfftowXS3I1Wg2vtQ/oHrxQ0QiTiE
 nYnK6XIFe57FqQ44SHNAyBFZCuxLhycsyA+9KtgWV4So0w0DAWCXZEtwYk+EdCVXQ+3AGo+6R
 DsdrWMGwOHRMpCGq07P3IA++DFQ0jNLU2EpPh9hWiJJXvQgxwY3Im63QyBOAIEIWPBIG40P4B
 MUF7T0MJOzfGhu2VnHaFCXOmxLmbXTFWFQ+vXGUVSZtcTfemrP3JtwCPTnWK5yIeYA
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
Cc: KWLIU@nuvoton.com, Jim Liu <jim.t90615@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> The generic_handle_domain_irq() function calls irq_resolve_mapping()
> so calling irq_find_mapping() is duplicative and will lead to a stack
> trace and an RCU stall.

Can a wording approach (like the following) be a bit nicer?

   The generic_handle_domain_irq() function calls irq_resolve_mapping().
   Thus delete a duplicative irq_find_mapping() call
   so that a stack trace and an RCU stall will be avoided.


Regards,
Markus
