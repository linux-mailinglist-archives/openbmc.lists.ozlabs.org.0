Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA899DF767
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 00:10:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1jL04dYTz30g5
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 10:09:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732891842;
	cv=none; b=P0tiH7o1wxstDTNWK04OisHHfo/4hWcOVvPFvJb6CHvf/d1ad1yqsEja6gda9fITnRfosotb+/0lZZsKWSKyKVeMXsbB3JYhfzMRq+m3tkpXP33ciuk867hklVln5lpqXOiftxqLT1hxNSSwPBWoIRRpIOrNQYRvoBaYTOwA33IBM0rFStkQDPl+iXYW8c4sQXuRvIpuqmMMvsFAsIJX/MOOVLqGomXwPjotDNvPXgjTZUvder7NzG3nc86ignEy66os8ey7oXZaS9GJbnudzy5yIKoY6qsJSWvlGHMnxb3imyP8FE/2btNoFsAX0rqLatWHKnptgafhkv6HXybVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732891842; c=relaxed/relaxed;
	bh=x6BUgFKMvWqnE3HjIPVzbYBbQhrG+0D/ZXL7z6iEv+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngZ6/ciRjjCJTejUKZGBVfbgGSRdRdAHOjGtPUOR/S+9BPTEDv1B38ZdKu9Z2aHQf79mTWf0PLBTaXrFat7Y3LCGfha9Kdy46RFDMk2QAMMvZXkthFnfmbrUBr7XfhXRZzz/T1/zHVYVnRZjD37L/UotKjk6qhoewg23nfwZnMiYhnYdR+vA6ANf/3mI7BmzzvjVn8QIOmvIrBiQEZARPFeyd348951HmdNR1O1Fnlo7cxznflEnRQdr9DRe816gqLL6hNf8r52raRSX2qgbWCLlj7gHlr0Fn4IOH7x2+zO+aEocDyILjOTN0hc9RHPAHhrz9+ncvkDj2XXk+2OH3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=DitXCuIf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=DitXCuIf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0GM422zWz2xbS
	for <openbmc@lists.ozlabs.org>; Sat, 30 Nov 2024 01:50:36 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ea3bf79a03so872140b6e.2
        for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2024 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732891831; x=1733496631; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6BUgFKMvWqnE3HjIPVzbYBbQhrG+0D/ZXL7z6iEv+Q=;
        b=DitXCuIf6xGWsnEKZDhphrtk4V5ZCBOOOOmXD2bawejBNySbU9gegcH6X17iHeDdF5
         vYQH4DIUxWoiBy0cOeMu42icsG76OJxTq9pkIpT846DZCT2AJnB6h3i7+hZzL6pqiKhL
         HpKdQpGW7aZ2ewEToqy+aUbztBDzSUYAV6ri6584VHQ9t2xd953BHxtZPiv0fiNQaKh/
         WqWdja+BRfBgQvaCcQ9rHD5MVJjSbUFzaDjQo7usenZof/J2a4Cex85u+L0QGZfmVJDX
         YaQxGJuX39OX+UVm0H8MiqB6FvvLrcyX50edsHcRjrxqK8m0SJaicse6fNsee5BX5mK9
         d0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891831; x=1733496631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6BUgFKMvWqnE3HjIPVzbYBbQhrG+0D/ZXL7z6iEv+Q=;
        b=AmkkgAEUfZ8KWcWFpGJSQBzTlzlWoHlRwNv7umKOJAsuYUSEegU1mcYGj+p8SJw8kS
         NO4V6M1oS4QFRz2CyS2HmzzQVSyfLH+2l53r+JxmreGKXCmCw4O347q/n5/ajnHEEk+1
         CdR+OqXTr+6uUbGGsVFZeXF8Nh5FitsoA7a8ZPsFd9YM0ivomktkBfJASBWUe/VuViMF
         ooD2bxN2t09zzo3ibLJFmSV7KUwpeUlMc1l+MDBYalQ2hTsWLgsKBiyWSr2P+JGNBsnP
         +DxxCDowxqyJTUDi/lZbyU/lzCuSpImNVXXK4L44ujHS6zZyxa8qyFbYT+vLORkLoc+a
         nrEg==
X-Forwarded-Encrypted: i=1; AJvYcCWbPUYuzrplPd2NA/e6EnszvKEpGPHWdT8XVG2+slgQ4uolg3m+A1ChzAbXMN02qn6Ny+S1Cp64@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxptvSRUJfzEJOHiPqDl5Dx7An0LpzpVNFOwq/tkF/thP6KlXuc
	U8hckQDdrR8ROUuCrHnawJ2AWGKk9Eqy9KEJDFm5uH44srQ+M25Lp2/9fyUDRfg=
X-Gm-Gg: ASbGncszuE5EUo2eAMbSwlbqSQ6WUNuPlB4RjCu6YaCgm0suntUDs3zlyjT5Sc8hWi+
	X5oj0+8wdchdeWohCqNYEm23ejj/aYqDc0neFFBhPP1g5RAiWhhfMGmEDp3jFO4Mcs0B0lqZby6
	lBxvzT0HsHNZBvDVwdu6xivpmiN49aoTOLoObHW+8lxLLHnlF6zKCUA9tBOU9D3aSPT9fzGPzHh
	oeXmIzVzX+MxhCRU2FNHboVBgVnP7HpbwrPQrA4zRN9ALcUJ4Lrjsd4GCXW+tqu++u4Xn8fCixk
	qABqsVYLFYY=
X-Google-Smtp-Source: AGHT+IGVek3mzhHMDzBdQxy7s1b0Zz14fviIHcadw7BkAuoKul+rfGZmueHuYf7hYyYauL0qiEX+qA==
X-Received: by 2002:a05:6808:1829:b0:3ea:50a8:4559 with SMTP id 5614622812f47-3ea6dbb1d5cmr12276229b6e.11.1732891831338;
        Fri, 29 Nov 2024 06:50:31 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ea86036a2dsm743394b6e.9.2024.11.29.06.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 06:50:30 -0800 (PST)
Message-ID: <6d8e9512-2be8-4337-9791-0d956b0968c5@baylibre.com>
Date: Fri, 29 Nov 2024 08:50:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Yu-Hsian Yang <j2anfernee@gmail.com>, Jonathan Cameron <jic23@kernel.org>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
 <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
 <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
 <20241109134228.4359d803@jic23-huawei> <20241109142943.3d960742@jic23-huawei>
 <CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com>
 <20241123144750.43eaa1c5@jic23-huawei>
 <CA+4Vgc+rqnxne6saUgUO_kR6chX9+HZcb40_9dpO6p6KuskSAg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CA+4Vgc+rqnxne6saUgUO_kR6chX9+HZcb40_9dpO6p6KuskSAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 02 Dec 2024 10:09:41 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/27/24 8:14 PM, Yu-Hsian Yang wrote:
> Dear Jonathan Cameron,
> 
> Thank you for your advice.
> 
> I would remove the "nvuoton,read-vin-data-size" property.
> 
> Read VIN info can use word read or byte read, and other registers
> should use byte read.
> If I use word read for VIN info and byte read for other registers,
> I encounter an issue when I use regmap instead of i2c smbus API.
> 
> I need two regmap configs with val_bits 8/16.
> After I call devm_regmap_init_i2c these two configs,
> the error message:
> "debugfs: Directory '5-001d' with parent 'regmap' already present!"
> 
> Do you have any suggestions?
> 
Give each regmap a unique name, like "5-001d-8bit" and "5-001d-16bit".
