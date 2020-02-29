Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8B1787EE
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 03:03:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHGK3nHZzDqTG
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 13:03:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=grantpeltier93@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uRWN+s3l; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V9mt2fgZzDqYk
 for <openbmc@lists.ozlabs.org>; Sun,  1 Mar 2020 02:48:44 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id v19so5510501ote.8
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0LnoqPNiVrVWIzM0qc+C8NSFCH3fjCc6Ip8H3uzdRjc=;
 b=uRWN+s3lnC8mvap1pnVxrPVHRrBViwj98MVPC+EpUcNZmjCorLmzo0vtPCd6xVRLLr
 e+Bn8pb16wEJxdmc8084PVbtEo/6CPMJswcykKhDfeY4eI25wpMYgvYYDvcayBmR+G4b
 1jeutUQvPsyvIVgjXiVIiViZmvi2yFAg3SZt37aBkUUbdHpvpMDlLWDKkaJ7B9Oustyr
 Lk4jsTWsA0ZJZzdMtvd+sr5tYX/6AOORje0GyNapLB1Qcf41xoCQI7oOZ6d03ERrCE2x
 VHNgpohCRi4nvVyYkEPCRRy8M5X3g1GRz/qOQsZxGQMi3FeBUhJQC9gfGbrOPWSwEdvu
 2xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0LnoqPNiVrVWIzM0qc+C8NSFCH3fjCc6Ip8H3uzdRjc=;
 b=b1w2oIypFKMoOcIHluOnFAFIyFqbjkhM58uHo0SZLNq0Jt8gSWbLFfq04eladk3ZPQ
 UUGkR8pSuUK6GVi42s8R1EBMiTOxZBYqY93P0XGCqzEYIqDwTBZlnX26UKVknWZjN+VT
 ka7aKVs+oApXv9UA0KHB4i2e3u3MZ9lungdajVYJXWtw5LlTM/KPG9nnPRH1uO4CfRAI
 qOcsHKeyLsVmzAyHoCkFPjLogTepcvRXMalqnR+CGnBv4NVPIXjcK59WNgN8FnUnbil3
 ZhJhT6lMFmA4q1FJ5KIdsj9BTr/sOv4Ur6xX9pw5r1uXJNrHe/NNzd34DVYiuIT1I38l
 boNw==
X-Gm-Message-State: APjAAAWF0+1Lz/pP+n4Kil9SHC8tCG1tktjCypw4e7wVJUMQ5Ak1dvBz
 jpFFtrzWgnkHjtWzoRwg87I=
X-Google-Smtp-Source: APXvYqznx4lMyeqJ9EkKf+z3GdQ7TAGSjbclkRH6ecBnD+7p4xk2SOjhpTNGWo1XKQaTP9CAse6RHw==
X-Received: by 2002:a9d:7617:: with SMTP id k23mr6830091otl.329.1582991321933; 
 Sat, 29 Feb 2020 07:48:41 -0800 (PST)
Received: from grant-ubuntu (99-189-78-97.lightspeed.austtx.sbcglobal.net.
 [99.189.78.97])
 by smtp.gmail.com with ESMTPSA id t22sm4442881otq.18.2020.02.29.07.48.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 07:48:41 -0800 (PST)
Date: Sat, 29 Feb 2020 09:48:39 -0600
From: Grant Peltier <grantpeltier93@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (pmbus) Add support for 2nd Gen Renesas digital
 multiphase
Message-ID: <20200229154839.GA8048@grant-ubuntu>
References: <20200228212349.GA1929@raspberrypi>
 <20200228225848.GA14676@roeck-us.net>
 <20200228235206.GA3468@raspberrypi>
 <1a456016-682a-2d53-767b-fe09784883ef@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a456016-682a-2d53-767b-fe09784883ef@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 04 Mar 2020 12:57:21 +1100
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
Cc: linux-hwmon@vger.kernel.org, zaitsev@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, adam.vaughn.xh@renesas.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 05:55:44PM -0800, Guenter Roeck wrote:
> On 2/28/20 3:52 PM, Grant Peltier wrote:
> > Hi Guenter,
> > 
> > Thank you for your expedient review. I will need to consult with my
> > coworkers to determine a more appropriate driver name. In the meantime I
> > will make the desired changes and I will also create a document for the
> > driver, which I will submit as a linked but separate patch.
> > 
> > With regard to the part numbers, this family of parts is currently in
> > the process of being released and we have not yet published all of the
> > corresponding datasheets. However, I have been assured that all of the
> > parts listed are slated to have a datasheet published publicly in the near
> > future.
> > 
> That would be great.
> 
> As for the driver name, I had a look into drivers/hwmon/pmbus/isl68137.c,
> and I don't immediately see why the new chips would warrant a new driver.
> The only differences seem to be that VMON is a new command, and of course
> only the ISL68137 supports AVL. But then there is, for example, ISL68127,
> which is again quite similar. The only other difference as far as I can
> see is input voltage scaling, but that doesn't warrant a separate driver
> (and, of course, I have no means to validate if input voltage scaling
> is indeed different for all the new chips).
> 
> Overall I would suggest to extend the isl68137 driver. I would also
> suggest to not add separate tables for each of the rail configurations
> but use the three-phase entry as starting point, copy it, and adjust its
> values as needed.
> 
> For the multi-phase chips, I question if reporting the input voltage
> for each phase make sense. Is it really a different voltage ? For IIN
> and PIN, the question is if the registers are indeed paged, since they
> are not paged in the older chips.
> 
> Guenter

The ISL68137 is part of the first generation of our digital multiphase
parts which are all exclusively 2-rail (2-page) devices. There are a
couple of reasons that we are opting for a new driver for the new
generation of devices:

1) Gen 2 has multiple rail configurations (1, 2, or 3) with different scaling
parameters than Gen 1
2) We are planning to support some of the non-generic PMBus functions of
the Gen 2 devices using the debugfs interface.

I am currently working on point 2 and those features are not
quite ready to be included in a patch set but we wanted to move forward
with the hwmon functionality for now as that is useful on it's own.

Fair point on the global vs paged commands. I will modify the page
functions so that global commands are only read from page 0.

Thank you,
Grant
