Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB31E2355
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 15:50:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wb2h0pLkzDq8v
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 23:50:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WZwt3SGNzDqQL
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 23:45:49 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <ce2341766ea9ad151c20e2ed92663b36c3df0aa2.camel@fuzziesquirrel.com>
Subject: Re: Implementing BMC Health Monitoring
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Adrian =?UTF-8?Q?Ambro=C5=BCewicz?=
 <adrian.ambrozewicz@linux.intel.com>,  "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, Sui Chen <suichen@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Vijay Khemka
 <vijaykhemka@fb.com>
Date: Tue, 26 May 2020 09:45:48 -0400
In-Reply-To: <6a2274b7-d811-3b1d-f725-54c8c542d47c@linux.intel.com>
References: <CAJOps0vP=0sa0R+gNFdrDy9y=e8Qq+LnZX6E2ssJ=5YaWigaeA@mail.gmail.com>
 <ef1c70adf41b465bb29143cbf0b20f63@intel.com>
 <9a86fbeb-7270-8fcd-10a9-a84bd40ea9a7@linux.intel.com>
 <6a2274b7-d811-3b1d-f725-54c8c542d47c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2020-05-25 at 14:32 +0200, Adrian Ambro=C5=BCewicz wrote:
> @Brad, @Vijay
>=20
> It seems Sui is proposing something highly related to already
> discussed=20
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31957 . As a
> matter=20
> of fact - requirement for such system metrics availability is also=20
> highly desirable on our (Intel) side. It seems we need to merge all=20
> requirements to satisfy the common needs..

I was still hoping for a telemetry/metrics solution built around
collectd.  This seems like another place where it might make sense.  IMO
there is too much code being re-written in this area.

