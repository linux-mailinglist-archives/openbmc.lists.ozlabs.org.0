Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F94D583C
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 03:39:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF9BC5RKMz30Dv
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 13:39:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A5jA/zf/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A5jA/zf/; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF99Q2DNwz30R1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 13:38:49 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id t11so10883971wrm.5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 18:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a7DTeDEbKx5KJQVwJ+AhwwoJQbxNGNy74ssqdwTeGWc=;
 b=A5jA/zf/Z3qsp0jKcMLCJskCu9VJ2wvvcK6Ohyq0JvZGOcv8RqGHSQZ+dktx2ayM19
 /WrgSt75xLxG0fWpRU373ELgPH485foVSzz17U24LLUQ4OMmL9Hx0uBgxuB81xPbvdEf
 jRKUAetojzHExGsxIwKUnFyQxSMUsw5WNKIJnERDsQVXsgwmKU3Ox1pvtPFM4+9qUGLz
 pHugdqNe8mLJuTHVy2FIXwp3q6xjFKP2BqqTYzWQfH2ShPuInbXoIvUlMdtXv2QKJXCx
 CthAu8iY1f8ZwW+06Fqc1cN2xNaAOfvJrcC75yBkL3jtISNN0uJpjZlviGYWd4fsvt3O
 SbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a7DTeDEbKx5KJQVwJ+AhwwoJQbxNGNy74ssqdwTeGWc=;
 b=cwy3fzPhVbTb394TTJnsc7icALP6t3v9Nm3cFO+ePWFdh/Mh1MvBRXI5prSjLOXpjD
 aPlt4CEfDRhMZQLl8FF80sIIe4bYRJTtZ19UZXCKyNu1uGHNvrZjOfxN1x6lBGTZ3D5x
 kwG64SAAiooLAk6NyJI7xBf5P8HvvOMSkgr+gndINTQWjPvys+0KQOwR6Aa06FWntwkV
 L3KpOGG1PdybhC9Ol5u80ZU9xG+t502SVBy7qj4MjzuZ6C1EbipOs95Es5rOmvzOUqVB
 uEdWTfQciyuYa8N/GoEKaPTz800w3anq8GMA/9ZqOoEtvDWG1F3DcAGfen7TKKU0VQWC
 X13w==
X-Gm-Message-State: AOAM531H1Oo4Vlh/JlkAAr3b6a3YtgKItX5D9LKYe7qJChjYsEkSor4e
 ucZO0omiINHomI2aDhXVtXY4JjzNxl/0ft4ezxQ=
X-Google-Smtp-Source: ABdhPJzan+575jWFZNJg0aqxz6vncXWbvUFYtNBVRas43tiHZ7FW5Ne8nNjHpBg4itlF+DqRpszg8Uh33vVb76pxzb0=
X-Received: by 2002:a5d:47ac:0:b0:1fc:f09b:c258 with SMTP id
 12-20020a5d47ac000000b001fcf09bc258mr5765512wrb.618.1646966325578; Thu, 10
 Mar 2022 18:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20220311001858.4166205-1-bjwyman@gmail.com>
 <3602c1b2-1335-0663-c96a-c524c555ccc9@roeck-us.net>
In-Reply-To: <3602c1b2-1335-0663-c96a-c524c555ccc9@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Thu, 10 Mar 2022 20:38:10 -0600
Message-ID: <CAK_vbW3ccx-bXzTXGJHj-v1o8f0ehqp8Xf=e_667jaWisAWb-A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
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
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 7:00 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/10/22 16:18, Brandon Wyman wrote:
> > Add a clear_faults write-only debugfs entry for the ibm-cffps device
> > driver.
> >
>
> This does not explain _why_ this would be needed.
>
> Guenter

I must have chopped that out when I did a squash on the commits I had.

>
> > Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> > ---
> >   drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> > index e3294a1a54bb..fca2642a8ed4 100644
> > --- a/drivers/hwmon/pmbus/ibm-cffps.c
> > +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> > @@ -67,6 +67,7 @@ enum {
> >       CFFPS_DEBUGFS_CCIN,
> >       CFFPS_DEBUGFS_FW,
> >       CFFPS_DEBUGFS_ON_OFF_CONFIG,
> > +     CFFPS_DEBUGFS_CLEAR_FAULTS,
> >       CFFPS_DEBUGFS_NUM_ENTRIES
> >   };
> >
> > @@ -274,6 +275,13 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
> >               if (rc)
> >                       return rc;
> >
> > +             rc = 1;
> > +             break;
> > +     case CFFPS_DEBUGFS_CLEAR_FAULTS:
> > +             rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
> > +             if (rc < 0)
> > +                     return rc;
> > +
> >               rc = 1;
> >               break;
> >       default:
> > @@ -607,6 +615,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
> >       debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
> >                           &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
> >                           &ibm_cffps_fops);
> > +     debugfs_create_file("clear_faults", 0200, ibm_cffps_dir,
> > +                         &psu->debugfs_entries[CFFPS_DEBUGFS_CLEAR_FAULTS],
> > +                         &ibm_cffps_fops);
> >
> >       return 0;
> >   }
>
