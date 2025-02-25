Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1ADA4507E
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 23:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Xrn0tpSz3cXN
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 09:51:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740517955;
	cv=none; b=UM9JJA1Q1QHs5b0eUplFz2HU/IWmAq84Wdnf+pHb4THyfsclKEXMimQ20CJw2Eq4w0xyYA9X98Kw2e9eDVY9Mb/dpLob0vIuLrE0axkH1YZ/7gpMb6bfCAdrS3R8QQRJiudcANmQ44/1ekhPh6s42B5UEoYlbURTTZ9ljPdPPrCc0398iI6MD9dpjkdusNfzRF8GFSpscyW5nzpCWJOkE5Z8euE0RqNez2B34AB4bY8wgiXdYkZLa64fDVrhDOjP+o3VMfiB8RSavn9diHxAqit8lZ/pkmw5+vRCx1YEtUlohpJzLOtirpmdbM6K0kPAOqdS+Cr0HTO9h37Y2on5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740517955; c=relaxed/relaxed;
	bh=tFiJKOq3JjGeoM/FsLGVl8qMQHUgBUN3DL8T4cVjwXg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hru5rgZbGsLpBFYkhr1vdOj96zv3uCnhz50tSPHmdYQIwr7Xy7d87CE0Xsy8FSz61uSs5OwOxJd6juOl59Z5mXAcWzhsMjwsczEpiPZcmaV44iUC6r7KMgajedLv7w8KCqTRgio3kJUnY+TMAJ0pMBgqedeJ0TW1lPv1tqv99yfkGWN3yt/NRLDP5Bw7b3pYQsfHLyP2y0/MubBbK6/cmxtJ7aSdm5JYnCXtns7OwD/gy/sK4SACahn65XkMiuoPBjpu4K+P6XsEgIxZNF3Cx6bbi43hpGzPC1wAXlsHmqoWKkX593E8LsOltOMjFQSRoaruwD4lH/npDYHgode9GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2Vg572L1z2yLJ
	for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2025 08:12:31 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5af513.dynamic.kabel-deutschland.de [95.90.245.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9487361E646F9;
	Tue, 25 Feb 2025 22:11:55 +0100 (CET)
Message-ID: <a4066857-01e7-4172-b141-4c5f8bb3540b@molgen.mpg.de>
Date: Tue, 25 Feb 2025 22:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
To: Eason Yang <j2anfernee@gmail.com>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
 <20250221090918.1487689-3-j2anfernee@gmail.com>
Content-Language: en-US
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 26 Feb 2025 09:51:02 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, kwliu@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, gstols@baylibre.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Eason,


Thank you for your patch.

Am 21.02.25 um 10:09 schrieb Eason Yang:
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> 
> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
> independent alarm signals, and the all threshold values could be set for

… and all the threshold values …

> system protection without any timing delay. It also supports reset input
> RSTIN# to recover system from a fault condition.
> 
> Currently, only single-edge mode conversion and threshold events support.

… are supported.

It’d be great if you added a datasheet name and revision, and, if 
publicly available, a URL.

> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>   MAINTAINERS               |   1 +
>   drivers/iio/adc/Kconfig   |  11 +
>   drivers/iio/adc/Makefile  |   1 +
>   drivers/iio/adc/nct7201.c | 487 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 500 insertions(+)
>   create mode 100644 drivers/iio/adc/nct7201.c

[…]


Kind regards,

Paul
