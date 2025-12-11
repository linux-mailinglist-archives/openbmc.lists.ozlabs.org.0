Return-Path: <openbmc+bounces-1012-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8588CB7286
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 21:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dS41M3kZVz2x9W;
	Fri, 12 Dec 2025 07:28:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765484935;
	cv=none; b=I1Vn9a/EeqkR9JNyKpxxUJVx1IThez9hvoBqr2Kkc68pztWmqoMfx+iUujpxB+W1iVr9rk9hDGLqQEn2vJZx6AjvWPDQ0YD1r/Exkx1wNih7Sh/JxJek+TWVDv1xz87VtzPVr90qm1KJ7zKgFL1vN9b1BOevHuYx4TVeCRGAbY5suhsI+JoddbWd6eSS7GfPg07OGS4FLduWAfsRZIulk+MsT9LgW9yYgHw16WOc+F6W6JAE3VzY+8Tx3pfhv9tO28qn/R+99/um0cTN2Q6MzvuIqIgWGJGMkfrHPKcPzax4eMKYUgvhCnBxcVII/Ppk0L5bMeQWhjwesbGGdpAzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765484935; c=relaxed/relaxed;
	bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS1b2xDFkVuUB+sFA3AFr+HRrAceFUq9y/DB4+umQlpPzlKTbaze8OwitTZIB+CgOcodHsZrgiPqRFY12SiC+R+qfhE3+CPNpLCzMzU9ljV46XTMAHuJ5w7Z5KyfhMyjAAkhifDNb8NSxfgky1ewik2CcYTa/k/lO2AHnZezW6wscy5L3tvnC54Jj+TFzfaqQfXy/E1wrCdHOUBUBhV0ovcYQ6XpXIknC+viarjkk3CRuQmSuSI6jzcW/xiqzewBOtBL3HEFYcCNYA0SJk3ZBss3IcOWLn8UKFsKfodEPlavNBrMSu4BRLcXfeWaFMyNf1h/M633fyQsAMIONv5qKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WK5sF6Si; dkim-atps=neutral; spf=pass (client-ip=209.85.210.171; helo=mail-pf1-f171.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WK5sF6Si;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.171; helo=mail-pf1-f171.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dS41K4k8fz2xPB
	for <openbmc@lists.ozlabs.org>; Fri, 12 Dec 2025 07:28:53 +1100 (AEDT)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso540586b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 11 Dec 2025 12:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765484871; x=1766089671; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=;
        b=WK5sF6SisZ0iGGJ+Ied5tB3vMY5MKismqXmCn1C8aah4dTZ1WD1dnK7V9aEisSRGSW
         amDcMk2J7AfOqLGsRK0FTzB+0DU05Sd2XgxTLoM7NGI3FD948IZGFzeUz5rzniKsCioZ
         5U0BIttgEs1QyZLHqkVFJu/+iNOWi2jhlkTSdUtYdfYH/EcW6G+XO1EiaLHWo6KWXcfF
         nYQ67Vly0PhR2BSClQ61hY6EowfTLSLZhzqDnjIAf2nMm3NVJFzC9uouyFK/zJ6FQ3aE
         TNvvI1BH2NU+qn+JjncA/++nDKUorGAsKu5wJsHQsE7QWh3ZtXb4M/iy+j0DTfFh17UW
         AD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765484871; x=1766089671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=;
        b=Im1OG1iRBuerJ7mhxrouyPekF5SGg7ACZLI/xznRvRjcrkGOUJNLHA2G6kkYieubiY
         WBzF5GUumqqVafIf1EA0+eswrDjSYy56VoLiDX1Y7E6lSYmJQBKHKD2ZqtKJLG2OjUsx
         imVIKKvy+c/Gy6A91R9LgXiaaQxMYHgqMA+4PQjQ7BsWHdLhp65rnbPT5p+TSHyLlwdr
         rjeuxmv5g0RA6W4tu7kFNajixr9ygXvOMI0UY1Gepb1h8wJoQ/KMhWSDgImT11OgAVmA
         tuEq6f3lJSKgjHUQNxpH+AdV/3Z3S+SG5C7zwft0zryhKPKXYQNf58+YD7n7V3m096t4
         /P/g==
X-Forwarded-Encrypted: i=1; AJvYcCVSZa4JOb89KKi2mmReKj5XTsGlU1nE2b6fyCB6aCTkE2wSm2/ktABFDUReTOxYiu6SRyDze6mm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFm5acPOkCci5r3DKvtBo0n8aZBUeYs9n7CqdGdaOyaq0RK1ZT
	kPQZj0bDeMM1ezng54TYSr47uZS91xCTSzkI8q9MVTkeLAvfw1ou42ty
X-Gm-Gg: AY/fxX774t3ZtlAc2jkiPsWu6RwHYzDdzrJYUy03NqcYPOLIyBcdA7ZR786sFWe1cGG
	7oWX+YqdS6FQk5fC8hMfjkY6l5Bnz5NeDxGoSC9/xLh6n2hcFVHbWMgITfO+L9e+Mu9EQAPdqx4
	EiCmUCc6GxXqnxazlBuZJKcYp9VagfXLOM9+2m0QDl/14bs9qOcjZbfRWaYaq163ayRS4Rwzj7F
	qa7q5b20K8e6+64BVnyjbIQQpO4nBswiosp2Rg29F/O5P+25kJr810QsF3EzJWBFgygHAl6mXIf
	J8h9zW3O/cK5d/ktpO49TlrET33nIAHizNNfrisrO97E0oO0XZ9K8QboOoxW7JTDXG7Yh4+on13
	XrA77HoRmDXP5S0b/ioTIGRQCuEsvfyGdJXFqG2Xl5vcdUoXBjUn13AWZq8ZSjoZp+X27nxsUNj
	CcnoCjn/UfAfVEQLQdNwiDl1pEcN6scGl27Vt6veV6kRwb9oAX4joFI+yInGE=
X-Google-Smtp-Source: AGHT+IHV4Iszd+K6pE+L70YOIdvHkZVJ03UYXalyKOYspoVp8AFbIBx4gAlLx501zb5azUo1ikN80g==
X-Received: by 2002:a05:6a21:6d89:b0:244:d3d0:962a with SMTP id adf61e73a8af0-366e0de878dmr8196886637.22.1765484871216;
        Thu, 11 Dec 2025 12:27:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ae4e3casm3142680a12.21.2025.12.11.12.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 12:27:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
Date: Thu, 11 Dec 2025 12:27:48 -0800
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
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/11/25 00:45, Andrew Jeffery wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I am not sure I understand what the plan is here. I am assuming it will be
applied through a non-hwmon branch.

Acked-by: Guenter Roeck <linux@roeck-us.net>


