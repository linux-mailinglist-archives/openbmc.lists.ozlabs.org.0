Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F654DB923
	for <lists+openbmc@lfdr.de>; Wed, 16 Mar 2022 21:04:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJh7C0BYsz30NZ
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 07:04:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FqfD0qVQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FqfD0qVQ; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJh6r36tBz3081
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 07:03:46 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id h23so3892901wrb.8
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRrmSaXTPuHNH4vczPmmM5RurjEif4JresYAJudYvWc=;
 b=FqfD0qVQyY2JzhSPaxqS+ifkhnrgmFYU8pFZiQ5Ld/+ajw2zlH3GxSV49hEgPXm2wp
 QH7feBbRLhu/He4VjdQ6QDME1HBxtBUCBB88Bu7xziemX5wIBBXic1xJWuOIuDiXgnBg
 mfohjMUO82cePSELJ7ANo6/q/IZTc2BmK9hB2PcDLWjlo2JAKJEaILrqAO5KbX7lyw7W
 WeFdd6YuuH3/puhFwFRu1RwRadoeZd7XLBoQdz46Tmj4vABMEA8A/1gtHoqWBposDlws
 lfI8KvHTvsRdIS2VuX2fVZasA+oz7bMpHfRUTKcBDqFZhOj1QImcT1SIyQI++DGdjces
 RhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRrmSaXTPuHNH4vczPmmM5RurjEif4JresYAJudYvWc=;
 b=2L3P0nEN4YLz+cEGfxF9kjBrxsa7MEEFVhbvGN7fjm1mPcmtB0PTUnlVmPpo0snQMO
 zabpyG/C6zelRhjYXFAH8i/5+R1V7i+PA3Pd6WT+9JbqkmJxo4Xu5sSk2sMzSSmjwEmr
 gAd5+0SSJmBPBybg2Q88L97BsyTGw1oFxUf3lEhycIfzKmn6k3bc/jyRo7EDPbK6Md5b
 deeqqJkRXvsWW/sJFVuixpek2I2/eG/jWjn1PW5JH412Kn3sDLDt3FpjI5+pXpwze0hP
 gcDvioX2+mh4ld6bTKmTLNj20DOJlwMrcqAlfZRvzwAr09hIzO7SCbepGbCNFE1oBPZl
 K5bw==
X-Gm-Message-State: AOAM531F4MyUMHEHoKHLjmK6du/cf1DK7ZznRGEiE7GNon1QFGK0FPs1
 HwSlkI3vWvl/hnrA71XXN84GGSzhmvKnTAnUN3g=
X-Google-Smtp-Source: ABdhPJwe/qOmXM9fRYbfR0TjwFrwz2y+p/GQCaKzJzgfLqeXm63idcDnub/1584eptHtzSB+GwGei7Si0y9PArMPYsY=
X-Received: by 2002:a5d:47a7:0:b0:203:d1b4:8f6 with SMTP id
 7-20020a5d47a7000000b00203d1b408f6mr1298090wrb.36.1647461021390; Wed, 16 Mar
 2022 13:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220311181014.3448936-1-bjwyman@gmail.com>
 <fa8b2d9f-e5c9-73f4-3916-84e370748687@roeck-us.net>
In-Reply-To: <fa8b2d9f-e5c9-73f4-3916-84e370748687@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 16 Mar 2022 15:03:05 -0500
Message-ID: <CAK_vbW2S07+S8+PrQnBLjvXYnLBXU06FHBvfM2zaT6RYx9HO+g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
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

On Sun, Mar 13, 2022 at 11:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/11/22 10:10, Brandon Wyman wrote:
> > Add a clear_faults write-only debugfs entry for the ibm-cffps device
> > driver.
> >
> > Certain IBM power supplies require clearing some latched faults in order
> > to indicate that the fault has indeed been observed/noticed.
> >
>
> That is insufficient, sorry. Please provide the affected power supplies as
> well as the affected faults, and confirm that the problem still exists
> in v5.17-rc6 or later kernels - or, more specifically, in any kernel which
> includes commit 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning
> bits after read").
>
> Thanks,
> Guenter

Sorry for the delay in responding. I did some testing with commit
35f165f08950. I could not get that code to send the CLEAR_FAULTS
command to the power supplies.

I can update the commit message to be more specific about which power
supplies need this CLEAR_FAULTS sent, and which faults. It is observed
with the 1600W power supplies (2B1E model). The faults that latch are
the VIN_UV and INPUT faults in the STATUS_WORD. The corresponding
STATUS_INPUT fault bits are VIN_UV_FAULT and Unit is Off.

>
> > Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> > ---
> > V1 -> V2: Explain why this change is needed
> >
> >   drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> > index e3294a1a54bb..3f02dde02a4b 100644
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
