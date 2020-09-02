Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5625B077
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:59:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhTC074yfzDqgs
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 01:59:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=C4nHvDq7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Kw/c7mpv; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhT0K30bKzDqyk
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 01:49:50 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D9625C021E;
 Wed,  2 Sep 2020 11:49:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 02 Sep 2020 11:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=rgOOOxq5H7E3Vy7Gzpk89q7Oxmp
 UU/weW7HSO2XS0xY=; b=C4nHvDq75B6T7Ds/lX28yzVFfbrfnU3jBDnCueknsWk
 oMYbWSsL0hIjL2KOhvoAvMxKJLmaF3QNfVtTv4M5Ce0cCVWbjE4Y5y6SXGSPoxmQ
 GxVt42pVk7s751WOgyqLVMHfPhfqr8R1BsbOpZbmUve/UPwdlJK9Xg+s/lGmxWAl
 OXIMs2c0kuzKinXUktvgRJrse3zSfK5v8mmV+4RJAxAoiuZzcYAmthVT2QY482TF
 7d2GCKn7DYMmT4YVxXR9499LnkvsOgUuS3Jjri4byh0Lo3bggDgZrYfgn/y6N1Tk
 hQ+edvo/csv5h36vD8ptxidyy3b0KurI8xYr26KGkPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rgOOOx
 q5H7E3Vy7Gzpk89q7OxmpUU/weW7HSO2XS0xY=; b=Kw/c7mpvE/5hDG9hTSL5r3
 /CzGZFMzUpDZjpYWBQk4kSD9O8mY04p1fNe0ISDJedOrnkQB6OsHsSlbNSLB9pOS
 udnIcv2L3UeoYGwuFWP5Lj1+BAlY7f/Yx/sNE/3zlzdt5ORP3LYfRYZ3f+EiXvfD
 p6nU+DlGAMTT2moaSf/QN2bqKmoypm+AcgtlL1ExmlvF0RfL/WKiPdIe4O6L3WcS
 SWFOQo296I+sUjcROs2nclP2oHEgbRhI5oIZCua2oge1nGbXpxYtRspA0ifXrKDc
 dyxpR4nUZQuoFZZZM198t6+3eV5UaSMbyzqW0saBp62g5A/k/lnIiZ5UstR+smLg
 ==
X-ME-Sender: <xms:Gb9PX1MTHHL59pMIQJHx8GqCulm2wKtjs08Se-iIOPb5EFprDnkmjg>
 <xme:Gb9PX3_oyuEOZUNG4_GXg9tVrfrdpWW1QIUVUIGgMZk81c4o4fHx4xWRevpDj1ZEM
 D8ftFMDzoMla8CMjmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepffegjeffueeutedutdelgfejiefh
 gfdtjeefueethfefhefhgfdvhfefiedvhfdtnecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecukfhppedutdejrdelvddrheelrddujeehnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:Gb9PX0Rwu97nmtFp_04KiWutZEVTlA0DsDig8EhIq6ysC0ygeWHAHA>
 <xmx:Gb9PXxtRP_huXrGR6KbcYa2NXrkRz6x5mP8g4dCD7xxpXz4JPvvsmg>
 <xmx:Gb9PX9eO-wCLqklOyJErOqpkbpNup00VtPzjTx83703gTXDdPJ8rtQ>
 <xmx:Gr9PX9nRBL_zLKaeHzqMH60XQPyssEYjOs525wAqt90CK6IPwMy65w>
Received: from localhost (mobile-107-92-59-175.mycingular.net [107.92.59.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 96C8F3280069;
 Wed,  2 Sep 2020 11:49:45 -0400 (EDT)
Date: Wed, 2 Sep 2020 10:49:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Subject: Re: Need update CI build config for new repo smbios-mdr.
Message-ID: <20200902154944.GW3532@heinlein>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
 <20200901162333.GT3532@heinlein> <20200901164139.GV3532@heinlein>
 <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hSsVBZHIO2Q9XETc"
Content-Disposition: inline
In-Reply-To: <SN6PR11MB352047845E48681E8F71B139902F0@SN6PR11MB3520.namprd11.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--hSsVBZHIO2Q9XETc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 02:02:00AM +0000, Wang, Kuiying wrote:
> Hi Williams,
> The key thing is sdbusplus interface is not match.
> You could config CI based on this patch https://gerrit.openbmc-project.xy=
z/#/c/openbmc/smbios-mdr/+/36011/
> That's ok, if it can pass the build.
>=20
> Thanks,
> Kwin.
>=20

Here is a snippet of the compile log:

/home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/src/cpuinfo_=
main.cpp:34:10: fatal error: peci.h: No such file or directory
   34 | #include <peci.h>
      |          ^~~~~~~~
compilation terminated.


This one might be a missing dependency?  Where is 'peci.h' from?  Is it
=66rom a kernel header for the ioctls or some other repository?  Do you
need to stub this out when building on x86?


make[2]: *** [CMakeFiles/cpuinfoapp.dir/build.make:63: CMakeFiles/cpuinfoap=
p.dir/src/cpuinfo_main.cpp.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:78: CMakeFiles/cpuinfoapp.dir/all] Error=
 2
make[1]: *** Waiting for unfinished jobs....
In file included from /home/jenkins-slave/workspace/ci-repository/openbmc/s=
mbios-mdr/src/cpu.cpp:17:
/home/jenkins-slave/workspace/ci-repository/openbmc/smbios-mdr/include/cpu.=
hpp:113:17: error: =E2std::string phosphor::smbios::Cpu::processorSocket(st=
d::string)=E2 marked =E2override=E2, but does not override
  113 |     std::string processorSocket(std::string value) override;

This appears to be a case where the current phosphor-dbus-interfaces
doesn't match whatever your commit is trying to do.  You've got
additional methods for handling dbus properties, but those properties do
not exist in phosphor-dbus-interface's Cpu interface.

I suspect you're trying to implement
xyz/openbmc_project/Inventory/Item/Cpu, which has a 'Socket' property
but not a 'ProcessorSocket'.  If I recall, this happened in the code
review where the "Processor" part was requested to be removed since it
was redundant.

There are a number of other properties in your compile fail that need
similar updating.

--=20
Patrick Williams

--hSsVBZHIO2Q9XETc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9PvxYACgkQqwNHzC0A
wRkDKQ/+Nt+IYiG5TPin0klcdnAt13cjAcaazRmHhz50BtiQYm8jp2N44cnPmICU
hunub/scYhygMXAmMiW97qeJMESR/AJ9Z4G6xU3JOdUwX/Cs/5iJ+5/+bLRgGrhr
qA1qMG9cd+yBffGLNzXiB9zUKgfONZX4TfSlHpR71vhgYda3nyO9qNoLjjkufJ/s
W4GyDBqWdCh6exq5vlNG4UICDhlw3Svdkxtmt+XHCh5fgxBKIZN79n3B/3vzhvIM
OOS4P1p9jF8xQqnsZJrUPxPrHqP/XguxSmBWBu9TfpKynpAVZd2C+2bykwa3iPdm
zLqLABSDuMV8BiN1HLm3X6ZHVYCLQm18GJB4MCkIrAnL7KZ5dgDdK9DnSGQb8gsv
s/ciS68Nx5ub3CwiglEjY+QFl2jV4xiwXX9l9dsIdBT7M860mPj5NxZnZQWP1cqh
GslM3b6b12/hbonp8mAaf1GnKHUiYYzSmoiQGWwuoVbl6SoGZge39IcX3lqSkAd6
Q1eZqhm1rHBoUgi2l7+nzWiTxL/vVxEo8GcVJlGlyvKbOSXQDLEQKWJ/JNS0u49K
z31+qHJNtvOgFHY6IvJ22R/YclLiYj3xA4mWXbPyS8OBawO8HPrhs9Wj/Z/6gzX3
F2T2M2WU8RHL+Ga5V1AVJjXdtkB4Np30V/dA3v9UekxqTzFl3fk=
=e6RX
-----END PGP SIGNATURE-----

--hSsVBZHIO2Q9XETc--
