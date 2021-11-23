Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20D45A6DB
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 16:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz7t036rTz2yw1
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 02:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f4kmgK0v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f4kmgK0v; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz7sW13WHz2xr3;
 Wed, 24 Nov 2021 02:51:10 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso3732963otf.0; 
 Tue, 23 Nov 2021 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tJQKOiGB2vMuUqi1aD/KDeUab9z92lW/Lc4DaqZriqA=;
 b=f4kmgK0vVOxM7SUOOui9MCrPkzPqPGRFZjasT0mKmxH+SZ2MigxSi9obkrdIxo7jLy
 /7mWXJLAmnpXtrA3LJ9eyH8LSugnBNo3+nClOf7UiabcSD+YDAELoJVjX9yz3oQRnNnr
 FIjAUFb68dCPXF18UEP/k1DsHEte9I6kvSmnV+NWOW5VMUKtq+umbTtsLXr6mZ8bm7+Z
 3IOA7DurRDMTl6QBVE8LOkG9QD3ez0kWGIKJ4xlq3OmNpQOvDaKPU+jdXmhfSP86mssb
 1XmbZi52GRozESpCh9wtR9znEdP1RC9wBIPEbwFO4HtS3FU5LHrPQCWrqHzpHz293s9h
 Vpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=tJQKOiGB2vMuUqi1aD/KDeUab9z92lW/Lc4DaqZriqA=;
 b=c5gVXjxODC/er5CyHU5QEDuUumbD0mdFMxb7Zux4IicqT++fPSQivtFC/CNti9dMRF
 6FUdQzVCUPN1PCOO6iOJyuOhK/3Nux/vTgIrJzBRY3vGsd+36bS03LNzkCa0xjYfKruS
 hhY7NTsIKNoniAoYaxLPrrVNOAeS2VfyR5+Sfmw8k4Ni7Qz61M1jdHs3xSVhJQw5jC/Q
 lu/8N0G6RcXbhRHktuR+xQkrbOPwK8d4pJoBfxCPCieVN0HXLGfKJe0ENtcJ8bGOGNhd
 Lcx5K9/4TU2UzFw/iNGGkNmdUNnICHNgddM4Pu2uLmgECEBijmdRRb14VjlgP9tUnC1c
 voBQ==
X-Gm-Message-State: AOAM531KEL5ArmkvHVLLvlXl8DqzKUHustCqAtXCeRf2bpp1EXIyHQ2q
 eGvjNGK+0u6gzUIIElDbhzo=
X-Google-Smtp-Source: ABdhPJyhyAw55KSiewZGLoxSdgQk1C3eR3BBScfSyS28Z3a9YLYF+FAAzifxgRGw/7mzEoByrErOFA==
X-Received: by 2002:a05:6830:22d8:: with SMTP id
 q24mr5291559otc.170.1637682665727; 
 Tue, 23 Nov 2021 07:51:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s2sm2226111otr.69.2021.11.23.07.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 07:51:05 -0800 (PST)
Date: Tue, 23 Nov 2021 07:51:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v4 10/13] hwmon: peci: Add cputemp driver
Message-ID: <20211123155104.GB2184678@roeck-us.net>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-11-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123140706.2945700-11-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 23, 2021 at 03:07:03PM +0100, Iwona Winiarska wrote:
> Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
> readings of the processor package and processor cores that are
> accessible via the PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain the DTS readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>
