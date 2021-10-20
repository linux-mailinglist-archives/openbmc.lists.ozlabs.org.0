Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757B434337
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 04:01:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYv485Qx7z30Hj
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 13:01:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=d5CC7CPA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HR3R0eFL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=d5CC7CPA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HR3R0eFL; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYv3f6fPlz2ygC
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 13:01:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F3405C00EB
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 22:01:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Oct 2021 22:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:subject:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 +qtp2Zq42fHljLiCelbcC5EBa8e0YEyeih92UrdWgQQ=; b=d5CC7CPA6SXgzgEn
 5du25E6lFVnSaUvsiDJAhdLOt5ikIUmgcsGFheb2AFkQ8AhK/ZNBU7gA1mgYaZ8E
 vwAGHnl1etyzO83HZDBuvNSrR+s/KGghPNQem0WtTf3ukl00/SaSX7ZVj2Vk8wb+
 rGh5cM0+ZyNab5Bi2YcWLJigeOMCf4F8kqfGpB2xHhghamos9FDimHHqdq7PSgnM
 r59C3wB+kKZ82//QxK8DqysTkFuSKJRBgvi0UgS807ygZOhHwWamCTbU6Dyn8/3E
 R8P29KAEFMIQRbzPGIiUiDeibF+Ey8e2tvvteAnXWvZ0lR8UewyhOiSIiAS00itL
 FnWcTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+qtp2Z
 q42fHljLiCelbcC5EBa8e0YEyeih92UrdWgQQ=; b=HR3R0eFLgT/38+W2gokgM0
 lQvk+BEvrZ45g2wZ7GWScN5eQCEcSxkUu3n3BI2MDlqWrSaPG4ocmbi8SsPXhFSy
 64ReYOkxiXcwRlBjIMW+pbtwvLfc2BhwglblIonLrJfPwQUNXq+BLugDtoHpmU1Y
 KEZf8BxOtci+GTZPKKwwthTh734XdIafXyKlIiGP6ptsNaif+9XhNFapfNgir3GR
 6BIrNfiTXGmt1A5zOv+CW5EFgJZaUYLSb5f788o+33nyoxmil7rxEfnINdLu71AL
 KgARqMJ2pNrnRL4pYLXGuX7ZMvwxjrF1fnjUzm0nRsPY5QqFKJl+yZC7Ius+S2+g
 ==
X-ME-Sender: <xms:aHhvYRWg7vO8TWcGR4IDYXc1NByHRAe3_eVQVpj6u_2pn-lUVhneNQ>
 <xme:aHhvYRkjv1EkqXDjFbcLkxUDHs-KG5V1-43bgAlsM7TTaz1DGgeWb9E7Bro20olQf
 3kmrgj6MTwuBmtOwQ8>
X-ME-Received: <xmr:aHhvYda_Voht3sGIFOvcAD5LH2u_E6svzt6UMechVzZASJ9KnFcgb35W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugfgsehtkeertd
 dttdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhii
 iihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepteeijedvffeuve
 ehgedvhfehheejgedtleeijedtjedufeeluddtieetudekveffnecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhu
 ihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:aHhvYUVeda-nkYPBjPqoZEcy0DwwVTnlQghdEJ6_xnWDhflcGboZ-w>
 <xmx:aHhvYbnliiEdRUNTUD254iA_6RW1DabTp9eqJPIvu1NCdUd7atio0g>
 <xmx:aHhvYRei-seWhHY0h-vw2RjpBLqBG0uLqZB3RElYNWYoUR1YVw7N0w>
 <xmx:aXhvYRRA0UmV7kNyi8pcxhvPe3X-NiX3AjyFPycAv8HIL_8lC6eq0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 22:01:12 -0400 (EDT)
Date: Tue, 19 Oct 2021 22:01:10 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: introducing the OpenBMC technical oversight forum
Message-ID: <20211020020110.mcf3isoygjfujolt@cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi Everyone

It was pointed out to me that my technical oversight forum introductory 
email here:

https://lore.kernel.org/openbmc/20210927162528.tfh6igwuwef7rsk7@cheese/

had the unfortunate subject of "call for volunteers" and thus might not 
have been read :-)  - so I am sending it again in what I hope
is a more visible way.  Thanks!

-brad

Hi all

Myself, the volunteers that responded, and the TSC have been working for the
last few months to prepare a charter that outlines how this new workgroup will
operate and I'm happy to report that the workgroup is now online and
operational.  I've appended the workgroup charter for your reading, you can
also find it in the docs repository.

After you read the charter you will likely wonder what the role of the TSC is,
and that isn't documented in the charter so I will discuss it briefly here.
There are several types of open source governance models - a commonly used
model splits project leadership between a board of governors and a TSC.  A
board typically oversees project finances, handles personal and legal issues,
arbitrates or settles complaints and disputes, oversees the use of project
trademarks or other "community" assets, and most importantly is accountable for
the overall success and growth of the entire project and its community.  Many
of these apply to OpenBMC.  With the introduction of the new workgroup
(Technical Oversight Forum or "TOF"), OpenBMC effectively moves to this kind of
split governance model.  Since we are using non-standard and confusing
descriptions for these different leadership groups, I've included this little
decoder ring to help illustrate:

| Leadership Role | Typical Project | OpenBMC |
| ---             | ---             | ---     |
| General         | Board           | TSC     |
| Technical       | TSC             | TOF     |

In the longer term, my goal is to see these different teams formalized in the
OpenBMC project charter and we can use the standard descriptions, board for our
TSC, and TSC for our TOF.

thx - Brad

-------------
# OpenBMC Technical Oversight Forum (TOF)
This is a working document and subject to change.

The OpenBMC TOF or Technical Oversight Forum represents the technical
leadership of the OpenBMC project.

The TOF handles the processes around accepting new features into OpenBMC,
creating new subprojects (git repositories), approving subproject maintainers,
handling and enforcement of subproject maintainer issues, and many other
technical leadership concerns related to OpenBMC.  This source of this document
is in the OpenBMC documentation repository (https://github.com/openbmc/docs).
The TOF updates and maintains this document, using the process documented
within, and it can be considered authoritative unless directly overridden by
the TSC. 

## Working Principles
- Decision making is a spectrum between building broad consensus, in which
    everyone has agreement, and providing guidance quickly, even when there are
    strongly differing view-points.  This group should intend to work towards
    broad consensus, with a balance towards moving forward when there is minor
    disagreement.
- Members within this forum are representatives of the development community as
    a whole and not as representatives for the entities they are employed by.  As
    such, decisions should be made based on merits of the decision at hand and
    not on impacts to various member entities.
- Encouraging progress, experimentation, and decision making within the project
    is the core purpose of the TOF and not to create processes and barriers to
    development.  Velocity should be favored over perfection, except as a
    rationale for ignoring well-reasoned issues.

## Role and responsibilities
Issues the TOF handle include:
- Approval of new bitbake meta layers.
- Approval of new subprojects.
- Supervising subproject maintainers.
- Resolving subproject maintainer disputes.
- Guidance and oversight of the technical direction of OpenBMC.

## Current members
- Brad Bishop - radsquirrel
- Andrei Kartashev - Alatar
- Deepak Kodihalli - dkodihal
- Ed Tanous - edtanous
- Richard Thomaiyar - rthomaiy
- Patrick Williams - stwcx
- Lei Yu - LeiYU

The TOF shall have a minimum of 5 and maximum of 9 members at any given time.

The chair rotates month to month.

Chair responsibilities:
- Preparing the agenda.
- Taking meeting minutes.
- Documenting decisions on GitHub.

Members are elected by community contributors yearly.  The voting process will
be determined by the TOF at a later date and updated in this document.  TOF
candidates should have a breadth of knowledge about the OpenBMC project. Ideal
candidates will also have a public history of fostering collaboration between
teams.

Resignation of TOF members will be handled as an empty/reduced seat until the
next voting session.

## Github issues
The TOF tracks any ongoing decisions using GitHub issues (link to repo goes
here). Issues can be opened by anyone, including TOF members themselves. Issues
can be requests for process or technical changes, or solicitations for the
opinion of the TOF. When an issue is opened the TOF will respond to a proposal
or a solicitation, or add it to the next TOF meeting agenda for TOF discussion.

Once an issue has a proposal, TOF members have 8 days to vote on the proposal
in one of three ways: for, against, or “needs discussion”*.  After 8 days, if
the proposal has at least three votes for and no other votes, the proposal is
approved.  Alternatively, if the proposal has at least three votes against and
no other votes, the proposal is rejected and closed.  Any other vote count
results in the issue being put on the next TOF meeting agenda.   To ensure
proposals do not stagnate, if the initial 8 days elapses and the minimum number
of votes has not been met, the proposal is extended by an additional 6 days and
then put onto the next TOF meeting agenda after 2 weeks.

Issue vote indicators by reacting to the top post:
   - For - 👍 (`:+1:`) 
   - Against - 👎 (`:-1:`) 
   - Needs discussion - 👀 (`:eyes:`)

## Meetings
The TOF meets bi-weekly. Any requests for consideration by the TOF should be
submitted via a GitHub issue using the process documented earlier in this
document.

Meetings require a quorum of the TOF to be present; quorum is defined as:

| Active TOF membership | Quorum |
| ---                   | ---    |
| 5                     | 4      |
| 6                     | 5      |
| 7                     | 5      |
| 8                     | 5      |
| 9                     | 6      |

During the meeting, the TOF discusses proposals under dispute and votes on
them. A proposal is rejected if it does not reach majority approval or there is
more than one dissenting vote.

It is the responsibility of the TOF chairperson to make a public record of the
decisions of the meeting.

## Discord channel
The TOF has a private Discord channel for forum member coordination and, in
rare situations, potentially sensitive topics.  Sensitive topics would be
topics having security or privacy concerns, such as those involving actions of
an individual developer.  The TOF chairperson is responsible for coordinating
the public posting of any information or decisions that do not need to remain
private, using the same process as public issues.
