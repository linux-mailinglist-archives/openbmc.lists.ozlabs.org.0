Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EEEA1DC4A
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 19:54:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhczJ1d7pz3bZK
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 05:54:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738004073;
	cv=none; b=kOGJwBGmqDlHpktZ4GLtgFZovO2SaFy2aFrgH0EtGqbrcpgNvsl+BMULMBMovVC5EV1t+CKQZsZluF4lFYKyLbFRnaboQobzzWSqQqGqdX3DCuHvRUq63w77IhjGctBfA8MB3vof7z6Irm62eXAI5WZNotWAyb4ul9lryjPqqV29cOqk1k0bf09Xq5nswB3GybGLY7iPgNcwxXFYBw/ouO1ySMl22UfNMnrA1XZCZEGVsPZK1Mi7NOrw7AoH0xwV7PZbjQs1ndsOKq5yHB2gs3mg1hHO+Fsag3QJGUxayqAka9/xOk/ds4lEV7jG6iUxSnmjL6gY2VTCuyny4UBAag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738004073; c=relaxed/relaxed;
	bh=4DwBtqJe2G7SgnACIilduClbZR5mLhGNGSesirB98sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKslWVF51aM7rLHIUdh3F18bOom16NBJy2Zh8M7auHKFTYKyMAI+IYttI+3oCEQOGqSp+t83YqRFPXAqy2koJF7ytySSlIGt3XUMnm4MEhDEnmwycqoporSlwlXTijeEDi3dDytQtGB8JqD0HnvPIIbCKeHTr7VQj1H63BHQmO6g7LluetKPiMTQ1y6LEkWnOOKC40yLjfD/sfzrZlWC/E9dgCIwWMWkrOEwLQofov+5HnvDvAX2ubrbxDKKoT0jxX/6GEGbsP9D5F5ycfSlL6sbckA0XZseiAoiPr1Ahdj2xuu5UimXbZZa8nR/ot/Bdzcw9i+lLhh176AE4FmRYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCe4j8Y3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCe4j8Y3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhczD6WMcz2yV8
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 05:54:31 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54025432becso5418400e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 10:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738004068; x=1738608868; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DwBtqJe2G7SgnACIilduClbZR5mLhGNGSesirB98sg=;
        b=iCe4j8Y3NMJphv1xmXKce91wh/EHJxQXgT7ym+RewATTSmN+mpd3CsfAW1KycQCrFN
         kAVHPOl1hevK0AsFPTvwlXe2f0XKdj52MsoYA09QkB96wJaUZudvK3QsEB3zsakvBWjQ
         f7D+8rTBXHmet5vyzEhwI0lkS8K+apUuDEnU2O9k/CNwHiYJNcx+vy9YWNOa6pR3Y7I/
         eOv2TjzZP5bh/sD6YnizcEn9/N1nqXa3CjbY2EkhDFHrmYRn4Y9fsC+EFgBNJsEDfKK3
         HdD80oVt477upP8fwYXD91PA2mfs//kDjGpCKxpxvmyVN2V4lI47GyGh/tVWodLXCSEx
         xnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004068; x=1738608868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DwBtqJe2G7SgnACIilduClbZR5mLhGNGSesirB98sg=;
        b=CEuNi/Xk817gv3wUXqvZq0BJoZZxQCqCMqLnPrQlRtyRSOWxvmK8AMkZHz+CV9ZDaJ
         BQ5OABJF84xM7i0klVyW5XYTVevYMe2spx4+TPNTIvnSBrGcrHPcRCMpqf2vMmnmpif8
         DTLOwy7Vjd8l0JQO6g+nri9C5PCgN7xGwLAT1qlH7sdSwyKYaPYEwLOV9RZyTMZ2tIHY
         nU9gb31AhUsRwW0nJU+4rvmplQswVi6YXeEVbwdxZQks+Cly1jQgy+lqVM2HGIaDy8Gu
         cwNO9WgrcYCM7rM+lBeNaPQ5972qZUWjqdmjvhWWtK2VsVtl5XC/E/IUdjBOxSqNsViR
         Ydiw==
X-Forwarded-Encrypted: i=1; AJvYcCUWLY+pme5ki8/Lqhy/j3lvS97bQp4LnW5RXAj0GOtJoyCt4QWFBk6fuq1CmJk33dXXNviK/J6x@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGxCSz73sA7d8YuJSaqYxTNbOw5d+b4vYQG3Qabs/1CLP8quUy
	66PHJdHjnXjGd/CfAOBr/wcNtdF80u1Ribp3CgOQNkVg3l0ngaOT
X-Gm-Gg: ASbGncvG3pp+qFw38dbcKnScm2bHLo8dO8W1wkiI3e5fZ6O+4XvsZdq2DC3tGUfp9Dr
	/6GEkwlvWTu3Y8mYah+o2gjyZlezhDmjcpxIT6qkYzw+T37f/SM/1BsATgf31+UVpOfgbFpKKcT
	QLGwi72UMd9D+S09DpwI15SdOeCobZtptT03qhE/I2sNmfrPfyuz32qjNkjgeLuRYj8x2xhvkMX
	z/IXxnXEFsmgyw80IjIUndZ2UzO/iOqv5w5jnM2Pj3iBhBHFg+DiVFPk8vBEBidgYleTbKY9lBQ
	8CBhY4Yn17p7rfFBj9M=
X-Google-Smtp-Source: AGHT+IH8UG7CJrTEaL66OM3T+KUSNCmOyng98VM7AApMTqZPYEjOJxePtiyDsiY7rxZfij2AuDFnXA==
X-Received: by 2002:ac2:51b7:0:b0:53f:231e:6f92 with SMTP id 2adb3069b0e04-5439c28570bmr12742475e87.34.1738004068126;
        Mon, 27 Jan 2025 10:54:28 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237459sm1395598e87.106.2025.01.27.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:54:27 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 50RIsNYo002766;
	Mon, 27 Jan 2025 21:54:24 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 50RIsLrO002765;
	Mon, 27 Jan 2025 21:54:21 +0300
Date: Mon, 27 Jan 2025 21:54:21 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
Message-ID: <Z5fWXfm+bDhGlFIi@home.paul.comp>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "Solanki, Naresh" <naresh.solanki@9elements.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Rudolph, Patrick" <patrick.rudolph@9elements.com>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

Thank you for the review. Please see inline.

On Mon, Jan 27, 2025 at 04:40:52PM +0000, Winiarska, Iwona wrote:
> On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
> > When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
> > critical thresholds for particular DIMM the driver should return an
> > error to the userspace instead of giving it stale (best case) or wrong
> > (the structure contains all zeros after kzalloc() call) data.
> > 
> > The issue can be reproduced by binding the peci driver while the host is
> > fully booted and idle, this makes PECI interaction unreliable enough.
> > 
> > Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
> > Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> 
> Did you have a chance to test it with OpenBMC dbus-sensors?

Using OpenBMC dbus-sensors is exactly the reason why I'm sending this
patch, so yes, I tested it before and after the change.

> In general, the change looks okay to me, but since it modifies the behavior
> (applications will need to handle this, and returning an error will happen more
> often) we need to confirm that it does not cause any regressions for userspace.

The change is prompted by the current behaviour which is unacceptably
bad: every now and then while powering on the host for the first time
BMC happens to request one of the memory thresholds at a wrong time
(e.g. when UEFI is busy doing something which prevents normal PECI
operation); this leads to the unfixed kernel code returning zero and
dbus-sensors happily using that as a threshold value which later
results in bogus critical over temperature events for the affected
DIMM (as their normal temperatures are always above zero). It was
relatively easy to reproduce on an IceLake-based system.

I consider the current behaviour (in case of PECI timeouts when
requesting DIMM temperature thresholds) to be so broken that changing
it to do the right thing can only do good. The non-failure case is not
affected by this patch.

That said, for sensible operation a dbus-sensors change is indeed
needed and I now have a patch pending upstream review[0] to handle
those errors by retrying until success. Without the patch the daemon
would just load with those thresholds missing but it's better to have
thresholds missing than to have them at zero producing a critical error
right away I think.

[0] https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/77500/

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
