Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249255D80
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 03:34:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YQYP4x71zDqbv
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 11:34:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YQXt3T5xzDqWJ
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 11:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="hvCCF0Ps"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45YQXs35JXz9s3C;
 Wed, 26 Jun 2019 11:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1561512829; bh=QK5/EPSWQ0l3eEA/E0Ld78g+P3jM71RE2zulg0Vt2Gg=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=hvCCF0PsQFOf6+1z9QtfMQrnBXytv2XD9mSXBrwQR7Wsku35v7uxJ4my2+01q333S
 nDAYahlRWsP7QDAqwsQ1pyo6/SajOaf/vUrwJAcNC0oML8/9SLiOSe9AFd8fNg4nFo
 v0Wo7ZFdj54exPXBGq6UPPmam0T/M6Qz4N7I0f0Z4+WzdVfsCCFsLd4eKcZz8jTNve
 zoA/lPpXX5Hh3RbDJMrhlF4WNyafBPC5VRUhLhdRhG0jplHM2rv/1YvfyjbeKNHcpM
 ls9Ll2QbcEyKa4oyiLUfXrYgV+sMrmJPX1bcd1ksQla3bJMWpuecVlENM03EamrJ3v
 ncQXOViQFpx7w==
Message-ID: <b75c57a9f3ac3c6e91c470d69dcd2ab6a4f6ee03.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.1] fsi: core: Fix NULL dereference issue
From: Jeremy Kerr <jk@ozlabs.org>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 26 Jun 2019 09:33:48 +0800
In-Reply-To: <20190614071643.18607-1-mine260309@gmail.com>
References: <20190614071643.18607-1-mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

> The failure case in fsi_slave_init() is wrong and could cause NULL
> dereference issue.
> E.g. on FP5280G2 machine, it could get failure in
> fsi_slave_set_smode(),
> and when it does fsi rescan, kernel crashes due to:
> 
>     Unable to handle kernel NULL pointer dereference at virtual
> address 00000060
> 
> The fix is to make it not calling kfree() but just goto err_free.
> 
> However, in err_free, it calls put_device() to free the device, it
> still
> cause issue during fsi rescan, that the device is used after freed.
> 
>     WARNING: CPU: 0 PID: 1433 at lib/refcount.c:190
> refcount_sub_and_test_checked+0x94/0xac
>     refcount_t: underflow; use-after-free.
> 
> So the put_device() is removed and "err_free" label is renamed to
> "fail".

It looks like this will leak memory (through the struct fsi_slave) that
has been kzalloc()ed. After device_register, we need to call
put_device() to free the struct fsi_slave, but there's no mechanism for
that to happen if we remove it from fsi_slave_init().

The error paths for this function do need to be fixed, but I don't think
this is the right approach.

Do you have a backtrace of the refcount_sub_and_test_checked+0x94/0xac
warning? This may not be the actual struct device that underflows.

Cheers,


Jeremy

