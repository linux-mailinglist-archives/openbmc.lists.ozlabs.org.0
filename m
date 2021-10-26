Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271E43B9C3
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 20:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf0z30yqfz2ymZ
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 05:41:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=e7/zsRLg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=e7/zsRLg; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf0yc2sHxz2xT8
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 05:41:12 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CB2D44611C;
 Tue, 26 Oct 2021 18:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1635273662; x=
 1637088063; bh=Ps++ViWrNfVtatIH4lcZ/kkQcDfcKuAY2rMMAVwSzC0=; b=e
 7/zsRLgP48k3FPbhulBiruZk6C7lECCvSAwDz0CQwGsuFZg8l6Bd/EhMSTpZ8M73
 vwIIKzt1cE0onl2tc1WfsFs3KL8d71qb83SYs35x0Za+qG5s3o0XHQ/jTV8EI5pU
 JMUMs5e5nvkIhvQmLylNKJNzjD9g3oQ1Arm1BPgGFs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUKoWZ5H35m5; Tue, 26 Oct 2021 21:41:02 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 39DD845E49;
 Tue, 26 Oct 2021 21:41:00 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (172.17.100.104) by
 T-EXCH-03.corp.yadro.com (172.17.100.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 26 Oct 2021 21:40:58 +0300
Received: from T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df]) by
 T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df%15]) with mapi id
 15.01.0669.032; Tue, 26 Oct 2021 21:40:57 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Milton Miller II <miltonm@us.ibm.com>
Subject: Re:  Blinking of the paired LEDs
Thread-Topic: Blinking of the paired LEDs
Thread-Index: AQHXyoyTXCgpfO9IDkeDP7PfSxrOnKvlXekAgAA8qjA=
Date: Tue, 26 Oct 2021 18:40:57 +0000
Message-ID: <513ded71b5b541a4a06e978e5400034f@yadro.com>
References: <2f488f5e7e1140369a3663679bddd673@yadro.com>,
 <OF324F0F03.50C28783-ON0025877A.00618017-0025877A.00627501@ibm.com>
In-Reply-To: <OF324F0F03.50C28783-ON0025877A.00618017-0025877A.00627501@ibm.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.199.18.134]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> >
> >Does anybody have suggestions about any better solution?
>
> I'd suggest going a level higher by defining the LED to the kernel
> as single instance of the multi-color led class.  While the class is
> described for full RGB controls, I believe a red green led controlled
> by 2 gpios in one bank is well within both the LED and GPIO
> kernel specifications (I don't know if you have chosen gpios
> in the same bank or even if you are using gpios to control it).
>=20
>=20
> https://github.com/openbmc/linux/blob/dev-5.10/Documentation/leds/leds-cl=
ass-multicolor.rst
>=20


Yes, I've seen this feature but couldn't get it to work with gpio-leds.
I have concluded that gpio-leds does not support multi-led.

The kernel driver modification seems to me a little bit more complex,
but probably you are right, it looks like a better solution.

Thanks for your advice.
