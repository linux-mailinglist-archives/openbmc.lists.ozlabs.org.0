Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A620E1E21F9
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 14:34:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WYLM6HNyzDqR0
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 22:34:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WYK60lfTzDqQD
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 22:33:12 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <032083e19beb4461536754a0b9e2cdbeda86a3f7.camel@fuzziesquirrel.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Adrian =?UTF-8?Q?Ambro=C5=BCewicz?=
 <adrian.ambrozewicz@linux.intel.com>,  Andrew Geissler
 <geissonator@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
Date: Tue, 26 May 2020 08:33:15 -0400
In-Reply-To: <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-05-25 at 14:35 +0200, Adrian Ambro=C5=BCewicz wrote:
>=20
> Is it allowed in OpenBMC to base the functionality on experimental=20
> implementations?

I would ask the question slightly differently - will other people use my
code if I base it on experimental implementations?  At this point in
OpenBMC I think the answer is yes.  I can say it isn't something that
would stop me from using it.

thx - brad
