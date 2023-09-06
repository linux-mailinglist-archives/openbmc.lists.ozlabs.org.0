Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8501E793E4A
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 16:02:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=R+wgsfOV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgkZj0slLz3bTj
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 00:02:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=R+wgsfOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 113178 seconds by postgrey-1.37 at boromir; Thu, 07 Sep 2023 00:01:33 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgkZ52WThz2xm6
	for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2023 00:01:30 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64C85E0014;
	Wed,  6 Sep 2023 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694008886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Cc3GDyhTJkNnRyDhyOHbwZd++EIJkpgVHFot9WD1+s=;
	b=R+wgsfOVdpCFKot7c1YUEADgmYoIQ5/WhpjKIOe4kdT91hMjPded5ljT30TGF1L07Lv016
	yYGyZlJt8zlfWFWju4AA5RuLB2RR0riAlJMGtB00OOUgr4lB6xpjxcmRY0R9k+wVb9wuvS
	4o8MBGd9hdZra+NgmUC3ThYFm7L80D4E8fogwPbAHC5wtKdlGfvU/DKJklONQFx2EsN99s
	mGDeeh/nDAlZxfNVAgne3rtD55H1l4hv0S1bwx/5ZcCrEc45LJadW2DMJSguM6giJ6Vxot
	AyFJZXCIzVFCzvFKJNgoQwFICvDSffmtNGSnsbi2tFRwnr48NosQxI9qBskj5Q==
Date: Wed, 6 Sep 2023 16:01:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mining Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v5 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <20230906140123dd8ffac4@mail.local>
References: <202309050635059ecd17a2@mail.local>
 <D6734DA5-839E-40A6-9085-F25BB8D70022@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D6734DA5-839E-40A6-9085-F25BB8D70022@gmail.com>
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

On 06/09/2023 09:19:29+0800, Mining Lin wrote:
> >> static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> >> {
> >>    int err, flags;
> >> @@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> >>    flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> >>    if (flags < 0) {
> >>        dev_dbg(&client->dev,
> >> -            "Failed to read NCT3018Y_REG_CTRL\n");
> >> +            "%s: Failed to read ctrl reg.\n", __func__);
> > 
> > If you really insist on this change, what about:
> > 
> > #define pr_fmt(fmt) "%s: " fmt, __func__
> [Mia] Do you mean to replace dev_dbg with pr_debug? If yes, for consistency, I'm going to refine all messages via pr_debug. Thank you for your suggestion.

No, I mean that instead of adding __func__ to all the messages just
define pr_fmt, this should achieve what you want.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
