Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5537E0C36
	for <lists+openbmc@lfdr.de>; Sat,  4 Nov 2023 00:28:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jLQHORFQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMcPz28Jfz3cW7
	for <lists+openbmc@lfdr.de>; Sat,  4 Nov 2023 10:28:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=jLQHORFQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 689 seconds by postgrey-1.37 at boromir; Sat, 04 Nov 2023 10:28:24 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMcPN5l4kz2xqH
	for <openbmc@lists.ozlabs.org>; Sat,  4 Nov 2023 10:28:24 +1100 (AEDT)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B6396C5953
	for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2023 23:17:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F059920003;
	Fri,  3 Nov 2023 23:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699053457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x9+2Ds6qHlsKkAZ8Qimij0GdkxZaoPt8iNhbBiZi5kM=;
	b=jLQHORFQnfhLF6sIACk/BnEWzYQErzbRUEQX4AAjXrHk3ZABz3/TCBG/lpwPtbXlFhUYXe
	lInoLK32DOG1W10Ak1XJhOClDFqwlFmCp8EdZekwAOd7rPsvFHw5NmSb1rMMPqYtYjC8J8
	unlPnhqgHBxuFARFW5LENl3CynTN81v8AeUCGAeXGPN2bmIWMEWY9b8vfiN1/B05wfKxri
	uNXKpNNspVQfVI4iZIx0mJrt2gWLvoPrTIIOPzTMjdrhaGJmy5F0BuGwydTZtcxjQ+D2F6
	dgw7tl7gBYbiKtXPAEllqySA1QDXoWjsgXRJc0fU4fmL4dDKm0NS3YDuvSSPyA==
Date: Sat, 4 Nov 2023 00:17:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v6 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <20231103231735b4769ca4@mail.local>
References: <20230913013719.8342-1-mimi05633@gmail.com>
 <20230913013719.8342-2-mimi05633@gmail.com>
 <20231103231639fd4b631c@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103231639fd4b631c@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, mylin1@nuvoton.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, KFLIN@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04/11/2023 00:16:40+0100, Alexandre Belloni wrote:
> On 13/09/2023 09:37:19+0800, Mia Lin wrote:
> > The NCT3015Y-R and NCT3018Y-R use the same datasheet
> >     but have different topologies as follows.
> > - Topology (Only 1st i2c can set TWO bit and HF bit)
> >   In NCT3015Y-R,
> >     rtc 1st i2c is connected to a host CPU
> >     rtc 2nd i2c is connected to a BMC
> >   In NCT3018Y-R,
> >     rtc 1st i2c is connected to a BMC
> >     rtc 2nd i2c is connected to a host CPU
> > In order to be compatible with NCT3015Y-R and NCT3018Y-R,
> > - In probe,
> >   If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
> >   Else, do nothing
> > - In set_time,
> >   If part number is NCT3018Y-R && TWO bit is 0,
> >      change TWO bit to 1, and restore TWO bit after updating time.
> > 
> > Signed-off-by: Mia Lin <mimi05633@gmail.com>
> > ---

I forgot to add, please include a changelog here, this will make my
reviews easier (and faster).

> >  drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 46 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> > index ed4e606be8e5..b006b58e15e2 100644
> > --- a/drivers/rtc/rtc-nct3018y.c
> > +++ b/drivers/rtc/rtc-nct3018y.c
> > @@ -23,6 +23,7 @@
> >  #define NCT3018Y_REG_CTRL	0x0A /* timer control */
> >  #define NCT3018Y_REG_ST		0x0B /* status */
> >  #define NCT3018Y_REG_CLKO	0x0C /* clock out */
> > +#define NCT3018Y_REG_PART	0x21 /* part info */
> >  
> >  #define NCT3018Y_BIT_AF		BIT(7)
> >  #define NCT3018Y_BIT_ST		BIT(7)
> > @@ -37,10 +38,12 @@
> >  #define NCT3018Y_REG_BAT_MASK		0x07
> >  #define NCT3018Y_REG_CLKO_F_MASK	0x03 /* frequenc mask */
> >  #define NCT3018Y_REG_CLKO_CKE		0x80 /* clock out enabled */
> > +#define NCT3018Y_REG_PART_NCT3018Y	0x02
> >  
> >  struct nct3018y {
> >  	struct rtc_device *rtc;
> >  	struct i2c_client *client;
> > +	int part_num;
> >  #ifdef CONFIG_COMMON_CLK
> >  	struct clk_hw clkout_hw;
> >  #endif
> > @@ -177,8 +180,27 @@ static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >  static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > +	struct nct3018y *nct3018y = dev_get_drvdata(dev);
> >  	unsigned char buf[4] = {0};
> > -	int err;
> > +	int err, flags;
> > +	int restore_flags = 0;
> > +
> > +	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> > +	if (flags < 0) {
> > +		dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_CTRL.\n");
> > +		return flags;
> > +	}
> > +
> > +	/* Check and set TWO bit */
> > +	if ((nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BIT_TWO)) {
> > +		restore_flags = 1;
> > +		flags |= NCT3018Y_BIT_TWO;
> > +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > +		if (err < 0) {
> > +			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
> > +			return err;
> > +		}
> > +	}
> >  
> >  	buf[0] = bin2bcd(tm->tm_sec);
> >  	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
> > @@ -212,6 +234,18 @@ static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  		return -EIO;
> >  	}
> >  
> > +	/* Restore TWO bit */
> > +	if (restore_flags) {
> > +		if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y)
> > +			flags &= ~NCT3018Y_BIT_TWO;
> > +
> > +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > +		if (err < 0) {
> > +			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
> > +			return err;
> > +		}
> > +	}
> > +
> >  	return err;
> >  }
> >  
> > @@ -479,11 +513,17 @@ static int nct3018y_probe(struct i2c_client *client)
> >  		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
> >  	}
> >  
> > -	flags = NCT3018Y_BIT_TWO;
> > -	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > -	if (err < 0) {
> > -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> > -		return err;
> > +	nct3018y->part_num = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
> > +	if (nct3018y->part_num < 0) {
> > +		dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_PART.\n");
> > +		return nct3018y->part_num;
> > +	} else if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) {
> 
> This is a weird way to check as this will accept any value of
> NCT3018Y_REG_PART as long as bit 1 is set, is this really what you want?
> 
> > +		flags = NCT3018Y_BIT_HF;
> > +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > +		if (err < 0) {
> > +			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
> > +			return err;
> > +		}
> >  	}
> >  
> >  	flags = 0;
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
