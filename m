Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE015F764
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 21:04:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K49C3CQPzDqWX
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 07:04:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jzyp3L16zDqcX
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 03:55:25 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 08:55:14 -0800
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; 
 d="asc'?scan'208,217";a="381493531"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Feb 2020 08:55:14 -0800
Subject: Re: Community support - where do want to be in a year?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
 <cf55586d-7e66-a3a6-30da-6980deb9be69@intel.com>
 <1F7B75A9-56F2-4B90-B799-6F541804F8CE@fuzziesquirrel.com>
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
Message-ID: <5387daa4-740c-f8bd-f876-73ce9a6d1b8c@intel.com>
Date: Fri, 14 Feb 2020 08:55:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1F7B75A9-56F2-4B90-B799-6F541804F8CE@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Pg7XArVI53oerWzA1HoHu4BvDkPfvfT3W"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kurt Taylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Pg7XArVI53oerWzA1HoHu4BvDkPfvfT3W
Content-Type: multipart/mixed; boundary="E4Ew3t0VSyiDdJv2a32Z8g7mRjgPWIQfe"

--E4Ew3t0VSyiDdJv2a32Z8g7mRjgPWIQfe
Content-Type: multipart/alternative;
 boundary="------------D8836ACBA4D8FFBDA1441023"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D8836ACBA4D8FFBDA1441023
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Brad,

The current test flow, when I tried yesterday, doesn't do well when the
current repo relies on some other chunk of the code base to succeed.

For example:
DBus changes an established item from bool to enum
Networkd uses the new enum type.

Git clone phosphor-networkd, run test.
Docker creates a new machine, populates the new machine, fetches the
code, from the upstream (which won't have the DBus), wait 20 or more
minutes, witness a failure.

It would be great to use my current devtooled state, and get the test
suite run with my current development state.
The phosphor-network test suite probably runs in under 1 minute.

I should be able to tweak code, run tests, see failure readily, tweak
code, rinse repeat.
I don't need the same level of verification that the QA team does.
Destroying the machine, and rebuilding it doesn't provide value.
If tests were quick to run there might be more incentive to creating
more tests.
As it stands, it is too onerous to bother.

On 2/14/20 8:33 AM, Brad Bishop wrote:
>
>> On Feb 14, 2020, at 10:24 AM, Johnathan Mantey <johnathanx.mantey@inte=
l.com> wrote:
>>
>> Kurt,
>>
>> I would like to see a more developer friendly unit test framework.
>> I have had only a couple of occasions where I needed to run the test s=
uite.
>> My most recent attempt was not successful because my test repo was out=
 of sync with the remainder of the OBMC infrastructure.
>> I would like to see:
>>
>> 	=E2=80=A2 A way to test my changes within the framework of more than =
one repo.
>> 	=E2=80=A2 A less heavy handed,
> I assume the heavy-handed part is the need for docker?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------D8836ACBA4D8FFBDA1441023
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Brad,<br>
    <br>
    The current test flow, when I tried yesterday, doesn't do well when
    the current repo relies on some other chunk of the code base to
    succeed.<br>
    <br>
    For example:<br>
    DBus changes an established item from bool to enum<br>
    Networkd uses the new enum type.<br>
    <br>
    Git clone phosphor-networkd, run test.<br>
    Docker creates a new machine, populates the new machine, fetches the
    code, from the upstream (which won't have the DBus), wait 20 or more
    minutes, witness a failure.<br>
    <br>
    It would be great to use my current devtooled state, and get the
    test suite run with my current development state.<br>
    The phosphor-network test suite probably runs in under 1 minute.<br>
    <br>
    I should be able to tweak code, run tests, see failure readily,
    tweak code, rinse repeat.<br>
    I don't need the same level of verification that the QA team does.
    Destroying the machine, and rebuilding it doesn't provide value.<br>
    If tests were quick to run there might be more incentive to creating
    more tests.<br>
    As it stands, it is too onerous to bother.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 2/14/20 8:33 AM, Brad Bishop wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:1F7B75A9-56F2-4B90-B799-6F541804F8CE@fuzziesquirrel.com=
">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Feb 14, 2020, at 10:24 =
AM, Johnathan Mantey <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jo=
hnathanx.mantey@intel.com">&lt;johnathanx.mantey@intel.com&gt;</a> wrote:=


Kurt,

I would like to see a more developer friendly unit test framework.
I have had only a couple of occasions where I needed to run the test suit=
e.
My most recent attempt was not successful because my test repo was out of=
 sync with the remainder of the OBMC infrastructure.
I would like to see:

	=E2=80=A2 A way to test my changes within the framework of more than one=
 repo.
	=E2=80=A2 A less heavy handed,
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I assume the heavy-handed part is the need for docker?</pre>
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

--------------D8836ACBA4D8FFBDA1441023--

--E4Ew3t0VSyiDdJv2a32Z8g7mRjgPWIQfe--

--Pg7XArVI53oerWzA1HoHu4BvDkPfvfT3W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl5G0O4ACgkQ0EfviT3f
Hwmanwf9FApbLEFCxWKq+/tDb0tWGAhjtBpCJUpSgniq68oClpbwc8jbfGyNZ2Zs
kX6D3APl7rmrE1fgAiexkZHnQsdQ4vLa5iVPdvELnqvM2A8vkUYXG0tCBwaun6MT
uR66p4P2FpHG/WudaNnGVL2HeoRTsbmtyo7m7Eyutk/R7GCpGx3IMY/l1zjfgeLM
U/VkDhMXJf6Uxc/rTeselY6oeVeGmaGi5iL6m1jNjFVgGeBM9uqB2obMPakikV7q
tIrWBha69lBJOEPftXmct64Wtf9A8zJiMLXPS8xmVo+HxGvm1oyq3ajxXDEMqcEH
6Wi5zt0rvYVnCKJx1o83m2gvSPKvHQ==
=eyM/
-----END PGP SIGNATURE-----

--Pg7XArVI53oerWzA1HoHu4BvDkPfvfT3W--
