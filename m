Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B27705F2992
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgsj15phrz3bhQ
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:21:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pswYYyvO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pswYYyvO;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfnHY5nwqz2xCd
	for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2022 22:59:37 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id b23so6475385pfp.9
        for <openbmc@lists.ozlabs.org>; Sat, 01 Oct 2022 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ffay6QHcfOr0P9N0Cih4/08+TLFhGiExUiJv4lMY7xo=;
        b=pswYYyvOfQfCLRGo1CxUFW2BDZ1clbZ8LgZsrV48O6SJfG7Glp8yoch/EH6mthFqEb
         5bXNf8kvls1aCI5A7C9vF6UsqnoxJmmCc7m9Vj1Wo8lMVzRrtNd7s8/TYkZAnYhY51Fq
         6Zd0qgJ52CRCd3rQ/5m8GyBPKh3XDvPK4bCmI8Zxe+WHLX48au0yKLiEHSfSSLvinG4J
         xnph3dw3bK5x6reLq0TqGflG/iiGxktowWMVxKcjIQggvsLKiz0XO1xOJZIXAggYi3eu
         7pDUEF0QRgRWaOIf/3xtbbgk6UGfEsWG6nnGxp8gw1+DnoKtyAVe66RjCpyfqNn7sIYk
         KWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ffay6QHcfOr0P9N0Cih4/08+TLFhGiExUiJv4lMY7xo=;
        b=AikaM9f5EhHZnu8PBId3xCX4irrvxYDpyOEgRaFMCUI7MxCpmqg9kiO0spUfVH2MRu
         huVkPvNh3yO8j7ARcLbgWOwJ4BTRlIC9qoAloFR5dh9W2RDqeV09pczaCFiwxdjSI1yx
         Q0wFdyr0ulxdlC/Eajoz3AyVD2y+va0w56zHeDORtsaQWnJ/ntomjVrh7FJygsc0DE/7
         x3cUPtC7LVOtzpPIJXTgNUIMkOmm4hUzmG5ez555gyfGiVrl73sN7BADwsnL758iICgO
         lE4dj/5UjIDgBrj1BCk5Av7Vesg5CXeIP85A/eKgj0pPBAPAaOeOC5Po5LNUnewC4f55
         qbhQ==
X-Gm-Message-State: ACrzQf3R7v5Abm7GuvTUStRFoCOaR8ZSxRkb5om9wgqKVhMOYyoIX19c
	LGKtw8GygvZBPyqNJQk2ACM=
X-Google-Smtp-Source: AMsMyM4peM46phw8DbztZr2o0snwG1Jyq78PMMuOiEZT+gfDnHjnAaYWjBGLimya9RfG8Pl0OktW3A==
X-Received: by 2002:a05:6a00:e1b:b0:537:7c74:c405 with SMTP id bq27-20020a056a000e1b00b005377c74c405mr13791536pfb.43.1664629174686;
        Sat, 01 Oct 2022 05:59:34 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-9.three.co.id. [180.214.232.9])
        by smtp.gmail.com with ESMTPSA id y25-20020aa78f39000000b0053e7d3b8d6dsm3700511pfr.1.2022.10.01.05.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 05:59:34 -0700 (PDT)
Message-ID: <594c4afe-17f7-8670-d5ba-ebdeca6a4b47@gmail.com>
Date: Sat, 1 Oct 2022 19:59:28 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v9 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon
 driver
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, macro@orcam.me.uk,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-2-quan@os.amperecomputing.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220929094321.770125-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Oct 2022 18:17:26 +1100
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/29/22 16:43, Quan Nguyen wrote:
> This commit adds support for Ampere SMpro hwmon driver. This driver
> supports accessing various CPU sensors provided by the SMpro co-processor
> including temperature, power, voltages, and current.
> 

s/This commit adds/Add/

-- 
An old man doll... just what I always wanted! - Clara
