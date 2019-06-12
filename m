Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FC41A75
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 04:43:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NrlN30qVzDqw6
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 12:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="efOjgZlf"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nrkt4rvgzDqvK
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 12:42:46 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id r6so9074169qkc.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wVXIj7DyG152HkSH2Qqv9JMh7oAU2JPVyeJUwfS/zXY=;
 b=efOjgZlfF7A3rGPnpHLQH6ptpkWFgXqGRwvKYA1QbteSOPMLiyOY/vqnkM5fhQyVDP
 tu9dJutUIXXlAA4aQdCrITPnWKZ2ph+FyzQga3gzR5XSxIPCLoYgIBUOtLsT8did+Sdq
 sNMiXNQlBx3dulX4oh7e05UeVMD9URYzQd5TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wVXIj7DyG152HkSH2Qqv9JMh7oAU2JPVyeJUwfS/zXY=;
 b=jPe0GqLJoC61asb/Hc+mUUjmEgzhch4gyx7UXYUJsw8jzYTD6JUHRs3ihsd4Mc8W0C
 IpUZOTXzupk0VVkUcEHg7pjEmNfMD9vavfqlpLz5LqyCOt0qMfr5I4b5nUakpyheG7Ie
 CCqpU7xOufu2TyPuZwqGihrAQDbbuNTYNJLAsabn4Gk7CVyb9jA9dfRH7hrf2P7ovIQz
 dhPHCsh7SMwxPR3BC/f/x9ztSVdSF4hr2APqFGoA8lwnc0hAbSI0UPpYfgpcgFIp36zl
 quPylurMn4rGfS4IBCTeL3KMhBdy89ImuExbi9cayxxvBgHwdJlizHplpDeiQq3+5UEn
 9iYQ==
X-Gm-Message-State: APjAAAUdiwWdpjARqhqqkFEoUCauJTttfy8RqoJACEJZZw8+ml6QOxIz
 jq+U7tB4R+g8M1P+kqhuXaEy//eaKEtTHxftiFo=
X-Google-Smtp-Source: APXvYqww+khNjI4lncMW0BV4HyF0R9jY9nFf8TuUAZpI2+PH3JtjCD1izq34xP03yJGFik590tOUS2TilwEwZNNt6uc=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr65268966qke.76.1560307363028; 
 Tue, 11 Jun 2019 19:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-3-sam@mendozajonas.com>
In-Reply-To: <20190606044950.5930-3-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 02:42:31 +0000
Message-ID: <CACPK8XeSi68qF1AQDq3JZCfRDnj=6tWZvyiXaOiQKKk9ZtGHaw@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: Include NC-SI in phy setup
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> Add NC-SI to the usual phy handling. This makes two notable changes:
> - Somewhat similar to a fixed phy, phy_connect() will create an NC-SI
> phy if CONFIG_PHY_NCSI is defined.
> - An early return is added to phy_read() and phy_write() to handle a
> case like the NC-SI phy which does not define a bus.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
