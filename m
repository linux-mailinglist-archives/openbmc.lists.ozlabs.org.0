Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1266FAAE5
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 08:25:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cbjg3kPnzF6VX
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 18:25:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ZzXlodA6"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cbhj5bjwzF4v1;
 Wed, 13 Nov 2019 18:24:21 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6820E42F12;
 Wed, 13 Nov 2019 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1573629854; x=1575444255; bh=M7vfThuM8XZjGxEXM+aRzHqVxGNGetVF0WO
 XQbTjMiM=; b=ZzXlodA6/Q6r9rF0DjgXzcHYh2yp9lAuT7Vc2EkIEb8mRtgyHGr
 lCO5gSLpsLqw10+6afGbjApUiw1HSSg3QFnIw4vcgXwJeTzRv3rqpawSdUuYtWyv
 Tln7xstHH8BQI0F88AF8FeqdLDk4raOAVNQxLNpNNJwpnJ7n3uAAh2e0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v13tcghmurlP; Wed, 13 Nov 2019 10:24:14 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 01EFF42F15;
 Wed, 13 Nov 2019 10:24:13 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 13
 Nov 2019 10:24:13 +0300
Date: Wed, 13 Nov 2019 10:24:13 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Packaging and deploying multiple firmware image types in one
Message-ID: <20191113072413.GA30087@bbwork.lan>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
 <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Originating-IP: [172.17.14.115]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 04:54:22PM -0600, Adriana Kobylak wrote:
> On 2019-11-12 01:49, Alexander A. Filippov wrote:
> > On Mon, Nov 11, 2019 at 01:28:11PM -0600, Adriana Kobylak wrote:
> > 
> > We use the system bundle of BMC + Host firmware on our VESNIN hardware.
> 
> How are you currently building the bundled image, do you include the Host
> firmware in the BMC rootfs, or do you have separate image files (bmc fw
> file, host fw file) in a single tarball?

We put separate image files in a single tarball.

> 
> > There are some things which cause discomfort a little bit:
> > - The uploaded system bundle isn't shown in the WebUI.
> > - The system bundle has only one version field which is common for BMC
> > and Host
> >   firmwares.
> 
> Do you think the ExtendedVersion d-bus property could help in this case? For
> example adding to the manifest "extended_version=host-v1.2."

I think, it is right only if the system bundle will be processed by its own
service, which creates corresponding objects for each part of the bundle with
their own hash, version's data and purpose.

E.g.: as you've proposed below with separate tarballs in one common tarball.

> 
> > - After rebooting BMC, which is required to complete update the BMC
> > firmware
> >   the system bundle turns to two separated instances in D-Bus which has
> > its own
> >   real versions.
> 
> Yeah, the purpose is not currently preserved across reboots. I have a change
> here for that:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/27045
> 

We use static filesystem layout on our VESNIN hardware. 
So, the version of active BMC is read from /etc/os-release and always has the
BMC purpose. 
The same way with the host firmware: it is read directly from the flash, which
has a special partition with version's data and always has the Host purpose.

> > 
> > Thus, I thought about putting the separate manifests for each part of
> > the
> > bundle.
> 
> If you go the route of adding a second manifest, would you have them in a
> separate tarball (bmc image + manifest) and (host image + manifest) then put
> those tarballs inside a tarball? since the manifest file name would be the
> same.
>

Yeah, it's possible.
But when I researched that, I had found that the phosphor-image-updater and the
openpower-update-manager both already have support for the system bundle. I
decided, we shouldn't create any other implementation, but follow the upstream's
way. So, it has led to the state I described earlier.

> > 
> > > 
> > > ---
> > > [1] https://lists.ozlabs.org/pipermail/openbmc/2019-June/016573.html
> > > [2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml
> > > [3] https://github.com/openbmc/meta-openpower/blob/master/recipes-phosphor/flash/host-fw_git.bb
> > > [4] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml
