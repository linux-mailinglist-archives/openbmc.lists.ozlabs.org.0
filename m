Return-Path: <openbmc+bounces-1400-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKmbKFmhmGkPKQMAu9opvQ
	(envelope-from <openbmc+bounces-1400-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 20 Feb 2026 19:00:57 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A07D169F0C
	for <lists+openbmc@lfdr.de>; Fri, 20 Feb 2026 19:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHdMm03jwz30Lv;
	Sat, 21 Feb 2026 05:00:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771610451;
	cv=none; b=bJVSNSmoNXxo2oXAUdH2ScmnTdfOXlfOfAbj/pyW0KfGRwPHYuJQTIisvsylWuFDe+kVJS5vV297Qe66XK88m0jZjJcuRKDuesr1aBxMkr8JsShLGqkZ7KVOwq21fGUqiA65030EKXBr6gZyzv1Hjn0ycqao9eM+9VLAhPw6/UeQsvEtcE4Q6ljIhbSgtQNTL5xfOcO24T+mf8xdUphjVORyr+IreTu89olLIOIBKIwttxsvmhlJhyC1WYGJ7gEeZbMUAWjn7EsKqs2ByNg9MJkLw2PDN4zMqYxcJyt6XZciWtCriQJxS8xSQoPu9xhYPzV7Pqq/rOpPqa4jGg7Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771610451; c=relaxed/relaxed;
	bh=mDviFNaQlXl4RDWxBL/FyAxNNazEkOwOqLYJW2oU+Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnuGkfhvnSWZWJ+ALFcyD2I6tuLEvO5xQRrIMA7HnNQ0XFnn5lvUqmMq/xyO4ku4iP1rI0Nt/cBi0argm0EbdhE8B7g8OsBAj2sbp00wJwC82EmmwZPH6ul3aaVRF3WDMZ1oMXYlsI5o/QMzzLT0tkcXimT2OZ8h/jstLihJ+GJKYC8Hn2bIJ3dGi03nuQGmgx0o6P0nKNuj0HpzdZpMAUq23WwsNdVmzIlw0For/S/3jjQK5iewKbAswVWBVaB3Oba+wleA8QjuM3bgma81kTFplvaHKVTLCRshG32w7Qs60YKQZolcpKlW5g0Dth6qFmOZLjDE58WlG1whoVDeAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UJqVjzmo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UJqVjzmo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1236.google.com (mail-dl1-x1236.google.com [IPv6:2607:f8b0:4864:20::1236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHdMj75pcz30GV
	for <openbmc@lists.ozlabs.org>; Sat, 21 Feb 2026 05:00:48 +1100 (AEDT)
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-126ea4e9694so68595c88.1
        for <openbmc@lists.ozlabs.org>; Fri, 20 Feb 2026 10:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771610441; x=1772215241; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDviFNaQlXl4RDWxBL/FyAxNNazEkOwOqLYJW2oU+Qo=;
        b=UJqVjzmocSBCPCO8jcQDCoDoAvRVB/UpCqnI1WN9EGag5p3Iv4ugPzhnsvRhTk0oT5
         /tCKvUNKKY94wacX5su3osXrzCicdrUSjEljelMD8EzQRNpnLSsdslOzjw/5kV77+j0V
         M6q7ddiIhn5eLRAkOnal2D8UAqLnSR76+9yImx5nYn89h5gx+jK3MjIaq+whl7VszONd
         kOqXI2sT+Xfzt7TxmTOUcRpx6BmS08JgWut+tix4yVshv/coZIzIN0kGhUkUrZ1O7JYl
         FqVJ4stfcIVQnO4Z+XMe4166NDcoE8KkuDM+nRtU61nibIoTb/a/qpGX7kmq4QoP4g+p
         Xmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610442; x=1772215242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDviFNaQlXl4RDWxBL/FyAxNNazEkOwOqLYJW2oU+Qo=;
        b=GwMQzXRtD/kv8AfWlD+KOUvlfSo9iHmLktIxPvjMwaZAqsLThNxpezbJ2CMHMz+Pv+
         5IBuY8yOHvQp14uP8vLBloUsKGzN+naLADe0RjPApNCsr4fl67NseG39Lb/JjaXeod6h
         gGLIkwRTRe1syUhJ8sz5MoovWcixkfgk22/O4YTfkKBlTMj1HdQF0YxymzSFckUBx2nZ
         FZ8p0vWpr9LGRYte5h+aR2uLUhmfmMyjCUHfuYWMOn2pQj3ln6DaRYh5OfwcH3SqmVhw
         NCoS1ZgCcQ27S2jNy74VU0AQoB9kDE+XPXtOkrN5xdry0jWSeHa6Cti0DTovUu2mIt++
         Nk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr4+twj9FltXf/AFP2obxivmshtJVMOOkgmc8oEGhx6iejWEMLX5qCYNbNobVm5d/FgoyKptmQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzfv59MKnaOnBdoI3XMShC8f/htbj7pQxY6ifyjZ1jQkrJXii2U
	GUmUH3gCMvwMvFpAomIXhq7f/lxAqfUtTD3NxSCqOeGIiub6s54UA+KG
X-Gm-Gg: AZuq6aIdf26nqPmcYombYyorUKauQ8FlzvuY/8B7NTXqok77YvQFWGQvThQd0v0ern0
	YNAuipbC6SGM606rRXjCk+NMD+lftLpxvcArP8wBtULeiM/AdfeLVNt/dMjstdeWXcQZtxLpp5t
	VB1cwKa5pY4wrH+cmdBpSrW0d0UrmI/swJJAv8gfVr/koFirNWpQtFFpBHIqzD+Sp1P9xZFNDHC
	n2VaE5aklf8++iy1lElrH8ydgbOEmXc8VNUGZHylJRo1UGhXYe2sC9wCbSwSdELd5YGrXq8xAUP
	5KODdZsegFKfHs0aWBjZvLj08JhYEF93wyTS9HG31VLvJ7mspUE8OaDj6FHqYamlk3pvD/srpwS
	f1nmuEb8P7B66ZMcilSnOwiFJ1Lh1G03VFwIG54LyoybjLzMB2oVyZSOiyL0w067+0EQO3hLSqQ
	XNL4KMvmuxJKdY+C6bWCKYY3xYghUFFibQH5to
X-Received: by 2002:a05:7022:128f:b0:11d:fb4c:db13 with SMTP id a92af1059eb24-1276acb98f5mr251538c88.14.1771610441292;
        Fri, 20 Feb 2026 10:00:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm203892c88.6.2026.02.20.10.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:00:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 10:00:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, sohil.mehta@intel.com,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
	Thomas Gleixner <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org
Subject: Re: [PATCH] [v2] peci: Remove dependency on x86 CPU variables
Message-ID: <6ad986a0-b99a-4b12-a590-85e9b2da496b@roeck-us.net>
References: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220175121.C16ADAAA@davehans-spike.ostc.intel.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sohil.mehta@intel.com,m:bp@alien8.de,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1400-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,zytor.com:email,intel.com:email,ozlabs.org:email,roeck-us.net:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: 0A07D169F0C
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 09:51:21AM -0800, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
> ostensibly to avoid duplicating CPU model number constants, but the
> result is complexity and duplicated *code* which is a far worse fate
> than duplicated constants.
> 
> Remove the PECI dependency on arch/x86 by adding a list of supported
> "target" CPU models in the driver.
> 
> This is only compile tested.
> 
> Long version:
> 
> == Background ==
> 
> The "PECI" driver runs on non-x86 hardware inside an x86 system.  It
> talks to the x86 CPU. The PECI hardware has different features based on
> platform generations and uses the CPU model to control feature
> detections.
> 
> Basically, instead of a PCI or USB device ID that a USB or PCI driver
> would use, the PECI driver uses the CPU model (and family).
> 
> The arch/x86 code unsurprisingly has a list of CPU model numbers and the
> PECI code currently reuses that list. But the arch/x86 list is
> maintained in the "Display" format which is different than the binary
> format that CPUID (and PECI hardware) uses.
> 
> == Problem ==
> 
> The end result is that the PECI code #includes the arch/x86 constants
> header and then duplicates some code that transforms the CPUID to the
> "Display" format. This is fragile because it's easy for us x86 folks to
> break the PECI driver when assuming that arch/x86 is x86-only.
> 
> == Solution ==
> 
> Remove the arch/x86 dependency. Instead of duplicating the
> CPUID=>Display functionality, just duplicate the constants.
> 
> Also rename the formerly "x86_vfm" variables. They are not in the VFM
> format any longer. They are purely device IDs.  Name them appropriately.
> 
> The result is a net code removal. The only downside is that the PECI
> folks need to add a #define whenever there is a new CPU model. But, they
> need to go add new CPU model to the driver explicitly *anyway*.
> 
> == Notes ==
> 
> One little wrinkle in this is that the CPU identifier that comes back
> from the PECI hardware contains the CPU stepping just like
> CPUID.01H:EAX. But the stepping is ignored by the PECI driver.
> 
> So, the PECI_INTEL_* identifiers are just defined with the stepping
> shifted off the beginning. They could have been defined with a 0 there
> and then have the stepping masked somewhere.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Iwona Winiarska <iwona.winiarska@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: x86@kernel.org
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> 
> --
> 
> Changes from v1:
>  * Fix wrong Haswell model/family
>  * Fix peci_device kernel doc
> ---
> 
>  b/drivers/hwmon/peci/cputemp.c |   10 ++++-----

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

