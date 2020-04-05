Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF519EC6B
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 17:48:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wJ4K5lh0zDqw6
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 01:48:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tP29YWUW; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wJ3Z4LhzzDqR2
 for <openbmc@lists.ozlabs.org>; Mon,  6 Apr 2020 01:48:08 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id a23so4913768plm.1
 for <openbmc@lists.ozlabs.org>; Sun, 05 Apr 2020 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ro6+KbefkXz+hPhP0Iqcl220cLZghODcgKlebnYOeYc=;
 b=tP29YWUW3x9WmSD+ejFt0USy7DlViex3SScBAv1194VeWEW5P9g9VXP7BMtEHS8w4o
 QPEfWb32O9gGWb9l5p2m/MwBZGd01bhZtG6jspoK0xjJae9sqlBh+KZssRbed9Z+QCdE
 ibfhMZoW/BZzu86FQTx0vrjbRyyFeZSgrMea26rN5lDE2YICdsFuLjEOYYkWvZDu52eL
 NVcqOdFEhwCMikqBIMdHZw9a0M+RpCj5nxjy8jBiVYgDTitDq+16+nYYhd+Dbzt0UuJI
 zqaRYmvalcX94TgFGbrUvfw4CiST8M5n78E5hYYPFyRNP5bQxMkuBpFlKh+IDCQch0mz
 BZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ro6+KbefkXz+hPhP0Iqcl220cLZghODcgKlebnYOeYc=;
 b=Mp4EPYUGqQZplKwZkqzz0cTWpC1527bBXswP3z3l0gg3/kfWbrEMVHp/7M6vLT2AuK
 OvHP/b/RJ7L36PBzfSBGFUW1HNq8mTs95Ig/0omw+vXb+9dZzaE9o4XoUmkkrHBqbtE/
 9PjeG2MECw+SdF8YbMY/rb8CrTyoNgwNwzj3uv192iQa09fgB/eoDiAJiFFfWM6ehtJo
 LuMtqyugKktBacHL6VsMQCPrW1MR4ahog7FeZ3SR4xZ03T9viVEBhC7z1cmrQ0mjYhCh
 LJZOtXMOc6QD0SXOZreuTLSMt+lE7VcDQ5iYA8xweCHEyVlS/wImQgwimsBuegTY1M4O
 1aYg==
X-Gm-Message-State: AGi0PuYsE8taIklE8AKFAIV9qqB0QnFQKXvIwqrTQvOxVKTCtxEcS0Dq
 r2CY4mw9n6gt1P8hc3/6GkU=
X-Google-Smtp-Source: APiQypKcN3uszX8BCrmxru7kRRaolnm7NM90uaXqMOzHJXXYiCi0JzXO4o7Hw2tblXgAA60VR1Qp7A==
X-Received: by 2002:a17:90b:292:: with SMTP id
 az18mr21079654pjb.126.1586101684836; 
 Sun, 05 Apr 2020 08:48:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l18sm9009275pgc.26.2020.04.05.08.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2020 08:48:04 -0700 (PDT)
Subject: Re: [PATCH linux hwmon-next v3 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
To: Kun Yi <kunyi@google.com>, jdelvare@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <20200405030118.191950-1-kunyi@google.com>
 <20200405030118.191950-4-kunyi@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a49060b5-a529-e6b2-2690-cac4681c7722@roeck-us.net>
Date: Sun, 5 Apr 2020 08:48:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200405030118.191950-4-kunyi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/4/20 8:01 PM, Kun Yi wrote:
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/amd,sbtsi.txt   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
> new file mode 100644
> index 000000000000..be7293c43c0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
> @@ -0,0 +1,26 @@
> +* Sideband interface Temperature Sensor Interface (SB-TSI) compliant
> +AMD SoC temperature device.
> +
> +SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> +interface that reports AMD SoC's Ttcl (normalized temperature),
> +and resembles a typical 8-pin remote temperature sensor's I2C interface
> +to BMC. The emulated thermal sensor can report temperatures in increments of
> +0.125 degrees, ranging from 0 to 255.875.
> +
> +Required properties:
> +- compatible: manufacturer and chip name, should be
> +	"amd,sbtsi",
> +
> +- reg: I2C bus address of the device as specified in Section 6.3.1 of the
> +SoC register reference: The SB-TSI address is normally 98h for socket 0 and
> +90h for socket 1, but it could vary based on hardware address select pins.
> +
> +[open source SoC register reference]:
> +	https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> +
> +Example:
> +
> +sbtsi@4c {
> +	compatible = "amd,sbtsi";
> +	reg = <0x4c>;
> +};
> 

Rob is going to ask you to provide this information in DT schema format
(Documentation/devicetree/writing-schema.rst). checkpatch tells you the same
nowadays.

Guenter

