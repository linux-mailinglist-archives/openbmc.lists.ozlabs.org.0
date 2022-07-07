Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1E569C2A
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 09:52:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdpYN4FqQz3c5y
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 17:52:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=F5qIWeZE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=F5qIWeZE;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdpXz33kcz3bvX
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 17:52:35 +1000 (AEST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A0C624000F;
	Thu,  7 Jul 2022 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657180337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlhJMe5eaAfucFNFw5DBnfmQ57zoA/G09jp+D3Ly4pU=;
	b=F5qIWeZE6+voZZFvqFrGd6OTrFVjxy6GGTxVWW1otoWxpwHffWNwiS9yg6YliSWJ6oOmE0
	Pn9TobsV410XCrOqt2b7FUl5efbnf4DLJqx1ysYOtLEaTSfMw0UFt7J4HGlPt9z4OKtJpk
	6HSz+YzU+eZ7zNk6AVHmXEo5NWvFQiahHafGm47iXkpAEg8vK63HMqFSwAGlZRlkgKG2Pn
	RtbZKViwdSU3C6lB7QJ7UMxcB8ioZdI+jzYhcaXhvfSZMueHxPR1eNlpmEVdb6B2zILmW0
	235E7rDpjU4wYMa5zTh3OinBuzjxplR5pM/gSykulsdT74x43pKR2k6GlWNj3g==
Date: Thu, 7 Jul 2022 09:52:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mining Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v3 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <YsaQrksj8jBhJYGP@mail.local>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
 <20220527084647.30835-4-ctcchien@nuvoton.com>
 <YrYd+FkiFPz84twJ@mail.local>
 <CAHpyw9cdmCSZEE4ZbpnehpyvFhpPWA+_E5zXzJerNX9xqYet5Q@mail.gmail.com>
 <CAL3ZnpzSm7f1L2MMuDr9_vg3TQuk3PSr46fwmJTMz4sA2sdCJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL3ZnpzSm7f1L2MMuDr9_vg3TQuk3PSr46fwmJTMz4sA2sdCJg@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, CS20 MYLin1 <mylin1@nuvoton.com>, YSCHU@nuvoton.com, Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, KFTING <KFTING@nuvoton.com>, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Medad Young <medadyoung@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 07/07/2022 15:17:28+0800, Mining Lin wrote:
> Dear Alexandre,
> 
> Thank you for your comments.
> I will refine and reply below.
> 
> Thanks.
> Best Regards,
> Mia
> 
> Medad Young <medadyoung@gmail.com> 於 2022年7月7日 週四 下午1:31寫道：
> >
> > Hello Alexandre,
> >
> > Thanks for your comments.
> > I add Mining Lin <mimi05633@gmail.com> into this mail thread,
> > and she is going to follow up this RTC driver.
> > She will be in charge of maintaining this driver.
> >
> > Alexandre Belloni <alexandre.belloni@bootlin.com> 於 2022年6月25日 週六 凌晨4:26寫道：
> > >
> > > Hello,
> > >
> > > Please run ./scripts/checkpatch.pl --strict on your patch, there are a
> > > bunch of issues.
> > >
> [Mia] I will run ./scripts/checkpatch.pl --strict on my patch to fix issues.
> 
> > > On 27/05/2022 16:46:47+0800, medadyoung@gmail.com wrote:
> > > > +static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> > > > +{
> > > > +     int err, flags;
> > > > +
> > > > +     dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
> > > > +
> > > > +     flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> > > > +     if (flags < 0) {
> > > > +             dev_err(&client->dev,
> > > > +                     "Failed to read NCT3018Y_REG_CTRL\n");
> > >
> > > You should cut down on the number of error messages, they are usually
> > > not useful as the user doesn't have any specific action after getting
> > > one of them apart from trying the action once again. Also, this will
> > > make your code shorter. dev_dbg is fine.
> > >
> [Mia] I will modify dev_err to dev_dbg if there is an error and nothing to do.
> 
> > > > +/*
> > > > + * In the routines that deal directly with the nct3018y hardware, we use
> > > > + * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
> > > > + */
> > > > +static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > > > +{
> > > > +     struct i2c_client *client = to_i2c_client(dev);
> > > > +     unsigned char buf[10];
> > > > +     int err;
> > > > +
> > >
> > > You should still return an error if the time is invalid there but without
> > > an error message.
> > >
> [Mia] I will verify the time by rtc_valid_tm(tm).
> 

No, I meant checking NCT3018Y_REG_ST as was done in the previous
revisions of the series

> > > > +static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
> > > > +{
> > > > +     struct i2c_client *client = nct3018y->client;
> > > > +     struct device_node *node = client->dev.of_node;
> > > > +     struct clk *clk;
> > > > +     struct clk_init_data init;
> > > > +     int flags, err;
> > > > +
> > > > +     /* disable the clkout output */
> > > > +     flags = 0;
> > > > +     err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CLKO, flags);
> > >
> > > BTW, this introduces a glitch in the clock output if the clock is
> > > actually used. Maybe you could just rely on the CCF core to disable this
> > > clock when there are no users.
> > >
> [Mia] Do you mean there is no need to disable the clock output here?
> 

The CCF will disable the clock at boot time if there are no users

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
