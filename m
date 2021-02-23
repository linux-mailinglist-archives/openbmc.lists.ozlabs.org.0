Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C0322EA7
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 17:23:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlPW548l2z3cMW
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 03:23:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlPVv5kVHz30L7
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 03:23:28 +1100 (AEDT)
IronPort-SDR: JjCOYcrRjSlYC7BqI525iLqRiVGub5PZR5ZG5t9KqNl96238bFfVUU4VSKvAMZCmoDVgaqM8c6
 UjhSYzSHk/Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="184907590"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="184907590"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 08:23:19 -0800
IronPort-SDR: I5VW47FQuwy0gAAU+7PNcQXKkKLELpKEir4qzHEMZhXw9S4imCQiuBSQQiXc/liP+MdQ+GCjQ8
 bcWfdUxCzuyA==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="430829911"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 08:23:18 -0800
To: =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 Michael Richardson <mcr@sandelman.ca>, "jk@ozlabs.org" <jk@ozlabs.org>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com> <17303.1613669867@localhost>
 <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
 <HK0PR04MB2737BDC541BD24AF0678383EC9809@HK0PR04MB2737.apcprd04.prod.outlook.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
Message-ID: <9e83d02f-1dd8-539c-3de3-f7191568ea99@intel.com>
Date: Tue, 23 Feb 2021 08:23:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2737BDC541BD24AF0678383EC9809@HK0PR04MB2737.apcprd04.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D5xYy1gmM2heErfTdJJr8SeLbj5zLwQjL"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D5xYy1gmM2heErfTdJJr8SeLbj5zLwQjL
Content-Type: multipart/mixed; boundary="6oSXWbOnvkVnMSrpgnNhNSmGOwceh6o1t";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 Michael Richardson <mcr@sandelman.ca>, "jk@ozlabs.org" <jk@ozlabs.org>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <9e83d02f-1dd8-539c-3de3-f7191568ea99@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com> <17303.1613669867@localhost>
 <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
 <HK0PR04MB2737BDC541BD24AF0678383EC9809@HK0PR04MB2737.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2737BDC541BD24AF0678383EC9809@HK0PR04MB2737.apcprd04.prod.outlook.com>

--6oSXWbOnvkVnMSrpgnNhNSmGOwceh6o1t
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/23/21 12:12 AM, David Wang (=E7=8E=8B=E6=8C=AF=E5=AE=87) wrote:
> I don't think this is a problem of dropping charecters.
> The error seems to occur only at the first time after boot.

The issue only happens for me the first time the BMC boots.
If I logout, and log back in, the ESC sequence does not happen.

>
>> This motivated me to mess with this again.
>> FWIW, The DSR command is present when I run Kermit from within a TMux =
frame.
>> This code, [[40;162R, is present when I run without TMux, and just use=

>> Konsole.
>> Both sequences are emitted AFTER the password has been input, and acce=
pted.
>> Password:
>> Last login: Thu Feb 18 19:45:28 UTC 2021 on ttyS4
>> ^[[39;81Rroot at intel-obmc
>> Using "set terminal type dumb" did not impact the emission of the ESC
>> sequence.
>> I haven't found the "turn responding off" control yet.
> I think this is not like a terminal problem, but the escape charecter i=
s not read correctly and the remaining string is output to stdout. Please=
 correct me if there is an error.
> I have found similar codes under linux:
> https://github.com/openbmc/linux/blob/599d7f997930829f13e05d332e3e7fccd=
89d340d/drivers/tty/vt/vt.c#L1829
> But I tried to insert the debug code to verify but found that they don=E2=
=80=99t seem to be the culprit.

I don't believe my issue is dropped characters either. Some program=20
during the boot sequence is sending the ESC sequence (It is printed in=20
full in the capture above), and there isn't a consumer of the value, so=20
it eventually lands in the BASH command line buffer.
I find it interesting that I can have Expect run any number of commands=20
to the terminal until I tell Expect to hand control to me via the=20
"interact" command. Once Expect has given me control of the IO stream,=20
the trailing edge of the ESC sequence (i.e. the portion from the ";" and =

after) is pending input to the BASH interpreter. Something in the whole=20
process ate the "ESC [39" portion of the sequence, and left the ";\d+R"=20
portion alone. This email trail encouraged me to investigate a bit more. =

I have "solved" this issue for myself by having the "interact" command=20
clear any sequence that has the ";\d+R" signature. This is not ideal. At =

the same time it solves an outstanding irritation.

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--6oSXWbOnvkVnMSrpgnNhNSmGOwceh6o1t--

--D5xYy1gmM2heErfTdJJr8SeLbj5zLwQjL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmA1K/UFAwAAAAAACgkQOcg9x5uaKcCG
kQf+OykKJEuzWpkeO3/J4f89e9lUKcRY7cI8tfWFkjNrT4ZgizTfYwdAnRlRmFnpfchR5vr2O05l
Qu8WTup5fLshPFfKXvwoCNEZT86luAc7JgR0/LFZTRLkrsnDF3w8DbJDfYsLa90KKWd75zeV2ESp
1WBbRods1kBXBsR4HDUw1Jq1W4TUV4p7OHPA8MvELIJqUHWtIk8rG2O6UDK7Sg+BjkCRKPqqQXdm
HCetBdScFibl9pwZtTNVZsTMdZTnBUym5Z81vG6Q5c51IzVfwD5STGm/u8S+wRpu0pOR4UkkUkOR
MYaNPwxcpv7UR8Bkl57bG64t5mS21qah+Il6oVfb9w==
=FkgP
-----END PGP SIGNATURE-----

--D5xYy1gmM2heErfTdJJr8SeLbj5zLwQjL--
