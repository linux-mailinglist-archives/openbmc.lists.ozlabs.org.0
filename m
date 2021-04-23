Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066D3692C9
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZRj050hz300K
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:11:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Fnhix165;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UBZXhs65;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Fnhix165; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UBZXhs65; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZRT0b19z2yRW
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:11:01 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F3C0E12EF;
 Fri, 23 Apr 2021 09:04:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 23 Apr 2021 09:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=PND2yB0dnYIdNWUT7NGu1Ciejqk
 /BHZ7IPuwMmsg00U=; b=Fnhix165nGeQNGTEUaOYs4CFD1JB38zRT0mhL7fDxPA
 HXGs8DRNPaP7eVG+stkIQi8HblkFBX8CYAHYSXjkdYEJcEejT0vXqR6kbum5Ic1H
 3+9+SiK+3PC525xjbMl/JEipzzvc9BamXhBiRfqdBnnxBTMniD7sKDsFR2kQqkzN
 leWRFzeI2kiB9nvT/vKrYZtNtgUt+VLTzqCZrwipCRtc13WUU8YPK3Wrar5DFEy3
 KuSoiMaURBVVty5JgzG6S982imvNrM1YZGadahA5i2FTVlNo2wWsMHUPTshDHc9N
 auAHdI8UVgG0IiWkKAK+WxosydEeA78uF1uRB4c8M1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PND2yB
 0dnYIdNWUT7NGu1Ciejqk/BHZ7IPuwMmsg00U=; b=UBZXhs65wkQiactPdatwEa
 fdycHzTsJ4ywEZHedlFx2VX/sBmcUl1khpfubRUfX/puZsHcynMiHdcq4Za6JEjI
 9016VKuc1aOX6TOGpWr5RkM2GAr7liRcxhWT4lkJ0ChFXIrvktVr+3aiXyg2KaXL
 WlFf9fCrWoaMGBMFw4ZbXs6L+6IEDfecTEVQug3LfmYrIyzCyXxzNNIi3396Zchs
 w5ca9KOpN3MPHsKNPnd6a/VBhs8M4Qv5M5dlL49Rnse25B9+HuKtncnJP3aUhCop
 vRqN1wTIfvTKXZu/3qFwlJ6sq8JMHJ/yRLgl+A5qmRrC258DndnwrPJ6N0XalMlQ
 ==
X-ME-Sender: <xms:18WCYLKADpM_nG-MDD-rkEIXh7NBC53Rh1ldAKNjOX-yzBHzsAstnQ>
 <xme:18WCYPE4Wg38RiH3U6Uodr13j22omjO2pBF9zRUEOyVDiUPG65Vs8jeNzYOlsYUMm
 hJrFaDkCbEOonGhTvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:18WCYAm649u_kGv5g7rqD5TqFN_kJwh_HS0HWlE3cdXDUfqVZ8b1fg>
 <xmx:18WCYMI4EUnhvWq5ELTRCeNu4ueom8E_x6qQbQ8Iij8rTRcbaAPVyQ>
 <xmx:18WCYBaAKjMH5TDpmwLqoMMXeOQodKMOS4G4FGNM8_jDFF76fJsT2w>
 <xmx:2MWCYNUms4hNJdcg8cA8vccTPVTfTdol6NYnWPUPT3m8dbVGP8EoFw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFA3B108006A;
 Fri, 23 Apr 2021 09:04:22 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:04:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "yugang.chen" <yugang.chen@linux.intel.com>
Subject: Re: apply for a new repo "openbmc/node-data-sync"
Message-ID: <YILF1YrtQz9pq2v4@heinlein>
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
 <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
 <CAH2-KxAe7v2ptH5SEJkd5YeQ-nCo_JQvwCoS5nU=ZLFac+tAuw@mail.gmail.com>
 <2e6ff1b9-733b-56ca-5cd6-fab6f0b20530@linux.intel.com>
 <20210419142631.eutfkickwfke7aq3@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v3gnCg3n462CPTQi"
Content-Disposition: inline
In-Reply-To: <20210419142631.eutfkickwfke7aq3@thinkpad.fuzziesquirrel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Ed Tanous <edtanous@google.com>, chunhui.jia@linux.intel.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--v3gnCg3n462CPTQi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

I've read through this and feel like most of my original questions are
still unanswered.  I've pasted them here again for reference:

---
> So, we need a new repo to sync the sensor data between primary node and
+secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.

Do you have a design on how this would be accomplished?  I'm curious
what your proposal ends up looking like at a dbus-level.  We should make
sure this is documented at a high level and also aligns with how we are
handling multi-host scenarios already in our dbus layout.

How are the two BMC devices connected?  How do you ensure you can safely
/ securely accept the data between the two BMCs?  If done poorly this
could open up a large security attack surface.

I suspect your software design is somewhat driven by a particular hardware
design as well, so we need to make sure it is clear the scoping of your
solution and should probably even communicate that in the name.  For
instance, if your data transport is IPMB over i2c and you don't plan on
this being a general daemon that could be expanded to a network
connection, we shouldn't name it so generally.
---


On Mon, Apr 19, 2021 at 10:26:31AM -0400, Brad Bishop wrote:
> Hi Daniel
>=20
> Typically email attachments are not opened.  To ensure your mail gets=20
> read, avoid attachments.  Resending without the attachment...
>=20
> On Mon, Apr 19, 2021 at 12:41:00PM +0800, yugang.chen wrote:
> >attach the design document, please take a look.
> >
> >Best Regards
> >Daniel(Yugang)
> >
>=20
> >## Requirements
> >resources, secondary BMCs need to collect its local management resources=
 and report
> >them to primary BMC.

Why is this a requirement?  What is driving it?

You could alternatively have DC-level software gather data directly from
both BMCs.  Please put that in the alternative and give rationale on why
this extra software is a better solution to the problem.

> >## Proposed Design
> >Each time a BMC reboot, The BMC needs to check 3 GPIO Pins: FM_STANDALON=
E_MONDE_N / FM_4S_8S_N_MODE / FM_NODE_ID to get working mode as standalone =
mode or primary /secondary(4S/8S) role according to the GPIO values.
> >After confirming the mode and BMCs' role, BMCs should set properties acc=
ording
> >to the correct configuration.
> >In 4S/8S mode only node id 0 will be primary BMC because only this node =
will be the PCH.L. Node id 1,2,3 will be the secondary nodes.

Some of this is very specific to your hardware design / architecture
being used (ex. "PCH" is an Intel term).  We may want to put some of
this into a background or architecture-specific section.

I get two high-level design points from reading this in my mind:
    1. You are not handling dynamic primary/secondary BMC selection; it
       is all assigned by physical position.  This is not unreasonable
       but it isn't sufficient for some other designs, so we should
       spell this out.
    2. Assignment of role will be done based on GPIOs for your
       particular implementation, but could be handled in a different
       manner for other systems.

Based on #2, I would suggest the role-selection code is separated from
any dbus/Redfish propagation code.  The role should likely be a dbus
property.

Also, these GPIO names seem like they are schematic names.  You might
want to look at docs:designs/device-tree-gpio-naming.md.  We typically
want to see a logical name from a userspace application point of view.

> >
> >Once a BMC gets mode is in 4S/8S, node roles are configured by node
> >ID (GPIO Pins) and keep consistent once AC on.=20

I think I know what you meant by this, but the wording is very difficult for
BMCs to accomplish.  OCP systems don't even have "AC power" since the
server is supplied DC 12 or 48v from the rack.  The BMC has almost no
way to know if it was reset in certain ways vs had standby power cycled.

I would suggest at a hardware level that the node roles are kept static
during the entire standby power cycle.  Likely this is what you meant, but
the wording here could be clearer.

> >Once node role check is done,
> >
> >In 4S/8S mode, Primary BMC needs to broadcast its role to make sure ther=
e is only
> >one primary BMC in the system.

And what if not?

> >Need a new feature to make sure secondary BMCs send local redfish events=
 to primary
> >BMC. And primary BMC needs to add a tag to those events coming from seco=
ndary BMC so
> >that user can know the event logs happened on which node.

Why Redfish and not dbus?  I think this is the first time that Redfish
is mentioned.

Does the primary really just need "events" or does it really need all of
the data necessary to create a Redfish model of the resources modeled by
the secondary?  I assume the latter, because if it was just events then
something still needs to go to the secondary to get the rest of the
model and to make changes to it.

> >Even in 4S/8S mode, each BMC will collect its local management resources,
> >including sensors, fans and do FSC according to the values of local sens=
ors.
> >PSU and Fans on each node will not be connected together. Configuration
> >settings of each secondary node will remain the same, and won't be synce=
d across
> >the nodes.

FSC?  Fan Speed Control?  Please don't use new and previously unused acrony=
ms,
unless they are a well-known / industry standard protocol.

> >In 4S/8S mode, PECI will only be connected to primary node. Primary BMC =
needs to
> >monitor all CPU and DIMM sensors and deliver the sensor values of the CP=
Us/DIMMs
> >on secondary nodes to secondary BMCs. So that secondary BMCs can use the=
 sensor values to control their own FSCs. Primary BMC also needs to have a =
way to find how many
> >CPUs are in the whole system include Primary and Secondary nodes.

This paragraph implies to me that the primary is also *pushing* sensor
values to the secondary so that the secondary can make local decisions
about fan speeds from information obtained over PECI on the primary?

It really seems like Redfish "events" is not sufficient for what you're
trying to accomplish, but you want some generic "sync dbus state between
BMCs" design.

> >## Alternatives Considered

All of these alternatives need an explaination of why this alternative
was not chosen.

> >Primary node monitors all the IPMI sensors in secondary nodes and create=
s redfish log
> >by itself.

Is "IPMI sensors" really what you wanted to say here?

> >Instead of BMC reboot, only AC cycle will make BMCs check GPIO pins and =
set
> >Legacy BMC or Non-Legacy BMC mode.

I didn't get the impression above that BMC reboot was when GPIO pins
were checked (and part of the reason why I pointed that out above).

> >Only primary BMC broadcast its role and secondary only waiting for the b=
roadcast
> >from primary.

I'm not sure what this means...

> >## Impacts
> >Only on the motherboard where legacy PCH is located, POST code/Front Pan=
el/KCS
> >port/UART will work, while these interfaces on board with non-legacy PCH=
 will
> >not work due to BIOS and HW design. And this will cause non-functioning =
of
> >SOL/KVM/Virtual media on secondary BMCs.

We are interested in *software* impacts here.  What code needs to
change?  How does this new design affect the way we think about existing
software components?

--=20
Patrick Williams

--v3gnCg3n462CPTQi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCxdMACgkQqwNHzC0A
wRljIA/+MuGN1xia7Dx8YH68qoZbtTXeZAGSwq9L/ErtbvjvuYTXVQz4bwqXcjXw
QFglp2qi32LEfmVG3CgYHtvKDXMXcI5RJAGN8Ew9FhiuG6zoUcWXuHXif+IjET+D
twC4g7Mn2wBKY323MqhEQHZQs3WMXE8Hy3MKHc7fx17CAxnBiWzVsKKl1tcGhR2C
OozcdDplE9DDqlyp+D9/g/BBNS3owps68zqF8EhVLMSHsSllNNblN/e3RufIISqx
T3lOR5sR1SscL4M9krGv04FwoAcV7gqeSFoWbglwZyBorNG68Jjk6GTjkFzUIRMV
BwML8NmVr+0K7myFtKpGzSOjlE6Lyq1kf5+fjy0uHaG2gNYB2JkZcofeEZbrwjQR
w7oSNeX+5Ve4ZYmWMdSpBydM7YSDNezMhaofZdkTe3kxGQFrCJuKUL+L6kxUf2A2
2+rqtW3+9kwcnucIInavfQjxHNfvehxiKyMgKveDkfCxkvqk040bdoPWFk/BRX9k
oCimwbJviO1358xgrNf7ttNsdiV7o4T2rT7SEdokDqLBeXXP9gg+ApQGGy0Qu8r/
ISjzE3OHJvue5OtdixXA32ms0IQT9yZJuiVeReiFxdjpMCJsAO+DgVv/JF0ioGj3
t4bbIkBale9r/72T19imKlXVBTLY/d/2gxEr31wv1fLG7wAKi2w=
=jRg7
-----END PGP SIGNATURE-----

--v3gnCg3n462CPTQi--
