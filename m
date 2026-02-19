Return-Path: <openbmc+bounces-1399-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK5sMDGVl2nO1QIAu9opvQ
	(envelope-from <openbmc+bounces-1399-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 23:56:49 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FE16369A
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 23:56:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH7zc2c5xz2yvy;
	Fri, 20 Feb 2026 09:56:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771496470;
	cv=none; b=VsxAn5eYEWHpxvI8+Z9AM0ARgBRrLCdmGp22ZMqzIKlGG0eXS/gBcdRxt21MgnPxVgVZdqpcskF8CI3dZnYRmp1//2BYt1+F/OSBt9CrQFJNa+LNw+87XPs+Hb79RzdBizAJK9YGmbuu7JbPSGDK5838zSqjPm4kDTgPy93SfAYtnHZIAas+yOYOPiEwO6c8vgTYNhOubdj1R2S2ni08hQUaW46yzpEC5JyZMIMLS8yalTxrQCODdFndCepmz2lA/Mdxw4CtTSkrogJWgmIO4LiS98EIYrj0cawSButvoS2V31JIg61Li/6HguISoulbHMhIvPR700/tTW11rzYk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771496470; c=relaxed/relaxed;
	bh=w9Aeee4fKBaZUgGNALNVTSi3OJpKpNywlNVD+fZAgpk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6Kq4VlhcHNn4j7FQBzCD5DIZboYayXfbLGqhquU3eh0UYdVYh688GKRbCdgE4HtE/D1CB+qfPWCtHxLKc9LCbWl/X9M0p9gm0GIw2ymAqEHcvMZ/3c+xtjhNFVfdklwqmERX1gL9eWsSejIrnm2oIVVQXowQNLciZazUFdkF9iB55wp0PrAgQY2atNTL6PdMEkNTbUYlJQ9xwRM+1I3zm0zu3nNJtMY0DhZoCMPhBc6Ja2kpyaIeGcXY07nnsom6C4JZm55nX4EL3Z7BSX6illFPJ9eOwzjD1nGF1Ja5MuMrKv21LUMaMPj83GPfw9qUNVy/QbWutAOF4yTo39ibg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aD+pQ9Ca; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aD+pQ9Ca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGqCn1Tczz2xd6
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 21:21:08 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48336a6e932so5189665e9.3
        for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771496460; x=1772101260; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9Aeee4fKBaZUgGNALNVTSi3OJpKpNywlNVD+fZAgpk=;
        b=aD+pQ9Ca7DPa/FEey/ASdLz4Rk4PAANfQ044IVsSymcco1nL4j/lT6TRUWC+BDDZhz
         hx/VcVrwzPyEhERlAOC//bS+UBq3Jur/CVpNtAuyO9TBQrmU39S3wT7HdZA8zUGRKU9M
         th8puqZNQWQhRIpxh/c1fsWhYHluEaBTfoeKyaOTAnaSzwQhTHry8YZdPExNKjPOAU7W
         /8n5WzWQhiQMq/A26qOM5yI9AdVP5phhXwIQidqLW6KOvQ6kpIY87euZqFFVxuIqgWoI
         8jNTxP9dtMF3cg+LrUdBdS7MeV/UwErf2Kf/cQIcTpVHRQuxknD+XWa30ElyLrLETwnR
         UA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496460; x=1772101260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w9Aeee4fKBaZUgGNALNVTSi3OJpKpNywlNVD+fZAgpk=;
        b=Lj8xSiglAPIkBfjPF5jMBfKP7dHk9EoNxcJDsbNAwaAmMMEYocp3HQZPYZ72JByTqk
         FEH7K2fVV8QXUkLdIhpE8DelbqclEniA5rvupp7V/dtzN859ysCtWFW1l9AdCGCj+lAX
         j35MX9dkcFZ2tGxWI+UXAoc2Ews2PS0c6Lis6joiUoZ3xygwww2+g6CJtof651eoYADK
         WvvT+sPuPPVG/LwgMwheHfBCvypPmhA8RRPYPYMxLG+/MyJHXOf9yDAhyo2Gtb+K5XPx
         DN4WHgiW6FM0veQ65W3SmoVCFsjkf3knceNPANsaWxvuHX/kFespshcZ8QxEaDE7v9/R
         8NnA==
X-Forwarded-Encrypted: i=1; AJvYcCUSzX7K/SB2qL+sze0O+MEMgR2L1LBquLxf4zIMlMklRDANufvJt0cdMx7YK6h08TEvlWm+KrVl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFIy8aBLHgS3oeaIImlS0af92Wo/KP646G5wwK8ZuTbVD5oB+r
	ARymydSV0aRYxxLA7M4qYpF+z/hrt5LMhDqIhowWg0X55qMcZUsNHYyA
X-Gm-Gg: AZuq6aJEzcMDh+d0tTpeHwSjTOqxg+T3VDTZqteN2MWhF9fBDKX6nI4BCQoW/sgmeia
	ti+4odQN7rFQxicd+qUltYVUQoK0OsP6WfunnCZHXZdXr6UqPc1HB3Zuvq71V9tRc79xFdvnXpe
	4lFe8IfspGkL4b00vOv223V8Z/tfIcugdStjSN0DPp9/XFdbV5tqkn3+icFahyt6PbiPogGlV2/
	OseDb+G8MaxVoVB22kp9Lvxl1PDp494P6PTi91gIzqX3Rqb+JnADNAqP4o1TVJ5Tv8x/HYRns/c
	7VAw4s+LGfGCTzvdHG0l+AQuvUpZrTam9SjoTc5dOBveKYmpGlc/qniYPUQNFRt51qEYZScWWUq
	QUM/McMYWM4igrsCw03sxjhLQzTBeCc4TrQIIib0XmGvzxYt5uUFTyiTkKt1GQXJCQyrU/0Ga88
	ENpsV2CauIBvjPr9wYX3uj3Ztjt9yUkBshnFXa738bX4zDrgyjlRd2bAU5Y0GySxmb
X-Received: by 2002:a05:600c:310e:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-48379bf6c82mr312120195e9.26.1771496459831;
        Thu, 19 Feb 2026 02:20:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839ea2f7a9sm22888445e9.3.2026.02.19.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:20:59 -0800 (PST)
Date: Thu, 19 Feb 2026 10:20:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Guenter
 Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Thomas Gleixner
 <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>, x86@kernel.org
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
Message-ID: <20260219102057.1da25411@pumpkin>
In-Reply-To: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1399-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,openbmc@lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[lists.ozlabs.org:server fail,intel.com:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: D65FE16369A
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 09:03:01 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
> ostensibly to avoid duplicating CPU model number constants, but the
> result is complexity and duplicated *code* which is a far worse fate
> than duplicated constants.

Is is possible/sensible to add a check in one file that includes both
headers that the constants match?

That will help pick up any typos.

	David

