Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B64EA4F1
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 04:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSCdF5N8Mz3c00
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 13:07:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=YWDyx7c0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CkUQ9OGJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=YWDyx7c0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=CkUQ9OGJ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSCcn5DmDz2yZw
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 13:07:20 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B6FEF5C01D5;
 Mon, 28 Mar 2022 22:07:17 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 22:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; bh=t
 Dglojh0NUIs2hIp76uBvbzvnFt/LCrEiUr33At35po=; b=YWDyx7c07CG4IoQ8x
 aEc4rnPyqUnS1LS9IhjjQMGZX2ONkCrE9nR7Tawygq8/41ryPTVxciF4UcdAW3yR
 880eD57cSC2pNHtYwgkWKSooqGrTPvB5bwtaWa8fGR9iWu8eiN6fo8XSf1Tj/HgJ
 +tbDT+HwPeFfYPw4/NI1GC43cE3z7YfCA7ISnWule/R4uSsVkcAmYSQVniZuAHsk
 pmIyoLLwUn9qk2IL3/tXsK77+ynlA18E373jlvFXfXPr5xnuTweyrTWNDnVZak3m
 PmtXGefK64SnwLb7So8nkCaqTNX0S2RI8JM8ialhycjj8fitlcap92nkL1YoVcua
 c/RcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=tDglojh0NUIs2hIp76uBvbzvnFt/LCrEiUr33At35
 po=; b=CkUQ9OGJw7GX8S7htXfdIcmqizFX922ba3GkTbmv5dYjsAwgIrC4bcMc6
 V23Yx6QrZKi4XvnC+aP1O/rKzHnUJVu9XC9DQJWyD/bEpxsLDMtw3LvM8dGTAUcN
 nG9x0Vgb+a3KKgUyOOtuFRj6Od//DTsjv3CcZKQEJNtAMe5ozdj0sAB/pSF37ARl
 pJyM3Gof+PHu1y+c6atrFHe/5sqKXOL/mhr/rldP7OXwSUHSZJyRlljbUadpCXff
 6Ny/tebr39jxgJOoj4EbXmDQXKkgJuV+xdIsmKKjwb2PwkIpejIJ0Y+lvp+x43WX
 SmV0MObOrinj7aMEN/fXMEPUOXVcw==
X-ME-Sender: <xms:1WlCYrv8VD_ilQlqwrx8uqVjb2uVTeA_OlfEaTFU-a6DIqwVh6S1Rg>
 <xme:1WlCYse5mcAADZkp6_eVWUBKQxcfsXiAlvZ32En-nAc-JvT_hE5d8gUE1RCEln1b4
 2O4lTRX3h8Mn3_1Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfffhffvufgtsehttdertderredt
 necuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrd
 hiugdrrghuqeenucggtffrrghtthgvrhhnpeeuteekkeffgeeiheeiffffjedtledvtdev
 hfdtfefhvdehudeviedvieejteehgeenucffohhmrghinhepohhpvghnsghmtgdqphhroh
 hjvggtthdrgiihiidpghhithhhuhgsrdgtohhmpdhfohhrmhgrthdqtghouggvrdhshhdp
 uhhnihhtqdhtvghsthdrphihnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:1WlCYuw7MevA3LSN4XPuI19WL_DfYxFjRZYogNaU35dLfvYkugOzIw>
 <xmx:1WlCYqP3P4p-X_eS6FIr7OM-49f3euZYU_z7n3eL_Et4nQklMLodKg>
 <xmx:1WlCYr-mQDZf1xr_kCWWvM0dco48bBXHewqlTIGClV3bPnA7oFGvUA>
 <xmx:1WlCYubKSubd0AjevwiJGgyUdekHwgBuJWNNk7pf5CjDQ9NPMZcEDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3F5C8F6043F; Mon, 28 Mar 2022 22:07:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
Date: Tue, 29 Mar 2022 12:36:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Ed Tanous" <edtanous@google.com>,
 jiaqing.zhao@intel.com, "Andrew Geissler" <geissonator@gmail.com>,
 "Adriana Kobylak" <anoo@linux.ibm.com>
Subject: Defining the behaviour of code formatting in openbmc-build-scripts
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
Cc: Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Review of https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/52406
sparked some discussion about what we actually want from the code-formatting
support in openbmc-build-scripts going forward.

## General statements

Enforcing code formatting in CI is effective in that it ensures style from
multiple contributors is consistent with minimal maintainer intervention.
Sometimes the automated formatting might be questionable, but the judgement is
that on the whole the consistency is a better trade-off than occasional
enforced untidiness. There are also escape hatches to disable formatting in
extreme circumstances. Automated code formatting is desirable.

clang-format is at the heart of OpenBMC's code formatting support as the bulk
of the OpenBMC codebase is written in C++.

## The problem

"Like all Vogon ships, it looked as if it had been not so much designed, as
congealed." - Douglas Adams, The Salmon of Doubt

Code formatting support in openbmc-build-scripts has evolved over time and
no-one has ever written down what we actually want. The lack of concrete
requirements has lead to an counter-intuitive and convoluted implementation
that has ended in some repositories (e.g. entity-manager) not having their code
formatted as expected.

There are 4 possible behaviours that openbmc-build-scripts could take against
an application repository:

1. All code formatting is disabled: No further action

2. No custom code formatting: Just do whatever the default actions are as
   implemented in openbmc-build-scripts

3. Some custom code formatting: Actions to run in addition to the default
   actions implemented in openbmc-build-scripts

4. Only custom code formatting: Actions to run in-place of the default actions
   implemented in openbmc-build-scripts (which must not be run)

Currently openbmc-build-scripts only implements 1, 2 and 4, while
entity-manager had assumed 3 was supported.

## Background (AKA why don't we have support for 3?)

Code formatting support in openbmc-build-scripts began with an implementation
of 1. However, along the way we introduced the phosphor-mboxd repository which
due to some unfortunate history has a mixed C and C++ codebase. The C code is
written in kernel style, while it was desired that the C++ be written in
OpenBMC style.

At the time the problem arose, clang-format had two issues:

a. It treats C and C++ as the same language, and so maintaining a code
   formatting split across those language boundaries requires two separate
   clang-format configuration files

b. clang-format's -style=file historically required that the style file in
   question be called ".clang-format"

These two constraints together required that phosphor-mboxd ship two separate
configuration files, and to explicitly symlink them as .clang-format before
invoking the clang-format command. As such it was easier to reason about code
formatting if the support in openbmc-build-scripts transferred the entire
formatting responsibility to repository-specific format-code script rather than
attempting to do anything of its own accord.

Hence, we support 1, 2 and 4, but not (yet) 3.

## Analysis

The current behaviour of openbmc-build-scripts is as follows, from
scripts/unit-test.py:

1. Check that code formatting was requested. If not, no further code-formatting
   action is taken

2. Check for `format-code` and `format-code.sh` in the root of the target
   repository and add them to the formatter list

3. If no custom scripts were found in 1, add the default format-code.sh
   implementation[1] to the formatter list 4. Execute the scripts in the
   formatter list

[1] https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/format-code.sh

This algorithm is implemented here:

https://github.com/openbmc/openbmc-build-scripts/blob/0ea75ec9efb7ffacb88f63e38fa7823fe8b124a7/scripts/unit-test.py#L1215-L1226

Confusingly, inside the default format-code.sh implementation there's also an
invocation of the custom format-code.sh script if it exists, but the default
format-code.sh implementation won't be executed if the custom format-code.sh
file exists (due to the implementation of scripts/unit-test.py). So this code
is dead:

https://github.com/openbmc/openbmc-build-scripts/blob/ac5915f07d3b796f224c85477763ca7fe893dcc2/scripts/format-code.sh#L136-L141

The a consequence of all this is that the entity-manager codebase isn't being
formatted with clang-format because it ships a custom format-code script that
doesn't invoke it.

## Proposal

I don't really have one. Does anyone have thoughts on how we differentiate
between cases 3 and 4? Use different file names? Invoke the script and ask it
what it expects?

Interested in your thoughts.

Andrew
