Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AA75CBD
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 04:08:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vsvG6pLHzDqRC
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 12:08:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EzyzwKM/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UktpQHVy"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vstb7211zDqN5
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 12:08:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A59F2239B;
 Thu, 25 Jul 2019 22:08:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 25 Jul 2019 22:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=VI4zghgASIn7RGlXs1VG6/OhZURNFCk
 4Drc9kJsOWkI=; b=EzyzwKM/oxHOeAb1Fn2aqb4zyOEwqyErsZBZsyHZ6l8xII7
 YAdOwoQPDPg3IK0Bs8rz14/f5E4jJuT/3Cx0zO9aQ9Bv/r+AviVvaCXFWAH71rDz
 YUncC+kgGML5lMr7ePgKv/OJ69nPuiSum3MJ1orgCbSQerkkdd7YEX95ekrVLx8z
 o/cTn+hb39N/+W5XkD27OxbSLG4BiK9rZKhOwiuyQF95T5LvR4qyQb/6V5RxfjY7
 5SgWdfaxZahYyUTiQIcHc9kYVVGbzMcCvmfFTlOLioRRgh9B+0sPlj6sXjQAdqQu
 BR+ES7Z0RHlUQ9eeKHzLgKcPdjD/uYaej8WJmaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VI4zgh
 gASIn7RGlXs1VG6/OhZURNFCk4Drc9kJsOWkI=; b=UktpQHVyAnFAWr8lLtoQ1b
 bG7IfP8ptxGyOdu+9P9fumgBlAUciKhzscVFGsqdNV5pTZqZF6pxHSC71lE338VY
 pJhA96ubqlN2zU9pebsX7+qPERXv3/SUXd1/oQWpPpDzff2o63EY5Fh+1pBVogQ6
 HBUZDZr0jkQUz+heGO30Nv98Kb89dYxmwyZVhCeMvKUNBzLZ+vD9tF1fEXFfG/tq
 91gkRL5ImSzPMFsb15CV5lwR9Qm2rK9AjAExz2kJ5iXh/FPSoRESzo+fTvqLMSbc
 fJiuXDQem0Us3zWp63oR6cMtXVPffDlUaos0ZSFEVoqvLMAx+N+aNOULgb+ASbVQ
 ==
X-ME-Sender: <xms:gmA6XeGSgXoENq-eyZbn42FHQM6sAc9CMGRSU_LhwfasigmK693a_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gmA6XTmlsrmyNuYVfc6EmzD86TqdKW8SxYI0vlH054EipSNBbppr5w>
 <xmx:gmA6XTJ8uBFi_esNAsm-bXipivKotqFqb4FUmPvAgMO4Nff05T6CYA>
 <xmx:gmA6XcbWODTN2Tgenzzr63CXbC_g6uin4DCAqMMvKaWdpExXI1laFA>
 <xmx:g2A6XUWhbJ6d3KIRIBlj7MAkqr6VluEUMWGDugLwyRJ_2m7i0SLGsw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 609B8E0129; Thu, 25 Jul 2019 22:08:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <2f7ad2ea-7717-4f9b-bdd5-b6efc131cf4e@www.fastmail.com>
In-Reply-To: <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
References: <CAHkHK0-dT2R6WUowZhaLgVurFPukL3tmJGneXCEijKew=1uRyA@mail.gmail.com>
 <46f3ba00-9382-2040-80a7-519457ecd65c@linux.vnet.ibm.com>
Date: Fri, 26 Jul 2019 11:38:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: vishwa <vishwa@linux.vnet.ibm.com>,
 "John Wang" <wangzhiqiang8906@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>, Mine <mine260309@gmail.com>,
 "Patrick Venture" <venture@google.com>,
 "Matt Spinler" <mspinler@linux.ibm.com>
Subject: Re: How to ideally fix the log function
Content-Type: text/plain
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



On Thu, 25 Jul 2019, at 20:52, vishwa wrote:
> Hi John,
> 
> Just some background; The goal is not to have func() pass in CODE_LINE 
> and CODE_FUNC since it would be a huge change all over in the code.

There's no way this is really going to work. It turns out sd_journal_print()
is actually a macro that adds the CODE_* properties via __LINE__ etc when
SD_JOURNAL_SUPPRESS_LOCATION is not defined[1], so we either get
the misleading information or force the caller to provide it.

A hack approach that almost immediately falls short is that you could try
macro over log() and adjust the actual log function prototype to take in the
location parameters so we can call sd_journal_send_with_location()
directly. However macro-ing over log won't handle namespaces correctly,
and log() seems to parameterise the level with a template so we can't
define the hypothetical log macro as a macro function (which we need to
do in order to adjust the parameter list).

Having said all that I'm not really a C++ person, but it appears the API has
trapped itself in a C++ corner. Maybe people more experienced and creative
than I can come up with something, but I think the best thing we can do
is three-fold:

1. Build libsystemd with `CFLAGS=-DSD_JOURNAL_SUPPRESS_LOCATION`
2. Add a new log macro that allows us to capture the info properly
3. Change callsites to the new macro function over time.

With 1 we remove the misleading information from the journal, and 2 and 3
get us to the right place, eventually at the expense of CPP macros.

Andrew

[1] https://github.com/systemd/systemd/blob/master/src/systemd/sd-journal.h#L53
