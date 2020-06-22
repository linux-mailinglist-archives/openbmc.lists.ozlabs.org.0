Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AA203B71
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 17:48:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rDMg2vRqzDqXJ
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 01:48:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rDKY43BdzDqXS
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 01:46:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <e2e4299776eb50f472da743835362ba3b1e7314a.camel@fuzziesquirrel.com>
Subject: Re: [EXTERNAL] how to get pci config space
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Date: Mon, 22 Jun 2020 11:45:40 -0400
In-Reply-To: <cd4f6a11-2150-38b9-46a2-2319a3ef574f@linux.intel.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
 <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
 <D37CC7FB-0199-47A5-930A-B9BBFF02F0D8@fuzziesquirrel.com>
 <DM6PR21MB138859ED52E4D8B7B1B634FEC8520@DM6PR21MB1388.namprd21.prod.outlook.com>
 <187e72f2-3ecb-2693-4467-3da3752efde8@linux.intel.com>
 <cd4f6a11-2150-38b9-46a2-2319a3ef574f@linux.intel.com>
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

On Wed, 2020-06-17 at 16:37 -0700, Bills, Jason M wrote:
> Hi Brad,
> 
> Not sure if anyone saw this or if there is just no interest. :)
> 
> Could you please create a peci-pcie repo for this application?

Hi Jason.  peci-pcie created!

thx - brad

