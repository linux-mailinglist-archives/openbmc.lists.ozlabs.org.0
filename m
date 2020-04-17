Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D431AD50A
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 06:05:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Mtd3nkFzF0cT
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 14:04:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=xCH+5n0p; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=A61iaDgN; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493Msn2sVszDrRh
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 14:04:13 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 630D960D;
 Fri, 17 Apr 2020 00:04:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 17 Apr 2020 00:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=s2sqB
 MRchVJZKgFMBu79Nf2YLk7/LFKabTduJy/N6jI=; b=xCH+5n0pPcSLVli1C049Z
 rrEarnHeOAPzhyr7oYTUCE9wHT+0i6oO+hoU3gxLJFBStoRwk06EhYv1PnvX4jNX
 wAIqCN1ZvMEv6QfTRyMumh1TbjRsHBQtpBULGp8TLCewHcDhsgg4XI4bjPSwBNdp
 WQi+TLp3uZ6667pKO3ueOg3H6Tc7JPQIu2uO+ef1IGaRJ3bZTUV0nOyZaQiJQyxc
 paIVAKzLMQUdAZTgyZsSv7pzCqszsSNZLjH0d4ueqn0ZDa+i90Gca5LYFYlhgN4M
 WhwAUabdAFoXtzeqiYvcmVTu/8VHLFkiZCkiKBzz0Pd/vnFjv98w9F3z6v98aVfA
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=s2sqBMRchVJZKgFMBu79Nf2YLk7/LFKabTduJy/N6
 jI=; b=A61iaDgNG032UiqGgr+xSR/YYIN3kvG8XPUA52LfqSAxPqhWiaciaFuHE
 zzD/1qx6ljdTZugT+2PlsMJccbg966fJHC1HMWBa33gxR9/gcTSQ3uzN2AWokT55
 l5nmvC4OOb3Fw9T6tjT0ZwWjmKaUx0dauvPUmGM5dBrEUlNrkIWLT7URyR2HfXPN
 oY4cgpiJCCsZh3YGAoYjnHJbmFWd4rMdLX8Pdp1kl7ZYiFd/SVOf4dc20KwU5qWI
 qa2nspKzAswlgAjIaNF9inez5hDpbXcSpkLW8r3eaFhnxoIPDo7eTyZ+wVEhWyuK
 Wr5gsDRs4M8cR9Gk0ZrETtuiBYtZQ==
X-ME-Sender: <xms:uSqZXgE79ZCg7nNkyOLnL9WS_pB1K7ryEjXJoQjb8nQz7_HxzxL5OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeigdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddujedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhgsmhgt
 qdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:uSqZXiGdutFHMgXLWo7fbomqKpHlyzdfN2cDBNzOetzyl3MLJ4YzEw>
 <xmx:uSqZXsXCgV9gaUl71bXquWwMp9Jor9VlyZroJck1gZ2YmfI4Kx3zDQ>
 <xmx:uSqZXo6im2IcM2BSs8cG3iY6c5k49YJfSMvUm23HEMkRIi3RebrVAA>
 <xmx:uiqZXob2Qr06bf-_DMaIfIWhSvE9xD5M29fyYxSyDCjDdgPdQalJ7w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2B171E00BD; Fri, 17 Apr 2020 00:04:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
In-Reply-To: <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
References: <1504A9E7C77EF44697F386AD61B1626015342605@BGSMSX105.gar.corp.intel.com>
 <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
Date: Fri, 17 Apr 2020 13:34:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Jeremy Kerr" <jk@ozlabs.org>,
 openbmc@lists.ozlabs.org
Subject: Re: MCTP Sockets related questions
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@intel.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+openbmc@lists.ozlabs.org

On Fri, 17 Apr 2020, at 13:18, Andrew Jeffery wrote:
> Hi Sumanth
>=20
> On Fri, 17 Apr 2020, at 01:48, Bhat, Sumanth wrote:
> > =20
> > Hi Jeremy, Andrew,
> >=20
> >  I have tried to capture our questions and concerns related to MCTP=20=

> > Sockets in the PMCI WorkGroup page under the topic =E2=80=93 MCTP So=
cket=20
> > Interfaces; link here -=20
> > https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG. Hope you ca=
n=20
> > have a look at it.
>=20
> Thanks for getting these written down, they are all great questions. I=
t's
> hard to have a conversation via a wiki, so I'm pasting the questions b=
elow:
>=20
> > Here are few questions for socket based implementation =E2=80=93=20
> >=20
> > Bus Owner / Bridging / Endpoint roles:
> > The current demux-daemon supports only static EIDs. How do we extend=
 =E2=80=98Bus Owner=E2=80=9D,
> > =E2=80=98Endpoint=E2=80=99 and =E2=80=98Bridging Device=E2=80=99 con=
cepts to demux-daemon?
>=20
> I think it probably needs to be made clear that the role of the
> mctp-demux-daemon is nothing more than to transform the interface for =
MCTP
> messages from direct calls to libmctp to use of sockets, as this will =
make
> migration to the planned kernel interface easier. Applications wanting=
 to talk
> over MCTP should connect to the mctp-demux-daemon socket and send mess=
ages this
> way. This includes the application that will handle MCTP control messa=
ges
> defined in the base specification.
>=20
> Now, there is the issue that MCTP control commands affect the binding
> associated with an endpoint, and as above the mctp-demux-daemon doesn'=
t handle
> any commands itself. What's missing from mctp-demux-daemon is an out-o=
f-band
> interface to manipulate the binding in response to control messages. E=
lements
> of this out-of-band interface are being proposed in the
> phosphor-dbus-interfaces patch that is currently under review[1].
>=20
> Regarding the planned kernel interface for MCTP, it will come in two p=
arts:
>=20
> 1. A common socket-based interface for exchanging messages between end=
points
> 2. A netlink interface to control configuration of MCTP networks and e=
ndpoints
>    connected to the system.
>=20
> Control messages in the kernel implementation will also be handled in =
userspace
> (possibly except for binding-defined messages). The daemon handling co=
ntrol
> messages responds by poking the netlink interface to reconfigure the k=
ernel as
> appropriate. Note that we have an alignment between the kernel interfa=
ce
> proposed here and the need for the out-of-band interfaces on the
> mctp-demux-daemon outlined above (netlink is also out-of-band). As par=
t of the
> eventual transition away from the mctp-demux-daemon to the kernel-base=
d socket
> implementation it's a possibility that we could wrap the netlink inter=
face with
> the D-Bus interface, which should mean minimal changes for application=
s already
> using the D-Bus interface (though realistically this should just impac=
t the
> daemon handling control messages).
>=20
> Returning to your question about the three operational modes in light =
of the
> above, a few points:
>=20
> 1. Endpoint-mode needs to respond to e.g. `Set EID` messages. A `Set E=
ID`
> message would be received by the MCTP control daemon connected to the
> mctp-demux-daemon, and the MCTP control daemon would e.g. call a SetEI=
D()
> method on the mctp-demux-daemon object's D-Bus interface to reconfigur=
e the
> endpoint.
>=20
> 2. I think Bus-owner mode is mainly a consideration of how the MCTP co=
ntrol
> daemon operates (i.e. sending messages rather than simply responding t=
o them as
> in Endpoint-mode).
>=20
> 3. Bridging is handled in two parts: The binding together of endpoints=
 may
> occur in the mctp-demux-daemon if the design is such that the bridge h=
as a
> singled EID rather than an EID per binding instance. Alternatively, if=
 an EID
> is provided per-endpoint, multiple mctp-demux-daemons could be run wit=
h a
> separate daemon subscribing to each mctp-demux-daemon socket participa=
ting in
> the bridge.
>=20
> Point 3. requires some rework of the mctp-demux-daemon to provide a
> deterministic abstract-socket naming scheme to enable multiple concurr=
ent
> mctp-demux-daemon instances to exist, and the work is similar to what =
I've
> recently done for the obmc-console package. The naming-scheme may be d=
efined by
> the system configuration (as is the case with obmc-console).
>=20
> [1]=20
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/=
+/30139
>=20
> > Also, when the sockets
> > move to Kernel, what would be the way for a user to configure a cert=
ain physical
> > binding in =E2=80=9CBus Owner=E2=80=9D mode and another binding in =E2=
=80=9CEndpoint=E2=80=9D mode ?
>=20
> As mentioned above, this isn't a property of the endpoint so much as h=
ow the
> endpoint is used by applications (such as the MCTP control daemon). Th=
e kernel
> will be agnostic to how an endpoint is used beyond configuring binding=
s and
> endpoints as directed by userspace via the netlink interface.
>=20
> > We will have cases
> > where BMC will be Bus Owner on a certain bus and Endpoint on another=
 bus simultaneously.
>=20
> That's fine, it's a use-case I anticipated (and again it partly comes =
back to
> how endpoints are used by applications rather than a property of the e=
ndpoint
> itself).
>=20
> >=20
> > Multiple MCTP Daemon instantiations:
> >=20
> > The rate of transmission and reception of MCTP messages will be limi=
ted by the
> > underlying physical binding. Having one instance of MCTP transport
> > interface per physical port would speed up the TX and RX. How can
> > this be achieved in demux daemon?
>=20
> This is enabled by deterministic naming of abstract sockets that I tal=
ked about
> above.
>=20
> > And how would this be addressed
> > in Kernel based sockets ?
>=20
> Messages are sent in process context, so concurrency is as wide as the=
 number
> of threads available assuming you're sending across different interfac=
es.
>=20
> > How can a user specify the physical bindings
> > he/she is going to need and instances for the same ?
>=20
> Via the netlink interface.
>=20
> >=20
> > Support for upper layer protocols:
> > In Intel=E2=80=99s usecases, most of the upper layer protocols like =
PLDM/Intel Vendor
> > Defined Messaging Type/SPDM etc. are going to be =E2=80=9CRequesters=
=E2=80=9D i.e. they are going
> > to send out request packets to a connected device on the platform (e=
x: Add-In Cards)
> > using MCTP. These protocols will not have prior knowledge about
> > the EIDs and thus need a way to query the existing EIDs and the
> > message types supported by the EIDs from the MCTP layer in order
> > to start their communication. The D-Bus proposal handles this by
> > creating D-Bus objects for the EIDs. How would we achieve the
> > same in demux daemon ?
>=20
> This is resolved by e.g. the mctp-demux-daemon implementing the D-Bus
> interfaces your proposing (aside from the Rx/Tx methods) as the out-of=
-band
> information/event mechanism.
>=20
> > How would Kernel based sockets handle this ?
>=20
> The netlink interface allows userspace to query the topology of the ne=
twork,
> which will be set up by the MCTP control daemon.
>=20
> As to what message types are supported by endpoints, I didn't have any=
 plan to
> cache this information on the BMC. I figured the application wanting t=
o talk to
> the endpoint would query the endpoint for this information directly. T=
hese
> queries operate at multiple levels, e.g:
>=20
> * What MCTP control commands are supported?
> * What PLDM constructs are supported?
> * What SPDM concepts are supported?
>=20
> None of this information belongs in the kernel. Whether userspace shou=
ld expose
> it in some generic fashion is up for debate but as mentioned I feel th=
e answer
> is probably not, just leave it to specific applications.
>=20
> >=20
> > Discovery of MCTP capable devices:
> >=20
> > We would need to modify the demux-daemon to cater for the discovery =
mechanisms.
> > When BMC acts as a Bus Owner, it would have to go ahead and discover=
 other
> > end points on the bus and this discovery mechanism varies according =
to the bus,
> > and the role: For example: How a PCIe device discovers other endpoin=
ts is totally
> > different from how a SMBus device would do.
>=20
> But this is binding-implementation specific. The logic should live in =
the
> binding, no? Device hotplug notifications are binding-specific but the=
re is a
> the Discovery Notify message that bindings can propagate up the stack =
to notify
> e.g. the MCTP control daemon that a device has appeared, and this is g=
eneric.
>=20
> > Similarly, how BMC as PCIe bus owner
> > would discover other endpoints (Endpoint Discovery control commands)=
 is different
> > from how BMC as PCIe endpoint would discover other endpoints(Get Rou=
ting Table update).
> > And discovered endpoints need to have a representation (ex: D-Bus ob=
jects) so that upper
> > layer protocols can discover them. How would this be handled in demu=
x daemon/Kernel approach ?
>=20
> Userspace interacting with the endpoint at an MCTP-control level will =
know
> which mode it's operating in, and so will know what method it needs to=
 use to
> construct the routing table (as a means to know the other endpoints in=
 the
> network).
>=20
> It sounds like what you're after is an abstraction that presents the n=
etwork to
> applications that do not care which mode in which the endpoints are op=
erating?
> If so, this is something I brought up on the phosphor-dbus-interfaces =
patch: We
> should come up with an abstract representation of the network for appl=
ications
> to consume.
>=20
> >=20
> > Control commands:
> >=20
> > Most control commands couple tightly with the binding and mctp layer=
 itself; for example,
> > when Set EID is used by the BMC to allocate EID to another device, i=
t needs to use
> > Special EID 0 + physical address of the device.
>=20
> Okay, so I had a bit of a bag of tricks planned here that mean we don'=
t need to
> embed physical addresses into e.g. `Set EID` packets. There's no allow=
ance for
> this in the spec anyway.
>=20
> The main insight for e.g. `Set EID` is that commands like this are onl=
y sent by
> bus-owners who must be controlling their own route table. The MCTP rou=
te table
> is effectively the combination of the ARP table and route table concep=
ts from
> IP networks, and so the intent with the kernel-based MCTP implementati=
on is to
> expose the route table to userspace just like the ARP table, including=
 the
> ability to inject entries into the table (like the ARP table).
>=20
> From there we maintain state for each entry that describes whether or =
not the
> EID has been assigned by userspace, akin to the `discovered` flag that=
 we
> maintain for the endpoint itself: This is set when the endpoint ID has=
 been
> successfully assigned (i.e. we see a `SUCCESS` completion code to for =
a `Set
> EID` message).
>=20
> Further, EIDs must be unique in the network, so the route table must n=
ot
> contain the same EID assigned to multiple devices. This means that the=
 EID is
> unambiguous in identifying the device.
>=20
> The trick is that EIDs unambiguously identifying devices is true regar=
dless of
> the state of the `discovered` flag associated with the entry in the ro=
ute
> table. So the plan is that in order to send a `Set EID` to a discovere=
d
> endpoint, we take the following steps:
>=20
> For static networks:
>=20
> 1. The MCTP control daemon injects an entry into the route table, sett=
ing the
> *proposed* EID, the bus and the physical address. The `discovered` bit=

> associated with this entry remains clear.
>=20
> 2. The MCTP control daemon constructs a `Set EID` message with an MCTP=
 header
> containing the destination EID set to the *proposed* EID (setting the
> destination EID to the *proposed* EID is purely for routing purposes, =
the
> message does not go onto the wire in this state).
>=20
> 3. The MCTP control daemon sends the `Set EID` message via the socket =
interface.
>=20
> 4. The kernel receives the message and parses the MCTP header to resol=
ve the
> route.
>=20
> 5. The kernel discovers from the routing table that the `discovered` f=
lag is
> _not_ set for the destination EID and introspects the packet for the `=
Set EID`
> MCTP command.
>=20
> 6. The kernel _modifies_ the packet, replacing destination EID with Sp=
ecial EID
> 0 for the `Set EID` packet.
>=20
> 7. The kernel passes the modified message onto the binding implementat=
ion
> (resolved via the route table) for transmission to the target endpoint=
.
>=20
> 8. The target endpoint responds to the `Set EID` message.
>=20
> 9. The kernel passes the response back to the userspace process associ=
ated with
> the sending socket.
>=20
> 10. The MCTP control daemon receives the response to the `Set EID` com=
mand. If
> the command is successful the MCTP control daemon sets the `discovered=
` flag in
> the route table and no further EID replacement is performed for packet=
s routed
> to that device. If the command failed then the discovered flag remains=
 clear.
> Further, the response may indicate the device has already received a
> _different_ endpoint ID from a previous `Set EID` command, in which ca=
se the
> route table is updated with the returned EID and the discovered flag i=
s set.
>=20
> For dynamic networks the process is largely the same, though the route=
 table is
> updated to contain the device bus address when we receive the binding-=
specific
> `Discovery Notify` signal. This signal is translated to a Discovery No=
tify
> message to trigger userspace probing of the bus for new devices and to=
 perform
> address assignment. Userspace can inspect the route table for devices =
with the
> `discovered` flag cleared to determine what devices need address assig=
nment.
>=20
> > Get EID command needs to return
> > binding specific information as a part of its response.
>=20
> Rather, `Get EID` returns the EID for the device at a particular physi=
cal
> address. This is subject to the same sequence outlined above.
>=20
> > Get UUID command needs to
> > return same UUID across all physical bindings.
>=20
> This is tied to how bridging will be implemented. Again, bridging is h=
andled by
> commands through the netlink interface in the case of the proposed ker=
nel
> implementation, and we just need to associate the one UUID with each o=
f the
> endpoints participating in the bridge.
>=20
> > And so on. Thus how would control
> > commands be handled in demux daemon? How would it look like when Ker=
nel based
> > sockets are introduced ?
>=20
> We may need to translate some of these concepts to designs that we cou=
ld
> implement on the mctp-demux-daemon, but otherwise I think your two que=
stions
> here are largely answered by the descriptions above.
>=20
> Hope that helps!
>=20
> Andrew
