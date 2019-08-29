Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB9A2801
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 22:31:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KDlS26sQzDrdG
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 06:31:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KDkM6mblzDrcY
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 06:29:57 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 13:29:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,444,1559545200"; 
 d="asc'?scan'208,217";a="175385806"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 29 Aug 2019 13:29:54 -0700
Subject: Re: QEMU native compile issue
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
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
Message-ID: <e2cde533-17ea-bac7-ed55-c3395dce2e71@intel.com>
Date: Thu, 29 Aug 2019 13:29:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ycl6qcPqYUXUj76Fu0pj2LrNQb9HYZBhm"
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
--ycl6qcPqYUXUj76Fu0pj2LrNQb9HYZBhm
Content-Type: multipart/mixed; boundary="eTfBQzAjuFdurYrOsl2fEFiU9G2Te04Rs";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Message-ID: <e2cde533-17ea-bac7-ed55-c3395dce2e71@intel.com>
Subject: Re: QEMU native compile issue
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
In-Reply-To: <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>

--eTfBQzAjuFdurYrOsl2fEFiU9G2Te04Rs
Content-Type: multipart/alternative;
 boundary="------------420C2D93DD0D5C31E3FEAA40"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------420C2D93DD0D5C31E3FEAA40
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I've reviewed the QEMU commits:

6d5d5dde9a linux-user: fix to handle variably sized SIOCGSTAMP with new
kernels

I didn't push the commit to somewhere useful.

On 8/26/19 4:31 PM, Andrew Jeffery wrote:
> Hi Johnathan,
>
> On Tue, 27 Aug 2019, at 05:39, Johnathan Mantey wrote:
>> Friday I ran into an issue compiling qemu-native. I tracked the issue =

>> to the the fact that the most recent kernel creates a new definition=20
>> for SIOCGSTAMP in sockios.h. The prior definition was in sys/socket.h.=
=20
>> I have pushed a change request to the QEMU code base.=20
> Can you provide a link to the change request that you pushed?
>
> Cheers,
>
> Andrew

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------420C2D93DD0D5C31E3FEAA40
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    I've reviewed the QEMU commits:<br>
    <br>
    6d5d5dde9a linux-user: fix to handle variably sized SIOCGSTAMP with
    new kernels<br>
    <br>
    I didn't push the commit to somewhere useful.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 8/26/19 4:31 PM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com">=

      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Johnathan,

On Tue, 27 Aug 2019, at 05:39, Johnathan Mantey wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Friday I ran into an issue=
 compiling qemu-native. I tracked the issue=20
to the the fact that the most recent kernel creates a new definition=20
for SIOCGSTAMP in sockios.h. The prior definition was in sys/socket.h.=20
I have pushed a change request to the QEMU code base.=20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Can you provide a link to the change request that you pushed?

Cheers,

Andrew
</pre>
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

--------------420C2D93DD0D5C31E3FEAA40--

--eTfBQzAjuFdurYrOsl2fEFiU9G2Te04Rs--

--ycl6qcPqYUXUj76Fu0pj2LrNQb9HYZBhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl1oNb4ACgkQ0EfviT3f
HwlMcggAgrgVHExAlABmjWjqZEydOmVT6CSdiMcTtt/FCWqKGTp7qX6w+nzh8wSu
mULfNX7bij17wzoqdQqkB13WgsIR3v4hm3CSTFzFkGJ0dr0XNhhkQnmE1d0Z+CUo
HFlNZiWFMHteKkaGc0Sx/HBBD1rViU1Eck/Wk+zxf/Dts3HK3cEUWc5RtExdyeS0
GDcdlRrT3ckQB2p55GCOirehcdRHaMgeeGHaHKg2xpo1M6TWcSU5Vjr53J/UuMdG
dKwoM9soP1wx7jacf8K6OFvaNVziPw6bF7cRc02CbW7n77OcY2JsXinU+fIAYWKx
CN0BhYVWgZ2c5HVK6EJgen2KHksz+Q==
=cug/
-----END PGP SIGNATURE-----

--ycl6qcPqYUXUj76Fu0pj2LrNQb9HYZBhm--
