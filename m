Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BD51AF0E
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtpLv1gpwz3bq9
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 06:28:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Wo4l3g3t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Wo4l3g3t; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpLT362Xz2yfZ
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:28:17 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BEE94368;
 Wed,  4 May 2022 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651696094;
 bh=k1OGqO6yttpA6KvVZQkxzts4/vCE80ZuQxCGo5hhVRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wo4l3g3tbSfivPvsKVzN8JXIHrCdw7VQ8UTGTKDqt9D5vfiFuZJrgX4Iq/+stwnCq
 0eDDymQkC/+HVsKy7fMLvzjQN3Zteirdlt+fFf4ns5C9iwmM1mJKdOmO2FFMlZUyjL
 5NwgO+BtJKIBuMH4kTzRM9i61xpkjAhlErqxi2Ig=
Date: Wed, 4 May 2022 13:28:11 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/6] regulator: core: Add support for external outputs
Message-ID: <YnLh23QbnO1MHoVL@hatter.bewilderbeest.net>
References: <20220504065041.6718-1-zev@bewilderbeest.net>
 <YnJ37QysSaa+gAps@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YnJ37QysSaa+gAps@sirena.org.uk>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 04, 2022 at 05:56:13AM PDT, Mark Brown wrote:
>On Tue, May 03, 2022 at 11:50:35PM -0700, Zev Weiss wrote:
>
>> The DT bindings changes (patches 1 and 2) consist of a boolean
>> regulator property to mark it as supplying an external output, and a
>> reg-external-output binding to act as a downstream device representing
>> that output.  The redundancy between the two maybe isn't entirely
>> ideal, but it was the cleanest approach I've been able to come up with
>> so far in terms of working with the regulator subsystem; I'm certainly
>> open to suggestions for better ways of going about this.
>
>Nothing in the series articulates what the purpose of the redundancy is
>- your description of this is a consumer, why would the regulator itself
>care what's connected to it?

Hi Mark, thanks for the review.

To some extent that was an additional (maybe excessive) protective 
measure against regulators ending up userspace-controllable when they 
shouldn't be, since I had previously gotten the impression that there 
was some concern about that possibility.

More functionally though, it was also basically a hack to allow the 
'state' sysfs attribute's mode to get set properly in 
regulator_register(), before the consumer is known.  Though if things 
are rearranged based on what you said in another message about putting 
the enable/disable control in a consumer driver instead of the regulator 
itself, it should be easy to get rid of.


Thanks,
Zev

