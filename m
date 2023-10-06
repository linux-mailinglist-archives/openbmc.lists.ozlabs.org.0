Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25F7BB79C
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 14:30:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=aGxxedqR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EXJ09Ux1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S276s5tg8z3cQj
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 23:30:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=aGxxedqR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EXJ09Ux1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S276762qyz3c4R
	for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2023 23:29:34 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9F4A65C01F0;
	Fri,  6 Oct 2023 08:29:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 06 Oct 2023 08:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696595369; x=1696681769; bh=LE
	Hvolsp6pvCK10A+qVRYdNUJiDZ6sMLMQGLvgoJg/o=; b=aGxxedqR7hfWtLZkny
	Q9uqliD++5IyTpIdZMOfg0s4jtfNzSnk/Ldt5ZMPwIod/lE5hWvhmTRwynBhDPqX
	434t5d+DrUrcwISOP6uDbTF0a/ZRgLAbrnid9DF/ZwtvuBW0SVIy6bzmdDMUkrGs
	h35pkD4MFJIq05AdAZt+qisOPINjFF5eoZLw+EPcLU+wf7wOZ8XLwFYAe+bQmEgz
	VDGLxsaaEqi6brMn+kSO2mJ7bQgW5wACurQFIclSFN94eSX4lr3wZIv6elwJfCog
	gUX67BN1N3WDINftOXFirRGI/ALXHSGHsTZ0iiReTWigw4XQHOGQsVaojGPRBG1K
	FHPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696595369; x=1696681769; bh=LEHvolsp6pvCK
	10A+qVRYdNUJiDZ6sMLMQGLvgoJg/o=; b=EXJ09Ux1kiPN7RdkVyKqmRe5Um4AN
	G3oyBSQQkXfpYHlKY5+R/BZ88eKQ0C1DQ5D/sn5yn4tY1LURp6S/LF2P60kFI8Zf
	qU9szD5yM8UuYr7W8/453jACHt0Iui703OFm2h+SdbKQF0k90cj08j3X1Lsgdgco
	b8NMk2sKd/X/Z/GNUUU10PwoQgK+1/z6SfYQHpeAMhdLQyS5og7vlIbBAIgUCb8i
	iyURitNB8I9lq7MaNzhq4FTHH5ZdRMSQQu8Letumm3xiuEa5Ky3NvfSz2ZlRzrr3
	lMDbcAK99y3YvZ1tupQbskXRewfGtRa7tHl22CTihfk90/VJECHxr5Hgw==
X-ME-Sender: <xms:qf0fZfy2fNMsjYtBwghxeH--tPansID93TEBFF0RMcE9roK4hk9_Kw>
    <xme:qf0fZXRtxpgDCBnL2D6xSIsllZ1aKgq4npfyU4X40wF7xqSIsuUM7a0-ZpzWFE9db
    iVJZBCPwbJPAAQbwQw>
X-ME-Received: <xmr:qf0fZZUqI8neI20c94-ELqThmuhgP5PJCzkkIgf7EFwWot7h0eZqVeo7Zokr_d9O4aHZIRRLwlbOzl7meJkvmM3Ewt5Sw4pHe9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeeugeduhedtffeugfeggefgfeej
    gfejtdfgudejheegtdevudffleelgedtffejnecuffhomhgrihhnpehophgvnhgsmhgtrd
    horhhgpdgrtghmrdhorhhgpdhophgvnhgtohhmphhuthgvrdhorhhgpdiiughnvghtrdgt
    ohhmpdhisghmrdgtohhmpdhthhgvghhurghrughirghnrdgtohhmpdhithhrvghnvgifrd
    gtohhmpdhgnhhurdhorhhgpdifihhkihhpvgguihgrrdhorhhgpdgvfhhfrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:qf0fZZhreviFN4DM3AczikDtfW8ODk3gtzcMC8DjOkMH6_nNY9h2qw>
    <xmx:qf0fZRAkLgXP8K6TD6RwiYrJ2ZMydl4vfK2X8k9_nQ_a6kfHroDu6A>
    <xmx:qf0fZSJXskgJYBC3kJESofS4FN38x-7H7QcvK82WD9S6ihY7cneAdA>
    <xmx:qf0fZU6JscnUIV0ChI1XK-qvzawJcZwWDv8wdV6GO8dtcZRsm882NQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 08:29:28 -0400 (EDT)
Date: Fri, 6 Oct 2023 07:29:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MetOQAl7oXQUxjeK"
Content-Disposition: inline
In-Reply-To: <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Brad Bishop <bradleyb@fuzziesquirrel.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MetOQAl7oXQUxjeK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 10:21:01AM +0530, Sunitha Harish wrote:
> Hi Patrick,
>=20
> Re-starting this discussion with the design that is being worked at=20
> License Manager: Add license manager design (Ibd6c6f35) =B7 Gerrit Code=
=20
> Review (openbmc.org) <https://gerrit.openbmc.org/c/openbmc/docs/+/64710>.

I've already written enough on this topic.  You've not added much in
terms of what I've already written, so I'm not sure what more you want
me to say.

> I agree with your concern about using this feature for letting the BMC=20
> software or resources licensed. We should reduce the scope of this=20
> design to exclude this from controlling the driver updates on the BMC.

Once you have the license manager on the BMC, there isn't anything that
would stop you from adding patches on your own to block BMC updates
without license approvals (which I really can't do anything to stop you
=66rom doing it on your own anyhow, and I'm not suggesting I can).  This
still doesn't do anything to protect me from legal risks I would have=20
to take on with this feature.

> But as we have the DMTF approved redfish schema for the LicenseService,=
=20
> we would like to bring this into the OpenBMC. We can use this License=20
> Manager as a pass through application at BMC. With this application and=
=20
> interfaces, user can upload the license for the hardware parts and for=20
> the installation of any OS on top of the firmware. There will be no=20
> validation of the License at the BMC scope. All=20
> validation/interpretation of the License will be at the hypervisor or=20
> the operating system level.

So you're going to add some custom PLDM commands to offload this to your
host firmware.  How is this helpful to the rest of the community?
Again, why do I want to take on the maintenance risk and legal risk
associated with this feature?  Why would anyone else in the community?

> We are looking for views from you and the community.

You've got to show that this feature is somehow enough of a benefit to
the community that justifies the risks.  Or you have to have some
proposal that mitigates the risks.  "Redfish defined a schema" is
not a benefit on its own.

Have you talked with your legal team about my DMCA concerns?  If you
can't provide some kind of assurance that developers on this project are
not going to be subject to a DMCA takedown notice because of YOUR code
and YOUR feature, I don't know how you can expect anyone on the project
to want to touch this.

> Thanks & Regards,
> Sunitha
>=20
> On 05-05-2021 23:06, Patrick Williams wrote:
> > Brad,
> >
> > I've reshuffled some of the quotes around because it makes more sense
> > with the points I'd like to make.  I've tried to add color to what I
> > think the OCP perspective would be.
> >
> > Typical disclosure: these are my thoughts, not my employer.  I am not
> > a lawyer.  Blah blah blah.
> >
> > On Tue, May 04, 2021 at 07:38:43PM -0400, Brad Bishop wrote:
> >> On Tue, May 04, 2021 at 10:02:19AM -0700, Ed Tanous wrote:
> >>> How does this affect our standing in things like OCP open system
> >>> firmware groups?
> >> I wouldn't expect this to affect our standing in OCP in any way.
> >>
> >>> Does this OpenBMC systems that enable this feature
> >>> ineligible?
> >> Do you mean to ask, do systems that configure OpenBMC with something
> >> like this enabled make them ineligible for some kind of OCP compliance?
> >> Probably, but isn't that a problem for those configuring OpenBMC in th=
at
> >> way?  I would say if you are looking for OCP compliance, don't use this
> >> feature.
> > I'm glad things were broken out this way because both of these questions
> > need to be resolved.
> >
> > I agree that the presence of this feature, or any feature which isn't a
> > violation of widely accepted ethical guidelines[1], should not on its
> > own affect our standing in or usage by other communities.  But, it can
> > certainly affect their opinion of us, which can diminish our standing.
> >
> > The other question is: would OCP accept the usage of this feature in an
> > OCP Accepted / Inspired[2] system?  I strongly suspect the answer here
> > is no.  It isn't just this feature, but this feature coupled with the
> > code signing, which is what would cause the denial of certification.
> >
> > OCP machines are expected to be owned by the entity that purchased it
> > and not the manufacturer.  To quote from an OCP website[3]:
> >
> >      Open system firmware is an open development project, the goal of w=
hich
> >      is to allow OCP owners to "own their firmware" -- to move the poin=
t of
> >      control of firmware to the system owner. Owners must be able to ch=
ange
> >      firmware and share it -- including any binary components -- with o=
ther
> >      owners. Starting in March, 2021, OCP badging for servers will requ=
ire
> >      that systems support OSF.
> >
> > Compliance with this statement would render any firmware-based license
> > enforcement moot.  (Note that this above OCP statement is in reference
> > to OSF, the UEFI implementation, but I think the intention is reflected
> > elsewhere in BMC expectations.)
> >
> > This is very important to both OCP and Facebook for the obvious reasons
> > that it allows us to enhance the server firmware to suit our own
> > purposes but also the non-obvious reason that it reduces the
> > environmental impact of our business[7].  If ownership of the firmware
> > is a one-way door (either us or the OEM/ODM), it means there are more
> > components which have to be scrapped when the servers are decommisioned.
> > If we can transfer ownership, in a secure manner, those parts are then
> > able to be reused and/or repurposed.  ITRenew is one company I am aware
> > of facilitates this kind of reuse[8]; they are a platinum member of OCP
> > and Sri hangs out on the OpenBMC Discord.
> >
> >>> Assuming you did this, wouldn't anyone be able to simply
> >>> recompile the code with the license checks disabled, load it on the
> >>> system
> >> In our system design, the BMC is not doing the actual license
> >> verification.  It is only a proxy, providing an interface to a user
> >> interface application.
> >>
> >> Further, we don't allow BMC code to be loaded that isn't signed by IBM,
> >> so unless I'm really missing something I don't think this can happen
> >> even, if the validation was being done on the BMC.
> > This feature was originally presented to us as being used to activate
> > "unlicensed" hardware or enforce license agreements with your OS.
> > While I think that is a lousy business model, that is between you and
> > your customers.
> >
> > But, IBM (and other OEMs[4]) also uses this feature to prevent people
> > from applying IBM-signed firmware updates to their own machines,
> > unless they have a current maintenance contract.  So when we have a
> > CVE in some software package used by OpenBMC not only can a machine
> > owner not compile their own fix for their own machine but they can't
> > even apply the fix already compiled by IBM unless they cough up
> > additional money.  This behavior is why I used the phrase "openly
> > hostile to your customers."
> >
> > IBM calls this entitlement to install firmware updates an "Update
> > Access Key"[5].  The referenced website describes how the machine
> > will only accept firmware updates if the UAK is not expired, how the
> > original UAK aligns with the system warranty, and how you can get
> > additional ones after this point (expiring every 180 days) if you
> > have an "IBM hardware maintenance service agreement".
> >
> > This behavior, and not the hardware licensing, is a big motivating
> > factor in why I said "I have no interest in providing any assistance on
> > this feature" and do not feel the project should support it either.
> > You might say "well, we'll just keep this part of the code private
> > then", and it would likely be pretty trivial to privately hold a few
> > patches to phosphor-bmc-code-mgmt to do the UAK work once you have
> > the rest of the framework in place.  The triviality of it is partially
> > why I don't even want the framework in place.  This feature provides no
> > benefit to anyone except <<insert OEM>>'s [bad] business model and prov=
ides
> > no benefit to users or this community (and I'll posit later it actually
> > harms this community).
> >
> >>> if we're now supporting firmware locking down systems?
> >> Don't we already lock down systems with things like secure or verified
> >> boot?  Can you help me understand lock down better?
> > Yes, we support secure / verified boot, even on OCP servers.  But the
> > OCP model is that the machine owner owns the machine, not the ODM/OEM.
> > The other model, which is what you're doing, is only advantageous to
> > you (and is deterimental to everyone else).  This isn't a matter of lack
> > of technical capability because IBM's own security research team provid=
ed
> > a whitepaper to OCP on best practices for providing transfering ownersh=
ip
> > of the device firmware to the machine owner[6].
> >
> >> I'm pretty certain this is something many server OEMs do and will
> >> continue to do.  So let me ask you what is better?  A single place for
> >> those with the common use case to collaborate, or a bunch of one-offs,
> >> likely full of bugs and security problems.
> > If I had to make a choice between supporting code that is a net-negative
> > to the community or letting you make a buggy implementation of a bad
> > feature... letting you make a buggy implementation is a double-win to
> > me because if you fail in implementing this it means [various people wi=
th
> > an ability to reverse-engineer] it can **help** users by giving them a
> > way around your terrible firmware update lockout.
> >
> >>> 2. This is harmful to the intent of OpenBMC and open source firmware
> >>> as a whole, and shouldn't be supported in any capacity in the OpenBMC
> >>> codebase.
> >> If you don't mind I would like to hear more about the intent of OpenBM=
C,
> >> and how any of this harms those intents.
> >>> How would open firmware principals be retained
> >> Can you elaborate on these principles?  I'm curious.  I may even
> >> document the answers :-)
> > I've badgered enough on the firmware update side of this, which is
> > the primary hinderance to "open firmware principles" I see.
> >
> > On Discord I said that I didn't think this feature is in the "spirit of
> > open source software" and I think Ed's statement here is along those
> > lines, but I realize there is a lot of potential perspective encapsulat=
ed
> > in that one phrase so let me try to unpack it.
> >
> > Corporate attachment to the Open Source / Free Software movement has
> > often been around the collaboration (and thus deduplication of effort)
> > side of it, but that is an outcome and not a principle of open source.
> > To me the draw has always been about freedom to read, debug and modify
> > the source.  It is immensely frustrating to me when I have to use non-f=
ree
> > software and I find a bug: you have no visibility into what is going
> > wrong and you have no possibility of fixing it!  As the GNU/FSF often
> > states it: "'free software' is a matter of liberty, not price... you
> > should think of 'free' as in 'free speech' and not as in 'free beer'.[9=
]"
> >
> > Again I bring up firmware update, but the emergence of GPLv3 (and
> > similar licenses) was instigated in response to the the Tivoization
> > of consumer devices[10].
> >
> > [ Side question: are you sure your statement that "only IBM signed
> >    firmware can run on our machines" doesn't violate the terms of the
> >    GPLv3, which is used by a good number of packages used in OpenBMC? ]
> >
> > We often have people show up to the project with some 5 year old server
> > they bought off eBay asking "how do I get OpenBMC to run on this?"
> > Which is a worse answer?:
> >      1. Well, we don't currently support it specifically but we support
> >         <XYZ> which is based on the same reference design.  With a litt=
le
> >         bit of reverse engineering, or the schematics from the
> >         manufacturer, you could probably create a port.
> >
> >      2. Yeah, we completely support that machine, but unfortunately the
> >         manufacturer locked down the system in a way so that you can
> >         compile all the code but the machine won't recognize it.  And if
> >         I told you how to bypass that, the manufacturer could sue me for
> >         violating the DMCA[11] because the same bug that allows you to
> >         bypass their signing is still present on their current systems.
> >
> > IBM does great work on this project and having upstream machine support
> > is good.  But, there is a big part of me that would much rather answer
> > #1 than #2 because of the implications from a Software Freedom
> > perspective.
> >
> >>> and something
> >>> that, if done wrong, could be very harmful to the goals of the
> >>> project.
> >> Can you elaborate on the goals of the project that would be harmed?
> > I hinted at the DMCA above.  The inclusion of this feature by the proje=
ct
> > pushes DMCA risk onto me, a developer on this project, from IBM.
> >
> > A long time ago now, I did an internship at IBM and at the time someone
> > had figured out how to circumvent exactly this feature on Power3/Power4
> > AS/400 servers and was contacting IBM customers to sell them black-mark=
et
> > activation keys (my cubical happened to share a wall with one of the
> > inventors of the hardware used at the time to confirm the activation
> > keys so I got to hear plenty of details on this).  The DMCA was new at
> > the time and first applied for protecting from DVD copyright, but I have
> > no doubt that if this situation happened today IBM would leverage the
> > DMCA to stop this rather quickly (and honestly, rightly so).
> >
> > The problem is that the DMCA has also been leveraged for cases which are
> > not a direct theft-of-service[12].  I am not saying that IBM will, and I
> > can't expect you to get a committment on that, but you are pushing the
> > risk onto me, the other developers here, and the project as a whole.
> >
> > What am I even talking about, you're probably wondering?  Since IBM is
> > using this feature to protect your intellectual property (AIX licenses,
> > firmware update lockout, etc.) everything about it falls under the
> > purview of the DMCA.  If I find a bug in your open source implementation
> > and report it in a public forum, you could issue a DMCA take-down
> > request.  If I review a code change and conceive of a way it might be
> > used to circumvent your implementation, and I bring it to your
> > attention, you could issue a DMCA take-down request.  If someone comes
> > to us with a 5 year old server and we figure out how to bypass your
> > security lockout so they can flash on the Github version of OpenBMC, you
> > could issue a DMCA take-down request.  If I do a presentation on
> > debugging with dbus and it turns out someone figures out how to use that
> > information to circumvent your licensing feature on the SSH interface,
> > you could issue a DMCA take-down request.
> >
> > These might sound absurd or you might think "IBM would never do that."
> > How do I and the other developers here know?  You're asking us to take
> > on that risk.  And why should I?  I want to stay as far away from
> > anything related to your licensing feature as I possibly can.  It does
> > nothing good for your customers, it does nothing good for this project,
> > and it puts me, a developer, at potential legal risk.
> >
> > While you might have a little bit of code that you're sharing, that
> > maybe other companies can leverage, you are also giving us baggage
> > that reduces our collaboration.  Now, anytime I'm even close to this
> > code, I have to think about not only the technical but now legal
> > ramifications of what I'm doing.  That means, I'm quite likely going to
> > have to just say "do whatever you want and leave me out of it" anytime
> > this code comes up in reviews or discussions.
> >
> > -- References --
> >
> > 1.https://www.acm.org/code-of-ethics
> > 2.https://www.opencompute.org/products#ocp-accepted-inspired-modal
> > 3.https://www.opencompute.org/projects/open-system-firmware
> > 4.https://www.zdnet.com/article/hp-to-begin-charging-for-firmware-updat=
es-and-service-packs-for-servers/
> > 5.https://www.ibm.com/support/pages/management-power8-and-later-update-=
access-keys#q45
> > 6.https://www.opencompute.org/documents/ibm-white-paper-ownership-and-c=
ontrol-of-firmware-in-open-compute-project-devices
> > 7.https://www.theguardian.com/technology/2021/apr/16/facebook-says-it-h=
as-reached-net-zero-emissions
> > 8.https://www.itrenew.com/resources/the-tco-of-ocp/
> > 9.https://www.gnu.org/philosophy/free-sw.en.html
> > 10.https://en.wikipedia.org/wiki/Tivoization
> > 11.https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act
> > 12.https://www.eff.org/wp/unintended-consequences-16-years-under-dmca
> >

--=20
Patrick Williams

--MetOQAl7oXQUxjeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUf/aUACgkQqwNHzC0A
wRmqbQ//RcfL40GjdKcIuODn8fwt9OF5jdhGjsIPLNT70L1m2QfiLTE4NoRfidBS
eB8WG+lt3liEytnB4Dcj+vUqoYrcg0tEeNJzeXdNgRc3PHMzw6OVJ1vtJmIxiQAS
hHF7P+mkie5jXTO4DDGQBnwvaVzXQJapOZvLFxoErFpBcZvaN0wJAtESXC5xS423
8LBDSd9D6NhOa1x4PeNFXymvnAmmAem5+W0zidFDhrLV+K4oLAfbFKX32I+PtKEM
dZfxxau0t3+3JCQ/fTigJ0lIO3KnwM4kank2Y7JJHlBF6mjP7Mir3YtO6XicMFA/
Vwsnj9XSWsTEhWtI9o6Sjq+Z9aw3yFKaLL0ZPSqM4RdBcz9wnl5KKg1uAA/q0FVb
OErD961xJZLmJklVwJtyOtZ7IWkH8DNmD8JQ1xJ/c+Rd1oVQB4iAHuu7eTXynxKO
4JmSd3/TiYU8EN7eKC6OjuHBQj1v4qOgMWEV3NPOgZNaZ32YN4rWdvxi23YD7Ydm
kTmi4CM2XJaVCUJd7SskzcargfbK4WH743826X+VmrTHI4PJhuF6m4WQ2BQMJNDu
cRZ5imh/tm5z6U0RPPDukeWNysMOEua5871ZjCmU2f0W0TOPcV7UWkTkZjNQuS/u
JkYP7kzsL0e7JsVUvXHyHRMfxjGLc4h/x+0xtoA+lE5ZBgD4fgY=
=oCky
-----END PGP SIGNATURE-----

--MetOQAl7oXQUxjeK--
