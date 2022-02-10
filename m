Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD34B0BFE
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 12:13:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvYyP3Pqtz3bZF
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 22:13:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EAXLFc6K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EAXLFc6K; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvYxv48Yvz3bSv;
 Thu, 10 Feb 2022 22:12:49 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a8so14368925ejc.8;
 Thu, 10 Feb 2022 03:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6U7aF4ObJyDWzraFLe5UBX3z5gmmdFgy9SvdwQK+hYc=;
 b=EAXLFc6K1/fUlqnuYsnYxz8TjOZVV/1KEIUlIoGQ3ooaxcfslXNgeamlgXfKCE6/IX
 KtldEVRsBfUiya46pfk7348CKRCngQH5KAR0itpR3qpzFxTi8pN9GA7fo0+V5vard7b/
 13EFBMBjx3yEkzDHUDUOoXi5OMmFNPa7zn53emwPYgdk2VOCXfBwD2eiwZy1P43Q+1Pf
 M9WsEm3BlX/YcZLULPuqORQ6SCOOaJRo1DAQQypowq4v2pI3I/ytl+3SR5Y6LJgibKSi
 OaTfnmVrFx4ffTsL9GT7+57+Zctq+EyMXuyqc7J1loPDzAdS8RLpxX0+Ejk+/fmhCrQM
 ZbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6U7aF4ObJyDWzraFLe5UBX3z5gmmdFgy9SvdwQK+hYc=;
 b=h5ZNHTYteEvE8AwS3AkNmt64sJd1NxIuEDi03IwBggdlvovXWSeOa7X5spsxyYS7W1
 Vq0eEGXdM0+Upk54rakHQgSumXFh2H2vro8qLJWmgKDsC32+yuBABGtrqV3EAaFN7MI1
 OPMn8xYqEOqQPMCHIAXbBpJBqedIX6jyZXeqKAEoxFt0M7o5MaphB3W7/o97o/OrZ/O5
 fCSgGU/i1yx4eRg28GPVlWs8+QQDh/uOWsEXhXFRurp1tmNDVyAXa2xi3LC4odfcRAzP
 8IdcF+AgFeX4AJeHSltvd1ZPHYbdez/iitvvEQJZlSWSs14M/bQp/l5aFBwsTp6SDh5o
 rT5w==
X-Gm-Message-State: AOAM532hibTcrmrGYco7AvWVcyUOJ4LlOo3xpFoBRDffdCGSRRjhlc4q
 sll+lKelDfHirQqfmEBaAeXd11zJ7+TeFqWymAk=
X-Google-Smtp-Source: ABdhPJzkCMLdqG6Vw9eSFrwRrEkPH1p/y0OytAcfu9aOTrlRegu6yU/rynP8zS9Bzp6xR2qqoTrAXc3CgnWrSabIfCY=
X-Received: by 2002:a17:907:2d92:: with SMTP id
 gt18mr5741496ejc.579.1644491563562; 
 Thu, 10 Feb 2022 03:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20220209203414.23491-1-zev@bewilderbeest.net>
In-Reply-To: <20220209203414.23491-1-zev@bewilderbeest.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Feb 2022 13:11:13 +0200
Message-ID: <CAHp75VdyNsrm8oeO0KvyPXNR23VdQEMd9LHks20bLbkE_g7kuw@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port type
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Konstantin Aladyshev <aladyshev22@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 9, 2022 at 10:53 PM Zev Weiss <zev@bewilderbeest.net> wrote:

...

> +/* ASPEED AST2x00 virtual UART */
> +#define PORT_ASPEED_VUART      123

If you are going to put it here, use the existing gap first, no need
to expand the last number.

-- 
With Best Regards,
Andy Shevchenko
