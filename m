Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E086B1DBBA8
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 19:38:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S0Mt6WQCzDqTN
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 03:38:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S0Jx5gSXzDqXK
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 03:35:44 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <d3bcea4e6ba97439a3c529cc8607186f10b00ebd.camel@fuzziesquirrel.com>
Subject: Re: Processing PLDM FRU information with entity manager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: James Feist <james.feist@linux.intel.com>, Deepak Kodihalli
 <dkodihal@linux.vnet.ibm.com>, "Thomaiyar, Richard Marian"
 <richard.marian.thomaiyar@linux.intel.com>, "Bhat, Sumanth"
 <sumanth.bhat@intel.com>
Date: Wed, 20 May 2020 13:35:55 -0400
In-Reply-To: <8e62ac67-8415-d5ef-a034-a306ae2a18c6@linux.intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <6bd3254af95cbd8ae44151f62114acca9d221962.camel@fuzziesquirrel.com>
 <8e62ac67-8415-d5ef-a034-a306ae2a18c6@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2020-05-20 at 09:56 -0700, James Feist wrote:

> I need a better example. FRUs are independent things, so there is no 
> hierarchy.

A drive plugs into a riser which plugs into the motherboard.  Isn't
that a hierarchy?
