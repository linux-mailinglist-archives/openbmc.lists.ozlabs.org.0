Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63237D663F
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 17:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sN5J5RTVzDqlL
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 02:39:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sN4T0Wf1zDqlD
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 02:38:14 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 08:38:11 -0700
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; 
 d="asc'?scan'208,217";a="370158925"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Oct 2019 08:38:11 -0700
Subject: Re: host-ipmid bumps failing on tiogapass
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 William Kennington <wak@google.com>
References: <482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com>
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
Message-ID: <4cb17f48-d29d-4994-e516-315068dbabfd@intel.com>
Date: Mon, 14 Oct 2019 08:38:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MCKmqTYvvuRMxEv32fwnqT7uaEFEaVpBs"
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MCKmqTYvvuRMxEv32fwnqT7uaEFEaVpBs
Content-Type: multipart/mixed; boundary="MTgeo0vBVUhvF4FzfhBtrVYQum4QXTSFG"

--MTgeo0vBVUhvF4FzfhBtrVYQum4QXTSFG
Content-Type: multipart/alternative;
 boundary="------------945FD0B3F07442E20DBA75C1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------945FD0B3F07442E20DBA75C1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Do you have logs to review for the build failure?

On 10/14/19 8:01 AM, Brad Bishop wrote:
> Hi William
>
> After: c514d874e4 (transporthandler: Rewrite + New Handler)
>
> fb-ipmi-oem no longer builds which is an issue because the tiogapass
> system uses it for the bitbake CI.=C2=A0 Is this a backwards compatibil=
ity
> issue or a bug in fb-ipmi-oem or something else?
>
> thx - brad

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------945FD0B3F07442E20DBA75C1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Do you have logs to review for the build failure?<br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/14/19 8:01 AM, Brad Bishop wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:482C700C-A6AC-4B90-96CC-0E0BB2A7F4F3@fuzziesquirrel.com=
">Hi
      William
      <br>
      <br>
      After: c514d874e4 (transporthandler: Rewrite + New Handler)
      <br>
      <br>
      fb-ipmi-oem no longer builds which is an issue because the
      tiogapass system uses it for the bitbake CI.=C2=A0 Is this a backwa=
rds
      compatibility issue or a bug in fb-ipmi-oem or something else?
      <br>
      <br>
      thx - brad
      <br>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
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

--------------945FD0B3F07442E20DBA75C1--

--MTgeo0vBVUhvF4FzfhBtrVYQum4QXTSFG--

--MCKmqTYvvuRMxEv32fwnqT7uaEFEaVpBs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2kll0ACgkQ0EfviT3f
HwmdFQf/YQv7orqwdkpecV0kuR+wuRhN4UP4q+m5V9junG0W/73EP958l19MlX+1
zs0uQHCr4TUBEHjg1ZKNgokJsJPVTcWtXlFom4sA9/kF3TIX7BMC8uu41lYvg13f
FPYFxeQ/vy9/4x8ZS9V/etNQJzHBfnKBU9GqodvjtR/L77cM58HWvI/pV23OQJb2
C2xG0GE2Vz5FgTywQhEssMqZJuEGZmuIuvyBTkYe6IVPBLHkEq2zNY4E4yyDSFLT
pKRriuAUEquvTRh0ioczvfIhRjcsqJOrQ+z8PJvDHnUbECjQ+B/PvIVKm7ddqTlE
nIrKw3QBGaKAyCX/NTeDBxnUcByWTA==
=JSWj
-----END PGP SIGNATURE-----

--MCKmqTYvvuRMxEv32fwnqT7uaEFEaVpBs--
