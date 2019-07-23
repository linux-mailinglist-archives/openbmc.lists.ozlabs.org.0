Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878470EE5
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:57:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t1nD2KfnzDqWT
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 11:57:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DL1hJknP"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t1mP1DhGzDqR1;
 Tue, 23 Jul 2019 11:56:18 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t14so19906973plr.11;
 Mon, 22 Jul 2019 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zdeVjAmSrferDd7T8hxsXdL0gr4l2xZ9zqxhMuU3IN4=;
 b=DL1hJknP7dOl9CjvZmvtrrFSLoqcpqlmYiN2kZoCeny4znXR65bo8ivkfAHSiRM8Io
 ciV5lejw6TLu5OncuR3jGwZHKmjXVnQpbP2HlGNCp5/18DPVq0rEGMRIk7NYUXKy9SQz
 AE359Z3Ib+/HgL9RChLa4wN7g0Vmm3Ubqrjglfe5yCw7/Y4pGBbi5JwE9SQD6McdFs/Y
 hdWQVG5eWZWRRNYC/wR0Z8IrBVFFuB8XzTj1CdTuQ/Wq0aynAWQ8W2wPHvlMahAq6O74
 ESiKZsWT+vZH5vvL2fcLwpdekXs87EFTsfQkYJmbOPZc2f1wPEgwIucBUAyT7rABq7sx
 WjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zdeVjAmSrferDd7T8hxsXdL0gr4l2xZ9zqxhMuU3IN4=;
 b=sEIjZ1CURg+esMhl/kQvSKzeNsNAF2TAXDo0NtQU2or8MNKJWFY4IIFhUsMmC+RZ3q
 7KYbDQu68PbhnFkakUPJTOn4L67tRMNQmX1st+oCJoZF3bVnRKlTRkqaK/1JaOw1F3Oc
 L8wMlPfBatU2V2gcid/LoZI8VVeDcarlsImt13sbZp4Yh2RbxM6QL3RjY0d0m7kGu8yI
 lc20QAwywyJX/aUypLEJAXIcGoIZb3PNkau3znnK6AnBVSM8ugkQKdGk2OfnPXZ6gSQX
 R6sP93mqd3lQ2ns+u2v1BWMzyp9K7XYSaRHoGqVBLtIL9LJ2+c9CqV7PGZID3aO8a76F
 goNg==
X-Gm-Message-State: APjAAAV74RrIByzx4vrOjA5kUlaBvzAhDR/oT/1AQaGSOsQzOsJgW3DC
 V7VLVWH2KGaZIBpo2GzufuI=
X-Google-Smtp-Source: APXvYqzKhsXfltpbJVJRV5E8B+0BKmnIOshdtuCdiVOvUrS5QqQf/Dmwvk82qizj9HvksQeH3+gOmg==
X-Received: by 2002:a17:902:44f:: with SMTP id
 73mr78998934ple.192.1563846976747; 
 Mon, 22 Jul 2019 18:56:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s11sm12752287pgc.78.2019.07.22.18.56.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 18:56:15 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
To: Vijay Khemka <vijaykhemka@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-2-vijaykhemka@fb.com>
 <20190722200622.GA20435@roeck-us.net>
 <6E2B35D8-B538-4C96-B289-27A87ECD74DB@fb.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d3137d6b-8bf8-4da6-9da7-a42b8bc68fbd@roeck-us.net>
Date: Mon, 22 Jul 2019 18:56:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6E2B35D8-B538-4C96-B289-27A87ECD74DB@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/22/19 5:12 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 7/22/19, 1:06 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>      On Mon, Jul 22, 2019 at 12:24:48PM -0700, Vijay Khemka wrote:
>      > Added new DT binding document for Infineon PXE1610 devices.
>      >
>      > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>      > ---
>      >  .../devicetree/bindings/hwmon/pxe1610.txt         | 15 +++++++++++++++
>      >  1 file changed, 15 insertions(+)
>      >  create mode 100644 Documentation/devicetree/bindings/hwmon/pxe1610.txt
>      >
>      > diff --git a/Documentation/devicetree/bindings/hwmon/pxe1610.txt b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
>      > new file mode 100644
>      > index 000000000000..635daf4955db
>      > --- /dev/null
>      > +++ b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
>      > @@ -0,0 +1,15 @@
>      > +pxe1610 properties
>      > +
>      > +Required properties:
>      > +- compatible: Must be one of the following:
>      > +	- "infineon,pxe1610" for pxe1610
>      > +	- "infineon,pxe1110" for pxe1610
>      > +	- "infineon,pxm1310" for pxm1310
>      > +- reg: I2C address
>      > +
>      > +Example:
>      > +
>      > +vr@48 {
>      > +	compatible = "infineon,pxe1610";
>      > +	reg = <0x48>;
>      > +};
>      
>      Wouldn't it be better to add this to
>      ./Documentation/devicetree/bindings/trivial-devices.txt ?
> Sure, I didn't know about this file. I will add and send another patch. It is
> Documentation/devicetree/bindings/trivial-devices.yaml. How do I abandon
> this patch or just leave it.
>      

When you send v2, just add the device to the trivial-devices file instead
and describe the differences to v1 (ie this patch).

Guenter

