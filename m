Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FAE3B72
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 20:58:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zc2L48JLzDqXY
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 05:58:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZQb32rRzDqKK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 04:45:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5317C6E201;
 Thu, 24 Oct 2019 13:45:21 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: multiple telemetry designs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <BYAPR21MB119170FD20EAB04EFEBDF41BC86A0@BYAPR21MB1191.namprd21.prod.outlook.com>
Date: Thu, 24 Oct 2019 13:45:21 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <62724E15-0D36-4286-8A6F-91896602FA64@fuzziesquirrel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
 <CAGMNF6UOfyzArHhoaA7H30WhdYFaHOhbHiCtUx0U7S2xeM_ngg@mail.gmail.com>
 <BYAPR21MB119170FD20EAB04EFEBDF41BC86A0@BYAPR21MB1191.namprd21.prod.outlook.com>
To: Neeraj Ladkani <neladk@microsoft.com>
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: "thalerj@linux.vnet.ibm.com" <thalerj@linux.vnet.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>,
 James Feist <james.feist@linux.intel.com>,
 "james.mihm@intel.com" <james.mihm@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 24, 2019, at 1:31 PM, Neeraj Ladkani <neladk@microsoft.com> =
wrote:
>=20
> This is great discussion. can we have a deep dive on this during next =
telemetry sync up call ?

FWIW you will have more engagement and a better end result if you have =
the discussion here on the list.  That way everyone can participate (not =
everyone can attend meetings) and the conversation is automatically =
recorded and archived.

-brad=
