Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BF516AD2
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 08:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsCcX5VXnz309l
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 16:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=natalenko.name header.i=@natalenko.name header.a=rsa-sha256 header.s=dkim-20170712 header.b=J0i1ujkP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=natalenko.name (client-ip=2001:19f0:6c00:8846:5400:ff:fe0c:dfa0;
 helo=vulcan.natalenko.name; envelope-from=oleksandr@natalenko.name;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=natalenko.name header.i=@natalenko.name
 header.a=rsa-sha256 header.s=dkim-20170712 header.b=J0i1ujkP; 
 dkim-atps=neutral
Received: from vulcan.natalenko.name (vulcan.natalenko.name
 [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsCKV08tyz2yQ9
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 16:06:53 +1000 (AEST)
Received: from spock.localnet (unknown [83.148.33.151])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 256A8EB9F77;
 Mon,  2 May 2022 08:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1651471607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6854pPcd/hzfCioNj9NpsO/BgBkih8LHFTE+6i6A2M=;
 b=J0i1ujkPXUjpKtIqvx3/2u6HNbMmmG8Aa4vESgKfRjtslp6rgBXTZ5Oj6f4bTnQor53smf
 jnXHJdsxGV2Pi/SZe7gDXL4wwnAvSHoRwevmbMLDzF+dpFto2GlhB3NqDnoo9t51QPAiRh
 DmUPzJCEsGAEPxeAKbcCZ83l0ArDdZ4=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 0/7] hwmon: (nct6775) Convert to regmap, add i2c support
Date: Mon, 02 May 2022 08:06:45 +0200
Message-ID: <2591481.aCYgfPdpt1@natalenko.name>
In-Reply-To: <bc46d60e-7c89-ad05-780c-9e9fd19f788e@roeck-us.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <bc46d60e-7c89-ad05-780c-9e9fd19f788e@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 May 2022 16:19:37 +1000
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On st=C5=99eda 27. dubna 2022 15:37:07 CEST Guenter Roeck wrote:
> Hi Zev,
>=20
> On 4/26/22 18:01, Zev Weiss wrote:
> > Hello,
> >=20
> > This is v4 of my effort to add i2c support to the nct6775 hwmon
> > driver.
> >=20
>=20
> Thanks a lot for your effort.
>=20
> I applied patches 2..6 to hwmon-next. The first and the last
> patch of the series will have to wait for DT maintainer approval.

=46or patches 2..6:

Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

>=20
> Thanks,
> Guenter
>=20


=2D-=20
Oleksandr Natalenko (post-factum)


