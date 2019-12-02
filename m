Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947710F198
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 21:34:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RcKf1tnjzDqNv
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 07:34:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RcJr0FY8zDqNm
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 07:33:40 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 12:33:36 -0800
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; 
 d="asc'?scan'208,217";a="213156270"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 02 Dec 2019 12:33:36 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: LAN Cable insertion/removal
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
Message-ID: <51636f8f-7d6c-4f89-61cb-0b4da48a5956@intel.com>
Date: Mon, 2 Dec 2019 12:33:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7wyxg8DVbsuLmfuouHBakMmeggbc93HEJ"
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
--7wyxg8DVbsuLmfuouHBakMmeggbc93HEJ
Content-Type: multipart/mixed; boundary="R65cQCXiKBw0L848Rozsh9UEXS2ecRQjS"

--R65cQCXiKBw0L848Rozsh9UEXS2ecRQjS
Content-Type: multipart/alternative;
 boundary="------------BEDFD9977404ECDF7A9362D0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BEDFD9977404ECDF7A9362D0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

LAN/NCSI experts,

I'm looking for some guidance to correctly report LAN state when RJ45
cables are inserted/removed from the NIC's monitored by the BMC.

Background:

 1. Intel uses one NIC that is dedicated to the BMC (1Gib phy, eth0)
 2. There is another LAN channel managed by the BMC via NCSI (100Mib
    NCSI, eth1)
 3. Prior generations of Intel servers correctly report the presence of
    an active LAN link upon insertion/removal
 4. Prior generations correctly update /sys/class/net/eth(x)/carrier
    based on cable insertion
 5. LAN carrier state is propagated to the IPMI system, and is logged
    via IPMI events.

OpenBMC:

 1. The dedicated NIC (aka eth0) correctly propagates
    /sys/class/net/eth0/carrier state to the kernel
 2. The eth0 carrier state does not propagate to Redfish/IPMI. I believe
    this to be a problem related to DBus update.
 3. The NCSI NIC (aka eth1) does not propagate the cable presence to
    /sys/class/net/eth1, which I believe to be invalid behavior.
 4. The eth1 carrier state does not propagate to Redfish/IPMI. I believe
    this is a two-fold problem with DBus update, and kernel update.
 5. LAN carrier state is not propagated to IPMI or Redfish, and is not
    logged.

I've already pushed a change to handle synchronous enable/disable
actions via DBus. Unfortunately it's only half the solution. I've been
trying to work my way through the FTGMAC100 driver code, and the
phosphor-networkd code in an effort to tie the async event into the DBus
space.=C2=A0 So far without success.

Desired results:

 1. Redfish GET /redfish/v1/Managers/bmc/EthernetInterfaces/eth0 (eth1)
    correctly reports the InterfaceEnabled state when a cable is
    pulled/inserted.
 2. Redfish receives an event that permits the state change to be logged.=

 3. IPMI correctly reports the link status (up/down)
 4. ip link correctly reports the link status (up/down).

Does anyone on the list have some recommendations?



Details of my investigation for the strong of heart:

  * Synchronous NIC Enable/Disable change

     1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/=
26696
     2. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interf=
aces/+/26694
     3. https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26693

  * FTGMAC driver: (kernel-source/drivers/net/ethernet/faraday/ftgmac100.=
c)

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 This code looks suspect, as it uses=
 "speed" to determine if the
link is up/down.=C2=A0 For the Intel system the NCSI channel is always
running 100Mibps, so does this really work?

    =C2=A0=C2=A0=C2=A0 /* Link is down, do nothing else */
    =C2=A0=C2=A0=C2=A0 if (!new_speed)
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Likewise, this code announces the l=
ink is "down", which seems
would cause the kernel to alter the state of
/sys/class/net/eth1/carrier.=C2=A0 Insertion of the cable does not cause =
a
corresponding "link is up" message:

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 static void ftgmac100_ncsi_handler(=
struct ncsi_dev *nd)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 if (unlikely(nd->stat=
e !=3D ncsi_dev_state_functional))
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 netdev_dbg(nd->dev, "N=
CSI interface %s\n",
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 nd->link_up ? "up" : "=
down");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 }

  * PHY driver (kernel-source/drivers/net/phy/phy.c and phylink.c)

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The PHY driver for eth0 seems to be=
 working correctly. Removal
shows the link going down, and the /sys/class/net/eth0/carrier file
changing state from 1->0. Insertion works correctly changing the state
from 0->1.=C2=A0 What isn't present is some action to phosphor-network or=

DBus indicating a link state change.

  * ip link

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The "ip link" command always return=
s
"<BROADCAST,MULTICAST,UP,LOWER_UP>" for eth1 (NCSI) channel.

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------BEDFD9977404ECDF7A9362D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    LAN/NCSI experts,<br>
    <br>
    I'm looking for some guidance to correctly report LAN state when
    RJ45 cables are inserted/removed from the NIC's monitored by the
    BMC.<br>
    <br>
    Background:<br>
    <ol>
      <li>Intel uses one NIC that is dedicated to the BMC (1Gib phy,
        eth0)<br>
      </li>
      <li>There is another LAN channel managed by the BMC via NCSI
        (100Mib NCSI, eth1)<br>
      </li>
      <li>Prior generations of Intel servers correctly report the
        presence of an active LAN link upon insertion/removal</li>
      <li>Prior generations correctly update
        /sys/class/net/eth(x)/carrier based on cable insertion</li>
      <li>LAN carrier state is propagated to the IPMI system, and is
        logged via IPMI events.<br>
      </li>
    </ol>
    <p>OpenBMC:</p>
    <ol>
      <li>The dedicated NIC (aka eth0) correctly propagates
        /sys/class/net/eth0/carrier state to the kernel</li>
      <li>The eth0 carrier state does not propagate to Redfish/IPMI. I
        believe this to be a problem related to DBus update.</li>
      <li>The NCSI NIC (aka eth1) does not propagate the cable presence
        to /sys/class/net/eth1, which I believe to be invalid behavior.</=
li>
      <li>The eth1 carrier state does not propagate to Redfish/IPMI. I
        believe this is a two-fold problem with DBus update, and kernel
        update.</li>
      <li>LAN carrier state is not propagated to IPMI or Redfish, and is
        not logged.<br>
      </li>
    </ol>
    <p>I've already pushed a change to handle synchronous enable/disable
      actions via DBus. Unfortunately it's only half the solution. I've
      been trying to work my way through the FTGMAC100 driver code, and
      the phosphor-networkd code in an effort to tie the async event
      into the DBus space.=C2=A0 So far without success. <br>
    </p>
    Desired results:
    <ol>
      <li>Redfish GET /redfish/v1/Managers/bmc/EthernetInterfaces/eth0
        (eth1) correctly reports the InterfaceEnabled state when a cable
        is pulled/inserted.</li>
      <li>Redfish receives an event that permits the state change to be
        logged.</li>
      <li>IPMI correctly reports the link status (up/down)</li>
      <li>ip link correctly reports the link status (up/down).<br>
      </li>
    </ol>
    <p>Does anyone on the list have some recommendations?</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Details of my investigation for the strong of heart:</p>
    <ul>
      <li>Synchronous NIC Enable/Disable change</li>
    </ul>
    <ol>
      <ol>
        <li><a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/phosphor-networkd/+/26696">https://gerrit.open=
bmc-project.xyz/c/openbmc/phosphor-networkd/+/26696</a></li>
        <li><a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/26694">https://gerr=
it.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/26694</a></li=
>
        <li><a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/bmcweb/+/26693">https://gerrit.openbmc-project=
=2Exyz/c/openbmc/bmcweb/+/26693</a></li>
      </ol>
    </ol>
    <ul>
      <li>FTGMAC driver:
        (kernel-source/drivers/net/ethernet/faraday/ftgmac100.c)</li>
    </ul>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 This code looks suspect, as it =
uses "speed" to determine if
    the link is up/down.=C2=A0 For the Intel system the NCSI channel is
    always running 100Mibps, so does this really work?<br>
    <blockquote><font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=
=C2=A0 /* Link
        is down, do nothing else */</font><br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 i=
f (!new_speed)</font><br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 return;</font><br>
    </blockquote>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Likewise, this code announce=
s the link is "down", which
      seems would cause the kernel to alter the state of
      /sys/class/net/eth1/carrier.=C2=A0 Insertion of the cable does not
      cause a corresponding "link is up" message:</p>
    <p><font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 static void
        ftgmac100_ncsi_handler(struct ncsi_dev *nd)</font><br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 {</font><br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 if
        (unlikely(nd-&gt;state !=3D ncsi_dev_state_functional))</font><br=
>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;</font><br>
      <br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0
        netdev_dbg(nd-&gt;dev, "NCSI interface %s\n",</font><br>
      <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0
        nd-&gt;link_up ? "up" : "down");</font><br>
      =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 }<br>
    </p>
    <ul>
      <li>PHY driver (kernel-source/drivers/net/phy/phy.c and phylink.c)<=
br>
      </li>
    </ul>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The PHY driver for eth0 seem=
s to be working correctly.
      Removal shows the link going down, and the
      /sys/class/net/eth0/carrier file changing state from 1-&gt;0.
      Insertion works correctly changing the state from 0-&gt;1.=C2=A0 Wh=
at
      isn't present is some action to phosphor-network or DBus
      indicating a link state change.</p>
    <ul>
      <li>ip link</li>
    </ul>
    <p>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The "ip link" command always=
 returns
      "&lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt;" for eth1 (NCSI) channel.<=
br>
    </p>
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

--------------BEDFD9977404ECDF7A9362D0--

--R65cQCXiKBw0L848Rozsh9UEXS2ecRQjS--

--7wyxg8DVbsuLmfuouHBakMmeggbc93HEJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl3ldRwACgkQ0EfviT3f
Hwm4Owf/aw/6C0NGl32DeHpUOQ3henz0AeDNtZz0QcuHMnxi2OPjEndk39Danpon
fAC4632hqu+MlYAWJUNQPebXycbNkscI/gOTovR1hSgbELbxjPEDA0Li5hJK2x31
ixWjPnHuYD9awuyCMlo9kZHujpXIu4yVqybtbT4KwhTHn0TYaybyiCfaqw+x10ug
5MIknJTNerHMH+AEjfCZmAyJjN3iUSEcF9FA7sIHGb8BZY8Vq2l0SWd9cQUpLGfp
QLI/UAniBUKnCcqOWXe7wa3eoRsJrxFBTPp1InrxMbT2Q9S57OfO2FHXjFoNCtBJ
ZIXI/pix6ZD29lhBb1nwFjaUag6A4A==
=yF24
-----END PGP SIGNATURE-----

--7wyxg8DVbsuLmfuouHBakMmeggbc93HEJ--
