Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B9245A15
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 01:40:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVDFL0rDxzDqPf
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 09:40:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSzhc4PKyzDqml
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 09:11:18 +1000 (AEST)
IronPort-SDR: e6dRRZ2ndVUl9/FJTF34axAzRVMW3SIWUG/qcvTXejlpUB5Zau9gw6EkqSQ8Z2lX37mtMlR/8P
 xDnerYwMUgiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="172549203"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="172549203"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 16:11:15 -0700
IronPort-SDR: CkNjvZyLca153AVJyWsup5JkgATtT6Q6Tm+3ukOINRz0slF138i3OWJLfv32/YaX7J3Tv9gkw+
 6NaFbEmQPDVQ==
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; d="scan'208";a="496330329"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 16:11:14 -0700
Date: Fri, 14 Aug 2020 16:11:13 -0700
From: "Mauery, Vernon" <vernon.mauery@intel.com>
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: Re: IPMI implementation of Get Device ID command
Message-ID: <20200814231020.GA16853@mauery.jf.intel.com>
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 17 Aug 2020 09:37:30 +1000
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Aug-2020 11:04 PM, TOM JOSEPH wrote:
>Hello,
>
>We have an implementation of this command https://github.com/openbmc/phosp=
hor-host-ipmid/blob/master/apphandler.cpp#L571=20
>. The current version of the code derives the major and minor firmware=20
>revision from the VERSION_ID field, and the auxiliary firmware=20
>revision is picked from dev_id.json. The auxiliary firmware revision=20
>is populated at build time https://github.com/openbmc/openbmc/blob/master/=
meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend.
>
>The implementation of the code is obsolete, as it was based on an=20
>earlier format. The current format of VERSION_ID for example is,=20
>2.9.0-dev-609-g56f86d23c. There is already a WIP patch to fix this for=20
>the master tag format https://gerrit.openbmc-project.xyz/c/openbmc/phospho=
r-host-ipmid/+/33893. <https://gerrit.openbmc-project.xyz/c/openbmc/phospho=
r-host-ipmid/+/33893>
>
>IBM tagging format is different from the tag format of master builds.=20
>One choice is to have the major and minor version added to the=20
>dev_id.json and if the format of VERSION_ID does not match the master=20
>tag format,=A0 pick from the json.
>
>How are other companies converting their arbitrary tag formats to IPMI=20
>firmware revision fields? Does every company maintain their own=20
>downstream implementation of this command?
>
We have a two-hash version scheme (one for openbmc, the other for the=20
downstream meta-intel layer) that looks something like=20
wht-0.2-3-gab3500-38384ac. We override the Get Device ID command
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/appcommands.cpp#L=
200
to expose part of both of those hashes in the aux bytes. But to get the=20
full version string, we use redfish.

>Is a common code possible for converting arbitrary tag formats to IPMI=20
>firmware revision fields?

Not that I am aware of. I think this leads to lots of string parsing.

--Vernon
