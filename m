Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C1616F22
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 21:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2fFc28Ypz3cLr
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 07:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hCFn13Mz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hCFn13Mz;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2fDy4ry0z3cDx
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 07:51:13 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13c2cfd1126so21624523fac.10
        for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2022 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vz0GfozIpsPUBz1QIRbwEXWEh5SPtHrHm1HOdjXnaj0=;
        b=hCFn13MzPnpqEf9Kex9dFGEIZm/M1JDpAf+dzr8CboGw1nWgBItdLYanDTl/cDX3G1
         ProzILPf/rOP0RkYBo6mvWZLI7EW/cZJPnoZVBP7qt6phrByah4FQy+qHohtT4EUJy9g
         03TvqPir9RhNYeGLPO/OQamLMvgsEttzTLICkzgFsqG2IwueeOMwpEhV1KJYp2MpTPGq
         Pb8p1hl+2fCTRphE6udzIIrGiXfyLuNJuD1MZafR197LxxlcMpZ/VLiH0YVdSQgRvNie
         fbIY262E+PmQSNAaIygFcPhip7M87skMd93jB6DECsySj4OVd69IzBtKA49nvyF6/KSd
         EphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vz0GfozIpsPUBz1QIRbwEXWEh5SPtHrHm1HOdjXnaj0=;
        b=ifHcnPBTl2qTgmi8BTM4BIKd7rLEpWpP2dbaRkMEMaEK2P3tD6deXJOCRB2oy/NKfM
         IsatwYjAwzTkS0dtpZp+2RKzntrBtLnVJTmYqsQ7xypD1XnkgO6UHBj9Ux+qnm+LL6Mz
         ce/1+ovyRQslndlmVK/8UddEVnpQlbVVrZArCEkfJQwJa+o0FaOxRWTZ72rT6MzrImFc
         ycTe3mSIebwUk3JGd7Jp/dVn0WFip+gvALUQaQrbrcUQ19ceatby6in+Djg3QydJekfS
         NAptyHeoPgn97sgh9cNgzZKKTn7zy058v7NGXVmBSU0EA3r0+3XgRCCJz/vQmecibtGM
         nhwg==
X-Gm-Message-State: ACrzQf0y1+aqoaq9OL7odo2cfNidg14RadKLSzIl7tQn+qhCPVDkz+hJ
	QbSRVoJxJlaxQwWjHGMP5lA=
X-Google-Smtp-Source: AMsMyM72H2oEil2phBMfeD9kNgmomI5srb1Ke1q9WqklFVafKYt4AHmFWvYO6aQguvqiB69jFm8Bcw==
X-Received: by 2002:a05:6870:e2d6:b0:13c:a47a:c477 with SMTP id w22-20020a056870e2d600b0013ca47ac477mr16170494oad.269.1667422271417;
        Wed, 02 Nov 2022 13:51:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s35-20020a4a96a6000000b004806f494d2fsm857957ooi.11.2022.11.02.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:51:10 -0700 (PDT)
Date: Wed, 2 Nov 2022 13:51:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH] docs: hwmon: (smpro-hwmon) Improve grammar and formatting
Message-ID: <20221102205110.GA2089605@roeck-us.net>
References: <20221102062103.3135417-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102062103.3135417-1-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 01:21:03PM +0700, Quan Nguyen wrote:
> Improve documentation grammar and formatting for the
> Ampere(R)'s Altra(R) SMpro hwmon driver.
> 
> Thanks Bagas for the changes in the link below.
> 
> Link: https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/#mfea2167b99384486a1b75d9304536015116c1821
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/smpro-hwmon.rst | 111 ++++++++++++++--------------
>  1 file changed, 56 insertions(+), 55 deletions(-)
> 
> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
> index 3a9b14dacf89..fb7b3665735b 100644
> --- a/Documentation/hwmon/smpro-hwmon.rst
> +++ b/Documentation/hwmon/smpro-hwmon.rst
> @@ -7,39 +7,39 @@ Supported chips:
>  
>    * Ampere(R) Altra(R)
>  
> -    Prefix: 'smpro'
> +    Prefix: ``smpro``
>  
> -    Reference: Altra SoC BMC Interface Specification
> +    Reference: `Altra SoC BMC Interface Specification`
>  
>  Author: Thu Nguyen <thu@os.amperecomputing.com>
>  
>  Description
>  -----------
> -This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> -SMpro co-processor (SMpro).
> -The following sensor types are supported by the driver:
> +The smpro-hwmon driver supports hardware monitoring for Ampere(R) Altra(R)
> +SoCs based on the SMpro co-processor (SMpro).  The following sensor metrics
> +are supported by the driver:
>  
>    * temperature
>    * voltage
>    * current
>    * power
>  
> -The SMpro interface provides the registers to query the various sensors and
> +The interface provides the registers to query the various sensors and
>  their values which are then exported to userspace by this driver.
>  
>  Usage Notes
>  -----------
>  
> -SMpro hwmon driver creates at least two sysfs files for each sensor.
> +The driver creates at least two sysfs files for each sensor.
>  
> -* File ``<sensor_type><idx>_label`` reports the sensor label.
> -* File ``<sensor_type><idx>_input`` returns the sensor value.
> +* ``<sensor_type><idx>_label`` reports the sensor label.
> +* ``<sensor_type><idx>_input`` returns the sensor value.
>  
> -The sysfs files are allocated in the SMpro root fs folder.
> -There is one root folder for each SMpro instance.
> +The sysfs files are allocated in the SMpro rootfs folder, with one root
> +directory for each instance.
>  
> -When the SoC is turned off, the driver will fail to read registers
> -and return -ENXIO.
> +When the SoC is turned off, the driver will fail to read registers and
> +return ``-ENXIO``.
>  
>  Sysfs entries
>  -------------
> @@ -48,48 +48,49 @@ The following sysfs files are supported:
>  
>  * Ampere(R) Altra(R):
>  
> -============    =============   ======  ===============================================
> -Name            Unit            Perm    Description
> -temp1_input     milli Celsius   RO      SoC temperature
> -temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
> -temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
> -temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
> -temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
> -temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
> -temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
> -temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
> -temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
> -temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
> -temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
> -temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
> -temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
> -temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
> -temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
> -in0_input       milli Volts     RO      Core voltage
> -in1_input       milli Volts     RO      SoC voltage
> -in2_input       milli Volts     RO      DIMM VRD1 voltage
> -in3_input       milli Volts     RO      DIMM VRD2 voltage
> -in4_input       milli Volts     RO      RCA VRD voltage
> -cur1_input      milli Amperes   RO      Core VRD current
> -cur2_input      milli Amperes   RO      SoC VRD current
> -cur3_input      milli Amperes   RO      DIMM VRD1 current
> -cur4_input      milli Amperes   RO      DIMM VRD2 current
> -cur5_input      milli Amperes   RO      RCA VRD current
> -power1_input    micro Watts     RO      Core VRD power
> -power2_input    micro Watts     RO      SoC VRD power
> -power3_input    micro Watts     RO      DIMM VRD1 power
> -power4_input    micro Watts     RO      DIMM VRD2 power
> -power5_input    micro Watts     RO      RCA VRD power
> -============    =============   ======  ===============================================
> -
> -Example::
> +  ============    =============  ======  ===============================================
> +  Name            Unit           Perm    Description
> +  ============    =============  ======  ===============================================
> +  temp1_input     millicelsius   RO      SoC temperature
> +  temp2_input     millicelsius   RO      Max temperature reported among SoC VRDs
> +  temp2_crit      millicelsius   RO      SoC VRD HOT Threshold temperature
> +  temp3_input     millicelsius   RO      Max temperature reported among DIMM VRDs
> +  temp4_input     millicelsius   RO      Max temperature reported among Core VRDs
> +  temp5_input     millicelsius   RO      Temperature of DIMM0 on CH0
> +  temp5_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp6_input     millicelsius   RO      Temperature of DIMM0 on CH1
> +  temp6_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp7_input     millicelsius   RO      Temperature of DIMM0 on CH2
> +  temp7_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp8_input     millicelsius   RO      Temperature of DIMM0 on CH3
> +  temp8_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp9_input     millicelsius   RO      Temperature of DIMM0 on CH4
> +  temp9_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp10_input    millicelsius   RO      Temperature of DIMM0 on CH5
> +  temp10_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp11_input    millicelsius   RO      Temperature of DIMM0 on CH6
> +  temp11_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp12_input    millicelsius   RO      Temperature of DIMM0 on CH7
> +  temp12_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
> +  temp13_input    millicelsius   RO      Max temperature reported among RCA VRDs
> +  in0_input       millivolts     RO      Core voltage
> +  in1_input       millivolts     RO      SoC voltage
> +  in2_input       millivolts     RO      DIMM VRD1 voltage
> +  in3_input       millivolts     RO      DIMM VRD2 voltage
> +  in4_input       millivolts     RO      RCA VRD voltage
> +  cur1_input      milliamperes   RO      Core VRD current
> +  cur2_input      milliamperes   RO      SoC VRD current
> +  cur3_input      milliamperes   RO      DIMM VRD1 current
> +  cur4_input      milliamperes   RO      DIMM VRD2 current
> +  cur5_input      milliamperes   RO      RCA VRD current
> +  power1_input    microwatts     RO      Core VRD power
> +  power2_input    microwatts     RO      SoC VRD power
> +  power3_input    microwatts     RO      DIMM VRD1 power
> +  power4_input    microwatts     RO      DIMM VRD2 power
> +  power5_input    microwatts     RO      RCA VRD power
> +  ============    =============  ======  ===============================================
> +
> +  Example::
>  
>      # cat in0_input
>      830
