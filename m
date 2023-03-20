Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A06C111A
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 12:46:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgCcQ12Vlz3cJn
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 22:46:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qoIIN/X9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qoIIN/X9;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgCbj6WMNz3cD2;
	Mon, 20 Mar 2023 22:45:35 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id bi9so14475556lfb.12;
        Mon, 20 Mar 2023 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pEHSkSsT1auJnkD1k0lUA29bx/Ib/zqnUvokdeITfEo=;
        b=qoIIN/X93SlWDs0PXFHLkE7u1YWDYnGDPAQtgUO4tYJn8Rfn7BMhcmj4h3PuY9gWtc
         EhQSy0fjAXIhMbOvPO7djjKynZfRvdpp+rNbBHJ/48x6RB/iqTVOty+3dXzdXpr2YULq
         eYimCY9etwWZ8B3wGMJsZ/5AEMPKqR5V5ppHSvB2RRS0pu9ydwaYgwSeN7efZXkKD2wf
         3GmagUiI/eUXa/fITuf/PlhUNhVziq4LXNCLOGBO3lwf2lG3j8hj9mXRaL3LkbLmgbn2
         nQ+dYW++xos/dO8dnLhA6WTeeLU3ruTU3/f8l33SbG+LsWQdFBtaDWsopKsqRwGtk0lk
         T/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEHSkSsT1auJnkD1k0lUA29bx/Ib/zqnUvokdeITfEo=;
        b=8BnnBI06h2UhqAN2nypXwBxe1ThMQVdA8xeJg3mA7jqOBFTkR1vWuDLVOhQZDK1HYE
         dTzyx/hOqqekCRY3Ujh9+si4RZh68tM3yBbj2Em1mHlxzSLoE0pgtyzKBUGTQc+RNI54
         fzotLoiNoL4UX5y7FAcC4Eowz5HHrd78cH7LYiDEXE8WVkqhUiVwD/SqO1tXCiksz7LC
         1RajT5Ibjvi4J0c6P3zkbJSojVu2VQtFcjIrcWumwr+kXT35ry4nu0DeePmbPLvfFwvt
         2ZvE+0GQ6uRfoTv5osbq3TCU4lNwOdCJoxYn7gy3FeCNwdB1JzUldc47+vCxGsyIT8/l
         tHSw==
X-Gm-Message-State: AO0yUKUxg+XhguHNSQP11tAYjNxHb5eJO9J9zURcLnFx5+fkBI1rJBfI
	DNrq7LqRhoyAll6WTklzIDw=
X-Google-Smtp-Source: AK7set94nfBfxtpNV5AkyI1/PEssWOGhiMHEMnMDIVJBtHXo3G+el13tnDKa7fNkf5UyX9vaZgEIKg==
X-Received: by 2002:ac2:5623:0:b0:4db:38a2:e985 with SMTP id b3-20020ac25623000000b004db38a2e985mr6724334lff.62.1679312730451;
        Mon, 20 Mar 2023 04:45:30 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id p20-20020a19f014000000b004db44f782aesm1657416lfc.4.2023.03.20.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:45:30 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 32KBjPQ4007560;
	Mon, 20 Mar 2023 14:45:27 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 32KBjF1t007559;
	Mon, 20 Mar 2023 14:45:15 +0300
Date: Mon, 20 Mar 2023 14:45:15 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v8 10/13] hwmon: peci: Add cputemp driver
Message-ID: <ZBhHS7v+98NK56is@home.paul.comp>
References: <20220208153639.255278-1-iwona.winiarska@intel.com>
 <20220208153639.255278-11-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208153639.255278-11-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>, Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

We are seeing wrong DTS temperatures on at least "Intel(R) Xeon(R)
Bronze 3204 CPU @ 1.90GHz" and most probably other Skylake Xeon CPUs
are also affected, see inline.

On Tue, Feb 08, 2022 at 04:36:36PM +0100, Iwona Winiarska wrote:
> Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
> readings of the processor package and processor cores that are
> accessible via the PECI interface.
...
> +static const struct cpu_info cpu_hsx = {
> +	.reg		= &resolved_cores_reg_hsx,
> +	.min_peci_revision = 0x33,
> +	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
> +};
> +
> +static const struct cpu_info cpu_icx = {
> +	.reg		= &resolved_cores_reg_icx,
> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
...
> +	{
> +		.name = "peci_cpu.cputemp.skx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},

With this configuration we get this data:

/sys/bus/peci/devices/0-30/peci_cpu.cputemp.skx.48/hwmon/hwmon15# grep . temp[123]_{label,input}
temp1_label:Die
temp2_label:DTS
temp3_label:Tcontrol
temp1_input:30938
temp2_input:67735
temp3_input:80000

On the host system "sensors" report

Package id 0:  +31.C (high = +80.C, crit = +90.C)

So I conclude Die temperature as retrieved over PECI is correct while
DTS is mis-calculated. The old downstream code in OpenBMC was using
ten_dot_six_to_millidegree() function for conversion, and that was
providing expected results. And indeed if we reverse the calculation
here we get 80000 - ((80000-67735) * 256 / 64) = 30940 which matches
expectations.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
