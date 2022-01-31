Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2E64A3D8B
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnHbF4S9gz30Lc
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:04:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GWklT8YK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GWklT8YK; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnHZq5Xnjz2xD4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:04:33 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id v5so10612371qto.7
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EUA/2+V/aF83sh7ixRxjevQmbamvMxVrhXdWvGgC6M=;
 b=GWklT8YK8uNWmuCEac6Xf26Pbi+Xj1Nm+gEwodIBtLz5P46W+TfSLaytG/tHU909Jq
 Lk3W/05+1C0UClXS3760X2TV+q11EoeNIVhzAaUiJ9rcPdUfUhFDd2KHShlq2/N/tzzj
 WPMBMGxcU/o120pq2JkPDINZhA3VOEO0FDbVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EUA/2+V/aF83sh7ixRxjevQmbamvMxVrhXdWvGgC6M=;
 b=b9uGKIjYfTpcvG3eFSpDKV0GLaEAn9j3Tf2f0RtAqtos/KxlW2E5AydqoRi2Tdu+MV
 Xj5vMCnYzYbVD3G5jwch5MV7AWIE3lnEV6shnTFHF5yWA7U98GKWYZ9RBE/FQlKNZYFJ
 6FwnIFe4SQzZOMqo+iqJ7/b5EJXacPMK+B1KDvEjQh2/r/izQNLO0ch2nSpgy2s+tRYt
 G+5fOy+hMZTEijm2Hi3pcWb9L32yIvUkoOQp5kFev4UIAtWJf+OHh4tBke849fgyKY9i
 g0d5aBH1r6uKJb4l22RHHHGdLaDKLpMCliuD5U+qdFuxQHfy6WCD4aVyF/uVPPpw81Eh
 bH5g==
X-Gm-Message-State: AOAM530ZlSqPaze6sSN4+DiHrPpSaGYF9rQHFCMDR+UU/EUj2ycXViw9
 +lTY86iYRxshCi/rLxwEhgk40WnFar5QRc9Ymfc=
X-Google-Smtp-Source: ABdhPJw6OVfmgSAqMBgr2SSwJVxOOZwxStaN0W5QQuYrtCMhPnav/GjR4S3+CUog8EtolwdF9nrCZY3AAzH145ISokY=
X-Received: by 2002:ac8:7e91:: with SMTP id w17mr13642990qtj.678.1643609070442; 
 Sun, 30 Jan 2022 22:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20220128214852.21551-1-eajames@linux.ibm.com>
 <20220128214852.21551-2-eajames@linux.ibm.com>
In-Reply-To: <20220128214852.21551-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:04:18 +0000
Message-ID: <CACPK8XeSc6yp+uajbQ3E8rUhF4Qk2ijJL-jrT7zFZLgxMYiuTQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 1/3] USB: serial: pl2303: Add IBM device IDs
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jan 2022 at 21:49, Eddie James <eajames@linux.ibm.com> wrote:
>
> IBM manufactures a PL2303 device for UPS communications. Add the vendor
> and product IDs so that the PL2303 driver binds to the device.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Please send this one upstream.

> ---
>  drivers/usb/serial/pl2303.c | 1 +
>  drivers/usb/serial/pl2303.h | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index a70fd86f735c..e2ef761ed39c 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -116,6 +116,7 @@ static const struct usb_device_id id_table[] = {
>         { USB_DEVICE(ADLINK_VENDOR_ID, ADLINK_ND6530GC_PRODUCT_ID) },
>         { USB_DEVICE(SMART_VENDOR_ID, SMART_PRODUCT_ID) },
>         { USB_DEVICE(AT_VENDOR_ID, AT_VTKIT3_PRODUCT_ID) },
> +       { USB_DEVICE(IBM_VENDOR_ID, IBM_PRODUCT_ID) },
>         { }                                     /* Terminating entry */
>  };
>
> diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
> index 6097ee8fccb2..c5406452b774 100644
> --- a/drivers/usb/serial/pl2303.h
> +++ b/drivers/usb/serial/pl2303.h
> @@ -35,6 +35,9 @@
>  #define ATEN_PRODUCT_UC232B    0x2022
>  #define ATEN_PRODUCT_ID2       0x2118
>
> +#define IBM_VENDOR_ID          0x04b3
> +#define IBM_PRODUCT_ID         0x4016
> +
>  #define IODATA_VENDOR_ID       0x04bb
>  #define IODATA_PRODUCT_ID      0x0a03
>  #define IODATA_PRODUCT_ID_RSAQ5        0x0a0e
> --
> 2.27.0
>
