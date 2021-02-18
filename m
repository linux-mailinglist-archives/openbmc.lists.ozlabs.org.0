Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB131EC9B
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 18:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhLbw29fqz3cGs
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 04:02:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Fri, 19 Feb 2021 04:02:10 AEDT
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhLbk4stLz30L4
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 04:02:10 +1100 (AEDT)
IronPort-SDR: 1HdODYUuYCUswSE6FbDra8t0vHAfZ1GDPH9zB8M1K7vD0tZ+8tzB9CVYz9KnHolyLw8pHBUwGR
 Y0BVnanIpjKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="170703304"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170703304"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 09:00:54 -0800
IronPort-SDR: axcCjRXnYH3cAV+CeK2qiMd9Ez/aPolNqOu4gsaBL1welQTxg2Qc6X3NjUG3oA42a7XHY1GYcV
 gY63FqLHCC8A==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="427297569"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 09:00:53 -0800
To: =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
Message-ID: <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com>
Date: Thu, 18 Feb 2021 09:00:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="16PAW3W4uvucjAHT3aI4WclKw2ZQU3hMi"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--16PAW3W4uvucjAHT3aI4WclKw2ZQU3hMi
Content-Type: multipart/mixed; boundary="eI2jgZt5ptxhp5J5DmoZggcQctCgLLotH";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>

--eI2jgZt5ptxhp5J5DmoZggcQctCgLLotH
Content-Type: text/plain; charset=big5; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

David,
I see a garbage sequence like this all the time.

I run an Expect script that controls my terminal emulator (kermit), and=20
I see a sequence like this:
[[39;88R
I have tried multiple times to have Expect eat or delete this output=20
before handing control to my terminal emulator.
Once Expect hands control I see:
;88R

I have also tried modifying settings in my terminal emulator to see if=20
the ANSI sequence would be eaten by the terminal emulator. This has also =

been ineffective.

So once my Expect script has handed control to me, I have to manually=20
press CR to clear the excess bytes.
This gives me an error message from Bash:
-sh: syntax error near unexpected token `;'

So I know the characters are in the Bash input stream.
Like you, I have no idea where they are coming from, and all my=20
mitigation attempts have failed.

None of my compatriots have the issue, so far as I know. When I brought=20
this to the attention of some of my team members, none claimed to have=20
the same issue. As my toolset is the outlier in the group, I just=20
resigned myself to suffering with the issue.

On 2/17/21 11:11 PM, David Wang (=A4=FD=AE=B6=A6t) wrote:
> Hi all,
>      when I use the host console via uart to log in to os, sometimes so=
me unexpected output is print to stdout, such as:
>
> login: root
> Password:
> Last Login:  Thu   Jan   7  06:52:18  UTC  2021  on ttyS0
> root@intel-corei7-64:~#  ;153R     <-------  This is the unexpected out=
put
>
> It also happen when using obmc-console-client or ipmitool sol activate.=

> It looks like an ANSI Escape sequence
> "EscLine;ColumnR	Response: cursor is at v,h	CPR"
> ref: http://ascii-table.com/ansi-escape-sequences-vt-100.php
> ref: https://stackoverflow.com/questions/16026858/reading-the-device-st=
atus-report-ansi-escape-sequence-reply
>
> My question is,
> how to prevent this escape sequence from printing to the stdout?
> Which package in openbmc is doing this?
> Has anyone had a similar problem?
> Please leave any comments.
> Thanks
>
> David
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--eI2jgZt5ptxhp5J5DmoZggcQctCgLLotH--

--16PAW3W4uvucjAHT3aI4WclKw2ZQU3hMi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmAunUQFAwAAAAAACgkQOcg9x5uaKcDY
sQf9FMBbc1EHlc/5u+9zAWcoTTK4oulipDHERCeCDx+wPKV4DASiYROsjy7dFN/00ugEBCnAjqUe
jE1PpE3t+bNnzTm40yI1J7pTdhUbmh65ATp8B8/5yJJE4kxqQg3nqUcGVbpNJaTThj0Ibw48IcwB
UASBPJ+YdAVmJ+n6zfUdR3Os3Ee0t2lIhozYrXpcdk8WT6DURzK9O2YqZ7G9T0Vsw5Oh/pyKNOpC
DaonAGFyAaZ2VuzPfbeN4PDvzcsRKt6joBDddNV6s0AnEseASQMuIi+Zo8oMxGtA88uq/nx3Zfv+
uR30I46dHZKLyIv/dZQbONvfIBuRov1Vv1EcMXhc2w==
=7ZEd
-----END PGP SIGNATURE-----

--16PAW3W4uvucjAHT3aI4WclKw2ZQU3hMi--
