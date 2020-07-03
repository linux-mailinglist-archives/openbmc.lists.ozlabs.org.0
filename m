Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E300721308D
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 02:46:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ybqn4Js1zDqyw
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 10:46:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nJjrrEkU; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ybpn2XhdzDqyk
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 10:45:19 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id gc15so4514504pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jul 2020 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xxCISvRtfhl8oL/cHz8IcSytvLoDXt2VBe6qFVBHxUE=;
 b=nJjrrEkUAQCGFmGDNhnb5PVExZ3pDaEIWh7BZWYbQZD2UR9o86pnVnUTyuKaTuTJDW
 Jpv6HrHW6Wd96BITv2uK8OH5weHw4hI8kcRDXFq3O1XzNvOlUrd+DUkufbneM1Hsi6JO
 v3E0y8rkNX6xX9HKg44GveDw1iZsMMTNN8nogn4UObvseMisxlDOj+eeiCbfVr/pr/0m
 JVMZVayOQCVBgveyiz63ZuW/T6mj4yECIx+Ui3dqVTXvj4WHXz2SXPuuaVC4XL8uWQvP
 o8ct/VHBaCQkVA3WFDpmBrAzUREPYlYXnmBY40tobsjxomCu7nyheU/mGfpxUiCtZ5Fz
 uPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xxCISvRtfhl8oL/cHz8IcSytvLoDXt2VBe6qFVBHxUE=;
 b=YYhEdV3UX11gOG2ma5bMLuoxJGh+X7b9V/eGTmYLxr19hMbRawwlINDPNxubtTi1a4
 6tjnW5HYas2yu3ru46PilsC0U/zsLlgbxCmiY5o81MAgn4uaVRY3smRHWFjlLa+BgXIK
 2RoRJRgPzDLRu8HuNuHIvsye9IFE49JyuO+w2e4Uj+2mv7wwY2cdwljaBJotPVTNjgTs
 krSIBdILNvbSpMGQmJ3skIrR19fIocdVXWZIuAiEi/+zsyBHVMRROUf6MZ9oByAmEDwi
 T+ZDuuQKAdYwtCO0De1+TgQX9ZRWAcnb0wi19uOvkNojYQLw616Qz8K3NPSQ7Z7DWh5w
 cvBQ==
X-Gm-Message-State: AOAM531cSPn3HQdhmb6oNQrgaUY2ucsax6if2o8bG/SQIfkjH2JtEawL
 xShEVhYfAXlsKi3FAjDXYKc=
X-Google-Smtp-Source: ABdhPJz+qnIK30TK5zKdKNpuN2jPEhIs1H8VMPfoPIeYzhAgJgFZjY/TlqevmnyCB1cDQRYUNKAH3A==
X-Received: by 2002:a17:902:369:: with SMTP id
 96mr6833712pld.214.1593737117645; 
 Thu, 02 Jul 2020 17:45:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 125sm9302049pff.130.2020.07.02.17.45.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 17:45:17 -0700 (PDT)
Date: Thu, 2 Jul 2020 17:45:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH] hwmon: (pmbus) fix a typo in Kconfig SENSORS_IR35221
 option
Message-ID: <20200703004516.GA100326@roeck-us.net>
References: <20200702221349.18139-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702221349.18139-1-rentao.bupt@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 taoren@fb.com, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 03:13:49PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Fix a typo in SENSORS_IR35221 option: module name should be "ir35221"
> instead of "ir35521".
> 
> Fixes: 8991ebd9c9a6 ("hwmon: (pmbus) Add client driver for IR35221")
> 
> Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 3ad97fd5ce03..e35db489b76f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -71,7 +71,7 @@ config SENSORS_IR35221
>  	  Infineon IR35221 controller.
>  
>  	  This driver can also be built as a module. If so, the module will
> -	  be called ir35521.
> +	  be called ir35221.
>  
>  config SENSORS_IR38064
>  	tristate "Infineon IR38064"
