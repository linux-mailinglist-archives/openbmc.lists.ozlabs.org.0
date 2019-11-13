Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7766EFB8F4
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 20:36:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cvxs70H2zF75P
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 06:36:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cvx92xfKzF754
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 06:36:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 58B706E228;
 Wed, 13 Nov 2019 14:36:07 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: openbmc project for telemetry
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
Date: Wed, 13 Nov 2019 14:36:07 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
 <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
 <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
To: =?utf-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 13, 2019, at 11:32 AM, Adrian Ambro=C5=BCewicz =
<adrian.ambrozewicz@linux.intel.com> wrote:
>=20
> Are there any obstacles? I'm eager to hear the good news :)

No obstacles; openbmc/telemetry created.

thx -brad=
