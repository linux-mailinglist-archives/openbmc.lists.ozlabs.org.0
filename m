Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B281CA3DA
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 08:29:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JL590BBKzDqLV
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 16:29:01 +1000 (AEST)
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
 header.s=fm2 header.b=tkqK9XUd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YT8x5jGE; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JL4G5KF6zDq5n
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 16:28:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1E16E9C4;
 Fri,  8 May 2020 02:28:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 08 May 2020 02:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Gg7IG
 W4Xrk4EqlVPjhm6XXS722Mzmkhx3pb1Z854gVw=; b=tkqK9XUdrKCPwh9htux94
 LpUfPh13OEoDEKl1JKIhUKGWCKMkncdDwPcPdCYyNbp8p6aJ4GzC6sMei5y3R7Ma
 p4EM542Wh6hR1nHCYqAwqmkJyz2uzehJ3ylomt9mjh64Z2jNNeR4oZUPRz0hMwlj
 9tGdxd8j0keb8PVcsZeMxHZojkSaR0iRNt18XW5GYGqsgJy4Jp3JlTNJxx/oB5vG
 WpYPvmp9mS57KEPAOebYSWUI2gjxZIwsLzNiGcvFUO9IXCGSwpo+RCmS5c00yepw
 ZdQ2LcOXH5iEAskfxvUszAitxCDIIg7OR56GZFpSJ3SURxPA2Wgxi3DDVOn3bl11
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Gg7IGW4Xrk4EqlVPjhm6XXS722Mzmkhx3pb1Z854g
 Vw=; b=YT8x5jGEpWc8Su30m94XHZT+nFElshOVPGjyWu/iCX+nkVLzBdBidlW72
 mfpDiFwdK+oevULAAjch1iCGML1EXQlYaHh1uk3uwY3w6GaaWWV7oJBb0y8iuSw0
 3SQLLkReXtAQB90voMzORss5Qa7TlutXCeDyX6Vnj9r6DlZn2/GySi4eYanetVvB
 McM/9anyhey8boh3alV+vmPpf8EIbnnnvpRpXDzDqFnqfJUEjwTsOEf41lFl9x1n
 UIxQQ5QP8WQSqlcCW/hrcwY+isRrrKnIbwbOV+C3SKkNFlMo+YQ3Lc++lHEDFTQz
 iIVZFTtC7eNXlONOJ1c9XWTfSwytQ==
X-ME-Sender: <xms:-fu0XiV_f4VW9oCpfYXXdBlVlO2q1XpTw4wsMFq0uxvz3VhqEYQsJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-fu0XpVxzAerTND31ZFK-SUJ5A-1gqElIcA0qqlA0HgoYMHZDCI6QQ>
 <xmx:-fu0XlQKF_ibECfol-1bwUL1kAoWtq8ulXUppjrgjWWW_QBp8VxbOw>
 <xmx:-fu0XgE3z06NBHa4CNk1UnUVKQED46kZOkxDzWlt-MdkotY3W3FGCw>
 <xmx:-vu0Xn_TB7ZWH3pqogl62OnVDNqbouJUqgY1arPNafZqj6a9Sy4VkA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B8AC1E00B0; Fri,  8 May 2020 02:28:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <9a4d4632-da0a-42e6-847b-356258077371@www.fastmail.com>
In-Reply-To: <4D8FDCBD0A020645AD4A2EB6A09DD3DA7C78C70D@BGSMSX102.gar.corp.intel.com>
References: <c427abda47504920b4845252bfd3b84c@intel.com>
 <4D8FDCBD0A020645AD4A2EB6A09DD3DA7C78B79B@BGSMSX102.gar.corp.intel.com>
 <4D8FDCBD0A020645AD4A2EB6A09DD3DA7C78C70D@BGSMSX102.gar.corp.intel.com>
Date: Fri, 08 May 2020 15:57:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@intel.com>,
 "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>
Subject: Re: Proposal: TX API change with PCIe binding
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Richard,

On Wed, 6 May 2020, at 19:03, Thomaiyar, Richard Marian wrote:
> =20
> Discussed the same today (esp. reg Src / Destination EID 0 handling),=20=

> we need this private pointer data handling (local mapping will not=20
> work, when there are multiple devices querying with EID 0).

I think your previous email is correct. Handling of e.g. BDF for the
PCIe VDM binding must be done by application of the route table
prior to placing the message on the physical transport. Transport-
specific addressing must not be something we concern ourselves
with further up the stack.

Messages with EID 0 must come from devices using local-only
addressing, which implies that they've not yet been assigned an EID.
See Table 2 of DSP0236 v1.3.0. For EID 0 destination messages it
implies we're sending a Set EID command to the device, for EID 0
source messages it implies that we've received a Discovery Notify
or some such event (are there other commands that we might receive)?

Either way, the upshot is the next action is very likely to be that we
assign an EID to the device, which means we can provisionally update
the route table as I outlined in my previous email to Sumanth about
handling physical layer routing. Provisional updates eliminate most
(all?) of the issues.

> Even we may=20
> need to expose the physical address to the upper layer (on certain=20
> conditions / OEM handling), and don=E2=80=99t have any other mechanism=
 other=20
> than having this privateBindingPtr.

Can you please outline the use-cases here? I'm not keen to implement
this before we have a concrete need for it. I want to see evidence that
it's necessary, not just the suggestion that it might be.

Finally, please make sure to Cc openbmc@lists.ozlabs.org on these
queries. I've taken the liberty of doing so with my reply. Other people
probably have the same questions as you do so I'd like to make sure
they can see the conversation, and that it's publicly archived for
historical purposes.

Also apologies for the delayed reply, the last couple of weeks have
been quite hectic for me.

Andrew

>=20
>=20
> Added this topic in OpenBMC PMCI WG agenda (for wide discussion).
>=20
>=20
> Regards,
>=20
> Richard
>=20
>=20
> *From:* Thomaiyar, Richard Marian=20
> *Sent:* Tuesday, May 5, 2020 7:10 PM
> *To:* Hawrylewicz Czarnowski, Przemyslaw=20
> <przemyslaw.hawrylewicz.czarnowski@intel.com>; Andrew Jeffery=20
> <andrew@aj.id.au>
> *Cc:* Bhat, Sumanth <sumanth.bhat@intel.com>
> *Subject:* RE: Proposal: TX API change with PCIe binding
>=20
>=20
> Hi Przemyslaw,=20
>=20
>=20
> I am not in favor of adding this private pointer(binding specific) in=20=

> each MCTP message packet (i.e. Want to keep MCTP message packet beyond=
=20
> the physical transport binding).
>=20
>=20
> Same problem exists even in SMBus binding, i.e. we need to convert the=
=20
> EID to SMBus address, but that doesn=E2=80=99t require it to be added =
in every=20
> mctp_message_tx packet. (i.e. This information must be hidden inside=20=

> the binding layer or managed by the control command handler code along=
=20
> with the binding layer. Internally the binding layer (along with daemo=
n=20
> code) must maintain a table for EID to transport layer physical addres=
s=20
> mapping) Basically, the binding_tx() must internally check this table=20=

> and get it converted. Note: Also we need a mechanism to find / discove=
r=20
> devices, which must be beyond the scope of this core mctp api=E2=80=99=
s (i.e.=20
> mctp_message_tx / rx etc).
>=20
>=20
> Regards,
>=20
> Richard
>=20
>=20
> *From:* Hawrylewicz Czarnowski, Przemyslaw=20
> <przemyslaw.hawrylewicz.czarnowski@intel.com>=20
> *Sent:* Tuesday, May 5, 2020 6:54 PM
> *To:* Andrew Jeffery <andrew@aj.id.au>
> *Cc:* Bhat, Sumanth <sumanth.bhat@intel.com>; Thomaiyar, Richard Maria=
n=20
> <richard.marian.thomaiyar@intel.com>
> *Subject:* Proposal: TX API change with PCIe binding
>=20
>=20
> Hi,
>=20
>=20
> I am working on PCIe binding and came across the following problem.=20=

> PCIe binding TX call needs some additional information for medium=20
> specific header like sender/receiver BDF or routing type. Current core=
=20
> implementation does not allow to pass any specific data to binding on=20=

> level of single request.=20
>=20
>=20
> For details let me present some code:
>=20
>=20
> int mctp_message_tx(struct mctp *mctp, mctp_eid_t eid, void *msg,
>=20
> - size_t msg_len)
>=20
> + size_t msg_len, void *prv)
>=20
> {
>=20
>=20
> static int mctp_message_tx_on_bus(struct mctp *mctp, struct mctp_bus *=
bus,
>=20
>  mctp_eid_t src, mctp_eid_t dest, void *msg,
>=20
> - size_t msg_len);
>=20
> + size_t msg_len, void *prv);
>=20
>=20
> Also added this:
>=20
>=20
> struct mctp_pktbuf {
>=20
>  size_t start, end, size;
>=20
>  size_t mctp_hdr_off;
>=20
>  struct mctp_binding *binding;
>=20
>  struct mctp_pktbuf *next;
>=20
> + /* binding private data */
>=20
> + void *prv;
>=20
>  uint8_t data[];
>=20
> };
>=20
>=20
> to pass it down to binding specific tx handler.=20
>=20
>=20
> The rationale for such change is simplification for passing binding=20=

> specific data and is also major advantage of this approach.
>=20
> On the other hand it has also a significant shortage - breaks current=20=

> API adding additional parameters to existing apicall what implies=20
> changes in all components using libmctp.
>=20
>=20
> Other approach is to use callbacks used directly by binding. I don=E2=80=
=99t=20
> like this concept as, in my opinion, it complicates TX flow on client=20=

> side and creates need to match specific part of=20
>=20
> messages with header (which can be divided in core). This would look l=
ike this:
>=20
>=20
> set_tx_medium_header_callback(pcie_binding, &local_callback);
>=20
>=20
> mctp_message_tx(mctp, dest, payload, length);
>=20
> . . .
>=20
>  ---> mctp_pcie_binding_message_tx() invokes callback to gather needed=
=20
> data, then prepares header.
>=20
>=20
>=20
> What do you think about it? Please share your opinion.
>=20
>=20
> --=20
>=20
> Best regards,
>=20
> Przemyslaw Czarnowski
>=20
>
