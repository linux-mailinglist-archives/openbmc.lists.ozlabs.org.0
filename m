Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717270A57
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 22:07:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45st1G4r8czDqWR
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 06:06:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b8HWUQlF"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45st0j5STWzDqVc;
 Tue, 23 Jul 2019 06:06:27 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i189so17894919pfg.10;
 Mon, 22 Jul 2019 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dc1nDbjKpnpP+a+/MmVe5NpW+Or0aQ+dHKZXZgx9JfE=;
 b=b8HWUQlFI4Bi3Vsm9h3pIL1BtPQ+jCsskWoS3LtjbQqMzNMt/ByjHN8SUdmCg4wCvg
 56aMy7KRNlT5Nyv+O+oWRkgwIWjVJ2hfQ7yczoZweGJLJbOe914LSiJsaHRGx1lr1FEp
 kC9Nx9QUUS8SrXKa1bvAwrbSDDSaqBTJf3vN7+Y9D1MKF5fnMwXNinoN/Q6WIk6TAK31
 Oyh8D5d5wUR/yIWMJzLhxnW5kMJ8eC5r+RY7gIrkOtwVc9IcKgB7bzqnOE/g1m/CMBl4
 rX5e6DeeEXM4oGUG5qWj0EvzUlLdkjOqwsn9BvkYvFtenYXanekOBprQdaWBcQktjGdG
 EBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=dc1nDbjKpnpP+a+/MmVe5NpW+Or0aQ+dHKZXZgx9JfE=;
 b=oUfZCOpkqPrlSZ0KYkmQomG7qjOAxf36aexTp1vAwL8p8udi/oj2KwCe60oThKFb4l
 kgFsC/dEh+tFjdN8Y5Zp5qA1jUjtTl2JJDXEd+/lxVSmWy9wojqGXoYxWndIuMkhcOHx
 h+nHfLE58us6RBZC3D3/JeS4l3OiAEsqTJtYaE3jxd6RPI+o9td9yBLZU5DEzM1Qe1mK
 hlke+9ZB4IwCCsHtO6LApSK5XDPwHtaMiORZO9rTbuoYr/6izlnBMSbfsOSUOCxs9boA
 85ByzjEz6614eHcy+poJjngg1dzWqML4qMZ4lMfa78JBU2mXjB4eCYupey4zw0nLdJM3
 4zfw==
X-Gm-Message-State: APjAAAV+eohGifVAhQi/gs2HoNqutsZT0YL91Zgc0L9tLujXLbHRnS90
 SA3ZjSZcaERF6WwEvWosjqg=
X-Google-Smtp-Source: APXvYqwrrfr8vZZ2zi0ljFQ1dG1N1h86xfW6V0hOrIDJx0pWBHs5P2AHff6cpF9shtD3j/eNTJY0qA==
X-Received: by 2002:a63:1046:: with SMTP id 6mr75083719pgq.111.1563825984205; 
 Mon, 22 Jul 2019 13:06:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b26sm44559517pfo.129.2019.07.22.13.06.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 13:06:23 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:06:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Message-ID: <20190722200622.GA20435@roeck-us.net>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-2-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722192451.1947348-2-vijaykhemka@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 12:24:48PM -0700, Vijay Khemka wrote:
> Added new DT binding document for Infineon PXE1610 devices.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  .../devicetree/bindings/hwmon/pxe1610.txt         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pxe1610.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pxe1610.txt b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
> new file mode 100644
> index 000000000000..635daf4955db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
> @@ -0,0 +1,15 @@
> +pxe1610 properties
> +
> +Required properties:
> +- compatible: Must be one of the following:
> +	- "infineon,pxe1610" for pxe1610
> +	- "infineon,pxe1110" for pxe1610
> +	- "infineon,pxm1310" for pxm1310
> +- reg: I2C address
> +
> +Example:
> +
> +vr@48 {
> +	compatible = "infineon,pxe1610";
> +	reg = <0x48>;
> +};

Wouldn't it be better to add this to
./Documentation/devicetree/bindings/trivial-devices.txt ?

Thanks,
Guenter
