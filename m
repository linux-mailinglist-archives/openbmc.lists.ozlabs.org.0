Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778B1FBD81
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 20:04:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mbg14GK5zDqvT
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 04:03:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mbdz107mzDqTm
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 04:03:01 +1000 (AEST)
IronPort-SDR: zq6HkjLzBqThqC7Ssj/YlT/52wB7vg1XRrbA/8T3QTTEtl+w3jWJ7ZWvdiBvEONE7EfmRD+R9H
 Q+Dvo0WfVn+Q==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 11:02:46 -0700
IronPort-SDR: J8a9+4/GzPybN9QDUQo4oOVqL1GgpoDeCr+1VBLT65UMbEotaXMegiqaj6UTNAKqvq0mb0TbPS
 GdA+oAJap0PQ==
X-IronPort-AV: E=Sophos;i="5.73,519,1583222400"; 
 d="asc'?scan'208,217";a="308538176"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 11:02:46 -0700
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, wak@google.com,
 openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
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
Message-ID: <b1d26a76-13e1-76ca-181c-c2b7b040cd66@intel.com>
Date: Tue, 16 Jun 2020 11:02:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TzNJjuupMUOKkDmtZfVGB48eNjBy2us7p"
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
--TzNJjuupMUOKkDmtZfVGB48eNjBy2us7p
Content-Type: multipart/mixed; boundary="VXLyAMHT6l3qCf9QW6K4yuIdZaqxpAWZY"

--VXLyAMHT6l3qCf9QW6K4yuIdZaqxpAWZY
Content-Type: multipart/alternative;
 boundary="------------BB9BC590C46BB3A01FE77719"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BB9BC590C46BB3A01FE77719
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ratan,

In the email trail for this topic on 27 April you indicated you were
going to start work on the per NIC gateway.
What is the current state of implementing this feature?

On 4/24/20 8:06 AM, Ratan Gupta wrote:
> Hi All,
>
> Currently, OpenBMC stack allows a single default gateway for the
> system. Latest kernel allows to configure multiple default gateways.
>
> Eg: In a system with two interfaces eth0 and eth1,
>
> eth0 configured with static address and having gateway(192.168.2.1)
> eth1 configured with DHCP and gets Gateway from DHCP server (10.10.10.1=
)
> ~~~~~~~~~~~~~
> Kernel IP routing table
> Destination=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Genmask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Flags=C2=A0=C2=A0 MSS Window=C2=A0
> irtt Iface
> 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.168.2.1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 0 eth0
> 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.10.10.1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 0 eth1
> ~~~~~~~~~~~~~~
>
> Kernel will first try using the default gateway having higher metric
> value and then fall back to the lower.
>
> More references:
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/=
7/html/networking_guide/sec-configuring_the_default_gateway
>
> I'm proposing to make this change in the openBMC D-bus interfaces to
> tie the gateway property with the Ethernet interface schema instead of
> System configuration.
>
> Ethernet Interface Schema =3D>
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Network/EthernetInterface.interface.yaml
>
>
> System Configuration Schema =3D>
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Network/SystemConfiguration.interface.yaml
>
>
>
> Please let me know your suggestions.
>
> Regards
> Ratan Gupta
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------BB9BC590C46BB3A01FE77719
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Ratan,<br>
    <br>
    In the email trail for this topic on 27 April you indicated you were
    going to start work on the per NIC gateway.<br>
    What is the current state of implementing this feature?<br>
    <br>
    <div class=3D"moz-cite-prefix">On 4/24/20 8:06 AM, Ratan Gupta wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com=
">Hi
      All,
      <br>
      <br>
      Currently, OpenBMC stack allows a single default gateway for the
      system. Latest kernel allows to configure multiple default
      gateways.
      <br>
      <br>
      Eg: In a system with two interfaces eth0 and eth1,
      <br>
      <br>
      eth0 configured with static address and having
      gateway(192.168.2.1)
      <br>
      eth1 configured with DHCP and gets Gateway from DHCP server
      (10.10.10.1)
      <br>
      ~~~~~~~~~~~~~
      <br>
      Kernel IP routing table
      <br>
      Destination=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Genmask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Flags=C2=A0=C2=A0 MSS
      Window=C2=A0 irtt Iface
      <br>
      0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.168.2.1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 eth0
      <br>
      0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.10.10.1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
      0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 eth1
      <br>
      ~~~~~~~~~~~~~~
      <br>
      <br>
      Kernel will first try using the default gateway having higher
      metric value and then fall back to the lower.
      <br>
      <br>
      More references:
<a class=3D"moz-txt-link-freetext" href=3D"https://access.redhat.com/docu=
mentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-conf=
iguring_the_default_gateway">https://access.redhat.com/documentation/en-u=
s/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_the_de=
fault_gateway</a><br>
      <br>
      I'm proposing to make this change in the openBMC D-bus interfaces
      to tie the gateway property with the Ethernet interface schema
      instead of System configuration.
      <br>
      <br>
      Ethernet Interface Schema =3D&gt;
      <br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/pho=
sphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInt=
erface.interface.yaml">https://github.com/openbmc/phosphor-dbus-interface=
s/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yam=
l</a>
      <br>
      <br>
      System Configuration Schema =3D&gt;
      <br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/pho=
sphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/SystemConfi=
guration.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfa=
ces/blob/master/xyz/openbmc_project/Network/SystemConfiguration.interface=
=2Eyaml</a>
      <br>
      <br>
      <br>
      Please let me know your suggestions.
      <br>
      <br>
      Regards
      <br>
      Ratan Gupta
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

--------------BB9BC590C46BB3A01FE77719--

--VXLyAMHT6l3qCf9QW6K4yuIdZaqxpAWZY--

--TzNJjuupMUOKkDmtZfVGB48eNjBy2us7p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl7pCUEACgkQ0EfviT3f
HwlzBwgAlkyblmAb5Co+SHa3DWc2Xa2FFx45f1ipQqCq0PaXKD5ONHb/clZbMxky
9sFp4UY8tt8BtHqHK78JgvdSK8oVBrWNyU2w2dSHqTtGXqCaeA7q5InQ8oB3d2+E
GL28D26mY+1+vhHibLsJ+moW0RY/ap1CzPQpgcZqmdG6zXuLndlHlbSfFfqZRL2q
pGCGGUMaL5IfW+gSbTeugWqCQh6nSQxDiwzn2LauGCnCgolkpYHw+3ckJMhU7tzb
lPxeuINj6CRe9UWFTqrt+VsCmLx3xVwWbhBgXFBUZTn9+h+Uj+9ULhUPmTPH6XGI
V/QWYm2qjJ+A4QQKDRhl9HXEhn0H8Q==
=DuwQ
-----END PGP SIGNATURE-----

--TzNJjuupMUOKkDmtZfVGB48eNjBy2us7p--
