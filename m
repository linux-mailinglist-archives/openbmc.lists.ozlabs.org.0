Return-Path: <openbmc+bounces-844-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30DC34964
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 09:52:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1fGx0Bdgz3bmk;
	Wed,  5 Nov 2025 19:52:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=178.33.255.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762332776;
	cv=none; b=cSj+P/6GJYTrabjewACtkzT3dtbUV1hxaVua0LmjkjoTIqjAKb/RQDKGxzRWv7o2AU4RDKXOh9/yblwnLbE8sCpKSYDI7kmP8wPKwxv5nNKVgfceoHTcSfOtlrqMm89Yi7q86MM5d5raQMMqZReCggUS4IxVsN10lki48/odmJ1p5FeDJvAtSllCe+EqNLKtC3tYpmH1hyynV0ibgFs02Q+H4k1fnyxsf+I+HxacK+sevipChwRF2aSkvwbNaHVvMgX5Be7yowtKGBVegOrw/Zv/2qkMj1R412LNY+fOLxHHkoZ298JA+lfKPS5m3q2XT0hfzWOkSJgOPTd/WS3JCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762332776; c=relaxed/relaxed;
	bh=UzhJ0D8m0FjOLM03YsXKOaPpbsXXkuTeXHNIj12fW0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ys4xDC2WoHx8Vtvfz4YuvzLTEHLpzRDmoeqX7EdgskNUpnwFjyXeVVROVUJ1PRm8/rBERisnObuz+nt1scHSrAIIAA3isabMGS8+4vYgWmYopU4NSnMiJ/dcPD6Es71K6I0NPuocU3yhH/YNWUKMWwEYWPVDbs1MXFopjSBVncytw6V1xlTnreDbyxbGM6KOoJeHT+sJ1NQAE9aFnVCEfokGQSeGKC0eBOBBjTWYPd44KD+i6ad+U8Qg9qr9cBk1QebEPbdE20tYOts6nbFi3gPNXtkk1kWkZ2e3cO7UGGnCMY8Ym/OWXJeRspbTUJf3fpekbC7A+VsfBse3Kr23Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kaod.org; dkim=pass (2048-bit key; unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256 header.s=ovhmo393970-selector1 header.b=Bb1Ezue4; dkim-atps=neutral; spf=pass (client-ip=178.33.255.19; helo=2.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=lists.ozlabs.org) smtp.mailfrom=kaod.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256 header.s=ovhmo393970-selector1 header.b=Bb1Ezue4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=lists.ozlabs.org)
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net [178.33.255.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1fGr5T3Nz3bW7
	for <openbmc@lists.ozlabs.org>; Wed,  5 Nov 2025 19:52:51 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.254.216])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4d1fGh54yzz5xfm;
	Wed,  5 Nov 2025 08:52:44 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Wed, 5 Nov
 2025 09:52:43 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-103G005ce6bb1a2-7bc6-41ef-8de6-5c9013ba0575,
                    67C45F718E61F6068C46D45FDE48FB82D97FBBF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e34f80cc-1455-4655-b2f6-64264860072e@kaod.org>
Date: Wed, 5 Nov 2025 09:52:42 +0100
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
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <broonie@kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 19e21827-40f9-48a7-a6c1-3cc3a3a50470
X-Ovh-Tracer-Id: 1178817205650492338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTGIa25WpJ6T7W6ehLzRIX51L5OQjMn4sfjiiOiCnCKizGTNWHCFNg+x+Jd+3wOOG7V7UQznLOOI8UZVH3ZU7ZWSdOPFHpCwmLcv/oUjlS36BTUKGybDjpXph1U2RKA2f2Z8tVIety+zS8fa9wVg2L37rrR/mfWQRRwE9Yr6NeB78TQUPCXtap/0caj3pAFSCR2c+X4uKlq3x054QWnnbQ/mLZmNHj3huuNoaSWMT56BhIhanmM0tj/f/kgRE0Ua1+83dA9/8JqKr5xu46t5lXMt7K75kYQdPHdVb6jxznnA/qzZsMOG6s3inuAukJovaW/vw9Eb1bNeNNNbCFjjYZXqSp7oqwPA4feQj8oUACRZkYIR2AXrrKUhjJsbW0187sRseRgvXu2IrMUIYdvlTOornKdSRC8J23XKwYNzSol/wlHDwBNZHlUWRQvcoepA4ibpXuw1pFBONbm9jjwg2RgZHjuSitm5dLsj18WY7ph6BNe/T+yDtq/VeGDodTq31KQHacONMcFadNeuTLrSM1pwmnoCidDnyZ2NvFwFZ3uiWvV0OwuyTpHXMOe2eyE9bbXMZy/aoeKysqzgl9/YcKM61RU2VlV8Z0oUwj3U3N23LUgCGWeG6v70mojo7HhEg+sAWNM9dQvRK+7n5/5wJ17zZIRJaK5Ow2Ya0Jt42eZcDw
DKIM-Signature: a=rsa-sha256; bh=UzhJ0D8m0FjOLM03YsXKOaPpbsXXkuTeXHNIj12fW0g=;
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1762332766; v=1;
 b=Bb1Ezue4PwjjvMfO8iYDnkpvMyeohr8PhB5+2Z9M+EOrUAIUSA3DbfZv+hqD0D5sNONyJtJ1
 OI8l4ltkBOGWZNeulkgB06pRkz9ZyU3sHZtlbsPgSiUxpTb8O49bTjqLzJAjsXwAGVMg7XCIfr5
 KHctbxoS4uPbBoVcwjNcKrkgJUhVy8F4psb/UWlo+o+dRWVAWa/1Q4p2PYQcTeJvBgasAoT0wcf
 c4drub32rPIh7oLrEz47zx9HOUBTdfFk+Q1zs4iPAjm589XBr3domu6uos7Ee73llGN0x960+F+
 Hst9ck7xnxOUx0KsfVMK9KDgSxlt10iCO3KY7t4xtFZ5A==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/5/25 09:49, Chin-Ting Kuo wrote:
> The AHB IO memory for each chip select is mapped using
> devm_ioremap(), so it should be unmapped using devm_iounmap()
> to ensure proper device-managed resource cleanup.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/spi/spi-aspeed-smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index e8bd8fe6c4e7..179c47ffbfeb 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -396,7 +396,7 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
>   
>   	for (cs = 0; cs < aspi->data->max_cs; cs++) {
>   		if (aspi->chips[cs].ahb_base) {
> -			iounmap(aspi->chips[cs].ahb_base);
> +			devm_iounmap(dev, aspi->chips[cs].ahb_base);
>   			aspi->chips[cs].ahb_base = NULL;
>   		}
>   	}


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



