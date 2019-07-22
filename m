Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507E706D7
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 19:27:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45spSf73LpzDqPf
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:26:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spRl2rF9zDqP2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 03:26:11 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 22 Jul 2019 13:26:56 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thaj <tajudheenk@gmail.com>
Subject: Re: Multi-node support
Message-ID: <20190722172656.hkjfluvusnnhtzkx@thinkpad>
References: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 10:26:04AM +0530, Thaj wrote:
>Hi,
>
>Does OpenBMC support Multi-node server configuration ?

Can you elaborate on what you mean by this?  I work for IBM so when I 
hear "multi-node" I think of multiple chassis, connected via cables NUMA 
systems.  If that -is- what you are referring to then OpenBMC does not 
support that today.

>
>Where can I get the roadmap of features in OpenBMC ?
We label enhancement issues in Github by release so for example:

https://github.com/openbmc/openbmc/issues/labels/Release2.7
https://github.com/openbmc/openbmc/issues/labels/Release2.8

To be honest there isn't a lot there - we're struggling somewhat to get 
those who implement features to maintain feature issues like these.

thx - brad
