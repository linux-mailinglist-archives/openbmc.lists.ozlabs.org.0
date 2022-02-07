Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760BD4ABEBD
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 14:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsmVm0kSRz3bZP
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 00:01:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JqNzuh+G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JqNzuh+G; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsmVN2kSxz2xDY
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 00:01:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2172E61123;
 Mon,  7 Feb 2022 13:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0157DC004E1;
 Mon,  7 Feb 2022 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644238869;
 bh=JOc1/6BZgCfsZYq3N36mbfIFoPDeRG9grLrfprzG+r8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JqNzuh+GfyMIdM8LVAIedh2MKCYgVMklskYwUHWzplhWZR/hBE0x/twHaAFevsUXq
 C/E4Jug/AouJue+jyUK/C0O1u/z12BfWJzANeJFD7Au8GmHtqxed85it87Jm2c/VqD
 5iQ2ykyE0D210OFRnxrp1QLzwip5+oW/VaaxIp7XSR+CYrpbYVdATtoLE0qWcPrSMb
 8utW3YP28BdnBMw5zbLGVlnmKtCXWwvzOLnjMU0h/mIDR6ryIvPGoCHVc56p2gkMmX
 xf59ddSVHTIZcKFaqjrShePZ4Tx2FXmxeTqpSHjx+6maF4TIXk0gIvwTnGVuoTw0fE
 AQlM41k4JBebA==
Date: Mon, 7 Feb 2022 14:01:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sui Chen <suichen@google.com>
Subject: Re: [RFC Patch v3 1/3] i2c debug counters as sysfs attributes
Message-ID: <YgEYEk355t8C4J1x@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com,
 krellan@google.com, kernel test robot <lkp@intel.com>
References: <20211221174344.1249202-1-suichen@google.com>
 <20211221174344.1249202-2-suichen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kV9YJMcLA9AXD3Nw"
Content-Disposition: inline
In-Reply-To: <20211221174344.1249202-2-suichen@google.com>
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krellan@google.com,
 kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kV9YJMcLA9AXD3Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I finally had some time to look at your proposal. As I wrote last time,
you convinced me to have the stats in sysfs for apple-to-apple
comparisons.

One change I'd like to see is to let the I2C core handle the stats and
not the individual bus drivers. From what I see, the I2C core could
handle all this if the bus drivers use proper fault codes.

> - ber_cnt (bus error count)

I'm not sure what exactly "bus error" means in this case. But I think it
can be translated to any not-otherwise handled errno returned by
__i2c_transfer() or __i2c_smbus_transfer(). I also think it should be
named "bus_errors". Do we really need the "cnt" suffix?

> - nack_cnt (NACK count)

This would be -ENXIO for __i2c_transfer and friends. Name should be
"NACKs"?

> - rec_fail_cnt, rec_succ_cnt (recovery failure/success count)

This would be the return code of i2c_recover_bus(). Names should be
"recovery_failures" and "recovery_successes"?

> - timeout_cnt (timeout count)

This would be -ETIMEDOUT for __i2c_transfer and friends. Name should be
"timeouts"?

> - i2c_speed (bus frequency)

Yes, we can have that. I don't think this is really a stat, though. It
is an attribute of an adapter. It has been requested before:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1413403411-8895-4-git-send-email-octavian.purdila@intel.com/
http://patchwork.ozlabs.org/project/linux-i2c/patch/20181210084111.6938-2-tudor.ambarus@microchip.com/
http://patchwork.ozlabs.org/project/linux-i2c/patch/20201013100314.216154-1-tali.perry1@gmail.com/

So, I think we can tackle it again but it is orthogonal from the stats
series.

> - tx_complete_cnt (transaction completed, including both as an initiator
>   and as a target)

This would be retval == num_msgs for __i2c_transfer and friends. I also
think it should be named "transfers_completed". "tx" often goes with
"rx" as a pair. I really wondered "why only tx" first.

So, let's keep at the high level first. What do you think about my
suggestions?

Thanks and happy hacking,

   Wolfram


--kV9YJMcLA9AXD3Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBGA4ACgkQFA3kzBSg
KbYCOA/+NKh18t9FOXG44dWZgqsl4HHVMSmEjwzcVjFNG8EDlatHUuhVIO2jag8j
3SWfe/lNFa0e30K0ggYZDSkkL70i65Rs6/7bxCGL8+UhD3K+w5l7+6IKkAJ/cYOf
ZtnjnOhMQxQ9YFh/YxG7+xOd9vJ8gpi001htwf6t0OBU7KR80SfjF+YlkZfZ/BVJ
9Xsr965j/Qf+wFzrPtuEmMo7qScyns95fcryivYCg+/9RQ101+sUs4AtE41bKFIo
3gtxbEoyqVMweaF4sigBqnu75fillhHlU3+ChU54IzPwclTBfX1i1YqLOAkA9wUn
jf3OTXgOCORXhVDF6rXd7GaiZdDzvBFk85oluZP3KxpwraYhNCjPOYgZko6fQqJB
fPxipmFwHionCOje+owWxIJskFc/nfEFl32VtO+QXpFklXkm/LkAqb+imgMjZDw0
UBJxDI1LW8vAmxcoQR9Qh4iiiAjCkV5RoOosevk1Q68N6rbv8KuWFio2PqmcDmOE
W5A24VtxdbYyYJ9jMchSRXJoPXNW5I4YZ0W4v4WIqyWWGODPjOanxr57RBlDuJbo
KqqIwmc8N8kTIE2qvJ7cn2vZ8RoRdQsAUNL6gRFUsjqA/470yLwTkzPfRh9/ACB2
e/Q5dEAm7CNzs5hfSWxg8ViAJA6EW2XThZW9Or2XSvkRj/l5YeA=
=logL
-----END PGP SIGNATURE-----

--kV9YJMcLA9AXD3Nw--
