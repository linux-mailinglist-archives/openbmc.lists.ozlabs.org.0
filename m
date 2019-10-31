Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B250EA9E2
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 05:21:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473XFb0mnkzF1KS
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 15:21:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=santosh.puranik.ibm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XCFJqgag"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473XDq1GDkzF5WM
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 15:20:40 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 21so3313886pfj.9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 21:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=4mJDqthaf5yJh2/2hGCfBJUkBVI3oqeTQ1CG8t6mYmY=;
 b=XCFJqgagxvC9h0JYjZJdHqc/LuzJ7ExbkRsqpyhUR6M1AGnRF53RIL6ZPbAO9yR5WF
 L7/qi05geHVUAzcU8WWEWZZ5LZxk/uY9qtHKLAwKWLOmP092xYmxY6bONLRiDTJrThO8
 avYrfdfQlkuKshiV0NrF2nw5kw2xFBPzFbDs4E86I0yT6/vHwR4MNi1+dWNHXO3xtls/
 flBP9rNNl+pvS6qDmxbfe4rBQnP+VMYn4alOu+6aWLtEd/r8bghBDmpqN3SD3LwjUT/6
 e6ui8kNHs/bKGrf991+NiQvgCHti1BB5Wb9G2VpbVHcVZiMW2I+jM7FDrGEGx5WHQfK8
 5IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4mJDqthaf5yJh2/2hGCfBJUkBVI3oqeTQ1CG8t6mYmY=;
 b=GSkp1S63PXkzuhFVBt9qs8zhnY8v7FEMKPKQLp2qQ7AbklV+gEHKwDlmpTeo6tKtwq
 XDwGaKgP+f7cIsEYglnaeTzL1V/oWFdB7R9mkM+lf67Lct7Ro9rA/7T2gXAaTEysnrrL
 cNXatVk6t+ebyaTW/h0h/bwcibel4FiOEHmLi+ROYa3Rkc8C5d6pZufSNYRkdDxs1O6C
 ZDAGVmA6JF0Wh1duGWlGHQ/+9uZqX2DpaVoThAQVCFW7q5qPCe3hcGY1WdOJS9TjhFW3
 ZMjNfIae8fyLCE1pa9IGLi6dZ328GIXa2D8dskr1JeQa+r3MnTGt2w7djMS0oZzBFiqo
 En1Q==
X-Gm-Message-State: APjAAAVtD4XyXef5XMOFIyvVOQYSoQkxKnM3AdMhRTXJH6hhjIDjkJ8B
 ZHOgCgThI4HwrCexN4J5EoczxqF6
X-Google-Smtp-Source: APXvYqw7ikx5S0HAz+XIOO/e23ol5KdEwkSk9cuIIcaZI4+sjSr2/JwmDEZVqF/O4mlC/0pIqtkGgA==
X-Received: by 2002:a65:434b:: with SMTP id k11mr3788569pgq.386.1572495636507; 
 Wed, 30 Oct 2019 21:20:36 -0700 (PDT)
Received: from [9.199.76.54] ([129.41.84.80])
 by smtp.gmail.com with ESMTPSA id z11sm1646770pfg.117.2019.10.30.21.20.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 21:20:35 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Fix i2c eeprom
 size
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <e17c8218-4a2c-1eee-f104-b572415c53e8@linux.vnet.ibm.com>
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Message-ID: <48393e3f-f839-ac2d-a94e-abb545b81aaf@gmail.com>
Date: Thu, 31 Oct 2019 09:50:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e17c8218-4a2c-1eee-f104-b572415c53e8@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 30/10/19 3:31 PM, Jinu Thomas wrote:
> Fix the size of the Proc VRM card's eeprom used for vpd storage
> The size is changed from 64Kbit to 128Kbit
>
> Signed-off-by: Jinu Joy Thomas <jinu.joy.thomas@in.ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index efb1e99b5124..d959947dd8d6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -412,7 +412,7 @@
>   	};
>   
>   	eeprom@50 {
> -		compatible = "atmel,24c64";
> +		compatible = "atmel,24c128";
>   		reg = <0x50>;
>   	};
>   };
> @@ -461,7 +461,7 @@
>   	};
>   
>   	eeprom@50 {
> -		compatible = "atmel,24c64";
> +		compatible = "atmel,24c128";
>   		reg = <0x50>;
>   	};
>   };
Reviewed-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>


We do not have schematics available for the VRM cards, but
I did confirm with the system designers that the EEPROMs are
indeed 128Kbit in size.
--
Santosh
