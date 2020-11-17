Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7A2B55A4
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 01:21:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZmnm4RBBzDqRn
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 11:21:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZmmr0BxnzDqNv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 11:20:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 16 Nov 2020 19:20:18 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Hancock Chang <HancockC@supermicro.com.tw>
Subject: Re: Need to create Supermicro's repo for OpenBMC Contribution
Message-ID: <20201117002018.6aeprjl5cy2otryk@thinkpad.fuzziesquirrel.com>
References: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
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
Cc: Ryan Sie <RyanS@supermicro.com.tw>, Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>, Michelle Liu <MichelleLiu@supermicro.com>,
 Ryan Zhou <RyanZ@supermicro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 01:14:40AM +0000, Hancock Chang wrote:
>Hello Kurt,
>
>As previous communication in below, Supermicro has completed the CLA and been accepted, our BMC dev team is preparing to have some contribution to OpenBMC, so would like to ask for help to create "meta-supermicro repository as openbmc subtree" then could start to follow the process to do some contribution
>
>We have 2 BMC senior staff would be as repo owner, name and email address as below assume this will be needed for creating the meta-ampere repository.
>
>     Ryan Sie, RyanS@supermicro.com.tw
>     Ryan Zhou, RyanZ@supermicro.com

meta-supermicro created.

-brad
