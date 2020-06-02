Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693801EC2FE
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 21:44:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c2Xq70tzzDqWk
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 05:43:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c2W853kHzDqYB
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 05:42:26 +1000 (AEST)
IronPort-SDR: S+mcxlujJ8UQ200ysLrbOQWPxGaSY/gK222EpJAdMQHtmr9CMsnvHeGFmnYADtmmct5yjAJQGR
 2cUA7vEt2W/A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 12:42:23 -0700
IronPort-SDR: 9P1RD10w6OLGgiPN/oJAPCZieZHloF5S7scAv3h9Y2TRdayRlp8DzOJcg3Q7KBHAJ/NUcqvYXW
 /0H8U/y9DQPw==
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; 
 d="asc'?scan'208,217";a="444823920"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 12:42:23 -0700
Subject: Re: OpenBMC 2.8 Release
To: krtaylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
 <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
 <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
 <7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com>
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
Message-ID: <072aa4a2-4bff-fa91-a113-9b80a96b933a@intel.com>
Date: Tue, 2 Jun 2020 12:42:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FToSiYdOwMihFtw0fDqaxG0pCcMbdt3s0"
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
--FToSiYdOwMihFtw0fDqaxG0pCcMbdt3s0
Content-Type: multipart/mixed; boundary="AG2uk5j4VhiR03ZQkrEaqsgjdlqP61g5S"

--AG2uk5j4VhiR03ZQkrEaqsgjdlqP61g5S
Content-Type: multipart/alternative;
 boundary="------------C69DD6CF51CE99D094E8CDE0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C69DD6CF51CE99D094E8CDE0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kurt,

I don't know if this is a "blocker".
Using the dunfell code on FC32 an Ubuntu 20, there is a problem in
"devtool modify" failing.

Somewhere in the do_unpack code an invalid environment variable is
autogenerated, and then fed to a Python eval() type call.
This eventually loads /usr/lib64/python3.8/sysconfig.py.
The autogenerated script does something with _PYTHON_SYSCONFIGDATA_NAME
that sysconfig.py doesn't like. The "devtool modify" then fails to
finish its job.
I've hacked sysconfig.py, which I don't find ideal, to overcome the issue=
=2E
Geissonator did a similar thing by grabbing the poky tarball and
changing the name of this variable.
It would be nice if this hackery were not necessary prior to dunfell
landing.

On 6/2/20 12:07 PM, krtaylor wrote:
> On 5/4/20 1:29 AM, Deepak Kodihalli wrote:
>> On 04/05/20 10:43 am, Andrew Jeffery wrote:
>>>
>>>
>>> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
>>>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>>>>> just add it directly here:
>>>>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
>>>> Added:
>>>> =C2=A0 * Yocto refresh to "Dunfell" version 3.1
>>>> =C2=A0 * Redfish support for: full certificate management, complete =
LDAP
>>>> management, full sensor support, event service schema, task schema
>>>> =C2=A0 * Move to Redfish Specification 1.9.0
>>>> =C2=A0 * Redfish support for 2019.4 Schemas
>>>> =C2=A0 * GUI enhancements: LDAP, certificate management
>
> We are targeting this Friday, June 5th for release 2.8. I'm not seeing
> much (or any) discussion on testing. If you have tested the release
> tag please post the results for your platform. Any blockers?
>
> https://github.com/openbmc/openbmc/releases
>
> Also, please review and add content to the release notes here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440
>
> Thanks everyone!
>
> Kurt Taylor (krtaylor)
>
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------C69DD6CF51CE99D094E8CDE0
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
    I don't know if this is a "blocker".<br>
    Using the dunfell code on FC32 an Ubuntu 20, there is a problem in
    "devtool modify" failing.<br>
    <br>
    Somewhere in the do_unpack code an invalid environment variable is
    autogenerated, and then fed to a Python eval() type call.<br>
    This eventually loads /usr/lib64/python3.8/sysconfig.py.<br>
    The autogenerated script does something with
    _PYTHON_SYSCONFIGDATA_NAME that sysconfig.py doesn't like. The
    "devtool modify" then fails to finish its job.<br>
    I've hacked sysconfig.py, which I don't find ideal, to overcome the
    issue.<br>
    Geissonator did a similar thing by grabbing the poky tarball and
    changing the name of this variable.<br>
    It would be nice if this hackery were not necessary prior to dunfell
    landing.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 6/2/20 12:07 PM, krtaylor wrote:<br=
>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com">On
      5/4/20 1:29 AM, Deepak Kodihalli wrote:
      <br>
      <blockquote type=3D"cite">On 04/05/20 10:43 am, Andrew Jeffery
        wrote:
        <br>
        <blockquote type=3D"cite">
          <br>
          <br>
          On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
          <br>
          <blockquote type=3D"cite">On 4/29/2020 10:48 AM, Kurt Taylor
            wrote:
            <br>
            <blockquote type=3D"cite">just add it directly here:
              <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/ope=
nbmc/wiki/Current-Release-Content">https://github.com/openbmc/openbmc/wik=
i/Current-Release-Content</a>
              <br>
            </blockquote>
            Added:
            <br>
            =C2=A0 * Yocto refresh to "Dunfell" version 3.1
            <br>
            =C2=A0 * Redfish support for: full certificate management,
            complete LDAP
            <br>
            management, full sensor support, event service schema, task
            schema
            <br>
            =C2=A0 * Move to Redfish Specification 1.9.0
            <br>
            =C2=A0 * Redfish support for 2019.4 Schemas
            <br>
            =C2=A0 * GUI enhancements: LDAP, certificate management
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
      We are targeting this Friday, June 5th for release 2.8. I'm not
      seeing much (or any) discussion on testing. If you have tested the
      release tag please post the results for your platform. Any
      blockers?
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openb=
mc/openbmc/releases">https://github.com/openbmc/openbmc/releases</a>
      <br>
      <br>
      Also, please review and add content to the release notes here:
      <br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-p=
roject.xyz/c/openbmc/docs/+/32440">https://gerrit.openbmc-project.xyz/c/o=
penbmc/docs/+/32440</a>
      <br>
      <br>
      Thanks everyone!
      <br>
      <br>
      Kurt Taylor (krtaylor)
      <br>
      <br>
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

--------------C69DD6CF51CE99D094E8CDE0--

--AG2uk5j4VhiR03ZQkrEaqsgjdlqP61g5S--

--FToSiYdOwMihFtw0fDqaxG0pCcMbdt3s0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl7Wq5sACgkQ0EfviT3f
Hwne3QgAkvq6RguaxyOcTG7h0pqErdrLkluyahio0qs+WvTV5mqdz2OE9zBxoOgX
jTdwhf7mJZbVn2KMMe9kdBbUlu/vKLpouEUGyh5nGT7BOi7oLQdLRiHrP4qxWmW5
xHtbiYyfZFB2V7ner/HiaNG9bTooMLJP3HX70wmF+fLF+ZBf6Ia5ctAwwhiQxY96
PuqnDAbxkYRAN/XfcV1gS4ojlZHHcXtc28tuwlOJsXBDZuRDH2Syc/T0C1QIi4Z5
NmSkPj8Hbji9BORLAi9riS/TUXfoNkr8VO8zcfqSsPxtu26KHGYGuqZBgQUhi0gl
k4FRDWE3R9gSO9vr481hgzk2sahCpw==
=wCLL
-----END PGP SIGNATURE-----

--FToSiYdOwMihFtw0fDqaxG0pCcMbdt3s0--
