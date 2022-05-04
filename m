Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27E51AAC4
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 19:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtkSQ0FWqz3bq9
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 03:33:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ucw.cz
 (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@ucw.cz;
 receiver=<UNKNOWN>)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtkS74yczz3bdM
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 03:32:55 +1000 (AEST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 094F61C0BBB; Wed,  4 May 2022 19:24:30 +0200 (CEST)
Date: Wed, 4 May 2022 19:24:29 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v3 3/4] leds: pca955x: Optimize probe led selection
Message-ID: <20220504172429.GF1623@bug>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
 <20220411162033.39613-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411162033.39613-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, joel@jms.id.au, linux-leds@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi!

> Previously, the probe function might do up to 32 reads and writes
> to the same 4 registers to program the led selection. Reduce this to
> a maximum of 8 operations by accumulating the changes to the led
> selection and comparing with the previous value to write the
> selection if different.

We have regmap APIs. You are free to use them if you really care about
those few reads. Reimplementing them by hand is not acceptable. How big is 
the seedup here?

Best regards,
								Pavel

> @@ -554,6 +556,15 @@ static int pca955x_probe(struct i2c_client *client)
>  	init_data.devname_mandatory = false;
>  	init_data.devicename = "pca955x";
>  
> +	nls = pca955x_num_led_regs(chip->bits);
> +	for (i = 0; i < nls; ++i) {
> +		err = pca955x_read_ls(pca955x, i, &ls1[i]);
> +		if (err)
> +			return err;
> +
> +		ls2[i] = ls1[i];
> +	}
> +
>  	for (i = 0; i < chip->bits; i++) {
>  		pca955x_led = &pca955x->leds[i];
>  		pca955x_led->led_num = i;
> @@ -624,6 +634,14 @@ static int pca955x_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	for (i = 0; i < nls; ++i) {
> +		if (ls1[i] != ls2[i]) {
> +			err = pca955x_write_ls(pca955x, i, ls2[i]);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
>  	/* PWM0 is used for half brightness or 50% duty cycle */
>  	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
>  	if (err)

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
