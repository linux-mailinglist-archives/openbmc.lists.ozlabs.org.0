Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BD3E31D6
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 00:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhL173VNhz3clf
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 08:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cXdU8wHD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cXdU8wHD; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhL0s56jrz30F6
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 08:35:56 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id n11so6494778wmd.2
 for <openbmc@lists.ozlabs.org>; Fri, 06 Aug 2021 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVuKbVXZPtoRifrL8/ErqID3f4/WzrsOET4lmsi9jdM=;
 b=cXdU8wHDYBlcJ3IzjjewATWeMWDgR/r5xlHegYBEWwsiz4MJbs8C3cbisSeUGZtj+V
 50PfYzziLCmPJwMkTaxjlKQ3cNgX+owhC2eu2npT3j5jOvxVtrmiDGKYRRZGKG/sOfiZ
 kvoyE7TbbT4HHtrvIvKEqybKY+/Ee+uUhdxvIup+NtnluzF+w09abz+MIUTVOHsiNLLn
 H93WHO/OdJ3ar8HnQn5XNEX3g07cDKPtU+G94ROk/R4JDxLViKeG6nqd7G3XeGD/X812
 KGqIj6VeTKyQRxIbRp4MA6HnUFPu44d66+C5aRNwkizqnP6Ssa5VTPTDuxaGLGyW8x12
 GJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVuKbVXZPtoRifrL8/ErqID3f4/WzrsOET4lmsi9jdM=;
 b=QP5XuXecQeYRI+ObwEJbO/bpZJ614l18HmyxoqhP1ZJ73GshsqpNDlgSfgJOTA9NGf
 IP0DzH8XSBmstzna90na12bHMUlEra7gKX5MduD5Eg3/TCQ7l808ZwTLE2M1ZG1t0Fka
 JwbbWZGi6td+hdKLr7ro2TCi2g1kBcjT806x0OQw0U5TVLtClf+IX4Zyqp2dksrllMEX
 4UdFX/FR/pw8aqt8ucSU8ghxKWdMwsP4eFUM1zdUKlGBO+sZ48ehnFymKCD/kqwA8ja0
 6iYEX4eAtr8MgvlpRAJW6eU3k4TyI0/KHNt/PcfU1tanKhtgU9ZOD1Epsnjwr6RSUQXB
 keSg==
X-Gm-Message-State: AOAM530MZlwt4XhTOiaDCdlnmkpXCQwaUzHt0AiALovEdDv2CQ4I0CHT
 yqAWm624y+qdDOa3IN8My3odWbjJgHjd61JRD1U=
X-Google-Smtp-Source: ABdhPJy4exHJo7eECucP6QTzRqjbBgev399KS4p1yQCB6h9gvKKlZJlxKha5VxsptfltcWQe2jefoPHtsBOx1XBlKKQ=
X-Received: by 2002:a1c:208e:: with SMTP id
 g136mr22386947wmg.142.1628289349581; 
 Fri, 06 Aug 2021 15:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210728224140.3672294-1-bjwyman@gmail.com>
 <2517b3a8-6549-3ee6-76d3-6545a38cf6ea@roeck-us.net>
In-Reply-To: <2517b3a8-6549-3ee6-76d3-6545a38cf6ea@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Fri, 6 Aug 2021 17:35:15 -0500
Message-ID: <CAK_vbW2fU+i6H5bV79eQAnFUzfuO-czyxbT9cbJmv34Sei5Log@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 6:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/28/21 3:41 PM, Brandon Wyman wrote:
> > From: "B. J. Wyman" <bjwyman@gmail.com>
> >
> > When doing a PMBus write for the LED control on the IBM Common Form
> > Factor Power Supplies (ibm-cffps), the DAh command requires that bit 7
> > be low and bit 6 be high in order to indicate that you are truly
> > attempting to do a write.
> >
> > Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
>
> Please be consistent and use "Brandon Wyman".

Ack. Curiously, that is the first time someone has pointed out that
inconsistency.

>
> Guenter
>
> > ---
> >   drivers/hwmon/pmbus/ibm-cffps.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> > index 5668d8305b78..df712ce4b164 100644
> > --- a/drivers/hwmon/pmbus/ibm-cffps.c
> > +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> > @@ -50,9 +50,9 @@
> >   #define CFFPS_MFR_VAUX_FAULT                        BIT(6)
> >   #define CFFPS_MFR_CURRENT_SHARE_WARNING             BIT(7)
> >
> > -#define CFFPS_LED_BLINK                              BIT(0)
> > -#define CFFPS_LED_ON                         BIT(1)
> > -#define CFFPS_LED_OFF                                BIT(2)
> > +#define CFFPS_LED_BLINK                              (BIT(0) | BIT(6))
> > +#define CFFPS_LED_ON                         (BIT(1) | BIT(6))
> > +#define CFFPS_LED_OFF                                (BIT(2) | BIT(6))
> >   #define CFFPS_BLINK_RATE_MS                 250
> >
> >   enum {
> >
>
