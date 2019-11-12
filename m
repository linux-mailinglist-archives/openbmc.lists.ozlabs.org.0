Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963EFF89EB
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 08:50:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C0K23HPGzF4mW
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 18:50:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="cZ40Evxi"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C0J927mlzF4C7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 18:49:28 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3C81142F12
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1573544961; x=1575359362; bh=oXlYU8ZNBXrmPP+dADrDmQEoXHsXdX6w0ai
 RMNLp5ds=; b=cZ40Evxibe6cvwHbNzgQr0+9oiYx7c7LF6saozxeU6DPV/hTOh4
 hpxLrMJAjGtWHEHkzAfuQrfahnzClz3yGdRwzI170/RVswdwdoQ0DujCFhLayUDe
 GgaUOXyhG4PIGwwA4NHr9upD8XcxhW/8SAPGM8mnsq2mJn+ol+0awYyA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGkvmJl0iDWV for <openbmc@lists.ozlabs.org>;
 Tue, 12 Nov 2019 10:49:21 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D610E41207
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 10:49:21 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 12
 Nov 2019 10:49:21 +0300
Date: Tue, 12 Nov 2019 10:49:21 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Packaging and deploying multiple firmware image types in one
Message-ID: <20191112074921.GA4938@bbwork.lan>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 01:28:11PM -0600, Adriana Kobylak wrote:
> There was some discussion in the "PSU firmware update" proposal[1] about
> bundling firmware images together such as the BMC and PSU firmware. The
> Software interface defines these bundles as a "System" version[2].
> 
> At IBM, we're starting to create a "System" bundle of BMC + host firmware by
> adding a recipe that would add the host's firmware files to the BMC's
> squashfs[3].
> 
> One of the pending items is determining how to showcase the version of these
> System images in Redfish. We can assume that the version of a System image
> corresponds to the BMC's "FirmwareVersion", but it's unknown what else the
> bundle contains (host fw, PSU fw, PCIe fw,..), in order to populate the
> other version fields such as "BiosVersion". There's a D-Bus "Extended
> Version" property[4] that could be leveraged to add the additional image
> information.
> 
> Feel free to share if you have any thoughts on this item or any aspect of
> these "System" images.
> 

We use the system bundle of BMC + Host firmware on our VESNIN hardware.
There are some things which cause discomfort a little bit:
- The uploaded system bundle isn't shown in the WebUI.
- The system bundle has only one version field which is common for BMC and Host
  firmwares.
- After rebooting BMC, which is required to complete update the BMC firmware
  the system bundle turns to two separated instances in D-Bus which has its own
  real versions.

Thus, I thought about putting the separate manifests for each part of the
bundle.

> 
> ---
> [1] https://lists.ozlabs.org/pipermail/openbmc/2019-June/016573.html
> [2] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml
> [3] https://github.com/openbmc/meta-openpower/blob/master/recipes-phosphor/flash/host-fw_git.bb
> [4] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml
