Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C816762A91
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 22:46:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jHYY1cl6zDqQR
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 06:46:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jHX461R2zDqN5
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 06:45:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 8 Jul 2019 16:46:00 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Tony Lee =?utf-8?B?KOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Subject: Re: Some questions about recipes-phosphor/inventory
Message-ID: <20190708204600.wbfmzml462x6pvck@thinkpad.dyn.fuzziesquirrel.com>
References: <63fc9eff383a40149fc8037b54844e1c@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <63fc9eff383a40149fc8037b54844e1c@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 05:39:39AM +0000, Tony Lee (=E6=9D=8E=E6=96=87=E5=
=AF=8C) wrote:
>Hi Brad,

Hi Tony

It took me about three weeks to reply to this - so if you've picked one=20
approach already I understand.

>
>As our phosphor-nvme proposal, https://gerrit.openbmc-project.xyz/c/open=
bmc/docs/+/19061
>it will set properties to D-bus "xyz.openbmc_project.Inventory.Manager" =
and object paths are
>"/xyz/openbmc_project/inventory/system/chassis/motherboard/nvme(index)"
>
>I have found two ways to achieve the above goals, but I have some proble=
ms with these two methods.
>
>1.Add a yaml file to openbmc/meta-phosphor/recipes-phosphor/inventory to=
 create those object paths.
I'm not sure you need any yaml files at all.  In your design you=20
mentioned a json config file to be read by a new nvme manager=20
application.  That seems suitable.
>
>Creating a bb file named =E2=80=9Cphosphor-inventory-manager-nvme.bb=E2=80=
=9D and follow the way like =E2=80=9Cphosphor-inventory-manager-assettag.=
bb=E2=80=9D.
I wouldn't recommend this...and I don't see how it fits into your design=20
(19061)?

>
>One of the problems is that not every developer needs these paths.
I'm not sure what you are meaning or why you are worried about here.
Developers can always leave nvme-manager out of their configuration if=20
they don't need it.  What am I not understanding?

>Another question is that it doesn't know how many NVMe drives were used =
for other projects
It seems like the new nvme manager application would know how many
nvme drives there are, and thus knows how many times to call=20
xyz.openbmc_project.Inventory.Mananger.Notify.

>
>2.Add a description of how to create object paths to D-bus "xyz.openbmc_=
project.Inventory.Manager" and give an example in README file.
Adding documentation is always a good idea and very appreciated.

>
>Which approach do you think is better or do you have any other suggestio=
ns?
I think the third option would be to have your new nvme manager=20
application call xyz.openbmc_project.Inventory.Mananger.Notify when it=20
finds new nvme drives and their corresponding inventory information=20
(serial number, etc).  Have you looked at that and could it meet your=20
needs?

thx - brad
