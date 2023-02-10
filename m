Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8116925F5
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 20:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD34q4Y84z3f8V
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 06:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AgHc2OLZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AgHc2OLZ;
	dkim-atps=neutral
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2jV4gLNz3fBs
	for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 05:45:17 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-15f97c478a8so7753288fac.13
        for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 10:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSmWk4P1YdFXvxvTiIVgI852UVWnz4vy/QS6724V8nM=;
        b=AgHc2OLZAJTXrrYhFJxKcHFJ80JZaMxxY0zBeovUHhkMVvICh1SlBt2y49oTdA1Kdh
         cCBf+qLh6qmKG2l6A2n1SFFnjnfeLTRJ/gt0H+8AWHo7tR2dQBGvdCEgyjpLBBOdhKaL
         dxtBqF7fXoLRI8S0lJEvMMGCy2mX/qsbThJC8S2cxsgCxSWM0N/+KqbvBrvdcAlV+Kss
         BgCcRWjSZlBGhbeS/fjrgwPDx8TBPiIi/IeaC9OWwLazVT+PQikjfxyhb4pYrZ2t1w/B
         WHAzSc76Bq/j2Ch6kWZT1qX4amxS0z4Oc9OAqtkce3FW5naNQEWX5tMjG7NhejSYavNZ
         uv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSmWk4P1YdFXvxvTiIVgI852UVWnz4vy/QS6724V8nM=;
        b=BtOjfQGxW0Phwyv7SNdKXrjpicbBox1/OBxIqvfFQFQ+3x6WSTAYPb0v0dtiPxFMI3
         VlbywXFXAFgCeOhXx4R/xH9mwrl4fw94sTnYjMKkCptYWk2f1HdejuwRfUa2d3/HDNPD
         +toAzNlqOioUWboDdUWQsZLrtKyqTyojoNNSjSWZNR/hWm8At90tZP9djaoC1PJfRPmw
         2ASYJTKVKv8Karw+qBTfM8SPSxB5GAWPFj/oE1LZifMdayp/B2EnKxgWm70AC0peQArv
         GgjX3DbWOaDxB0HJI+9C84FHok50tNzoGF+KScJWbfJjQecwXQHXspN2JdiQ3Mtl3toj
         TmDw==
X-Gm-Message-State: AO0yUKV792svOBGi3DOtXjZqUZEZwuFzn95mL80GrlQnm7fxwv85ygEl
	8uGH3EU3XS+W4zvyCKT71xg=
X-Google-Smtp-Source: AK7set9rlFZaa4Xbho8YO0ab2EMSQTJxPs8a3sqTk1xN+SDFoM69Vcqd1wLHwmQigcarQSBMBLcDbw==
X-Received: by 2002:a05:6870:a797:b0:163:2d8e:55a7 with SMTP id x23-20020a056870a79700b001632d8e55a7mr7367961oao.24.1676054714141;
        Fri, 10 Feb 2023 10:45:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y20-20020a056870429400b0016a2330dc21sm2234801oah.0.2023.02.10.10.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:45:13 -0800 (PST)
Date: Fri, 10 Feb 2023 10:45:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host
 system
Message-ID: <20230210184511.GA3670524@roeck-us.net>
References: <20230209011632.32668-1-zev@bewilderbeest.net>
 <20230209175001.GA667937@roeck-us.net>
 <Y+WMcCukyTvPcN2F@hatter.bewilderbeest.net>
 <97485a97-08c4-917b-1b8d-8102a8575a58@roeck-us.net>
 <Y+WieWyU+055eEom@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+WieWyU+055eEom@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 09, 2023 at 05:48:41PM -0800, Zev Weiss wrote:
> On Thu, Feb 09, 2023 at 04:26:47PM PST, Guenter Roeck wrote:
> > On 2/9/23 16:14, Zev Weiss wrote:
> > > On Thu, Feb 09, 2023 at 09:50:01AM PST, Guenter Roeck wrote:
> > > > On Wed, Feb 08, 2023 at 05:16:32PM -0800, Zev Weiss wrote:
> > > > > While porting OpenBMC to a new platform with a Xeon Gold 6314U CPU
> > > > > (Ice Lake, 32 cores), I discovered that the core numbering used by the
> > > > > PECI interface appears to correspond to the cores that are present in
> > > > > the physical silicon, rather than those that are actually enabled and
> > > > > usable by the host OS (i.e. it includes cores that the chip was
> > > > > manufactured with but later had fused off).
> > > > > 
> > > > > Thus far the cputemp driver has transparently exposed that numbering
> > > > > to userspace in its 'tempX_label' sysfs files, making the core numbers
> > > > > it reported not align with the core numbering used by the host system,
> > > > > which seems like an unfortunate source of confusion.
> > > > > 
> > > > > We can instead use a separate counter to label the cores in a
> > > > > contiguous fashion (0 through numcores-1) so that the core numbering
> > > > > reported by the PECI cputemp driver matches the numbering seen by the
> > > > > host.
> > > > > 
> > > > 
> > > > I don't really have an opinion if this change is desirable or not.
> > > > I suspect one could argue either way. I'l definitely want to see
> > > > feedback from others. Any comments or thoughts, anyone ?
> > > > 
> > > 
> > > Agreed, I'd definitely like to get some input from Intel folks on this.
> > > 
> > > Though since I realize my initial email didn't quite explain this explicitly, I should probably clarify with an example how weird the numbering can get with the existing code -- on the 32-core CPU I'm working with at the moment, the tempX_label files produce the following core numbers:
> > > 
> > >     Core 0
> > >     Core 1
> > >     Core 2
> > >     Core 3
> > >     Core 4
> > >     Core 5
> > >     Core 6
> > >     Core 7
> > >     Core 8
> > >     Core 9
> > >     Core 11
> > >     Core 12
> > >     Core 13
> > >     Core 14
> > >     Core 15
> > >     Core 18
> > >     Core 20
> > >     Core 22
> > >     Core 23
> > >     Core 24
> > >     Core 26
> > >     Core 27
> > >     Core 28
> > >     Core 29
> > >     Core 30
> > >     Core 31
> > >     Core 33
> > >     Core 34
> > >     Core 35
> > >     Core 36
> > >     Core 38
> > >     Core 39
> > > 
> > > i.e. it's not just a different permutation of the expected core numbers, we end up with gaps (e.g. the nonexistence of core 10), and core numbers well in excess of the number of cores the processor really "has" (e.g. number 39) -- all of which seems like a rather confusing thing to see in your BMC's sensor readings.
> > > 
> > 
> > Sure, but what do you see with /proc/cpuinfo and with coretemp
> > on the host ? It might be even more confusing if the core numbers
> > reported by the peci driver don't match the core numbers provided
> > by other tools.
> > 
> 
> The host sees them numbered as the usual 0-31 you'd generally expect, and
> assigned to those cores in the same increasing order -- hence the patch
> bringing the two into alignment with each other.  Currently only cores 0
> through 9 match up between the two, and the rest are off by somewhere
> between one and eight.
> 

Hmm, interesting. It is not sequential on my large system (Intel(R) Xeon(R)
Gold 6154). I also know for sure that core IDs on Intel server CPUs are
typically not sequential. The processor number is sequential, but the core
ID isn't. On my system, the output from the "sensors" command (that is,
from the coretemp driver) matches the non-sequential core IDs from
/proc/cpuinfo, which is exactly how I would expect it to be.

Guenter
