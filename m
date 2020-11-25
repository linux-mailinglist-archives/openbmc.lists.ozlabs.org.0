Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585CD2C4332
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 16:38:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch4mP1sj9zDqpB
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 02:38:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch4k33gt7zDqr6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 02:36:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <4e839c2d6723f6b2d6c4a990869093c09988d6d4.camel@fuzziesquirrel.com>
Subject: Re: Add size property of EEPROM device
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "he.huang" <he.huang@linux.intel.com>, ed <ed@tanous.net>,
 "jae.hyun.yoo" <jae.hyun.yoo@linux.intel.com>, "vernon.mauery"
 <vernon.mauery@linux.intel.com>,  openbmc <openbmc@lists.ozlabs.org>
Date: Wed, 25 Nov 2020 10:36:16 -0500
In-Reply-To: <5FBCB6EB.3080609@linux.intel.com>
References: <5FBCB6EB.3080609@linux.intel.com>
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

On Tue, 2020-11-24 at 15:31 +0800, he.huang wrote:
> The requirement comes from:
> When we write to the EEPROM we need the size to ensure that we won't
> write out of the range and return the correct complete code.

Don't the eeprom drivers prevent this?
