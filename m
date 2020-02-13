Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432D15C861
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 17:37:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JMch3CMnzDqWZ
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 03:37:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JMc20qcHzDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 03:37:04 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Functionality vs Security
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
Date: Thu, 13 Feb 2020 11:36:59 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C48B413D-C8FD-4FF5-8B3A-7D34FBB15EB6@fuzziesquirrel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
 <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
To: "Mihm, James" <james.mihm@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 13, 2020, at 3:15 AM, Mihm, James <james.mihm@intel.com> wrote:
>=20
> Exposing the REST D-Bus APIs via a network interface is bad practice =
and should be disabled by default.

Yeah.  You are right of course.  It isn=E2=80=99t really the what that =
bothers me here it is the how.  I=E2=80=99m disappointed that Intel was =
only able to make the Redfish enabled webui work for Intel and not =
anyone else.

> Just because it was done that way in the beginning doesn=E2=80=99t =
mean that it should remain that way.

I don=E2=80=99t remember saying this?

> Applications should be configured to be secure by default.

This sounds perfectly reasonable of course but I don=E2=80=99t know how =
to implement it for OpenBMC.  I=E2=80=99m not even sure what it means.  =
Security isn=E2=80=99t a boolean it is a spectrum.  Show me any security =
posture, and I will show you one that is slightly more strict/secure.  =
Clearly, my security posture isn=E2=80=99t strict enough for Intel.  =
However I know there are organizations out there that have even stricter =
security postures than Intel.  So in the general case - how does one =
decide which posture should be the default, and when is ok to =
=E2=80=9Cbreak=E2=80=9D existing usage patterns rather than =E2=80=9Cupdat=
e=E2=80=9D them for the sake of a stricter security posture?  Help me =
establish some rules so we can avoid this kind of bickering in the =
future.

thx
-brad=
