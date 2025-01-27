Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0945A1DB4C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 18:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhb5V5n56z3bZN
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 04:29:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737998987;
	cv=none; b=YTDW0WQnAKyif3LslOnQ3lFNAMlGApYSp4ah5M67/BoAMhbpIoUJiAXJNr0l3NmwvQmJAaXuWJhyvse6DxCPRVzesvOHeBFE/hoan+XMu+FroVr8OhycImvFhwPzj2T5G1XhkdCkMRqaPhC3HADY3aIdIywmNUSfkFZNpL7gIXxaRJIkOvWS8cT4/S/+E4V+nD7+NoQxzVjBuQr3gGQ+p4qcQtNi/+cJfRnMe/PDRPQ5Mpo4LcG4CslXg+c0c2TdR9mpG0ufjcauMCT/X9z6MsMnZbVcWyL0yP/8hGGHWBTaeij6hwfvj9DNiAEkfGK+Xbizj2cPvSKVw+9nUXy1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737998987; c=relaxed/relaxed;
	bh=BDtDtJawyOQigbNs3N0WPL5lKPkOWwhgeDJjweSkGP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCVxKIB0Kpz7jhDjGxSzWx+S8y4dZUprCUnnCQ2vtwEMMG20kP0UBXc8agfDz7hkCf1SL1zh4WMmPe1TfJl/71TvKCkErA2GGNbxqrlS/j/khZSok3MmbBuOSV4Myw3r5J1+Bx/LTmu/bc+OmuJI5HQJHfJG+pDbxoDmPSW3SexPMonoVd/9I72jdGaif/eMcDe+aWBDO6TNrOdmSsyFTCtSpnYUEBKq+MnRT17cDxcvEoyFYvZNscNwkY3bhjdl+wqP9aacWew6vaURfI/L3F24OXW4H8AWNERlupj7vsOdPuUYkPmB/M0Fv5S+HvzesP1Q06sSRiQcLzBEl0kGFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkfQ2zBl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PkfQ2zBl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yhb5P3ZVVz2xjL
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 04:29:44 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21675fd60feso105146185ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 09:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737998982; x=1738603782; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BDtDtJawyOQigbNs3N0WPL5lKPkOWwhgeDJjweSkGP0=;
        b=PkfQ2zBle9woYfpbEdf7J3DqA3uakbz3O8GHl5Nxl69WtNynxpFlNgrmRzXI5Wn//I
         mi6sNyh48ffrbB9T65K2uhApRAQQvZRrmC3/Lb2zGU+Amc3Oa+arYxVE8begtwmV/kfS
         piAfjPloh9pTqlBq4yLd8ZMbPRwtdzLeIQ12E2l8siBzyJCFzvzU0F+Dz+rK021/hbJ5
         Fi3yGaiaK3LL1UutpYNfxJLIla4A+BSKx46AWRuvPH8fIm+kAMzeRJX8dHvJbTL2h0kB
         Ra5A0Bg0D4rAWEslwDPYCEquixeK/C3koj3NoaMlL3JjckMUZsDxi68nd7X4+2GZVSmp
         UeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998982; x=1738603782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDtDtJawyOQigbNs3N0WPL5lKPkOWwhgeDJjweSkGP0=;
        b=omlOZ7mIW/Y2gQCVGfpSvP3MHXgUIm5ye2dJ/RBfB9BW1273+1NkMXTPMSajQnqyKk
         LjHE3T5slPtFUt8MRaAh2TCWB1D8uO6tPqJ1Ax6jZAg9DcWreMXWwS08uCO4ZDAhGMyt
         fq9EJrjg9CujREBns0yboxcapmPNz42Dwd7aZq6n9zfS3T1nPoVKx63hkD/947qPU12C
         jCjKTII5E5iJTSCWuzyrueoTXXXx+e+OvNxAP4uFaHoZ8ydbvvjG0WZsA8mFNP6Xt8qK
         nJVw03SPoX+bX8jfay8GSpRZtZ8dZKRjIEAwvidsbDcgz5PwNNTfJ7HAAIH5mkrgBa1o
         XyQw==
X-Forwarded-Encrypted: i=1; AJvYcCWvDbs7uJBfV9qlZU3gjuwqoiKTmJABjPryE8S3zDaloktnd5/A2cokGeomR0n4zRCOicNtrEzS@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxY2UeHQ6OBiDIY3xIzTYXdyCjHhzFAsmwGBfEDq94oXMmj5wLL
	Vuf4AbxjU1KOmj6lx2+Zndy5+0jc3ZQeVD2l9ighYw9kRrviAHtg
X-Gm-Gg: ASbGncvFSit7feCXTamGOAAFVSNVQ2B28FRsYn6ZAIDt76JVLBm1cVR8w5/ckGhSFk+
	Nu7qMBMko9Wt+8T2koCFxwF/ymSi7rkpMVtago8pbEXWJoTzOJHDRisgi5XAtpulQHN3R7RVMiG
	BnRcrr3EC3OxjJJmx9AcSXVSDuIN7KcllgS5Bo2kzpYjT3oPhSktFKUj02V9aVTjTYRkZYy2/VF
	cGDqXZ4xuPpVft32VJc3HqNMyEoQ+htpYDuf2BfHrjcAFcBTKVR4NCrs5pux43AzyTc1Iuy9936
	B8wVjH7ctaGgaf8Pqzf3JZdTSVEj4fknfH3g0JeAQH/8SNfN+F/3tQ==
X-Google-Smtp-Source: AGHT+IGRBJyckC2Cm8GHkPAERJz+atimT6PIbQDDKJRuV7MBOD2JtWGFe+YDWmybnpoW6bYkVGItBA==
X-Received: by 2002:a05:6a00:340c:b0:728:e906:e446 with SMTP id d2e1a72fcca58-72dafbda6ddmr67991863b3a.24.1737998982294;
        Mon, 27 Jan 2025 09:29:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7609aasm7576692b3a.96.2025.01.27.09.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 09:29:41 -0800 (PST)
Message-ID: <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
Date: Mon, 27 Jan 2025 09:29:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "Rudolph, Patrick" <patrick.rudolph@9elements.com>,
 "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
 "Solanki, Naresh" <naresh.solanki@9elements.com>,
 "fercerpav@gmail.com" <fercerpav@gmail.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/27/25 08:40, Winiarska, Iwona wrote:
> On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
>> When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
>> critical thresholds for particular DIMM the driver should return an
>> error to the userspace instead of giving it stale (best case) or wrong
>> (the structure contains all zeros after kzalloc() call) data.
>>
>> The issue can be reproduced by binding the peci driver while the host is
>> fully booted and idle, this makes PECI interaction unreliable enough.
>>
>> Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
>> Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> 
> Hi!
> 
> Thank you for the patch.
> Did you have a chance to test it with OpenBMC dbus-sensors?
> In general, the change looks okay to me, but since it modifies the behavior
> (applications will need to handle this, and returning an error will happen more
> often) we need to confirm that it does not cause any regressions for userspace.
> 

I would also like to understand if the error is temporary or permanent.
If it is permanent, the attributes should not be created in the first
place. It does not make sense to have limit attributes which always report
-ENODATA.

Guenter

