Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FC8A4123A
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:20:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZb0J5Wz3gLC
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740238481;
	cv=none; b=RtYg3SsP8a420Urix0lKrkhwk7XD2P9VBNrdHnErdtTv5Y10rF5ixQESSmDbDLeGdTjAto/jWfjuNV4bZEqt0bRTr47KFj3jxSbwJAjiyx/xXER0r9v1Uw7LoChV/dHMwpvUNntqsK09z1+yOVYEv10yzcAMo5LycQu/d31EU40SRIZYH4XIun8w3kVS5rCQo18I/1PAkhrQIm+6TNGPAeME2yGXCjAcwdxQjfl+ITUxS54U3JFnHYKa2HuSJyEacdVXTlqo+vKRi07wVfFcA1KBnxia01amqffYp843qWSWtBRg+8PBXsNynicK2e7IAHm4CdywRFCBN70gUNsMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740238481; c=relaxed/relaxed;
	bh=yxbAecXmLrwblOzW5YnC9ZyQogRSkmji2QUa5GmQpH8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gXsb1b6fGbmxsb00hNvUiFoFsHSokcLcf3+WmieU3FtdZFPCl+nqYDikyop3d4XrdFapP9aw0tiWvlATugEd8xB+to+i56rK1ki+3n7tBOTWuKj9Bp6rZ+j9dSfIxMdN5Ygmot1RS14+BcibYz4rzWrvBFbl7ryor81kWaBIkm0YQU2zibtoDECfjyg8JFp8v94XIbFwab7E7cOwWGAoPWPhLD/ArxckRuo3kTpqgz4BpMUUW+EbaVdUpOsqomVwoMZO/v7LwNbyd1veh1Cx4vOYTdPOy462AzYHPaxpXCMPUGG7WmsXkLQ6+ndPBXlSiGKA2fCQhwk6tpV/iY9xVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AzvFCNgu; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AzvFCNgu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 521 seconds by postgrey-1.37 at boromir; Sun, 23 Feb 2025 02:34:40 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0WJc0JDVz2yVb
	for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 02:34:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A28461143;
	Sat, 22 Feb 2025 15:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE357C4CED1;
	Sat, 22 Feb 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740237953;
	bh=5FoHX3Ihpq6uQwdHsZ//hL1s5P1FmjObacFMhwq+9No=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AzvFCNgussSYkj6AJHZmpkSgkVM8zJgCfcLakUXfA5ll4Khb1udMQ7pYeY5zipDIk
	 IaUXihFP0TKgIsy9LBeMX2DMWl3DUxljiD7ZwTCBwopxXcgkRHAM2zhEzxCy6ifbJz
	 SGKCNW7Go8Uv1fqxpS5bqE4SK5KG9qrdY0EQMIGN8PYL7T1mWL9btLQQzozRRiyI4U
	 K/h8M6yLGNwzg1y0qzULTpgJJOAbNYlrStjsT+6rnriHdOUxSINve2fOHlWAWEgubY
	 CsXhsSot3MyUsSolxbcGasAux1BHRWJUP81LkqYnvpWk+0sLeklkFdhILIQTchZSXs
	 d8OfoyZOGyVVw==
Date: Sat, 22 Feb 2025 15:25:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v4 0/2] iio: adc: add Nuvoton NCT7201 ADC driver
Message-ID: <20250222152537.2a24d80f@jic23-huawei>
In-Reply-To: <20250221090918.1487689-1-j2anfernee@gmail.com>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_XBL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, gstols@baylibre.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 21 Feb 2025 17:09:16 +0800
Eason Yang <j2anfernee@gmail.com> wrote:

Hi Eason,

Not sure if I asked this before, but this is a device that seems
to be typically used for hardware monitoring and there are a number
of similar sounding device in drivers/hwmon/  

That raises a couple of questions:
1) Is it compatible with any of those existing drivers?
2) Why IIO rather than HWMON?

There isn't normally a problem with having a hardware monitoring
related device supported by IIO, it is just good to know if your
usecase makes that a good idea.  We have the iio-hwmon bridge
driver to solve the problem of a device than can be used either
as a generic ADC or as a hwmon type monitoring device (which tends
to have more alarms etc)

Jonathan


> Change since version 4:
>  - Fix comments
>  - Add interrupts and reset-gpios to the DT example
>  - Use the FIELD_PREP and FIELD_GET
>  - Add use_single_write in regmap_config
>  - Use regmap_access_table
> 
> Change since version 3:
>  - Fix comments
>  - Don't put nct720"x" in the name, just call it nct7201
>  - Remove differential inputs until conversions are finished
>  - Add NCT7201_ prefix in all macros and avoid the tables
>  - Correct event threshold values in raw units
>  - Add with and without interrupt callback function to have the event
>    config part and one that doesn't
>  - Remove print an error message if regmap_wirte failed case
> 
> Change since version 2:
>  - Remvoe read-vin-data-size property, default use read word vin data
>  - Use regmap instead of i2c smbus API
>  - IIO should be IIO_CHAN_INFO_RAW and _SCALE not _PROCESSED
>  - Use dev_xxx_probe in probe function and dev_xxx in other functions
>  - Use devm_iio_device_register replace of iio_device_register
>  - Use guard(mutex) replace of mutex_lock
>  - Use get_unaligned_le16 conversion API
> 
> Changes since version 1:
>  - Add new property in iio:adc binding document
>  - Add new driver for Nuvoton NCT720x driver
> 
> Eason Yang (2):
>   dt-bindings: iio: adc: add NCT7201 ADCs
>   iio: adc: add support for Nuvoton NCT7201
> 
>  .../bindings/iio/adc/nuvoton,nct7201.yaml     |  57 ++
>  MAINTAINERS                                   |   2 +
>  drivers/iio/adc/Kconfig                       |  11 +
>  drivers/iio/adc/Makefile                      |   1 +
>  drivers/iio/adc/nct7201.c                     | 487 ++++++++++++++++++
>  5 files changed, 558 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
>  create mode 100644 drivers/iio/adc/nct7201.c
> 

