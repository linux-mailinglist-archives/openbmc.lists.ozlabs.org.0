Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A0A1DC7C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 20:10:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhdKS1tQDz3bZN
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 06:10:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738005017;
	cv=none; b=ke2vYCLyDb30DerketDw8kVcqXu9VbNq6nMQBoMP9AIZimzXxn/ERrExPdotqvuASZohE2nE+a4madVPiSUTECguzm6JZXzoVnGR+lGBELTOoGPz/Q+UWy+RLdrbPfxXYAcjnkif6ddQ7B4ZECVQm6dycp17ooAhBANxYa4PPEsqbsCcDAmJcN034m0YL0abynZA4Vp+tuNFzpdZ3AkhdAjMc0vnH8wjKDtlsdz3cdle/a7L5xXBO/7VhvpTCSKLe94+UMURCFoP73464Lu2S8nzisCFAklyZsHYCXME2D+4ODeIuHWi92mZ3ad0p+XejO974ZabSqWhZPegxyASyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738005017; c=relaxed/relaxed;
	bh=bGwrXPOvo05x7dKLdltIQ3oHgnPqyjh5wBEm2GWPthM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWYASxEPgYpZeNkFmprHCc3kzXA7NcAWBlaU1UWUUVM3rF3TTrYjCzxRhFlKgQ1FlmCdnMlpnXTC5Os2BATfPykVXziUE7bD1K482exKvCOPBZKmP00ZzNu3hGoddG1JL9GmEF4B4ojmuDHkwV8Wiw2EkTwfp2IbdAhUHsBTwf2XmYFbKibiCObExbfwQaBIB3iqCapdhQ3QhC7hl5LInpxibK2vlWkDigh194/MVViaRtRUdNP0fc+ULZ1DyNDjiluVN+AP9YCdPAO5UbSDZboFHYAmx9gKnuT/Bn2IMybfHhYffuWzqdbEooS31UNWr1dEMJBSsGpmnq8CWLWBmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cNGd84s8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cNGd84s8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhdKM0clSz2yDS
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 06:10:13 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-303548a9361so39582731fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738005010; x=1738609810; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGwrXPOvo05x7dKLdltIQ3oHgnPqyjh5wBEm2GWPthM=;
        b=cNGd84s8jI3u59VTMfchGGDHaQXMRStepDMekJhfGRfamxolJB9qxUJyVNAcauC60Q
         lEk81ISPoVAdQMqtycsy/dM16FxXoPBPSZLzxCt40T3ZxcljgiuRnLU/l8qNkGTy6ang
         oRjAoG80nDYjZNWKUFKgjIRszGIlVgr8gDLUd2CnBJC7vcG47+H0TfU4B9VfFvW6+YX1
         ioZZF0hOWYApRyTcMb/mjHzc7hBdWzpXlQAWf1B02Uv+2mliWg5WlWDoY/+xY87Vnj+p
         yuggS+TKTdby2PykggZeRUin1Xkf1sT+n9/9JAAORpuOAHAmQdEmInEf/AnXY9xsv2Z2
         VrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738005010; x=1738609810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGwrXPOvo05x7dKLdltIQ3oHgnPqyjh5wBEm2GWPthM=;
        b=Id1/yKUTWqvO6LW3gxls1cOIu2InNxNmg6Y01kBj205NBqjhYoD36JPkTUPzSdZn5D
         QsGg9zaIGErqMI1vsKCOLap9wF7sxtLdlgGGEvVFOmu/rzeSv0n/5Z7EXwtjspVxyual
         oBfT5DvM9OHeXPSRE+Sj6hT468JWSjDNcHC1d9NsJ0ZG566GMCZx4bDXDBck+FfdHv4t
         oquwM0gr/H98V9uKgFSnu/ypkoq3xMs7qiwULJrJ/q5qoV4EH2VxkFC5hnumyWD280Gl
         6Z7ZgG/pWmGBSRCI05udwp5cE1W4D1HEtuUopwqKqOUDHz1iACoxwUfHIZotdbRUy7yw
         pHvg==
X-Forwarded-Encrypted: i=1; AJvYcCVDHob9mUD/ExrG/Vacxt985AAOxpcRtpuI/2TYsLkvPDMK2LfAapMGVhSbChkpJa+HAXYfaFoa@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzws3H/rw8EjZ8PE1rGAY/Js+0SY50yPiTHbeex7rlgJZiBGkZc
	Wqob4khRvYaoN1SuPgWB21GzMbDOj9S9kRyFJ6+cCez4loN1QgPK7yxWG8dY
X-Gm-Gg: ASbGncskl8kITbUgALh4EuJRqc7v4KC9iakp9/zgcHlc6On8JFYCb4WOJEJTWnDguPL
	1uLmmqnP/6gb8/LNkiWcbsBTGa6/sT/Y/8kiXSM17I9xpIgEGMmqpIMGkiiuEOwQEy1+dDncCiC
	MKbtmfitbq82l+MFmMgUb1aDfD7HBBjn+kASWbkYAvPwPPJCZ06CyEZ2nH40fPb1sRiZ/JBfkWc
	uYIQ6XFEdwz25/OFIjMLpq4IkH4p+yq/SoRmNQ7a+I5V6QA0eVeUEAanoCYU0HD/Cmp7f0oCFfl
	hBq7zuVHPV7p8GvXqQY=
X-Google-Smtp-Source: AGHT+IGcyGJAafbq2BnEAcDVUomhfJ6yZ8JXnr9Oo1BWvohJt8PKPBt3ZNFrQEx4CVCXKFZ8BeCIuQ==
X-Received: by 2002:a2e:b555:0:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-3072ca9a6f7mr122102721fa.22.1738005010251;
        Mon, 27 Jan 2025 11:10:10 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc49806sm15422331fa.91.2025.01.27.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 11:10:09 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 50RJA5QR002808;
	Mon, 27 Jan 2025 22:10:06 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 50RJA3D2002807;
	Mon, 27 Jan 2025 22:10:03 +0300
Date: Mon, 27 Jan 2025 22:10:03 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
Message-ID: <Z5faC6M2MUj8KYoB@home.paul.comp>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
 <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
 <Z5fQqxmlr09M8wr8@home.paul.comp>
 <1dc793cd-d11d-441a-a734-465eb4872b2a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dc793cd-d11d-441a-a734-465eb4872b2a@roeck-us.net>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "Solanki, Naresh" <naresh.solanki@9elements.com>, "joel@jms.id.au" <joel@jms.id.au>, "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Rudolph, Patrick" <patrick.rudolph@9elements.com>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 27, 2025 at 10:39:44AM -0800, Guenter Roeck wrote:
> On 1/27/25 10:30, Paul Fertser wrote:
> > Hi Guenter,
> > 
> > On Mon, Jan 27, 2025 at 09:29:39AM -0800, Guenter Roeck wrote:
> > > On 1/27/25 08:40, Winiarska, Iwona wrote:
> > > > On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
> > > > > When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
> > > > > critical thresholds for particular DIMM the driver should return an
> > > > > error to the userspace instead of giving it stale (best case) or wrong
> > > > > (the structure contains all zeros after kzalloc() call) data.
> > > > > 
> > > > > The issue can be reproduced by binding the peci driver while the host is
> > > > > fully booted and idle, this makes PECI interaction unreliable enough.
> > > > > 
> > > > > Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
> > > > > Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > > > 
> > > > Hi!
> > > > 
> > > > Thank you for the patch.
> > > > Did you have a chance to test it with OpenBMC dbus-sensors?
> > > > In general, the change looks okay to me, but since it modifies the behavior
> > > > (applications will need to handle this, and returning an error will happen more
> > > > often) we need to confirm that it does not cause any regressions for userspace.
> > > > 
> > > 
> > > I would also like to understand if the error is temporary or permanent.
> > > If it is permanent, the attributes should not be created in the first
> > > place. It does not make sense to have limit attributes which always report
> > > -ENODATA.
> > 
> > The error is temporary. The underlying reason is that when host CPUs
> > go to deep enough idle sleep state (probably C6) they stop responding
> > to PECI requests from BMC. Once something starts running the CPU
> > leaves C6 and starts responding and all the temperature data
> > (including the thresholds) becomes available again.
> > 
> 
> Thanks.
> 
> Next question: Is there evidence that the thresholds change while the CPU
> is in a deep sleep state (or, in other words, that they are indeed stale) ?
> Because if not it would be (much) better to only report -ENODATA if the
> thresholds are uninitialized, and it would be even better than that if the
> limits are read during initialization (and not updated at all) if they do
> not change dynamically.

From BMC point of view when getting a timeout there is little
difference between the host not answering being in idle deep sleep
state and between host being completely powered off. Now I can imagine
a server system where BMC keeps running and the server has its DIMMs
physically changed to a different model with different threshold.

Whether it's realistic scenario and whether it's worth caching the
thresholds in the kernel I hope Iwona can clarify. In my current
opinion the added complexity isn't worth it, the PECI operation needs
to be reliable enough anyway for BMC to monitor at least the CPU
temperatures once a second to feed this essential data to the cooling
fans control loop. And if we can read CPU temperatures we can also
read DIMM thresholds when we need them and worse case retry a few
times while starting up the daemon.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
