Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E153694B8
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 16:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRc9V356wz2yxL
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 00:29:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d1pQqNyT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d1pQqNyT; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRc9G1LGbz2xYd;
 Sat, 24 Apr 2021 00:28:49 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso43535751otb.13; 
 Fri, 23 Apr 2021 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RilDTx1mAkKSalY1rFUh5tAuC9UZIjAPDIoqWnUMMLc=;
 b=d1pQqNyTqTvuNeSXGmbBl2S3GwY4lVF9NfQoMeuo8DuerAD9ht8plSDFef6fiJNkqQ
 Dd3QaazKa3FQfqVrPEc0dBZmez8uX4aL73BcctOgm1w+KVc16dcBnbYApsNLwYEXyHQC
 tR51MlQL55CiRRqwFJee6YsNzzR5u9F0L1ARRD57xNJ4XSmloiIZMYoMWMBUxqOBq0v5
 U+K2FwiyRIlkkcdMO0RHf13KpjWHZITDT66253tVM7F18UmahNeDbgUMdHuSxH9dfkxN
 p3WQB6Tf1k4unpYhCTgieCE9GDHOJXmEJCQbSaOIvKAbSWE9Q5QXBCdmPsRjWvIiGU/P
 LaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RilDTx1mAkKSalY1rFUh5tAuC9UZIjAPDIoqWnUMMLc=;
 b=N0ka6seODnLeJPXBSmLdZ0wUZ2VXj5ry4VU149b0k40IRVrYsrY21rNplNLKij4YMq
 Jms2EGs1gipsQx1Eyvxq0zf4XGoT3jA4CrYWgDz5OvBnY+8TxwYq6lZUh5Ttfjplcfbs
 AZAk9PYqP4hn9eOmX7lv3PIXMh5bDTJmYQvkk8GHVGoFCac/rxWLdvVQtB0UTy+YOBTq
 Lwph2BzptY94ZOhXnk1dMDyQ44EDiASNLlSDzdTXSqHromxrNjDfSsysQSFbitxSJl+s
 QafhsAUXAtPQEQeWwlguuDiJ4219xl1SfjrBz7ZBOANgyEFU71ksVKA4JQNqlYnHEiPS
 5sjA==
X-Gm-Message-State: AOAM533XF6JTLoa2gb2YHWZneIouvYYOW9+OwzyFSehsq2YiYfsnexvo
 ytl1sMu5iDwIqNIVrj3lzCk=
X-Google-Smtp-Source: ABdhPJxIzB1ipeKLfBWKfOj0O+wbyqaTqyC9ua6idBGda0P1bH0ghuFXP2g5ZVZLa+pR+ARc3HLLIg==
X-Received: by 2002:a05:6830:1e3a:: with SMTP id
 t26mr3568415otr.134.1619188126764; 
 Fri, 23 Apr 2021 07:28:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id i9sm1199290oog.17.2021.04.23.07.28.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 07:28:45 -0700 (PDT)
Date: Fri, 23 Apr 2021 07:28:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v4 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Message-ID: <20210423142844.GA136288@roeck-us.net>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
 <20210422090843.4614-5-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422090843.4614-5-quan@os.amperecomputing.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 04:08:43PM +0700, Quan Nguyen wrote:
> Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.
> 
> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> Changes in v4:
>   + None
> 
> Changes in v3:
>   + None
> 
> Changes in v2:
>   + Removed "virtual" sensors [Guenter]
>   + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
>   + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
>   + Clarified "highest" meaning in documentation [Guenter]
>   + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
>   + Removed Socket TDP sensor [Quan]
>   + Included sensor type and channel in labels [Quan]
> 
>  Documentation/hwmon/index.rst       |   1 +
>  Documentation/hwmon/smpro-hwmon.rst | 101 ++++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/hwmon/smpro-hwmon.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 48bfa7887dd4..3e3631b253b6 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -166,6 +166,7 @@ Hardware Monitoring Kernel Drivers
>     sis5595
>     sl28cpld
>     smm665
> +   smpro-hwmon
>     smsc47b397
>     smsc47m192
>     smsc47m1
> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
> new file mode 100644
> index 000000000000..f978b1370e16
> --- /dev/null
> +++ b/Documentation/hwmon/smpro-hwmon.rst
> @@ -0,0 +1,101 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver Ampere(R)'s Altra(R) SMpro hwmon
> +==============================================
> +
> +Supported chips:
> +
> +  * Ampere(R) Altra(R)
> +
> +    Prefix: 'smpro'
> +
> +    Reference: Altra SoC BMC Interface Specification
> +
> +Author: Thu Nguyen <thu@os.amperecomputing.com>
> +
> +Description
> +-----------
> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> +SMpro co-processor (SMpro).
> +The following sensor types are supported by the driver:
> +
> +  * temperature
> +  * voltage
> +  * current
> +  * power
> +
> +The SMpro interface provides the registers to query the various sensors and
> +their values which are then exported to userspace by this driver.
> +
> +Usage Notes
> +-----------
> +
> +SMpro hwmon driver creates at least two sysfs files for each sensor.
> +
> +* File ``<sensor_type><idx>_label`` reports the sensor label.
> +* File ``<sensor_type><idx>_input`` returns the sensor value.
> +
> +The sysfs files are allocated in the SMpro root fs folder.
> +There is one root folder for each SMpro instance.
> +
> +When the SoC is turned off, the driver will fail to read registers
> +and return -ENXIO.
> +
> +Sysfs entries
> +-------------
> +
> +The following sysfs files are supported:
> +
> +* Ampere(R) Altra(R):
> +
> +============    =============   ======  ===============================================
> +Name            Unit            Perm    Description
> +temp1_input     milli Celsius   RO      SoC temperature
> +temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
> +temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
> +temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
> +temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
> +temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
> +temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
> +temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
> +temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
> +temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
> +temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
> +temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
> +temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
> +temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> +temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
> +in0_input       milli Volts     RO      Core voltage
> +in1_input       milli Volts     RO      SoC voltage
> +in2_input       milli Volts     RO      DIMM VRD1 voltage
> +in3_input       milli Volts     RO      DIMM VRD2 voltage
> +in4_input       milli Volts     RO      RCA VRD voltage
> +cur1_input      milli Amperes   RO      Core VRD current
> +cur2_input      milli Amperes   RO      SoC VRD current
> +cur3_input      milli Amperes   RO      DIMM VRD1 current
> +cur4_input      milli Amperes   RO      DIMM VRD2 current
> +cur5_input      milli Amperes   RO      RCA VRD current
> +power1_input    micro Watts     RO      Core VRD power
> +power2_input    micro Watts     RO      SoC VRD power
> +power3_input    micro Watts     RO      DIMM VRD1 power
> +power4_input    micro Watts     RO      DIMM VRD2 power
> +power5_input    micro Watts     RO      RCA VRD power
> +============    =============   ======  ===============================================
> +
> +Example::
> +
> +    # cat in0_input
> +    830
> +    # cat temp1_input
> +    37000
> +    # cat curr1_input
> +    9000
> +    # cat power5_input
> +    19500000
