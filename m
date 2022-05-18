Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C7252B49F
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 10:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L35kd2sksz3c8c
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 18:29:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=hZvXa/hx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hZvXa/hx; dkim-atps=neutral
X-Greylist: delayed 47830 seconds by postgrey-1.36 at boromir;
 Wed, 18 May 2022 18:29:10 AEST
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L35kG0c3wz2xm2
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 18:29:07 +1000 (AEST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3692C0003;
 Wed, 18 May 2022 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652862541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlIcAIfMVoOYvEtRo6Y7sDw80J8H5Asrq5W676I+ZIY=;
 b=hZvXa/hx1psoDuOQFjEyl/yioMON23FcQdUZSzeMOtlIPgecU8iKY3RSGSpxH4IKSZhac+
 HODp6gBIRfPOTZa0I/N/UomGqDuokBldquZyB4xF1VG+NWiCfNq8tXvPVNMpkUomuafM1i
 AKdNdJ5VOcsJtu+65Fu6bMjQvLw/f4e798kfP0Wd9l3BOzv0FHQUJP3zLoUAeuCP0JiS31
 dKjn8KfaCYIg3EalEb0a10izQbg99gyy0nGOW6gSzccY9x/qh+lBlOM9FR0iCkSi/j+ZWF
 +ICGbm+l3bOOQNHQ332soUs0naiH4btAmci3DJXK2q2zww4bI2oSwg3NMa1ggg==
Date: Wed, 18 May 2022 10:28:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Medad Young <medadyoung@gmail.com>
Subject: Re: [PATCH v2 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <YoSuS+nFJoD4+oKM@mail.local>
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-4-ctcchien@nuvoton.com>
 <YoPzaSc/8BBVWWsB@mail.local>
 <CAHpyw9fw54hQrsPa4psbUs2VfBqHj+gMKDceL2N5k8_jU+434w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHpyw9fw54hQrsPa4psbUs2VfBqHj+gMKDceL2N5k8_jU+434w@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, YSCHU@nuvoton.com,
 Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, KFTING <KFTING@nuvoton.com>,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/05/2022 11:11:00+0800, Medad Young wrote:
> > > +config RTC_DRV_NCT3018Y
> > > +     tristate "Nuvoton Real Time Clock"
> >
> > This definitively needs a better description
> 
> OK, I will add a better description.

To be clear, this needs at least the part number

> > > +     tm->tm_wday = buf[6] & 0x07;
> > > +     tm->tm_mday = bcd2bin(buf[7] & 0x3F);
> > > +     tm->tm_mon = bcd2bin(buf[8] & 0x1F) - 1 ; /* rtc mn 1-12 */
> > > +     tm->tm_year = bcd2bin(buf[9]) + 100;
> > > +
> > > +     dev_dbg(&client->dev, "%s:s=%d, m=%d, hr=%d, md=%d, m=%d, yr=%d, wd=%d\n",
> > > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mday, tm->tm_mon,
> > > +             tm->tm_year, tm->tm_wday);
> > > +

I forgot but this dev_dbg is not particularily useful as we have
tracepoint in the core. However, if you want to keep it, please use
%ptR.

> > > +     return 0;
> > > +}
> > > +
> > > +static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
> > > +{
> > > +     struct i2c_client *client = to_i2c_client(dev);
> > > +     unsigned char buf[10] = {0};
> > > +     int err;
> > > +
> > > +     dev_dbg(&client->dev, "%s:s=%d, m=%d, hr=%d, md=%d, m=%d, yr=%d, wd=%d\n",
> > > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mday, tm->tm_mon,
> > > +             tm->tm_year, tm->tm_wday);

Ditto

> > > +
> > > +     err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, buf);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     if (!(buf[0] & NCT3018Y_BIT_TWO)) {
> > > +             dev_err(&client->dev,
> > > +                     " TWO is not set.\n");
> >
> > This is not useful, what is TWO?
> 
> TWO stands for Time Registers Write Ownership
> for NCT3018Y, driver needs to set this bit before writing to other registers
> 

Can't you simply set it forcefully here instead of erroring out?

> >
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     /* hours, minutes and seconds */
> > > +     buf[NCT3018Y_REG_SC] = bin2bcd(tm->tm_sec);
> > > +     buf[NCT3018Y_REG_MN] = bin2bcd(tm->tm_min);
> > > +     buf[NCT3018Y_REG_HR] = bin2bcd(tm->tm_hour);
> > > +     buf[NCT3018Y_REG_DW] = tm->tm_wday & 0x07;
> > > +     buf[NCT3018Y_REG_DM] = bin2bcd(tm->tm_mday);
> > > +
> > > +     /* month, 1 - 12 */
> > > +     buf[NCT3018Y_REG_MO] = bin2bcd(tm->tm_mon+1);
> > > +
> > > +     /* year and century */
> >
> > Were is the century?
> 
> I will update the comment, for there is no century.
> 
> >
> > > +     buf[NCT3018Y_REG_YR] = bin2bcd(tm->tm_year - 100);
> > > +
> > > +     return nct3018y_write_block_data(client, NCT3018Y_REG_SC, 10, buf);

So this overwrites the alarm which is something you must not do.

> > > +     buf[0] = bin2bcd(tm->time.tm_sec);
> > > +     buf[1] = bin2bcd(tm->time.tm_min);
> > > +     buf[2] = bin2bcd(tm->time.tm_hour);
> > > +
> > > +     err = nct3018y_write_block_data(client, NCT3018Y_REG_SCA, 1, buf);
> > > +     if (err)
> > > +             return err;
> >
> >
> > Writing byte per byte opens a huge window for a race condition here.
> >
> 
> I write byte per byte,
> because these three registers are not continuous
> 

Right, I did see it and then forgot.

> > > +     nct3018y->rtc = devm_rtc_allocate_device(&client->dev);
> > > +     if (IS_ERR(nct3018y->rtc))
> > > +             return PTR_ERR(nct3018y->rtc);
> > > +
> > > +     nct3018y->rtc->ops = &nct3018y_rtc_ops;
> > > +     nct3018y->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> > > +     nct3018y->rtc->range_max = RTC_TIMESTAMP_END_2099;
> > > +     nct3018y->rtc->set_start_time = true;
> >
> > Do you have a good reason to set set_start_time here?
> >
> 
> Sorry, I am new here.
> I just follow other drivers.
> so you think I should not set set_start_time, right?
> 

There are very few drivers that needs it, when they used to window the
dates they support back to 1970 which is not something you seem to care
about.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
