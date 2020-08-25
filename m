Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C6251C75
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 17:41:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbYBJ4v7NzDqHY
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 01:41:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=FoZyUkk2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NYN2yU9b; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXH570Y0zDqMr
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 01:00:33 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id CBBF0D5A
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 11:00:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 11:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=T9avNRK/XEYeUgbo1dVTCtJxDGB0FPBrUbwaYkbGWuk=; b=FoZyUkk2
 2adbtEXXeyWoHmRznkmlvr6slTEXw0w28u7w8zuL2fkesjS0cOBPaYZmGsxKd2LM
 qGFhLvq+02pZiYrDBUdMlfH9ZgJ+yyX9WfcCPacbD7KjXLNSeWyQYCio8a258saC
 OEb1jT5C6L8HAFShDE1EV3AF8KSEx8l5p7mIYZXQ5B19USaH3jub0L+VnxmpDCYv
 z7s1Se4GRmwXYIyU/dTUhww7MDI0H3ad2V0XXQm+ZlhVamg+Vg2DKUp1gd1nYXeS
 FDXSIGw5vMwdjLcUXgi2cAoX9xAUQVv9+K1xgKusnXIAAXsSa2treBpDjult5AHh
 XzjwMf+erryrJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=T9avNRK/XEYeUgbo1dVTCtJxDGB0F
 PBrUbwaYkbGWuk=; b=NYN2yU9bGjtiBEu/I4qTdI3xTxvpa54ymrD8QBjpcTjCC
 aABf/mgwy4/JzeRpXFcEXgs4K8pUhveXr3K8EqX3BQll/v/wPzwKub85Wd8+cKVq
 T3d5XeBu8Ilf4NZsGycccgPnii7A1vRm1Izak11WtOuamrAhqau0yjo8ZGxVWRR1
 26RIbsDm6Ovnk0YJUDEdWjDVS+J74SjAQWj/WFhP7/qly+sR3iJ0h1r3V2wIRWXk
 +1qMn8Te7AG3fRchYovlVc5wN726/KaJ43KFU5wpju+IdEhCdKirBlgvwy4gEyKW
 7y/M0XBGaO55TsnH8oj5Ky5Xk6F6kowWkNpr/zDKA==
X-ME-Sender: <xms:jidFX1OFkmBiSZk6VB0tE0K5C0LLQ2lCcyCLTRuwS_dQW2OQJ7zyDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeffhefglefhhfeihfejgeegleejleel
 jeehfefghfffledttefffedvkeelgeevnecuffhomhgrihhnpeguvggsihgrnhdrohhrgh
 dpghhithhhuhgsrdgtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:jidFX39ypexT_b8zd0S_d60NxBLIm3kjXqLIBk-I6-5Ws7TZsC9Z6Q>
 <xmx:jidFX0QyxA29S71WmLbrXbiFo8lWss973MgKSEYpJ899wr6hJEOVTA>
 <xmx:jidFXxvrRbVt4uPo2Muj3fbz-2gxseLNCTndt9ScvO_NbaUDEgmZKQ>
 <xmx:jidFX49MtPzbOmYBenD7n_xRdul8t3jmTEYqRRoRLZOPToLHEgiCtA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD3E63280066
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 11:00:29 -0400 (EDT)
Date: Tue, 25 Aug 2020 10:00:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: sdbusplus - const/readonly flags
Message-ID: <20200825150028.GK3532@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Content-Disposition: inline
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


--huBJOJF9BsF479P6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I thought I sent an email to the list on this 1.5 months ago, but I
didn't receive any feedback.  It seems like my email never made it to
the list.  So, here is another attempt.

---


TL;DR: The sdbus++ attribute flag 'const' was incorrectly documented and a
new flag 'readonly' is now available.  Some phosphor-dbus-interfaces
might be implemented incorrectly.


ALSO: I could really use the help of the domain experts for the
phosphor-dbus-interfaces listed in the gist[4] to review and determine
if 'const' or 'readonly' is more appropriate.


---

For the sdbus++ interface YAML files we have some flags that can be
added to attributes.  These flags correspond to flags available in the
underlying sdbus vtable functions[1].  Through investigation of
openbmc/sdbusplus#48[2] I came to realize that our documentation of
'const' did not match what SD_BUS_VTABLE_PROPERTY_CONST meant.

The old documentation said:

    The flag `const` makes the property read-only via D-Bus but still
    writable by the app implementing it.

The PROPERTY_CONST says:

    PROPERTY_CONST corresponds to const and means that the property never
    changes during the lifetime of the object it belongs to, so no signal
    needs to be emitted.

The words are quite different.  To deal with this I have done two
things[3]:

   a. Fix the documentation of 'const' to match PROPERTY_CONST's
      intention.
   b. Add a new flag 'readonly' to match the previously documented
      behavior.

The new documentation reads:

    Both `const` and `readonly` prevent D-Bus clients from being able to
    write to a property.  `const` is a D-Bus indication that the property
    can never change, while `readonly` properties can be changed by the D-B=
us
    server itself.  As examples, the `Version` property on a software object
    might be appropriate to be `const` and the `Value` property on a sensor
    object would likely be `readonly`.

You might ask why I didn't fix 'const' to match the documentation.  I
chose to change the documentation instead for two reasons.  First, the
code using these flags has been tested, so it is a less risky change to
simply update the human-read documentation.  Second, we were always
calling a near identical-named sdbus macro, so it is more intuitive to
have matching behavior for matching names.

What does this mean for us?  A few thoughts.

   * I expect some of the 'const' flags in phosphor-dbus-interfaces are
     wrong and should be changed to 'readonly'.  I have collected a list
     of them in a gist[4].  If you really intend to mean "this property
     will never change during the life of an object" continue to use
     'const', but if you mean "this property shall not be changed by
     clients", use 'readonly' (and probably also add 'emits_change').

   * Implementations should really be careful using 'const' because the
     default behavior of sdbusplus/server/object.hpp is
     'emit_object_added' in the constructor, but the 'const' properties
     themselves are likely set later which is a violation of the
     'PROPERTY_CONST' documentation.  A process could listen for the
     ObjectAdded signal and use the results of that to cache your
     'const' properties, which haven't been fully initialized yet, and a
     later PropertyChanged signal will never come when the real property has
     been initialized.

   * We don't currently have code in sdbus++ generated servers to
     prevent changing 'const' properties after the ObjectAdded or
     InterfaceAdded signal has been sent.  This could be added at a
     later time to try to catch these cases.

Thank you for reading this far!  Like usual, reach out if I've messed
something up or what I've written above is not clear.

1. https://manpages.debian.org/experimental/libsystemd-dev/SD_BUS_WRITABLE_=
PROPERTY.3.en.html#Flags
2. https://github.com/openbmc/sdbusplus/issues/48
3. https://github.com/openbmc/sdbusplus/commit/e1c73d3bf8f6cabc1c58f67a233d=
ba55b6f76d74
4. https://gist.github.com/williamspatrick/fa975c33f00640ca54a7aa246bbbfeb9

--=20
Patrick Williams

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FJ4oACgkQqwNHzC0A
wRnxWA/+NpaxhO7biDnRPUpH/ar/P1lsfR2+LZyhVaJDUES0H8IFpeBam6cCQTP1
jwbZSOmzSvjYqbp5mJyHD8DKNOePBUNh7zz9pJxtNqghWpwFXLPEW40bzmydZHAx
5EoZ+DeXuMl99k7MHIhGK3lQcf4gExmvqUhmQ3yh6TdqNxU92u7zCNn3ZcufKeR+
DCo4I6XEI+xpzLY1JJ+/RqCb8xyyKCKzHx25HxQYqV1jHlPwoKVFsVHC+0BiC/6R
h6yfDnhTUC5emuHw/G/gw3AL5p1wjDx8Vf2ilRmTzjLczv78MDVxdfIgSTrWQk5O
WHsr95f2dqyZzrzmQsqrpQwKxmXkGcmyKkr5ckVUM+V5tbrnOgB5vYG/gdXCs8YS
H463E07ZfYQcjzwUXy1gzLQKasgzjyfQKYVHA7UWw1t/ptmYwsPY0NdFVMoyPL6u
oDaPpsVTNFb4pztbOI4DNahtOM7ExFnHt2mYQ/2vxXuEFQSt6SmgXdG7KgldfUIA
SiO7VyB88D3SMOXmEdudN9xJvkyWuumcpGAh5vwmMtbCow1+0b56RqWVKOhS9ueT
uiZD0KRmwTraA3EEA4EOjhjstPEX3DNsDdr5KOnBKUPsMmjyjD5Y8fsBnUvEW2Q+
4XMElpk5uOb3OH30bpWQm2EpOzI+j9OD9+BJRY/xZZc2tKrHFJg=
=dJd6
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--
