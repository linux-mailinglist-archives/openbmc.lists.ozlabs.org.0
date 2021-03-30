Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3A34E2F7
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 10:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8j4S36Jdz3047
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 19:18:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=BvQQY0nh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=BvQQY0nh; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8j4C5jbbz2yRW
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 19:17:46 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7C61B167;
 Tue, 30 Mar 2021 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617092264;
 bh=VvcznrS1rjWpiKZiP+i/h/lLrJJWsyYrC/wQiX5Rzo4=;
 h=Date:From:To:Cc:Subject:From;
 b=BvQQY0nhA/SRfdxkuOha5Hqtzy/xI4EkYwYD4wGb6h1Mnr36FErF3EKR87j1QcKEE
 OfjIjzj2mchfpXLz3sFDwclz/oC+MrmjuSG2o+lST0qzZNW514NiyHEKO27ZUjDkEP
 KC2XR1G41bxVQLgDZW+0MzAhJN2yShvPd2ig/Re0=
Date: Tue, 30 Mar 2021 03:17:41 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: Enabling pmbus power control
Message-ID: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Hello,

I'm working on a board that has a handful of LM25066 PMICs controlling
the power supply to various devices, and I'd like to have both the
existing hwmon sensor functionality as well as userspace power on/off
control, which does not currently seem to be available (other than via
'i2cset -f', which I'd of course prefer to avoid).  I've drafted up a
couple possible versions of this, and was hoping to get some opinions
on the appropriate overall approach.

One option is to add a read-write sysfs attribute to the existing
hwmon directory (current incarnation of the patch:
https://thorn.bewilderbeest.net/~zev/patches/pmbus-statectl.patch).
This bears a vague resemblance to a patch that was rejected a couple
years ago
(https://lore.kernel.org/linux-hwmon/20190417161817.GA13109@roeck-us.net/),
but is different enough that I wonder if it might potentially be
tolerable?  (It exposes significantly less, for one thing.)

The other approach involves layering a regulator device over the pmbus
device as is done in the LTC2978 driver, and then putting a
reg-userspace-consumer on top of that (current patch:
https://thorn.bewilderbeest.net/~zev/patches/pmbus-ureg.patch).  My
first attempt at this ran into problems with all the
reg-userspace-consumer instances getting attached to the first
regulator device, I think due to all of the regulators ending up under
the same name in the global namespace of regulator_map_list.  I worked
around that by adding an ID counter to produce a unique name for each,
though that changes device names in userspace-visible ways that I'm
not sure would be considered OK for backwards compatibility.  (I'm not
familiar enough with the regulator code to know if there's a better
way of fixing that problem.)  The #if-ing to keep it behind a Kconfig
option is also kind of ugly as it stands.

The first version seems simpler to me (and avoids the rather more
cumbersome sysfs paths the second one produces, for what that's
worth).  I think the second is (at least structurally) perhaps more
aligned with what Guenter was saying in the previous discussion linked
above, though.  Does anyone have any advice on the best way to proceed
with this?  If the reg-userspace-consumer approach is the preferred
route, suggestions on a better fix for the name collision problem
would be welcome.


Thanks,
Zev

