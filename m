Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07263AE060
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 23:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S1vX1KdgzDqRC
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 07:46:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S1ty03tXzDqNK
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 07:45:54 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 14:45:51 -0700
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; 
 d="asc'?scan'208,217";a="185316826"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 09 Sep 2019 14:45:51 -0700
Subject: Re: QEMU native compile issue
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
 <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
 <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Openpgp: preference=signencrypt
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
Message-ID: <b0e8e1a5-631e-9b26-1829-1f39ff3393d9@intel.com>
Date: Mon, 9 Sep 2019 14:45:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ztO4ssnzbLqiGYgv4VmgzSuErJ2Avg7Fl"
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ztO4ssnzbLqiGYgv4VmgzSuErJ2Avg7Fl
Content-Type: multipart/mixed; boundary="lTWFxgrWp60CPWxaWid3kQk0iIFuFqYgb";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Patrick Venture <venture@google.com>, Benjamin Fair <benjaminfair@google.com>
Message-ID: <b0e8e1a5-631e-9b26-1829-1f39ff3393d9@intel.com>
Subject: Re: QEMU native compile issue
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
 <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
 <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>
In-Reply-To: <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>

--lTWFxgrWp60CPWxaWid3kQk0iIFuFqYgb
Content-Type: multipart/alternative;
 boundary="------------FCB85149C400E5BB5E050483"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FCB85149C400E5BB5E050483
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Brad,

FYI...

Commit c68388fc.... is part of my latest pull, which is 9d227052b.

The upstream fix for QEMU native is not present in any commit 9d227052b.
When you are unblocked please collect the QEMU update.

On 9/9/19 4:57 AM, Brad Bishop wrote:
> at 8:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>> On Wed, 28 Aug 2019, at 00:09, Johnathan Mantey wrote:
>>> Not really. I'm not sure where the code went.
>>>
>>> =C2=A0I cloned the OpenBMC QEMU, made my change, and then pushed the =
change
>>> to "upstream". I have SHA "650af0e183 Fix compile error when using
>>> kernel 5.2" as the text.
>>
>> As you noted in your follow-up email you found the fix upstream.
>> Further, the fix
>> is contained in the QEMU v4.1 tag.
>>
>> Upstream open-embedded has already bumped QEMU to v4.1 - I guess we
>> should backport that change to openbmc/openbmc and this will be
>> resolved.
>> I've Cc'ed Brad so he's across it.
>
> I think this was picked up with openbmc
> c68388fccb8c0b5bf4d6b8efff91203796be98b2.
>
> If that doesn=E2=80=99t have what we needed...I=E2=80=99m blocked on do=
ing further
> oe-core updates because of this:
>
> https://lists.ozlabs.org/pipermail/openbmc/2019-September/017984.html
>
> -brad

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------FCB85149C400E5BB5E050483
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Brad,<br>
    <br>
    FYI...<br>
    <br>
    Commit c68388fc.... is part of my latest pull, which is 9d227052b.<br=
>
    <br>
    The upstream fix for QEMU native is not present in any commit
    9d227052b.<br>
    When you are unblocked please collect the QEMU update.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 9/9/19 4:57 AM, Brad Bishop wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com=
">at
      8:08 PM, Andrew Jeffery <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a> wrote:
      <br>
      <br>
      <blockquote type=3D"cite">On Wed, 28 Aug 2019, at 00:09, Johnathan
        Mantey wrote:
        <br>
        <blockquote type=3D"cite">Not really. I'm not sure where the code=

          went.
          <br>
          <br>
          =C2=A0I cloned the OpenBMC QEMU, made my change, and then pushe=
d
          the change
          <br>
          to "upstream". I have SHA "650af0e183 Fix compile error when
          using
          <br>
          kernel 5.2" as the text.
          <br>
        </blockquote>
        <br>
        As you noted in your follow-up email you found the fix upstream.
        Further, the fix
        <br>
        is contained in the QEMU v4.1 tag.
        <br>
        <br>
        Upstream open-embedded has already bumped QEMU to v4.1 - I guess
        we
        <br>
        should backport that change to openbmc/openbmc and this will be
        resolved.
        <br>
        I've Cc'ed Brad so he's across it.
        <br>
      </blockquote>
      <br>
      I think this was picked up with openbmc
      c68388fccb8c0b5bf4d6b8efff91203796be98b2.
      <br>
      <br>
      If that doesn=E2=80=99t have what we needed...I=E2=80=99m blocked o=
n doing further
      oe-core updates because of this:
      <br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.ozlabs.org/piper=
mail/openbmc/2019-September/017984.html">https://lists.ozlabs.org/piperma=
il/openbmc/2019-September/017984.html</a>
      <br>
      <br>
      -brad
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

--------------FCB85149C400E5BB5E050483--

--lTWFxgrWp60CPWxaWid3kQk0iIFuFqYgb--

--ztO4ssnzbLqiGYgv4VmgzSuErJ2Avg7Fl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl12yAkACgkQ0EfviT3f
Hwk+WggAgDyV7zZRZSmFyOM1XNLOThgZBblbwX8pg3H69CFeYRqzWLjwLdrchQBf
yxz5Laxj4Ugf0Jqy7wh8tqUu2JuG3Wipzhlp6jEzYAfcU2kWsa42mn0m9zUAmSI6
m2b87KnbKZ+q5HR7d5ag+0yOThiUfrTMnE5s43ofRjkh0cRCj89P4fEFS7nRTq7g
EVGr+GziViH6n8xiRd77hcPB+a3Wu9j0rCpXZMXAvbIyqy76QpxHIvemnPxNuSFG
tiGUEV0czSE0WL3+CPGYXtn72bVV+U5h3B79EPLttSkkLNAeGqv59mhhprlHfSPI
hhu9oVbCz0Svk2paYOY3VaK0grVoIA==
=2kob
-----END PGP SIGNATURE-----

--ztO4ssnzbLqiGYgv4VmgzSuErJ2Avg7Fl--
