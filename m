Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D334FCF
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 20:27:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JL48380MzDqS6
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 04:27:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JL3h2f1PzDqFL
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 04:26:39 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:26:37 -0700
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 11:26:37 -0700
Date: Tue, 4 Jun 2019 11:26:35 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [Design] PSU firmware update
Message-ID: <20190604182635.GD46814@mauery.jf.intel.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On 03-Jun-2019 04:54 PM, Lei YU wrote:
>Hi All,
>
>This is a proposed design of PSU firmware update.
>It will be posted to gerrit for review after we have resolved comments
>in the mailing list.
>
># PSU firmware update
>
>Author:
>   Lei YU <mine260309@gmail.com> <LeiYU>
>Primary assignee:
>   None
>Other contributors:
>   Su Xiao <suxiao@inspur.com>
>   Derek Howard <derekh@us.ibm.com>
>Created:
>   2019-06-03
>
>
>## Problem Description
>
>There is no support in OpenBMC to update the firmware for PSUs.
>
>
>## Background and References
>
>In OpenBMC, there is an existing interface for [software update][1].
>
>The update process consists of:
>1. Uploading an image to BMC;
>2. Processing the image to check the version and purpose of the image;
>3. Verifying and activating the image.
>
>Currently, BMC and PNOR firmware update are supported:
>* [phosphor-bmc-code-mgmt][2] implements BMC code update, and it supports all
>  the above 3 processes.
>* [openpower-pnor-code-mgmt][3] implements PNOR code update, and it only
>  implements "verifying and activating" the image. It shares the function of
>  the above 1 & 2 processes.
>
>For PSU firmware code update, it is preferred to re-use the same function for
>the above 1 & 2.
>
>
>## Requirements
>
>To mitigate the risk of power loss, the PSU firmware code update shall meet
>pre-conditions:
>1. The host is powered off;
>2. The redundant PSUs are all connected;
>3. The AC input and DC standby output shall be OK on all the PSUs;
>
>And during updating:
>4. After the update is done on a PSU, the AC input and DC standby output shall
>be checked.
>
>
>## Proposed Design
>
>The PSU firmware code update will re-use the current interfaces to upload,
>verify, and activate the image.

We would like the option to be able to ship the PSU firmware as part of 
the BMC image (in the root filesystem). This means that it is already 
present and authenticated when the BMC boots. In this way, we know that 
the current BMC firmware plays well with the PSU firmware and have fewer 
variables to test for when making a release.

I suppose this could be done by skipping the download phase and simply 
creating an activation object at boot and then initiating the FW 
activation automatically.

--Vernon

>1. The "Version" interface needs to be extended:
>   * Add a new [VersionPurpose][4] for PSU;
>   * Re-use the existing ExtendedVersion as an additional string for
>     vendor-specific purpose, e.g. to indicate the PSU model.
>2. Re-use the existing functions implemented by [phosphor-bmc-code-mgmt][2] for
>uploading and processing the image.
>   * The PSU update image shall be a tarball consists of a MANIFEST, images,
>     and signatures
>3. There will be a new service that implements the [Activation][5] interface to
>update the PSU firmware.
>   * It shall run all the checks described in [Requirements] before performing
>     the code update;
>   * It shall run the checks after each PSU code update is done.
>   * The service will verify the signature of the image;
>   * The service shall check the ExtendedVersion to make sure the image matches
>     the PSU model.
>   * The service will call a configurable and vendor-specific tool to perform
>     the code update.
>   * When each check fails, or the vendor-specific tool returns errors, the PSU
>     code update will be aborted and an error event log shall be created.
>   * When the PSU code update is completed, an informational event log shall be
>     created.
>
>
>## Alternatives Considered
>
>### General implementation
>
>The PSU firmware update could be implemented by separated recipes that only
>call vendor-specific tools.
>It will be a bit simpler but loses the unified interface provided by OpenBMC's
>existing [software update interface][1], and thus it will become difficult to
>use a standard API to the PSU firmware update.
>
>### VersionPurpose
>It is possible to re-use the VersionPurpose.Other to represent the PSU image's
>version purpose.
>But that requires additional information about the image, otherwise, there is
>no way to tell if the image is for PSU, or CPLD, or other peripherals.
>A new VersionPurpose.PSU is more specific and makes it easier to implement and
>friendly for the user.
>
>### Additional string
>The design proposal uses ExtendedVersion as the additional string for
>vendor-specific purpose, e.g. to indicate the PSU model, so the implementation
>could check and compare if the image matches the PSU model.
>It is possible to make it optional or remove this additional string, then the
>implementation will not verify if the image matches the PSU. It could be OK if
>we trust the user who is uploading the correct image, especially the image
>shall be signed.
>But it is always risky in case the image does not match the PSU, and cause
>unintended damage if the incorrect PSU firmware is updated.
>
>
>## Impacts
>
>This design only introduces a new VersionPurpose enum into the dbus interfaces.
>The newly introduced PSU firmware update service will be a new service that
>implements existing [Activation][5] interface.
>So the impacts are minimal.
>
>
>## Testing
>
>It requires the manual tests to verify the PSU code update process.
>* Verify the PSU code update will not start in case the pre-conditions are not
>  met;
>* Verify the PSU code update is done on all PSUs successfully when the
>  pre-conditions are met.
>* Verify the PSU code update will fail in the case that any PSU's AC input or
>  DC standby output is lost during code update.
>
>
>[1]: https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software
>[2]: https://github.com/openbmc/phosphor-bmc-code-mgmt/
>[3]: https://github.com/openbmc/openpower-pnor-code-mgmt/
>[4]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_project/Software/Version.interface.yaml#L14
>[5]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Activation.interface.yaml
