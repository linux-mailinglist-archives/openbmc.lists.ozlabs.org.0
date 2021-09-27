Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD934198D8
	for <lists+openbmc@lfdr.de>; Mon, 27 Sep 2021 18:26:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ7L127dlz2yPW
	for <lists+openbmc@lfdr.de>; Tue, 28 Sep 2021 02:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=J29bfbhU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DH681pit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=J29bfbhU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DH681pit; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ7KX1HDxz2xXS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 02:25:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D6855C00E3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Sep 2021 12:25:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 12:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:subject:message-id:references
 :mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm3; bh=wGHhBLCO7pMRNaDLUx9FqyUHJbn74MqCaKFa+3fs
 kcY=; b=J29bfbhUN01k17yybhpYz/edwSK467GmHhE/6kgB0mKR0GbXjUV4Tpet
 Msal/FxJ9CDZG9iYHDlVjJJLjPDwPwUDSn52n7JvlZ6T3eBs0Q0VHD4OxyfNSxxa
 iXFmVRFq0oD1j+PhwDp/jGEZOcUd3ME+9loP0x5DkthFtGR2rL2DeIkq6tlSKdnz
 mS0OoQRNpFjIDzXRzF0+UfwZypJBVyoU5ClnpPPAQ5qlsjkVop1ZdMMLjP08aUGH
 QsuNp3903T7YJlAnW8eyEzBPYuF5CwEu3bAFBT+YlZrBVqX4L+WePZeS/jqYpZJQ
 Dy0eA/Q/WRgYCDnY8aLBmaQdY3/zuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=wGHhBLCO7pMRNaDLUx9FqyUHJbn74MqCaKFa+3fsk
 cY=; b=DH681pitByl/I0pyWnYeqtBaLz5UmTa2ZdGr0ismuqeE6QfwwjJNz0Y0d
 JdRIodFeTbeCv39IV48t1ThL4u+m+/nvN18GMBRUk1DIsYvi34B0BMRkPN2qP/2r
 ZIgIc/3E4ub2UkLxcB4Mj+hRIgUwWyPm75ypjQawP5UmlfpTbXqcz4GdyOMkCMuf
 h1r/Pzh8mLg5040FwCzkVUkKzM4DfpTyt2KGx9UjYk4TBhaRpdnrqZenKbFGKHUm
 dFR/Jq4O37a+tczBX4QJVlMme7nmw1473Vk+E8F1iLqHcCE3JyqRd8SGganZlaqy
 LU/CsEYtos5eSvTCQhytw+jLH5eWA==
X-ME-Sender: <xms:evBRYfqvPwANQwpLDO5X0sbAQK4duhvVP60H8veWg_Ytp5xAcwhqUg>
 <xme:evBRYZqlpqE82ydwQ8_Yeci52rXa715Q6sVCOZG1mpNjyToLxLLt4T_GHh1ecvWDT
 M5pOHGuhDliOCpJmpY>
X-ME-Received: <xmr:evBRYcM2FboseNSwWWaOdEL_FX6E6ufppMJEL2QKLC_t_cetEgw2efUK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggugfgjsehtke
 ertddttdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhephfejueelie
 eufeffheefiedvveeiveeihefgkeelteelkeeiffegfeffudeugfevnecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:evBRYS7v4iRN12gK41cTA6cZbapU87GIQgie4FkxpvJkW3sZD08cmg>
 <xmx:evBRYe7uLjbPfs4nnp6oGC9_ouAWmYHRNkuLrkxPtyQmhvU7PQcEXw>
 <xmx:evBRYagr9GRW6b8X3v0Sz8v11Pb-HMP8UwzehkeuQ6ad0qTxHqaSrg>
 <xmx:evBRYbUxXFy7UUwSxbxnUL8HTA2nFlES92_Aui9qXce8OEzzxMhABw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 27 Sep 2021 12:25:29 -0400 (EDT)
Date: Mon, 27 Sep 2021 12:25:28 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Call for volunteers
Message-ID: <20210927162528.tfh6igwuwef7rsk7@cheese>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
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

On Mon, Jan 11, 2021 at 04:09:19PM -0600, Brad Bishop wrote:
>Hello OpenBMC-ers!
>
>Your TSC has been aware of the problem of fragmentation in our project for some
>time.  Fragmentation is a loose term - for the purposes of this note consider
>it to be any time contributor efforts in the community are duplicated without
>thought given to maintenance and/or compatibility.
>
>To begin to address this issue the TSC is looking for volunteers to serve on a
>"repository review forum" to which the TSC will initially delegate its
>authority in the areas of:
>- new repository creation
>- placement of contributed new function into existing repositories
>
>The TSC fully expects the scope of this forum to quickly grow into the role of
>a traditional TSC providing frequent, technical oversight to project
>contributors.  The current TSC will continue to serve the project in terms of
>governance, advocacy and industry exposure - and likely get a rename (OpenBMC
>Board? or OpenBMC Steering Committee?) in the process.
>
>The new forum would meet periodically or at the demand of other forum members
>to:
>- raise the forums combined awareness of new function under development
>  (information exchange)
>- build a consensus within the forum on where the function should exist
>- inform the function contributor and the rest of the community of the decision
>
>A successful forum would be a forum that can simultaneously encourage the
>contribution of new and innovative solutions to existing problems without
>introducing complexity to the project as a whole.
>
>A successful forum member will have previously demonstrated a breadth of
>understanding of the upstream OpenBMC codebase through:
>- frequent participation in peer review, the mailing list, IRC, and Discord.
>- submission of high quality designs and code to upstream OpenBMC
>  (github.com/openbmc)
>- a history of working with and guiding less experienced OpenBMC developers
>  in a timely manner, enabling them to come up to speed quickly.
>
>If you are interested in serving the project in this manner, please reply to
>submit yourself as a candidate.
>
>-brad, on the behalf of the OpenBMC TSC

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
