Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5743063
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 21:46:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PHSL38GKzDqlc
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 05:46:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PHRn4P5yzDq9C
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 05:46:12 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 12 Jun 2019 15:46:57 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Tony Lee =?utf-8?B?KOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Subject: Re: Repository for phosphor-nvme
Message-ID: <20190612194657.adqisdizqho5tyes@thinkpad.dyn.fuzziesquirrel.com>
References: <59731b596a7048fab67aa03456c2058c@quantatw.com>
 <20190523163009.unv7lnvn6x7duieu@thinkpad>
 <cc95beae385043d2a491c84f363699d5@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cc95beae385043d2a491c84f363699d5@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> >Hi Brad,
> >
> >
> >
> >Could you help create repository for "phosphor-nvme"?
>
> Done.  Sorry about the delay.
>
> As with the last couple new repos that have been created you'll have to use
> github pull requests until the gerrit/github syncronization problem can be
> solved.

Hi Tony

I believe I have enabled replication on phosphor-nvme, so you can go
ahead and use Gerrit for code reviews on phosphor-nvme, and changes you
merge there will automatically be replicated to GitHub.

thx - brad
