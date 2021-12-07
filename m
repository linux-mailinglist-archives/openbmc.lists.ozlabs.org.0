Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5372546B666
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7YrK1WbNz2yPN
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 19:49:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=dKANB7yz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=dKANB7yz; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Yqt6pH2z2yJv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 19:48:58 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 08CB513C;
 Tue,  7 Dec 2021 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638866936;
 bh=rFG3fPh/GO6YZe67EweUIEV/cR182XtK+FWjQnWRVC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKANB7yzY70JDvU99+fu26wXvQtyT4eeJlWmbsq4yWKP2qhUAG0P/RnG8GgmoOScb
 Bm9rDusBbcmf7Uco8MZNIM8cNBbXWwyGl6JR4V04xYIfzq8e3u4WelOSnzr74RunT5
 uCEYQ5ztHKOrqbGBxILlwE8equ6/r0lb+msO12oI=
Date: Tue, 7 Dec 2021 00:48:51 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: add Delta AHE-50DC fan control module
Message-ID: <Ya8f81AQKTmQnYde@hatter.bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-3-zev@bewilderbeest.net>
 <498caafa-fdc5-eb5a-312f-13968a088448@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <498caafa-fdc5-eb5a-312f-13968a088448@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 11:58:14PM PST, Krzysztof Kozlowski wrote:
>On 07/12/2021 08:15, Zev Weiss wrote:
>> This is the integrated fan control module of the Delta AHE-50DC Open19
>> power shelf.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>
>This is a third version sent within one night, without changelog and any
>indication why sending the same three times. Please do not send multiple
>versions the same day and give people some time to respond. When
>creating a new version, add a changelog under ---.
>

Sorry for the noise -- I wrote changelogs in the cover letter 
(https://lore.kernel.org/linux-hwmon/20211207071521.543-1-zev@bewilderbeest.net/), 
but forgot to include all the recipients of the component patches in the 
CC list of the cover (which I presume would have been preferred), I just 
used git send-email's --cc-cmd flag with get_maintainer.pl.


Zev

