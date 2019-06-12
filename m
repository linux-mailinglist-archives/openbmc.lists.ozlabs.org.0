Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2543186
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 23:52:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PLFD52mVzDr0x
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 07:52:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PLDl6rpkzDr0r
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 07:51:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <0b087d91bf683a9d2e28ccdf751147e26c45a277.camel@fuzziesquirrel.com>
Subject: Re: meta-yadro subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 12 Jun 2019 17:52:38 -0400
In-Reply-To: <20190603115332.GA20703@bbwork.lan>
References: <20190603115332.GA20703@bbwork.lan>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2019-06-03 at 14:53 +0300, Alexander A. Filippov wrote:
> Hi Brad,
> 
> Finally, we are ready to publish our yocto layer. 
> Could you please create a repo meta-yadro in OpenBMC project and
> corresponded
> subtree.
> You might clone it from https://github.com/YADRO-KNS/meta-yadro.git.

Hi Alexander

I finally did this today.  Thanks!

-brad
