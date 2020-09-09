Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54184263119
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 17:59:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmmt20Q4PzDqZD
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 01:59:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmlpB4K63zDqD9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 01:10:56 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 9 Sep 2020 11:10:46 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: CS20 KFTing <KFTING@nuvoton.com>
Subject: Re: Nuvoton requests to create a repo in openbmc github
Message-ID: <20200909151046.ew5lxd6cjkldzlu7@thinkpad.dyn.fuzziesquirrel.com>
References: <HK0PR03MB489753729249375AC99D79E7DB2D0@HK0PR03MB4897.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <HK0PR03MB489753729249375AC99D79E7DB2D0@HK0PR03MB4897.apcprd03.prod.outlook.com>
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

On Fri, Sep 04, 2020 at 05:25:12AM +0000, CS20 KFTing wrote:
>Hi Brad:
>
>This is Tyrone from Nuvoton.
>
>Nuvoton creates an ipmitool library to provide Nuvoton-specific IPMI command handlers for Nuvoton-based platform running OpenBMC, just like intel-ipmi-oem.
>
>Nuvoton would like to ask your help to create a repo named "nuvoton-ipmi-oem" in openbmc github.
>
>Joseph Liu <kwliu@nuvoton.com>  and warp5tw <kfting@nuvoton.com> will be the administrators of this repo.

Hi Tyrone.  Done!

thx - brad
