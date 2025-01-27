Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE9A1DC11
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 19:30:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhcRN6cydz3bZN
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 05:30:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738002621;
	cv=none; b=GHQOJNppBLGNzqP/E22c2SmZeLHC7haB/mpJwEYzbxM0htqT5nM7bcACqPkzPpt7rD56eZtdqs6EmSrrkXoTsJfzyy3TQmYas0KL1yAOmbt9THVFRkZeATP39rFjX5a+idLNpFUmMrCrXpkrdiSw5m15djiBxeDus7wSYBvhP4NH3fLhiA/x5QVIeYFuWqdDjkKwRhbbcWdK04C0K5sTcAh86CqiYwAbCfIdHBrZOqu4MsyNe3r0zvsbXgDnUxx+lDLQHU66RsMF1Buc+Xe1dLE6L4WWLJrbCTGkPlt1+rWyxUiBj+Bcu7TB2lnDql15leTQnXSu+VostR03p+2obw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738002621; c=relaxed/relaxed;
	bh=8BuIu4l6wPSP7fJ+Eza3SUprCGG69F2G4g4BU8K2Cio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abTAVz6INYgUIbl3N1ur10XKskh20YM65ogxt9+tgALXOHviO1OL7ZWYfFd0pOKn4/PLwLHb16gUE1NP1smE3ls1AyMuBUofvb430AxjfCvnRyrlPjgiQk6Ix3cJytTzj1KoUvM/WuBP0W6rMDufeKVlnLSJ7gYWGPKnU7R1ed5gNxS8Ia9xwyXvZMOnGyOL75QdCW+ZmC/rWcR2b+WstB6wKDaLC/rV9EbevJvVqUfxkJP5m3skrVDZNQgUfyNJ0DqvSBDqrshEH3kmobrkqg3YJz+fX45VMcTUO22F79cn8fEsFhm0YdRCeCDvt++bAP1QMlXAGSKKbIkEyjl+lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PsHjjAmF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PsHjjAmF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhcRH1XDBz3013
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 05:30:18 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30761be8fcfso48242151fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738002612; x=1738607412; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BuIu4l6wPSP7fJ+Eza3SUprCGG69F2G4g4BU8K2Cio=;
        b=PsHjjAmFih7yja5l69vocCWuL5+gNXShw22YVq2wCNyX6gJe78XYIp1zVB0US/60dT
         ofjQBzSuYxDrH3ZDDtnr3jsUgZVjcTGM7WZI5rRJQgCHAECsDLG3oHmbwd1gaECtgHAd
         lMdLLRTNcCKbB3ucWiJBlHZhiQBSGySM05g5tsQMXiuG6zasu1arCEIamhtaOmG1D0/f
         NRlh+sV2C2tL21QJO3chVkJCzsth96vM2AL0QbKOCIUOYwWT8lNRx2i/ajYRN05eN96i
         bcsOsiwByPZL207Zi6Hvec6lBdjzMD9ejRXcD17PMdG6Rnb7cSqsjYT8ygePStc7ESqD
         C/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738002612; x=1738607412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BuIu4l6wPSP7fJ+Eza3SUprCGG69F2G4g4BU8K2Cio=;
        b=se2e2mNYGbhOy7IIjoSxFqfUcysFTdhAHwJMwxFbghY/iwaH2ZoHLdFMSK2jNBm6MM
         3mkO6brYsOPU39B6/DzXy+U9ZJHmB2Am1Xr3hHQln9/D4y/EKXgyMJWDjdUmlBMf7XU8
         6aua6juhbRNbuSL2AFV5Hu5Qu6LLY6e97o9IlaXptQH3NJtVS8/e0PSxwxaMN/l6fpZk
         IllZBgnEd5K7i3RaA+snrPzKNEmm8cVar0oPLH0htuOagct62U0lHkrXDBCFX3LfFODf
         5tBTHx4DNd7DmKjeLhzZ+XWKYO9x4b9HQhiMGbtZWh/fpHYj3X/WkoZA2v2ztqlWvQAW
         4pWw==
X-Forwarded-Encrypted: i=1; AJvYcCUK3QsWZ+mWPkmEPsq3vZE2cZEUenIEkRNf0ejnV+2h5MlSOlsyl5ZC3J3l57d/2j4cnw1PTBWn@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWud03rSEiLL1Y1azslSvrZLnsQ9yJB1w5mkRwzCh056M28JBO
	z4EwE7NmrG2J13Dy62dMlC1lO4Hx2EhjQPS0T62PXTTrHLYHb+WF
X-Gm-Gg: ASbGncu1HD+WhW+5/bIsjWlXQweOkoSSvAXTGR2b2BAbHdLIyvRAG9sd1g81PW1YME/
	G4zDGU2fOfdQ7ZQq2N0Y0UyeXIKmxrSzd9kqTL9WDMwzK8CTJuN/fNW7FNhz3QorDCKrpFhjH46
	3tipPoHUYkmT0U8outmrmB/ECT76WnSxtMZmEO0rJ8Yv5yTt8S8PJ/whc0NCjrzxknrb2UhXd7v
	DjZS8i9R3b0w1ysp3lahcCohkEu1ZCvDHRaw4g0vopzVoj1y5gXy05JM8a5XL/oxUqMOldH4LnA
	s5jE8R8cpKOzjyUk07c=
X-Google-Smtp-Source: AGHT+IH2ScEgn8uuPjwMkePm52H+flcKMPqBEQfjBeotCJ4WSOqUW6FDBnqXkySVZKLeRV4j8HLc5g==
X-Received: by 2002:a2e:a265:0:b0:307:2ae8:14b with SMTP id 38308e7fff4ca-3072cacabd5mr127635061fa.12.1738002612179;
        Mon, 27 Jan 2025 10:30:12 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba66a5csm15866621fa.2.2025.01.27.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:30:11 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 50RIU7Zd002723;
	Mon, 27 Jan 2025 21:30:08 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 50RIU41a002722;
	Mon, 27 Jan 2025 21:30:04 +0300
Date: Mon, 27 Jan 2025 21:30:03 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
Message-ID: <Z5fQqxmlr09M8wr8@home.paul.comp>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
 <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
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

Hi Guenter,

On Mon, Jan 27, 2025 at 09:29:39AM -0800, Guenter Roeck wrote:
> On 1/27/25 08:40, Winiarska, Iwona wrote:
> > On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
> > > When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
> > > critical thresholds for particular DIMM the driver should return an
> > > error to the userspace instead of giving it stale (best case) or wrong
> > > (the structure contains all zeros after kzalloc() call) data.
> > > 
> > > The issue can be reproduced by binding the peci driver while the host is
> > > fully booted and idle, this makes PECI interaction unreliable enough.
> > > 
> > > Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
> > > Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> > 
> > Hi!
> > 
> > Thank you for the patch.
> > Did you have a chance to test it with OpenBMC dbus-sensors?
> > In general, the change looks okay to me, but since it modifies the behavior
> > (applications will need to handle this, and returning an error will happen more
> > often) we need to confirm that it does not cause any regressions for userspace.
> > 
> 
> I would also like to understand if the error is temporary or permanent.
> If it is permanent, the attributes should not be created in the first
> place. It does not make sense to have limit attributes which always report
> -ENODATA.

The error is temporary. The underlying reason is that when host CPUs
go to deep enough idle sleep state (probably C6) they stop responding
to PECI requests from BMC. Once something starts running the CPU
leaves C6 and starts responding and all the temperature data
(including the thresholds) becomes available again.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
