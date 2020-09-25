Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6B278C01
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 17:05:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByZw84h9NzDqLR
	for <lists+openbmc@lfdr.de>; Sat, 26 Sep 2020 01:05:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByZsY72Y2zDqWs
 for <openbmc@lists.ozlabs.org>; Sat, 26 Sep 2020 01:02:46 +1000 (AEST)
IronPort-SDR: F6hxH/bfN+25Lrb0E98qPcg/N7yqywWDNzaeRIVnsz6fr64k8NocVecUxaEzFj0KCScIPHQgDH
 yvcVClYS9/IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="161632881"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
 d="asc'?scan'208,217";a="161632881"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 08:02:41 -0700
IronPort-SDR: 5uNwsFb9BvfT9trB8wek3XvjZzvYHWWtBSwaR66Sh3Wmnn0HJhP/2sYe67LWcVcxSHBMXNP/JW
 GqSa/vQxbybQ==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
 d="asc'?scan'208,217";a="455871939"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 08:02:41 -0700
Subject: Re: Action: OpenBMC community messaging survey
To: krtaylor <kurt.r.taylor@gmail.com>, Joseph Reynolds <jrey@linux.ibm.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
 <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
 <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <121a2102-ce28-893a-122c-f1453a4faf77@intel.com>
Date: Fri, 25 Sep 2020 08:02:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EI2GxrltH44ZdP0SwYV0GuZMSna5ZwFOp"
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
--EI2GxrltH44ZdP0SwYV0GuZMSna5ZwFOp
Content-Type: multipart/mixed; boundary="ryzbPdJBnVpxJ1Bk2PRlfhOdeM1BtDoWo"

--ryzbPdJBnVpxJ1Bk2PRlfhOdeM1BtDoWo
Content-Type: multipart/alternative;
 boundary="------------67DDBA3806558918266A5F31"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------67DDBA3806558918266A5F31
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kurt,

I occasionally watch the IRC channel, and I am not a particularly
competent user.
Things I like about continuing to use IRC vs "service z"

 1. IRC is not proprietary
 2. IRC can be accessed using a client of your choosing
 3. I like that it isn't logged. People may be more willing to allow
    their personality to be on display.
 4. IRC permits private side-bands for private conversations.
 5. My experience with IRC is when I need assistance with infrastructure
    issues the key person/people have been readily available. That
    may/may not translate to "service z". In addition, do we really need
    to permanently record "The CI server doesn't seem to be working." ?
 6. IRC doesn't collect data about me.
 7. Freenode could disappear tomorrow, and the community would not be
    impacted for long.

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------67DDBA3806558918266A5F31
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Kurt,<br>
    <br>
    I occasionally watch the IRC channel, and I am not a particularly
    competent user.<br>
    Things I like about continuing to use IRC vs "service z"<br>
    <ol>
      <li>IRC is not proprietary</li>
      <li>IRC can be accessed using a client of your choosing</li>
      <li>I like that it isn't logged. People may be more willing to
        allow their personality to be on display.</li>
      <li>IRC permits private side-bands for private conversations.<br>
      </li>
      <li>My experience with IRC is when I need assistance with
        infrastructure issues the key person/people have been readily
        available. That may/may not translate to "service z". In
        addition, do we really need to permanently record "The CI server
        doesn't seem to be working." ?<br>
      </li>
      <li>IRC doesn't collect data about me.<br>
      </li>
      <li>Freenode could disappear tomorrow, and the community would not
        be impacted for long.</li>
    </ol>
    -- <br>
    <div class=3D"moz-signature">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------67DDBA3806558918266A5F31--

--ryzbPdJBnVpxJ1Bk2PRlfhOdeM1BtDoWo--

--EI2GxrltH44ZdP0SwYV0GuZMSna5ZwFOp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAl9uBo0ACgkQOcg9x5ua
KcAkswgAlJNqX5Twgh9NTH59mD4eSFwKBRMh71Wg2BX5avOJ7am2jXatz7MeHJEC
jM5NfcUT5Z1t5y6FHKsP0A7hLO1CUOWk+RHrIa2sUpCAWfOaw86tIOV2U+zjL2xL
noUdpj9XWxK0oEHAlwkaCUEcpU3MN0ERs2yXmkh8U6SuOm8JBYF+OvqoqX0rIpft
GYzPmw9pk/4K8hIBMctmkpe0hixrDTzIjfdtOgr+rRbc3pkyhvxm7hLr7FJ1SN8p
8EvADx0aG5vycXUcU4yg5F0YGo0MOECkZXDozR7KS7nca/fb4vvfgvC3zJFeZK/W
zjHSJLcz2ZW2yqIhMTq0+IA/hmI0zA==
=fDcU
-----END PGP SIGNATURE-----

--EI2GxrltH44ZdP0SwYV0GuZMSna5ZwFOp--
