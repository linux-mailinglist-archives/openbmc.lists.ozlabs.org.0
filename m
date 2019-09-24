Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C94ABD340
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 22:04:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBwd4Z1JzDqWj
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:04:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBcf0f0LzDqXQ
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:50:25 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 50E1B1325D;
 Tue, 24 Sep 2019 15:50:23 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 linux dev-5.3 2/4] ARM: aspeed-g6: lpc: add compatible
 strings
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <f2cae818-a373-4a2e-825b-e90165410758@www.fastmail.com>
Date: Tue, 24 Sep 2019 15:50:23 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <BDEB3DAA-B1DF-44F9-8361-8B571970D460@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
 <20190919152340.23133-3-bradleyb@fuzziesquirrel.com>
 <f2cae818-a373-4a2e-825b-e90165410758@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:31 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Fri, 20 Sep 2019, at 00:53, Brad Bishop wrote:
>> Assume the AST2600 SoC contains the same LPC devices as the AST2500.
>>
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>> v2:
>>   - removed DT binding documentation changes
>> ---
>>  drivers/char/ipmi/bt-bmc.c            | 1 +
>>  drivers/char/ipmi/kcs_bmc_aspeed.c    | 1 +
>>  drivers/reset/reset-simple.c          | 1 +
>>  drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 1 +
>>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
>>  5 files changed, 6 insertions(+)
>
> Also should be split for upstreaming, but as with the bindings the changes
> are fine in principle.

Split in three (ipmi, reset, socc) in v3.
