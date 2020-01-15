Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A785013CD15
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 20:28:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ycmf5XbnzDqQF
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 06:28:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.a=rsa-sha256
 header.s=zoho header.b=JZ1yVyqf; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yclq3K3QzDqRs
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 06:27:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1579116429; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=BDo0LoFglf6slQWAtVTtsUC1FwVRA1Du1VqdhgNzC/s=;
 b=JZ1yVyqfyKu9BrIvTZcY/0BpzJRcjRrB3Zg9l7cX71dvfFRY2k3N50H1AEahXGG4
 6rxNTKKo+1Rtmd9aUN+OZWNFfM6Wnqiqm1P4LqEiPfqAeIx2qxj6OfAm72fJeUHGcpW
 JVS2NGJ1TbEmeV/XLZR42tyCRDjCYee/GyHcU/Fk=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1579116424705526.310494170472;
 Wed, 15 Jan 2020 11:27:04 -0800 (PST)
Date: Wed, 15 Jan 2020 13:27:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: No sensors displayed in webUI
Message-ID: <20200115192701.GD3512@patrickw3-mbp.dhcp.thefacebook.com>
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
 <3ae17538-5e0d-1228-a242-56ab25dd3229@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline
In-Reply-To: <3ae17538-5e0d-1228-a242-56ab25dd3229@linux.intel.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: Max Power <max_power2005-openbmc@yahoo.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 09:26:48AM -0800, James Feist wrote:
> There was a thread about this last week:
>=20
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020044.html
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020136.html
>=20
> TL;DR all the sensors are available in Redfish, but the WebUI hasn't move
> over to full Redfish support yet. There is a test patch that helps enable
> this in the thread.

Hi James,

This statement about a dependency on Redfish stood out to me.  The
current UI is mostly using the "old" REST API, but as long as the dbus
objects are created correctly it should not matter one bit if the
external interface is the dbus-based REST API or the Redfish one.

This is a bug in dbus-sensors that is independent of Redfish vs REST.

The current webui code expects there to be properties that are specified
in phosphor-dbus-interfaces.  Specifically, it is looking for the "Unit"
property[1], which is a required property on
xyz.openbmc_project.Sensor.Value[2].  The dbus-sensors has a bunch of
Sensor.Value objects that are violating the interface spec by not
providing "Unit" [3].  Notice that `setInitialProperties` doesn't
register_property on "Unit" and neither does any other code in this
repository[4].

Why is none of this code using the code generated from
phosphor-dbus-interfaces?  Since it is generating dbus objects "by
hand" it isn't not getting any compile-time checking if it is doing the
wrong thing (or more likely that the phosphor-dbus-interface changes out
=66rom underneath it).

[1] https://github.com/openbmc/phosphor-webui/blob/f70f42553615972163b36c9b=
4d77be07e4399122/app/common/services/api-utils.js#L979
[2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Sensor/Value.interface.yaml#L32
[3] https://github.com/openbmc/dbus-sensors/blob/fbb44ad1ea716d4e8c2cacdf01=
d380c6d0f53855/include/sensor.hpp#L13
[4] https://github.com/openbmc/dbus-sensors/search?utf8=3D%E2%9C%93&q=3Duni=
t&type=3D

--=20
Patrick Williams

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4fZ4MACgkQqwNHzC0A
wRlm/hAAkC7nyYEhZiPvqpeymMUYmPNndhi+qO99+YfebNK+S/ruDWeZZd3Y/vs/
gOYexjx2I2vbIf0nNViLIXuxkhaxOfwcWx1lf6C2lYENJ5j7cVJWxholPkm0Kh59
SzwJ7VH3VrCw6xHwnWp0HblaMKd4NkAY7pdSvjQEU0LcukRvGog3WXkdbtOPHQcl
/a86c8G+ZnyD4nDmZSrBIVYR8rtSFXVIT3dZfnXQMpCVtsimCHWlzMVBj+p5lCWm
krVsSYRnCT0Ewwrb1m70xLHTW8qmlfpiGZ/hK+VzH7RMrE0dzuSFIS0VRNkmNYu/
PPHdwk+VG/d7mg/TJdUxvEe1l3CAEyRldsEEM3tkmyMVigXo69meHfANBKuVLq8O
4XKQpnegQMUlR54LhTCY8UFPdBb1+DL6aE+z7FYF5JKog3Cf2LmO5D/DkEHaT5NH
PFYFcx5zz5Jklg9kU2jVPeHByJ0tmh+kB1+zXyqjD5h7S0FUYBIw81BrsecGBago
xdiFj+DA8arZrEtXuJfpfVXQlOoIlCa2dzbvyjI+xrg4tbuVKX41Vjg9omrtLNES
pXBpqXofHp0FSArlYV9VNy4xOWvLQmGjab6GJg/9cDGkKPFEtcUHKuJim0xIrdmg
4FgAx4T3wlF7qLJSNQ7v0WDVOnopMiOlpYLPbg+jIpF2UsSvM5E=
=3cq/
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--

