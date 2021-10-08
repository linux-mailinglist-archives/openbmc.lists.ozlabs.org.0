Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384E1426C85
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 16:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQqq60QFTz306M
	for <lists+openbmc@lfdr.de>; Sat,  9 Oct 2021 01:10:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c7i9Tclq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c7i9Tclq; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQqpf3f4Fz2ywp
 for <openbmc@lists.ozlabs.org>; Sat,  9 Oct 2021 01:10:33 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id n63so13893228oif.7
 for <openbmc@lists.ozlabs.org>; Fri, 08 Oct 2021 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IiXYxUUmxX5fc/N+2AGbIuVJDEoKxiawErZ9srHj0jo=;
 b=c7i9TclqOXC9NQVa/0QKM57Q5QT8fIu2Uv6j4jzQtqYYYbXGO5S2+Mi2nhcO2FrGFz
 a0J77gQXvctEdjS9lqpR1Je3tH+8RCIQvEGk7/QX7qwu9flkFoBepGIbW41dwUO8QV4v
 b1RsXy7mUJOhtan+juYoPJcgW9cvyrktgGHgL3Unx/KE9I4wlHW4JzQOyaRkkbvKBIDE
 GN2x2Cto3WauKEYvajTIvmhXinClt2A5hRoFM1WsOrsNrHhuqYy+K61FpUhKZmvpEl88
 oAoo/KmKydPub5dJNYlaD+WhNG6nDsBhswNmKCtpbPbqNxG3G1W66Xb9GXxHzwUZ6C32
 k4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=IiXYxUUmxX5fc/N+2AGbIuVJDEoKxiawErZ9srHj0jo=;
 b=28/Jw/oe01v96Lb3LYc5GW504UKNbgIzAfdf0eoU34lXlstgiVdCzhVzzaaXZ8A87K
 +eeHOe42fsu4+AYb/0ru4dRbyimBncC6RGs/HNThsShsBPnN4IaQDo7OE1Vwpq8jd7Vk
 t9fy4T+xfGon2LQeY4cFFygCRBcLsVXhXmC7DW55zfSH5ffSg/uaWmI/ROUDvlPn2fHG
 KkuuJFSXTz1g2c4Uf6XRtJhtcg4rTGb7ol3pZrc3uaxkay/NF/ifAL6JA/oJlOWCD5MG
 LwXrafzAZukJPwbf+qfGyaMJuBniai7S2WtfYknX6qt5tC5zvqGAxZFTGFy9QtD0YLvO
 Gv6Q==
X-Gm-Message-State: AOAM531t0QZ77JpG4lqERB4YatHwgZJpyjaQPPT5rXtd0dQFGrSQpGkl
 FENq8xGdgOo/h/E+9C6LIbU=
X-Google-Smtp-Source: ABdhPJxhdHlSP1WurrhCIJ8tM/5LxgwSdz5d+pKk7TVEe5llpRNDBiWgwKyHSppItIe/qE9kJftKiw==
X-Received: by 2002:a54:410b:: with SMTP id l11mr16346473oic.74.1633702229084; 
 Fri, 08 Oct 2021 07:10:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bg16sm688219oib.30.2021.10.08.07.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:10:28 -0700 (PDT)
Date: Fri, 8 Oct 2021 07:10:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus/ibm-cffps) Add mfg_id debugfs entry
Message-ID: <20211008141027.GA1987825@roeck-us.net>
References: <20211004144339.2634330-1-bjwyman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004144339.2634330-1-bjwyman@gmail.com>
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
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 04, 2021 at 02:43:38PM +0000, Brandon Wyman wrote:
> Add support for the manufacturer ID to the debugfs entries.
> 
> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index df712ce4b164..2ee47cbbb665 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -18,6 +18,7 @@
>  
>  #include "pmbus.h"
>  
> +#define CFFPS_MFG_ID_CMD                        0x99
>  #define CFFPS_FRU_CMD				0x9A
>  #define CFFPS_PN_CMD				0x9B
>  #define CFFPS_HEADER_CMD			0x9C
> @@ -34,7 +35,7 @@
>  #define CFFPS_INPUT_HISTORY_SIZE		100
>  
>  #define CFFPS_CCIN_REVISION			GENMASK(7, 0)
> -#define  CFFPS_CCIN_REVISION_LEGACY		 0xde
> +#define CFFPS_CCIN_REVISION_LEGACY		 0xde
>  #define CFFPS_CCIN_VERSION			GENMASK(15, 8)
>  #define CFFPS_CCIN_VERSION_1			 0x2b
>  #define CFFPS_CCIN_VERSION_2			 0x2e
> @@ -57,6 +58,7 @@
>  
>  enum {
>  	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
> +	CFFPS_DEBUGFS_MFG_ID,
>  	CFFPS_DEBUGFS_FRU,
>  	CFFPS_DEBUGFS_PN,
>  	CFFPS_DEBUGFS_HEADER,
> @@ -158,6 +160,9 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>  	switch (idx) {
>  	case CFFPS_DEBUGFS_INPUT_HISTORY:
>  		return ibm_cffps_read_input_history(psu, buf, count, ppos);
> +	case CFFPS_DEBUGFS_MFG_ID:
> +		cmd = CFFPS_MFG_ID_CMD;
> +		break;
>  	case CFFPS_DEBUGFS_FRU:
>  		cmd = CFFPS_FRU_CMD;
>  		break;
> @@ -558,6 +563,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
>  	debugfs_create_file("input_history", 0444, ibm_cffps_dir,
>  			    &psu->debugfs_entries[CFFPS_DEBUGFS_INPUT_HISTORY],
>  			    &ibm_cffps_fops);
> +	debugfs_create_file("mfg_id", 0444, ibm_cffps_dir,
> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_MFG_ID],
> +			    &ibm_cffps_fops);
>  	debugfs_create_file("fru", 0444, ibm_cffps_dir,
>  			    &psu->debugfs_entries[CFFPS_DEBUGFS_FRU],
>  			    &ibm_cffps_fops);
