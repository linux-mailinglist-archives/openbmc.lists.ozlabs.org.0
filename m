Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB0613DBC
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 19:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1MgZ0Xh7z3c69
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 05:51:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gLWG6j8X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gLWG6j8X;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Mfz06nSz3c1x
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 05:50:50 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6BE4B1A6;
	Mon, 31 Oct 2022 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667242245;
	bh=yI4VxHDcRGzkmJzt6Mtn+pBg7sqPLddFXxyeqLB99ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLWG6j8XI9P3wq9uVxSiD+zKUj/071FKMi6IBkvvr8Av3dFpgp4Av5G4GD/vuEFmJ
	 TrlXBhscA3fP3xDH9qvvU3W/YPzTR7Tjt6PENNQ3waFCParDKvnWnNEm38g6DSkZcb
	 +iHqKDcjUEWKGkxTa6nY73G0m7zLjQuk4uxvNLdk=
Date: Mon, 31 Oct 2022 11:50:38 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output bindingg
Message-ID: <Y2AY/tQLQ6m+SXI7@hatter.bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
 <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
 <Y1rRCq9Kdd2zPPkw@hatter.bewilderbeest.net>
 <ee37b5a1-5afc-71b3-f777-add295d9ce17@linaro.org>
 <Y1tWpikPogEtV0+x@hatter.bewilderbeest.net>
 <Y1v6migO2PNV4ksW@sirena.org.uk>
 <Y1wxMk2x25AeRwLr@hatter.bewilderbeest.net>
 <Y1/tnic0qc/Ll/5u@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1/tnic0qc/Ll/5u@sirena.org.uk>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 08:45:34AM PDT, Mark Brown wrote:
>On Fri, Oct 28, 2022 at 12:44:50PM -0700, Zev Weiss wrote:
>> On Fri, Oct 28, 2022 at 08:51:54AM PDT, Mark Brown wrote:
>
>> > We don't turn things off on reboot?  We don't do anything in particular
>> > on reboot...
>
>> Okay, perhaps not on reboot specifically, but the userspace-consumer driver
>> has a regulator_bulk_disable() in its .remove function, so it would be
>> triggered at least by a module unload (which is sort of why I ended up with
>> the "when software relinquishes control" wording in the patch).  If we're
>> going to continue with the plan of using that driver for this functionality
>> (which seems overall quite reasonable to me), we need a way to express that
>> that must not happen on this hardware.
>
>Ah, that would be the test driver not intended to be used in production
>then...  That shouldn't be a blocker for the DT binding, and if there's
>a different compatible string for this application then we can either
>make the userspace consumer do something different based on that
>compatible string or have a new driver which does something more
>sensible and perhaps has a better userspace ABI.  Either way so long as
>we can tell the thing being described is a BMC output from the DT
>binding I think we can leave it up to the OS to do something constructive
>with that rather than trying to control the specific behaviour in the
>binding.

Ah, alright -- that seems like a nice (obvious in retrospect, of course) 
solution that should work well I think.  I'll post a v2 with that 
approach soon.


Thanks,
Zev

