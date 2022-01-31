Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A844A3D8F
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnHn11N52z30Qt
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:13:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Pt9cfmAR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Pt9cfmAR; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnHmb6YDyz30L4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:13:01 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id s6so11904747qvv.11
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8bWz6hjQesnpgAx1fa3oiR3St3SQ7FF/bIrchO6Uisg=;
 b=Pt9cfmARecu1Ta2GVliOGD2nUWaZn9OI9Qrl90RHAw9f3u78+1xBmEe2uMKwWz9k7/
 Eh0Clx/EDbcFGWEAw/e+hWDcPTWYaXxC2wvTn+llXKuaL7RDMoInNhvyg20bpO9BZ+kr
 Uj3GzQxAEvCXgZyiYrbxJG7W0JzykQFsqGGqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8bWz6hjQesnpgAx1fa3oiR3St3SQ7FF/bIrchO6Uisg=;
 b=UUtjEsIz8suYkslBfIseswRLryQK796br5sA0F+fkIvswq1SkzIMLmZqG75w3SSlP+
 k0fesWQfnEBm15vZVl5o3FKRPbVS1YcKBKhPZvdPzaJaDgAmVJY4N6LZP1Tk17h8dG3i
 TtvKBUfN5Ahyra2CK58d2e3foPLTMQwpmF/4zM8MGnMNdiGWochOfc96LeKUFN7MOC+I
 UnJTgFoCx9Wp1WMWAQQHGGE589wORoWt0CDDmVcuFOK+PNwBsXD/7JumxadIXD1mUOVV
 RjZwHssc1sONj38pEjPydOk/dpRrRSLWWXNJhHXT495pULtTErzBBhbefk/iwpKLg2Ua
 ekYw==
X-Gm-Message-State: AOAM530qHM/T7LvmUbUqp4zqzsUa29qrcrXqvxAgk1xgKJW6YdUsoGX1
 FsgP+uNNLUlbe9YFlVkNn+UE7O7AT/PZnSFNIJdQEF/k
X-Google-Smtp-Source: ABdhPJzK5syXojek3XnrfX2QjWjcVFprBcvO/XK7oqoZlGmYvZqjBLtPs6GbHU/C961iDxAEXp9KJWMz9La3t5LcTEM=
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr16271189qvb.130.1643609578559; 
 Sun, 30 Jan 2022 22:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20220128214852.21551-1-eajames@linux.ibm.com>
In-Reply-To: <20220128214852.21551-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:12:46 +0000
Message-ID: <CACPK8XdEDt44srkTR6yQuU+_hpESLK5wE7Wj9=+XMUaY2PNYgg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 0/3] Support PL2303 on AST2600
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
> This series provides support for the PL2303 serial-to-USB converter
> on the AST2600-based systems, Everest and Rainier.
>
> Eddie James (3):
>   USB: serial: pl2303: Add IBM device IDs
>   USB: uhci: Add ast2600 compatible
>   arm: dts: Aspeed: Rainier and Everest: Enable UHCI

I merged the device ID and the device tree change, and added the
driver to the defconfig.

Cheers,

Joel

>
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
>  drivers/usb/host/uhci-platform.c             | 3 ++-
>  drivers/usb/serial/pl2303.c                  | 1 +
>  drivers/usb/serial/pl2303.h                  | 3 +++
>  5 files changed, 14 insertions(+), 1 deletion(-)
>
> --
> 2.27.0
>
